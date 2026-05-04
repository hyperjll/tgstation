//Stargazer structure
/obj/structure/destructible/clockwork/gear_base/stargazer
	name = "stargazer"
	desc = "A small pedestal, glowing with a divine energy."
	clockwork_desc = "Place a weapon upon it to provide special powers and abilities to the weapon."
	reebe_desc = "The energies of reebe are interfering with it's abilites, making it only be able to to enchant things at the lowest level."
	icon_state = "stargazer"
	base_icon_state = "stargazer"
	anchored = TRUE
	break_message = span_warning("The stargazer collapses.")
	///ref to our visual effect, migtht be able to make this just be an overlay
	var/obj/effect/stargazer_light/light_effect
	///how long is our use cooldown
	var/stargazer_cooldown = 3 MINUTES
	///Used to determine the primary type of enchantments (Universal). Shouldn't be touched unless admins want both cultist and clock cult enchantments on the stargazer or smth.
	var/enchanter_type_main = "Universal"
	///What type of 'special' enchantments can we give in addition to the primary type?
	var/enchanter_type = "Clockwork"
	///A list of every possible weapon enchantment, determined on-load.
	var/list/possible_weapon_enchantments = list()
	///A list of every possible armor enchantment, determined on-load.
	var/list/possible_armor_enchantments = list()

/obj/structure/destructible/clockwork/gear_base/stargazer/Initialize(mapload)
	. = ..()
	light_effect = new /obj/effect/stargazer_light(get_turf(src))
	START_PROCESSING(SSobj, src)
	if(!length(possible_weapon_enchantments)) // Get all enchants, if it doesn't require an item or requires clothing items, then it could be on any non-clothing item.
		for(var/datum/component/enchantment/possible_enchantment as anything in subtypesof(/datum/component/enchantment))
			if(possible_enchantment.enchantment_type == enchanter_type_main || possible_enchantment.enchantment_type == enchanter_type)
				if(isnull(possible_enchantment.required_item_type) || !possible_enchantment.required_item_type == /obj/item/clothing)
					possible_weapon_enchantments += possible_enchantment
	if(!length(possible_armor_enchantments)) // Get all enchants, if it doesn't require or forbid any items (clothing), or outright requires a clothing item, then it could go on clothing items. (I.E Tiny, Protection, etc)
		for(var/datum/component/enchantment/possible_enchantment as anything in subtypesof(/datum/component/enchantment))
			if(possible_enchantment.enchantment_type == enchanter_type_main || possible_enchantment.enchantment_type == enchanter_type)
				if((isnull(possible_enchantment.required_item_type) && isnull(possible_enchantment.forbidden_item_type)) || possible_enchantment.required_item_type == /obj/item/clothing)
					possible_armor_enchantments += possible_enchantment

/obj/structure/destructible/clockwork/gear_base/stargazer/Destroy()
	STOP_PROCESSING(SSobj, src)
	if(!QDELETED(light_effect))
		QDEL_NULL(light_effect)
	return ..()

/obj/structure/destructible/clockwork/gear_base/stargazer/process()
	if(QDELETED(light_effect))
		return
	for(var/mob/living/viewing_mob in viewers(2, get_turf(src)))
		if(IS_CLOCK(viewing_mob))
			if(!light_effect.is_open)
				light_effect.open()
			return
	if(light_effect.is_open)
		light_effect.close()

/obj/structure/destructible/clockwork/gear_base/stargazer/wrench_act(mob/living/user, obj/item/tool)
	. = ..()
	if(!.)
		return

	if(anchored && !light_effect)
		light_effect = new /obj/effect/stargazer_light(get_turf(src))
	else if(light_effect)
		QDEL_NULL(light_effect)

/obj/structure/destructible/clockwork/gear_base/stargazer/attackby(obj/item/attacking_item, mob/living/user, params)
	if(user.combat_mode)
		. = ..()
		return

	if(!anchored)
		to_chat(user, span_brass("You need to anchor \the [src] to the floor first."))
		return

	if(!enchanting_checks(attacking_item, user))
		return

	to_chat(user, span_brass("You begin placing \the [attacking_item] onto [src]."))
	if(do_after(user, 6 SECONDS, src))
		if(!enchanting_checks(attacking_item, user))
			return

		if(istype(attacking_item, /obj/item) && !istype(attacking_item, /obj/item/clothing) && attacking_item.force)
			if(upgrade_weapon(attacking_item, user))
				COOLDOWN_START(src, use_cooldown, stargazer_cooldown)
			return
		if(istype(attacking_item, /obj/item) && istype(attacking_item, /obj/item/clothing))
			if(upgrade_armor(attacking_item, user))
				COOLDOWN_START(src, use_cooldown, stargazer_cooldown)
			return
		to_chat(user, span_brass("You cannot upgrade \the [attacking_item]."))

/obj/structure/destructible/clockwork/gear_base/stargazer/proc/enchanting_checks(obj/item/checked_item, mob/living/user)
	if(!COOLDOWN_FINISHED(src, use_cooldown))
		to_chat(user, span_brass("\The [src] is still warming up, it will be ready in [DisplayTimeText(COOLDOWN_TIMELEFT(src, use_cooldown))]."))
		return FALSE

	if(HAS_TRAIT(checked_item, TRAIT_ENCHANTED))
		to_chat(user, span_brass("\The [checked_item] has already been enchanted!"))
		return FALSE
	return TRUE

/obj/structure/destructible/clockwork/gear_base/stargazer/proc/upgrade_weapon(obj/item/upgraded_item, mob/living/user)
	//Pick a random effect, provided it's compatible.
	var/datum/component/enchantment/our_chosen_enchantment = upgraded_item.AddComponent(pick(possible_weapon_enchantments))
	if(!our_chosen_enchantment.check_requirements(upgraded_item))
		upgrade_weapon(upgraded_item, user) // WARNING: Try again, you rolled an incompatible enchantment. This could be an infinite loop if you don't ensure atleast ONE enchantment is guarenteed to roll on ALL items.
		to_chat(user, span_notice("\The [upgraded_item] emits a small puff of smoke... seems like this item cannot be enchanted."))
		return FALSE

	//Prevent re-enchanting
	ADD_TRAIT(upgraded_item, TRAIT_ENCHANTED, STARGAZER_TRAIT)
	//Add a glowy colour
	upgraded_item.add_atom_colour(rgb(243, 227, 183), ADMIN_COLOUR_PRIORITY)

	to_chat(user, span_notice("\The [upgraded_item] glows with a brilliant light!"))
	return TRUE

/obj/structure/destructible/clockwork/gear_base/stargazer/proc/upgrade_armor(obj/item/upgraded_item, mob/living/user)
	//Give the armor it's upgraded form
	if(istype(upgraded_item, /obj/item/clothing/suit/clockwork) || istype(upgraded_item, /obj/item/clothing/head/helmet/clockwork)) // Checking for either type of clockwork cultist signature armor.
		if(istype(upgraded_item, /obj/item/clothing/suit/clockwork)) // Just making sure, don't know what shenanigans could fuck this up.
			var/obj/item/clothing/suit/clockwork/my_drip = upgraded_item
			my_drip.give_empowered_armor()
		else // the helmet version of this. I'm not sure if the var included could just be the same considering the proc name is the same, i don't want to waste my time testing it and will let my intuition win out here.
			var/obj/item/clothing/head/helmet/clockwork/my_drip = upgraded_item
			my_drip.give_empowered_armor()
	else
		//Pick a random effect, provided it's compatible.
		var/datum/component/enchantment/our_chosen_enchantment = upgraded_item.AddComponent(pick(possible_armor_enchantments))
		if(!our_chosen_enchantment.check_requirements(upgraded_item))
			upgrade_armor(upgraded_item, user) // WARNING: Try again, you rolled an incompatible enchantment. This could be an infinite loop if you don't ensure atleast ONE enchantment is guarenteed to roll on ALL items.
			to_chat(user, span_notice("\The [upgraded_item] emits a small puff of smoke... seems like this item cannot be enchanted."))
			return FALSE

	//Prevent re-enchanting
	ADD_TRAIT(upgraded_item, TRAIT_ENCHANTED, STARGAZER_TRAIT)
	//Add a glowy colour
	upgraded_item.add_atom_colour(rgb(243, 227, 183), ADMIN_COLOUR_PRIORITY)

	to_chat(user, span_notice("\The [upgraded_item] glows with a brilliant light!"))
	return TRUE

//The visual effect of the stargazer
/obj/effect/stargazer_light
	icon = 'hypermods/icons/obj/clock_cult/clockwork_objects.dmi'
	icon_state = "stargazer_closed"
	pixel_y = 10
	layer = ABOVE_OBJ_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	alpha = 160
	///are we open or closed
	var/is_open = FALSE
	///ref to our timer if we have one
	var/active_timer

/obj/effect/stargazer_light/ex_act()
	return

/obj/effect/stargazer_light/Destroy(force)
	cancel_timer()
	return ..()

/obj/effect/stargazer_light/proc/finish_opening()
	icon_state = "stargazer_light"
	active_timer = null

/obj/effect/stargazer_light/proc/finish_closing()
	icon_state = "stargazer_closed"
	active_timer = null

/obj/effect/stargazer_light/proc/open()
	icon_state = "stargazer_opening"
	cancel_timer()
	active_timer = addtimer(CALLBACK(src, PROC_REF(finish_opening)), 2, TIMER_STOPPABLE | TIMER_UNIQUE)
	is_open = TRUE

/obj/effect/stargazer_light/proc/close()
	icon_state = "stargazer_closing"
	cancel_timer()
	active_timer = addtimer(CALLBACK(src, PROC_REF(finish_closing)), 2, TIMER_STOPPABLE | TIMER_UNIQUE)
	is_open = FALSE

/obj/effect/stargazer_light/proc/cancel_timer()
	if(active_timer)
		deltimer(active_timer)
