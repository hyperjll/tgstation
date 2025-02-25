/datum/action/cooldown/mob_cooldown/werewolf_transform
	name = "Transform"
	button_icon = 'hypermods/icons/ui_icons/antags/werewolf/werewolf_ui.dmi'
	button_icon_state = "transform"
	desc = "Begin the process of transforming into a werewolf or begin reverting back into your regular form."
	cooldown_time = 90 SECONDS
	var/specie_to_become = /datum/species/werewolf
	/// Used to store whatever you were before.
	var/specie_to_revert_into = null
	/// Amount of time it takes us to transform back or forth
	var/channel_time = 3 SECONDS

/datum/action/cooldown/mob_cooldown/werewolf_transform/Activate()
	disable_cooldown_actions()
	werewolf_begin_transform()
	StartCooldown()
	enable_cooldown_actions()
	return TRUE

/datum/action/cooldown/mob_cooldown/werewolf_transform/proc/werewolf_begin_transform()
	var/mob/living/my_werewolf = owner
	var/old_transform = my_werewolf.transform

	var/animate_step = channel_time / 6
	playsound(my_werewolf, 'sound/effects/wounds/crack1.ogg', 50)
	animate(my_werewolf, transform = matrix() * 1.1, time = animate_step, easing = SINE_EASING)
	animate(transform = matrix() * 0.9, time = animate_step, easing = SINE_EASING)
	animate(transform = matrix() * 1.2, time = animate_step, easing = SINE_EASING)
	animate(transform = matrix() * 0.8, time = animate_step, easing = SINE_EASING)
	animate(transform = matrix() * 1.3, time = animate_step, easing = SINE_EASING)
	animate(transform = matrix() * 0.1, time = animate_step, easing = SINE_EASING)
	animate(transform = matrix() * 1, time = animate_step, easing = SINE_EASING)

	my_werewolf.balloon_alert(my_werewolf, "transforming...")
	if (!do_after(my_werewolf, delay = channel_time, target = my_werewolf))
		animate(my_werewolf, transform = matrix(), time = 0, easing = SINE_EASING)
		my_werewolf.transform = old_transform
		return FALSE
	playsound(my_werewolf, 'sound/effects/magic/demon_consume.ogg', 50, TRUE)
	playsound(my_werewolf, 'hypermods/sound/mobs/humanoid/werewolf/werewolf_howl.ogg', 70, TRUE)

	werewolf_transform()

/datum/action/cooldown/mob_cooldown/werewolf_transform/proc/werewolf_transform()
	var/mob/living/carbon/human/my_werewolf = owner
	if(!my_werewolf.dna?.species) // Just checkin'
		return

	my_werewolf.regenerate_limbs()

	if(!iswerewolf(my_werewolf)) // Are you not in werewolf form?
		if(specie_to_revert_into == null) // Now you are, we'll store your previous form here.
			my_werewolf.uncuff() // turning into a werewolf breaks any cuffs
			specie_to_revert_into = my_werewolf.dna.species
			var/datum/species/species_type = specie_to_become
			my_werewolf.set_species(species_type)
	else
		my_werewolf.set_species(specie_to_revert_into)
		specie_to_revert_into = null


/datum/action/cooldown/spell/touch/werewolf_maul
	name = "Maul Victim"
	button_icon = 'hypermods/icons/ui_icons/antags/werewolf/werewolf_ui.dmi'
	button_icon_state = "feast"
	desc = "Prepare a stronger attack or pry open an airlock (requires an empty offhand). Can also be used on human corpses to consume their heart, recovering health."
	cooldown_time = 30 SECONDS
	spell_max_level = 1
	overlay_icon_state = "bg_default_border"
	//cast_range = 1 // Touch range
	spell_requirements = NONE
	antimagic_flags = NONE
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND
	invocation_type = INVOCATION_NONE
	hand_path = /obj/item/melee/touch_attack/werewolf_maul
	draw_message = span_notice("You prepare to maul someone.")
	/// How many hearts has this werewolf eaten?
	var/hearts_eaten = 0

/datum/action/cooldown/spell/touch/werewolf_maul/can_cast_spell(feedback = TRUE)
	. = ..()
	if(!iswerewolf(owner))
		return FALSE

/datum/action/cooldown/spell/touch/werewolf_maul/cast_on_hand_hit(obj/item/melee/touch_attack/hand, mob/living/carbon/victim, mob/living/carbon/caster)
	if(ishuman(victim))
		var/mob/living/carbon/human/human_victim = victim
		if(human_victim.stat != DEAD)
			human_victim.apply_damage(30, BRUTE)
			human_victim.Knockdown(5 SECONDS)
			if(prob(5))
				human_victim.ForceContractDisease(new /datum/disease/transformation/lycanthropy)
			playsound(human_victim, 'sound/effects/wounds/crack1.ogg', 50)
			playsound(human_victim, 'hypermods/sound/mobs/humanoid/werewolf/werewolf_attack1.ogg', 70)
			return TRUE
		else
			playsound(human_victim, 'sound/effects/butcher.ogg', 50)
			if(!do_after(caster, 5 SECONDS, target = human_victim))
				return
			var/obj/item/organ/heart/heart = human_victim.get_organ_slot(ORGAN_SLOT_HEART)
			if(heart)
				if(heart.organ_flags == ORGAN_ROBOTIC)
					to_chat(caster, span_notice("This one's heart is robotic! You can't eat that."))
					return FALSE
				caster.adjustToxLoss(-30, FALSE)
				caster.adjustOxyLoss(-30, FALSE)
				caster.adjustBruteLoss(-30, FALSE)
				caster.adjustFireLoss(-30, FALSE)
				playsound(human_victim, 'sound/effects/wounds/blood1.ogg', 50)
				caster.visible_message(span_warning("[caster] digs out [human_victim]'s heart and eats it whole!"), span_warning("You eat [human_victim]'s heart."), \
				span_hear("You hear a sickening squelch as flesh meets teeth."))
				if(!human_victim.mind)
					to_chat(caster, span_notice("The heart you consumed almost tastes... stale? This won't do at all."))
				else
					hearts_eaten++
				qdel(heart)
			else
				to_chat(caster, span_notice("This one doesn't even have a heart! How disappointing."))
				return FALSE
			return TRUE
	return FALSE

/obj/item/melee/touch_attack/werewolf_maul
	name = "\improper werewolf paw"
	desc = "It's just your paw. Don't think too hard on it."
	icon = 'icons/obj/weapons/hand.dmi'
	icon_state = "greyscale"
	color = COLOR_DARK_MODERATE_ORANGE
	inhand_icon_state = "werewolf" // we don't want visual effects here since it's just your paws.

/obj/item/melee/touch_attack/werewolf_maul/afterattack(atom/target, mob/user, click_parameters)
	..()
	// Thanks to the armblade code for this one.
	if(istype(target, /obj/structure/table))
		var/obj/smash = target
		smash.deconstruct(FALSE)
		playsound(smash, 'hypermods/sound/mobs/humanoid/werewolf/werewolf_attack1.ogg', 70)
		return TRUE
	if(istype(target, /obj/machinery/door/window))
		var/obj/smash = target
		smash.deconstruct(FALSE)
		playsound(smash, 'hypermods/sound/mobs/humanoid/werewolf/werewolf_attack1.ogg', 70)
		return TRUE
	if(istype(target, /obj/machinery/door/airlock))
		var/obj/machinery/door/airlock/opening = target

		if((!opening.requiresID() || opening.allowed(user)) && opening.hasPower())
			return
		if(opening.locked)
			opening.balloon_alert(user, "bolted!")
			return

		if(opening.hasPower())
			user.visible_message(span_warning("[user] digs their claws into the [opening] and starts prying it open!"), span_warning("You start forcing the [opening] open."), \
			span_hear("You hear a metal screeching sound."))
			playsound(opening, 'hypermods/sound/mobs/humanoid/werewolf/werewolf_attack1.ogg', 70)
			playsound(opening, 'sound/machines/airlock/airlock_alien_prying.ogg', 100, TRUE)
			if(!do_after(user, 8 SECONDS, target = opening))
				return
		user.visible_message(span_warning("[user] forces the airlock to open with [user.p_their()] [src]!"), span_warning("You force the [opening] to open."), \
		span_hear("You hear a metal screeching sound."))
		opening.open(BYPASS_DOOR_CHECKS)
		return TRUE


/datum/action/cooldown/spell/werewolf_pounce
	name = "Pounce"
	desc = "Prepare your hind legs to leap through the air, quickly traversing long distances and slamming into enemies, knocking them down! Slamming into things may result in recoil damage."
	button_icon = 'hypermods/icons/ui_icons/antags/werewolf/werewolf_ui.dmi'
	button_icon_state = "pounce"

	cooldown_time = 10 SECONDS
	spell_max_level = 1
	overlay_icon_state = "bg_default_border"
	spell_requirements = NONE
	antimagic_flags = NONE
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND
	invocation_type = INVOCATION_NONE
	var/jumpdistance = 8 //-1 from to see the actual distance, e.g 4 goes over 3 tiles
	var/jumpspeed = 5

/datum/action/cooldown/spell/werewolf_pounce/can_cast_spell(feedback = TRUE)
	. = ..()
	if(!iswerewolf(owner))
		return FALSE

/datum/action/cooldown/spell/werewolf_pounce/cast(mob/living/carbon/cast_on)
	if(!isliving(cast_on))
		return

	var/atom/target = get_edge_target_turf(cast_on, cast_on.dir) //gets the user's direction

	ADD_TRAIT(cast_on, TRAIT_MOVE_FLOATING, LEAPING_TRAIT)  //Throwing itself doesn't protect mobs against lava (because gulag).
	if (cast_on.throw_at(target, jumpdistance, jumpspeed, spin = FALSE, diagonals_first = TRUE, callback = TRAIT_CALLBACK_REMOVE(cast_on, TRAIT_MOVE_FLOATING, LEAPING_TRAIT)))
		playsound(src, 'hypermods/sound/mobs/humanoid/werewolf/werewolf_attack2.ogg', 50, TRUE, TRUE)
		cast_on.visible_message(span_warning("[cast_on] leaps into the air at high speed!"))
	else
		to_chat(cast_on, span_warning("Something prevents you from leaping into the air!"))


/datum/action/cooldown/spell/touch/werewolf_tainted_claw
	name = "Tainted Claws"
	button_icon = 'hypermods/icons/ui_icons/antags/werewolf/werewolf_ui.dmi'
	button_icon_state = "tainted-bite"
	desc = "Fill your claws with a random toxin to apply to your target. Successful attacks heal toxin damage and rapidly purge your bloodstream."
	cooldown_time = 200 SECONDS
	spell_max_level = 1
	overlay_icon_state = "bg_default_border"
	//cast_range = 1 // Touch range
	spell_requirements = NONE
	antimagic_flags = NONE
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND
	invocation_type = INVOCATION_NONE
	hand_path = /obj/item/melee/touch_attack/werewolf_tainted_attack
	draw_message = span_notice("You prepare your claws to poison your next victim.")
	var/r_type = ""

/datum/action/cooldown/spell/touch/werewolf_tainted_claw/can_cast_spell(feedback = TRUE)
	. = ..()
	if(!iswerewolf(owner))
		return FALSE

/datum/action/cooldown/spell/touch/werewolf_tainted_claw/cast_on_hand_hit(obj/item/melee/touch_attack/hand, mob/living/carbon/victim, mob/living/carbon/caster)
	if(ishuman(victim))
		var/mob/living/carbon/human/human_victim = victim
		var/list/r_types = subtypesof(/datum/reagent/toxin/) // get all toxin reagents

		for(var/i in 1 to 1) // get one random toxin reagent
			r_type = pick(r_types)

		if(human_victim.stat != DEAD)
			human_victim.apply_damage(10, BRUTE)
			caster.adjustToxLoss(-20, 0, TRUE)
			human_victim.reagents.add_reagent(r_type, 5)
			caster.reagents.add_reagent(/datum/reagent/medicine/pen_acid, 5)
			if(prob(40))
				human_victim.ForceContractDisease(new /datum/disease/transformation/lycanthropy)
			playsound(human_victim, 'sound/effects/wounds/crack1.ogg', 50)
			playsound(human_victim, 'hypermods/sound/mobs/humanoid/werewolf/werewolf_attack1.ogg', 70)
			return TRUE
	return FALSE

/obj/item/melee/touch_attack/werewolf_tainted_attack
	name = "\improper tainted claws"
	desc = "It's your paw. Not much else to note."
	icon = 'icons/obj/weapons/hand.dmi'
	icon_state = "greyscale"
	color = COLOR_DARK_MODERATE_LIME_GREEN
	inhand_icon_state = "werewolf" // no visual "werewolf" icon doesn't exist -- we don't want one..
