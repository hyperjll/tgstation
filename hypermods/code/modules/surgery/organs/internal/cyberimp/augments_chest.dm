/obj/item/organ/internal/cyberimp/chest/nutriment/plus/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/chest/reviver/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/chest/reviver/fivemincap/heal() // five minute cap.
	if(COOLDOWN_FINISHED(src, defib_cooldown))
		revive_dead()

	var/need_mob_update = FALSE
	if(owner.getOxyLoss())
		need_mob_update += owner.adjustOxyLoss(-5, updating_health = FALSE)
		revive_cost += 1
	if(owner.getBruteLoss())
		need_mob_update += owner.adjustBruteLoss(-2, updating_health = FALSE)
		revive_cost += 10
	if(owner.getFireLoss())
		need_mob_update += owner.adjustFireLoss(-2, updating_health = FALSE)
		revive_cost += 10
	if(owner.getToxLoss())
		need_mob_update += owner.adjustToxLoss(-1, updating_health = FALSE)
		revive_cost += 10
	if(need_mob_update)
		owner.updatehealth()

	if(revive_cost > 3000) // Make sure this doesn't go over 5 minutes. The revive_dead proc adds 10 minutes, so this is super nice to have here.
		revive_cost = 3000

/obj/item/organ/internal/cyberimp/chest/reviver/fivemincap/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/chest/reviver/tenmincap/heal() // ten minute cap.
	if(COOLDOWN_FINISHED(src, defib_cooldown))
		revive_dead()

	var/need_mob_update = FALSE
	if(owner.getOxyLoss())
		need_mob_update += owner.adjustOxyLoss(-5, updating_health = FALSE)
		revive_cost += 1
	if(owner.getBruteLoss())
		need_mob_update += owner.adjustBruteLoss(-2, updating_health = FALSE)
		revive_cost += 10
	if(owner.getFireLoss())
		need_mob_update += owner.adjustFireLoss(-2, updating_health = FALSE)
		revive_cost += 10
	if(owner.getToxLoss())
		need_mob_update += owner.adjustToxLoss(-1, updating_health = FALSE)
		revive_cost += 10
	if(need_mob_update)
		owner.updatehealth()

	if(revive_cost > 6000) // Make sure this doesn't go over 10 minutes. The revive_dead proc adds 10 minutes, so this is super nice to have here.
		revive_cost = 6000

/obj/item/organ/internal/cyberimp/chest/reviver/tenmincap/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/chest/thrusters/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN

/obj/item/organ/internal/cyberimp/chest/regenerativebetter
	name = "regenerative implant"
	desc = "A surgical implant that when inserted into the body will slowly repair the host. Allowing for very slow recovery of all forms of damage."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "chest_implant"
	implant_overlay = "chest_implant_overlay"
	implant_color = "#AD0000"
	slot = ORGAN_SLOT_HEART_AID
	var/healing = FALSE

/obj/item/organ/internal/cyberimp/chest/regenerativebetter/on_life(seconds_per_tick, times_fired)
	if(healing)
		addtimer(CALLBACK(src, PROC_REF(heal)), 1 SECONDS)
	else
		healing = TRUE
		to_chat(owner, span_notice("Your regenerative implant was integrated successfully."))
	return

/obj/item/organ/internal/cyberimp/chest/regenerativebetter/proc/heal()
	if(owner.getOxyLoss())
		owner.adjustOxyLoss(-2.5)
	if(owner.getBruteLoss())
		owner.adjustBruteLoss(-1)
	if(owner.getFireLoss())
		owner.adjustFireLoss(-1)
	if(owner.getToxLoss())
		owner.adjustToxLoss(-0.5)

	owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, -0.5)
	owner.adjustOrganLoss(ORGAN_SLOT_HEART, -0.5)
	owner.adjustOrganLoss(ORGAN_SLOT_EYES, -0.5)
	owner.adjustOrganLoss(ORGAN_SLOT_EARS, -0.5)
	owner.adjustOrganLoss(ORGAN_SLOT_LUNGS, -0.5)
	owner.adjustOrganLoss(ORGAN_SLOT_LIVER, -0.5)
	owner.adjustOrganLoss(ORGAN_SLOT_STOMACH, -0.5)
	owner.adjustOrganLoss(ORGAN_SLOT_TONGUE, -0.5)
	owner.adjustOrganLoss(ORGAN_SLOT_APPENDIX, -0.5)

/obj/item/organ/internal/cyberimp/chest/regenerativebetter/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN


/obj/item/organ/internal/cyberimp/chest/regenerative
	name = "regenerative implant"
	desc = "A surgical implant that when inserted into the body will slowly repair the host. Allowing for very slow recovery of all forms of damage."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "chest_implant"
	implant_overlay = "chest_implant_overlay"
	implant_color = "#AD0000"
	slot = ORGAN_SLOT_HEART_AID
	var/healing = FALSE

/obj/item/organ/internal/cyberimp/chest/regenerative/on_life(seconds_per_tick, times_fired)
	if(healing)
		addtimer(CALLBACK(src, PROC_REF(heal)), 1 SECONDS)
	else
		healing = TRUE
		to_chat(owner, span_notice("Your regenerative implant was integrated successfully."))
	return

/obj/item/organ/internal/cyberimp/chest/regenerative/proc/heal()
	if(owner.getOxyLoss())
		owner.adjustOxyLoss(-1)
	if(owner.getBruteLoss())
		owner.adjustBruteLoss(-0.5)
	if(owner.getFireLoss())
		owner.adjustFireLoss(-0.5)
	if(owner.getToxLoss())
		owner.adjustToxLoss(-0.25)

	owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, -0.25)
	owner.adjustOrganLoss(ORGAN_SLOT_HEART, -0.25)
	owner.adjustOrganLoss(ORGAN_SLOT_EYES, -0.25)
	owner.adjustOrganLoss(ORGAN_SLOT_EARS, -0.25)
	owner.adjustOrganLoss(ORGAN_SLOT_LUNGS, -0.25)
	owner.adjustOrganLoss(ORGAN_SLOT_LIVER, -0.25)
	owner.adjustOrganLoss(ORGAN_SLOT_STOMACH, -0.25)
	owner.adjustOrganLoss(ORGAN_SLOT_TONGUE, -0.25)
	owner.adjustOrganLoss(ORGAN_SLOT_APPENDIX, -0.25)

/obj/item/organ/internal/cyberimp/chest/regenerative/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN


/obj/item/organ/internal/cyberimp/chest/jellypersonregen
	name = "gelatine sythesis implant"
	desc = "A surgical implant that when inserted into the body will slowly repair the host. Specifically tailored to jellypeople."
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "chest_implant"
	implant_overlay = "chest_implant_overlay"
	implant_color = "#AD5000"
	slot = ORGAN_SLOT_HEART_AID

/obj/item/organ/internal/cyberimp/chest/jellypersonregen/on_life(seconds_per_tick, times_fired)
	if(isjellyperson(owner))
		addtimer(CALLBACK(src, PROC_REF(heal)), 1 SECONDS)
	return

/obj/item/organ/internal/cyberimp/chest/jellypersonregen/proc/heal()
	if(owner.getOxyLoss())
		owner.adjustOxyLoss(-3)
	if(owner.getBruteLoss())
		owner.adjustBruteLoss(-1.5)
	if(owner.getFireLoss())
		owner.adjustFireLoss(-1.5)
	if(owner.getToxLoss())
		owner.adjustToxLoss(1)

	if(owner.blood_volume <= BLOOD_VOLUME_SAFE)
		owner.blood_volume += 1

	owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, -1)
	owner.adjustOrganLoss(ORGAN_SLOT_HEART, -1)
	owner.adjustOrganLoss(ORGAN_SLOT_EYES, -1)
	owner.adjustOrganLoss(ORGAN_SLOT_EARS, -1)
	owner.adjustOrganLoss(ORGAN_SLOT_LUNGS, -1)
	owner.adjustOrganLoss(ORGAN_SLOT_LIVER, -1)
	owner.adjustOrganLoss(ORGAN_SLOT_STOMACH, -1)
	owner.adjustOrganLoss(ORGAN_SLOT_TONGUE, -1)
	owner.adjustOrganLoss(ORGAN_SLOT_APPENDIX, -1)

/obj/item/organ/internal/cyberimp/chest/jellypersonregen/syndicate
	organ_flags = ORGAN_ROBOTIC | ORGAN_HIDDEN


/obj/item/organ/internal/cyberimp/chest/spinalspeed
	name = "neural overclocker implant"
	desc = "Stimulates your central nervous system in order to enable you to perform muscle movements faster. Careful not to overuse it."
	slot = ORGAN_SLOT_SPINAL_AUG
	icon = 'hypermods/icons/obj/medical/organs/organs.dmi'
	icon_state = "imp_spinal"
	implant_overlay = null
	implant_color = null
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

/obj/item/organ/internal/cyberimp/chest/spinalspeed/Insert(mob/living/carbon/M, special = 0)
	. = ..()

/obj/item/organ/internal/cyberimp/chest/spinalspeed/Remove(mob/living/carbon/M, special = 0)
	if(on)
		toggle(silent = TRUE)
	..()

/obj/item/organ/internal/cyberimp/chest/spinalspeed/ui_action_click()
	toggle()

/obj/item/organ/internal/cyberimp/chest/spinalspeed/proc/toggle(silent = FALSE)
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

/obj/item/organ/internal/cyberimp/chest/spinalspeed/update_icon_state()
	. = ..()
	if(on)
		icon_state = "imp_spinal-on"
	else
		icon_state = "imp_spinal"
	for(var/datum/action/A as anything in actions)
		A.build_all_button_icons()

/obj/item/organ/internal/cyberimp/chest/spinalspeed/proc/move_react()//afterimage
	var/turf/currentloc = get_turf(owner)
	var/obj/effect/temp_visual/decoy/fading/F = new(currentloc, owner)
	if(!hsv)
		hsv = rgb2hsv(rgb(255, 0, 0))
	//hsv = RotateHue(hsv, world.time - last_step * 15)
	//last_step = world.time
	F.color = hsv2rgb(hsv)	//gotta add the flair

/obj/item/organ/internal/cyberimp/chest/spinalspeed/on_life()
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
				owner.adjustFireLoss(1)
			if(50 to 100)
				if(COOLDOWN_FINISHED(src, alertcooldown) || !hasexerted)
					to_chat(owner, span_userdanger("Your spine and brain feel like they're burning!"))
					COOLDOWN_START(src, alertcooldown, 5 SECONDS)
				hasexerted = TRUE
				owner.set_drugginess(2 SECONDS)
				owner.adjust_hallucinations(20 SECONDS)
				owner.adjustFireLoss(5)
			if(100 to INFINITY)//no infinite abuse
				to_chat(owner, span_userdanger("You feel a slight sense of shame as your brain and spine rip themselves apart from overexertion."))
				owner.gib()
	else
		time_on -= 2

	time_on = max(time_on, 0)
	if(hasexerted && time_on == 0)
		to_chat(owner, "Your brains feels normal again.")
		hasexerted = FALSE

/obj/item/organ/internal/cyberimp/chest/spinalspeed/emp_act(severity)
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
	owner.adjustFireLoss(severity)
	to_chat(owner, span_warning("Your spinal implant malfunctions and you feel it scramble your brain!"))

/obj/item/organ/internal/cyberimp/chest/spinalspeed/toy
	name = "glowy after-image trail implant"
	desc = "Donk Co's first forray into the world of entertainment implants. Projects a series of after-images as you move, perfect for starting a dance party all on your own."
	syndicate_implant = FALSE
