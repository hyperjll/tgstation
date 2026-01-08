/obj/item/organ/cyberimp/chest/nutriment/plus/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/chest/reviver/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/chest/reviver/fivemincap/heal() // five minute cap.
	if(COOLDOWN_FINISHED(src, defib_cooldown))
		revive_dead()

	var/need_mob_update = FALSE
	if(owner.get_oxy_loss())
		need_mob_update += owner.adjust_oxy_loss(-5, updating_health = FALSE)
		revive_cost += 1
	if(owner.get_brute_loss())
		need_mob_update += owner.adjust_brute_loss(-2, updating_health = FALSE)
		revive_cost += 10
	if(owner.get_fire_loss())
		need_mob_update += owner.adjust_fire_loss(-2, updating_health = FALSE)
		revive_cost += 10
	if(owner.get_tox_loss())
		need_mob_update += owner.adjust_tox_loss(-1, updating_health = FALSE, forced = TRUE)
		revive_cost += 10
	if(need_mob_update)
		owner.updatehealth()

	if(revive_cost > 3000) // Make sure this doesn't go over 5 minutes. The revive_dead proc adds 10 minutes, so this is super nice to have here.
		revive_cost = 3000

/obj/item/organ/cyberimp/chest/reviver/fivemincap/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/chest/reviver/tenmincap/heal() // ten minute cap.
	if(COOLDOWN_FINISHED(src, defib_cooldown))
		revive_dead()

	var/need_mob_update = FALSE
	if(owner.get_oxy_loss())
		need_mob_update += owner.adjust_oxy_loss(-5, updating_health = FALSE)
		revive_cost += 1
	if(owner.get_brute_loss())
		need_mob_update += owner.adjust_brute_loss(-2, updating_health = FALSE)
		revive_cost += 10
	if(owner.get_fire_loss())
		need_mob_update += owner.adjust_fire_loss(-2, updating_health = FALSE)
		revive_cost += 10
	if(owner.get_tox_loss())
		need_mob_update += owner.adjust_tox_loss(-1, updating_health = FALSE, forced = TRUE)
		revive_cost += 10
	if(need_mob_update)
		owner.updatehealth()

	if(revive_cost > 6000) // Make sure this doesn't go over 10 minutes. The revive_dead proc adds 10 minutes, so this is super nice to have here.
		revive_cost = 6000

/obj/item/organ/cyberimp/chest/reviver/tenmincap/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/chest/thrusters/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null

/obj/item/organ/cyberimp/chest/regenerativebetter
	name = "regenerative implant"
	desc = "A surgical implant that when inserted into the body will slowly repair the host. Allowing for very slow recovery of all forms of damage."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "chest_implant"
	//implant_overlay = "chest_implant_overlay"
	//implant_color = "#AD0000"
	slot = ORGAN_SLOT_HEART_AID
	var/healing = FALSE

/obj/item/organ/cyberimp/chest/regenerativebetter/on_life(seconds_per_tick)
	if(healing)
		addtimer(CALLBACK(src, PROC_REF(heal)), 1 SECONDS)
	else
		healing = TRUE
		to_chat(owner, span_notice("Your regenerative implant was integrated successfully."))
	return

/obj/item/organ/cyberimp/chest/regenerativebetter/proc/heal()
	if(owner.get_oxy_loss())
		owner.adjust_oxy_loss(-2.5)
	if(owner.get_brute_loss())
		owner.adjust_brute_loss(-1)
	if(owner.get_fire_loss())
		owner.adjust_fire_loss(-1)
	if(owner.get_tox_loss())
		owner.adjust_tox_loss(-0.5, forced = TRUE)

	owner.adjust_organ_loss(ORGAN_SLOT_BRAIN, -0.5)
	owner.adjust_organ_loss(ORGAN_SLOT_HEART, -0.5)
	owner.adjust_organ_loss(ORGAN_SLOT_EYES, -0.5)
	owner.adjust_organ_loss(ORGAN_SLOT_EARS, -0.5)
	owner.adjust_organ_loss(ORGAN_SLOT_LUNGS, -0.5)
	owner.adjust_organ_loss(ORGAN_SLOT_LIVER, -0.5)
	owner.adjust_organ_loss(ORGAN_SLOT_STOMACH, -0.5)
	owner.adjust_organ_loss(ORGAN_SLOT_TONGUE, -0.5)
	owner.adjust_organ_loss(ORGAN_SLOT_APPENDIX, -0.5)

/obj/item/organ/cyberimp/chest/regenerativebetter/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null


/obj/item/organ/cyberimp/chest/regenerative
	name = "regenerative implant"
	desc = "A surgical implant that when inserted into the body will slowly repair the host. Allowing for very slow recovery of all forms of damage."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "chest_implant"
	//implant_overlay = "chest_implant_overlay"
	//implant_color = "#AD0000"
	slot = ORGAN_SLOT_HEART_AID
	var/healing = FALSE

/obj/item/organ/cyberimp/chest/regenerative/on_life(seconds_per_tick)
	if(healing)
		addtimer(CALLBACK(src, PROC_REF(heal)), 1 SECONDS)
	else
		healing = TRUE
		to_chat(owner, span_notice("Your regenerative implant was integrated successfully."))
	return

/obj/item/organ/cyberimp/chest/regenerative/proc/heal()
	if(owner.get_oxy_loss())
		owner.adjust_oxy_loss(-1)
	if(owner.get_brute_loss())
		owner.adjust_brute_loss(-0.5)
	if(owner.get_fire_loss())
		owner.adjust_fire_loss(-0.5)
	if(owner.get_tox_loss())
		owner.adjust_tox_loss(-0.25, forced = TRUE)

	owner.adjust_organ_loss(ORGAN_SLOT_BRAIN, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_HEART, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_EYES, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_EARS, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_LUNGS, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_LIVER, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_STOMACH, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_TONGUE, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_APPENDIX, -0.25)

/obj/item/organ/cyberimp/chest/regenerative/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null


/obj/item/organ/cyberimp/chest/jellypersonregen
	name = "gelatine sythesis implant"
	desc = "A surgical implant that when inserted into the body will slowly repair the host. Specifically tailored to jellypeople."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "chest_implant"
	//implant_overlay = "chest_implant_overlay"
	//implant_color = "#AD5000"
	slot = ORGAN_SLOT_HEART_AID

/obj/item/organ/cyberimp/chest/jellypersonregen/on_life(seconds_per_tick)
	if(isjellyperson(owner))
		addtimer(CALLBACK(src, PROC_REF(heal)), 1 SECONDS)
	return

/obj/item/organ/cyberimp/chest/jellypersonregen/proc/heal()
	if(owner.get_oxy_loss())
		owner.adjust_oxy_loss(-3)
	if(owner.get_brute_loss())
		owner.adjust_brute_loss(-1.5)
	if(owner.get_fire_loss())
		owner.adjust_fire_loss(-1.5)
	if(owner.get_tox_loss())
		owner.adjust_tox_loss(1)

	owner.adjust_blood_volume(1, maximum = BLOOD_VOLUME_SAFE)

	owner.adjust_organ_loss(ORGAN_SLOT_BRAIN, -1)
	owner.adjust_organ_loss(ORGAN_SLOT_HEART, -1)
	owner.adjust_organ_loss(ORGAN_SLOT_EYES, -1)
	owner.adjust_organ_loss(ORGAN_SLOT_EARS, -1)
	owner.adjust_organ_loss(ORGAN_SLOT_LUNGS, -1)
	owner.adjust_organ_loss(ORGAN_SLOT_LIVER, -1)
	owner.adjust_organ_loss(ORGAN_SLOT_STOMACH, -1)
	owner.adjust_organ_loss(ORGAN_SLOT_TONGUE, -1)
	owner.adjust_organ_loss(ORGAN_SLOT_APPENDIX, -1)

/obj/item/organ/cyberimp/chest/jellypersonregen/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	aug_overlay = null


/obj/item/organ/cyberimp/chest/spinalspeed
	name = "neural overclocker implant"
	desc = "Stimulates your central nervous system in order to enable you to perform muscle movements faster. Careful not to overuse it."
	slot = ORGAN_SLOT_SPINAL_AUG
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "imp_spinal"
	//implant_overlay = null
	//implant_color = null
	actions_types = list(/datum/action/item_action/organ_action/toggle)
	w_class = WEIGHT_CLASS_NORMAL
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	var/syndicate_implant = TRUE
	var/on = FALSE
	var/time_on = 0
	var/hasexerted = FALSE
	var/list/hsv
	var/last_step = 0
	COOLDOWN_DECLARE(alertcooldown)
	COOLDOWN_DECLARE(startsoundcooldown)
	COOLDOWN_DECLARE(endsoundcooldown)

/obj/item/organ/cyberimp/chest/spinalspeed/Insert(mob/living/carbon/M, special = 0)
	. = ..()

/obj/item/organ/cyberimp/chest/spinalspeed/Remove(mob/living/carbon/M, special = 0)
	if(on)
		toggle(silent = TRUE)
	..()

/obj/item/organ/cyberimp/chest/spinalspeed/ui_action_click()
	toggle()

/obj/item/organ/cyberimp/chest/spinalspeed/proc/toggle(silent = FALSE)
	if(!on)
		if(COOLDOWN_FINISHED(src, startsoundcooldown))
			playsound(owner, 'hypermods/sound/effects/spinal_implant_on.ogg', 60)
			COOLDOWN_START(src, startsoundcooldown, 1 SECONDS)
		if(syndicate_implant)//the toy doesn't do anything aside from the trail and the sound
			if(ishuman(owner))
				owner.add_actionspeed_modifier(/datum/actionspeed_modifier/neuraloverclockactions)
			owner.next_move_modifier *= 0.7
			owner.add_movespeed_modifier(/datum/movespeed_modifier/neuraloverclock, update=TRUE)
		RegisterSignal(owner, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(move_react))
	else
		if(COOLDOWN_FINISHED(src, endsoundcooldown))
			playsound(owner, 'hypermods/sound/effects/spinal_implant_off.ogg', 70)
			COOLDOWN_START(src, endsoundcooldown, 1 SECONDS)
		if(syndicate_implant)
			if(ishuman(owner))
				owner.remove_actionspeed_modifier(/datum/actionspeed_modifier/neuraloverclockactions)
			owner.next_move_modifier /= 0.7
			owner.remove_movespeed_modifier(/datum/movespeed_modifier/neuraloverclock)
		UnregisterSignal(owner, COMSIG_MOVABLE_PRE_MOVE)
	on = !on
	if(!silent)
		to_chat(owner, span_notice("You turn your spinal implant [on? "on" : "off"]."))
	update_appearance(UPDATE_ICON)

/obj/item/organ/cyberimp/chest/spinalspeed/update_icon_state()
	. = ..()
	if(on)
		icon_state = "imp_spinal-on"
	else
		icon_state = "imp_spinal"
	for(var/datum/action/A as anything in actions)
		A.build_all_button_icons()

/obj/item/organ/cyberimp/chest/spinalspeed/proc/move_react()//afterimage
	var/turf/currentloc = get_turf(owner)
	var/obj/effect/temp_visual/decoy/fading/F = new(currentloc, owner)
	if(!hsv)
		hsv = rgb2hsv(rgb(255, 0, 0))
	//hsv = RotateHue(hsv, world.time - last_step * 15)
	//last_step = world.time
	F.color = hsv2rgb(hsv)	//gotta add the flair

/obj/item/organ/cyberimp/chest/spinalspeed/on_life()
	if(!syndicate_implant)//the toy doesn't have a drawback
		return

	if(on)
		if(owner.stat == UNCONSCIOUS || owner.stat == DEAD)
			toggle(silent = TRUE)
		time_on += 1
		switch(time_on)
			if(20 to 50)
				if(COOLDOWN_FINISHED(src, alertcooldown))
					to_chat(owner, span_alert("You feel your spine tingle."))
					COOLDOWN_START(src, alertcooldown, 10 SECONDS)
				owner.adjust_hallucinations(20 SECONDS)
				owner.adjust_fire_loss(1)
			if(50 to 100)
				if(COOLDOWN_FINISHED(src, alertcooldown) || !hasexerted)
					to_chat(owner, span_userdanger("Your spine and brain feel like they're burning!"))
					COOLDOWN_START(src, alertcooldown, 5 SECONDS)
				hasexerted = TRUE
				owner.set_drugginess(2 SECONDS)
				owner.adjust_hallucinations(20 SECONDS)
				owner.adjust_fire_loss(5)
			if(100 to INFINITY)//no infinite abuse
				to_chat(owner, span_userdanger("You feel a slight sense of shame as your brain and spine rip themselves apart from overexertion."))
				owner.gib()
	else
		time_on -= 2

	time_on = max(time_on, 0)
	if(hasexerted && time_on == 0)
		to_chat(owner, "Your brains feels normal again.")
		hasexerted = FALSE

/obj/item/organ/cyberimp/chest/spinalspeed/emp_act(severity)
	. = ..()
	if(!syndicate_implant)//the toy has a different emp act
		owner.adjust_dizzy(severity SECONDS)
		to_chat(owner, span_warning("Your spinal implant makes you feel queasy!"))
		return

	owner.set_drugginess(4 * severity)
	owner.adjust_hallucinations((50 * severity) SECONDS)
	owner.adjust_eye_blur(2 * severity)
	owner.adjust_dizzy(severity SECONDS)
	time_on += severity
	owner.adjust_fire_loss(severity)
	to_chat(owner, span_warning("Your spinal implant malfunctions and you feel it scramble your brain!"))

/obj/item/organ/cyberimp/chest/spinalspeed/toy
	name = "glowy after-image trail implant"
	desc = "Donk Co's first forray into the world of entertainment implants. Projects a series of after-images as you move, perfect for starting a dance party all on your own."
	syndicate_implant = FALSE


/obj/item/organ/cyberimp/chest/dualwield
	name = "C.C.M.S implant"
	desc = "Short for Complementary Combat Maneuvering System, it processes spinal nerve signals and enacts forced complementary maneuvers on the opposite side of the user's body when they attack. In layman's terms, it lets you dual wield."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "ccms"
	aug_overlay = "ccms_overlay"
	visual = TRUE
	slot = ORGAN_SLOT_BRAIN_CEREBELLUM
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN
	/// How often does this particular variant actually work?
	var/proc_chance = 100
	/// Side-effect chance, if it happens, the dual-wield is cancelled. Tho, this only happens with the refurbished subtype.
	var/side_effect_chance = 0

/obj/item/organ/cyberimp/chest/dualwield/Insert(mob/living/carbon/organ_owner, special)
	. = ..()
	register()

/obj/item/organ/cyberimp/chest/dualwield/Remove(mob/living/carbon/organ_owner, special)
	. = ..()
	unregister()

/obj/item/organ/cyberimp/chest/dualwield/proc/register()
	RegisterSignal(owner, COMSIG_MOB_ITEM_ATTACK, PROC_REF(on_item_attack))

/obj/item/organ/cyberimp/chest/dualwield/proc/unregister()
	UnregisterSignal(owner, COMSIG_MOB_ITEM_ATTACK)

/obj/item/organ/cyberimp/chest/dualwield/proc/on_item_attack(mob/living/carbon/human/source, atom/target, list/modifiers)
	SIGNAL_HANDLER

	if(!isliving(target))
		return

	var/mob/living/attacked_mob = target
	var/obj/item/weapon = source.get_active_held_item()

	if(!(source.combat_mode)) // No dual wielding outside of combat mode.
		return

	if(weapon != source.get_active_held_item()) // Just to be extra careful about loops.
		return

	var/item = source.get_inactive_held_item()

	if(!item)
		return

	var/attack_time = (source.next_move - world.time) * 0.5 // Allows us to attack in the "gaps" between our owner's attacks, because it looks cool as fuck.

	if(prob(proc_chance))
		addtimer(CALLBACK(src, PROC_REF(complement_attack), source, item, attacked_mob), attack_time, TIMER_UNIQUE) // TIMER_UNIQUE makes sure this will never go exponential even if a loop is found.

/obj/item/organ/cyberimp/chest/dualwield/proc/complement_attack(mob/living/carbon/human/source, obj/item/item, mob/living/attacked_mob)
	if(QDELETED(owner) || QDELETED(attacked_mob))
		return

	if(owner.get_inactive_held_item() != item)
		return

	if(handle_side_effects(src, item, attacked_mob)) // If handle_side_effects returns true, that means we misfired.
		return

	if(attacked_mob.IsReachableBy(owner))
		unregister() // Prevent looping in on ourselves if the user switches items during the delay.
		item.attack(attacked_mob, owner)
		register()

/obj/item/organ/cyberimp/chest/dualwield/proc/handle_side_effects(mob/living/carbon/human/source, obj/item/item, mob/living/attacked_mob)
	return FALSE // Returning true means we misfired, i.e. failed to dual wield even though it should have triggered under normal circumstances.

/obj/item/organ/cyberimp/chest/dualwield/refurbished
	name = "refurbished C.C.M.S implant"
	desc = "A refurbished dual wielding implant. It looks old and the nerve filaments have degraded, but it's still functional."
	icon_state = "ccms_refurbished"
	aug_overlay = "ccms_refurbished_overlay"
	organ_flags = ORGAN_ROBOTIC
	side_effect_chance = 20

/obj/item/organ/cyberimp/chest/dualwield/refurbished/handle_side_effects(mob/living/carbon/human/source, obj/item/item, mob/target)
	if(prob(side_effect_chance)) // Low probability for it to not work at all.
		owner.visible_message(
			message = span_warning("[owner]'s arm twitches."),
			self_message = span_danger("Your C.C.M.S misfires!")
		)
		return TRUE // Cancels the complementary attack.

	if(prob(30)) // And if it does work, it might cause some damage.
		owner.visible_message(
			message = span_warning("[owner]'s arm spazzes out!"),
			self_message = span_danger("Your arm spazzes out!")
		)
		var/obj/item/bodypart/arm = owner.get_holding_bodypart_of_item(item)
		if(arm)
			arm.receive_damage(brute = 10, wound_bonus = 10, sharpness = NONE) // You can get away with like 5 spazzes before you get a dislocation.
