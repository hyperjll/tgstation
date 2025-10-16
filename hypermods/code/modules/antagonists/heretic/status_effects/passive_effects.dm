/datum/status_effect/haste
	id = "heretic haste"
	duration = STATUS_EFFECT_PERMANENT
	alert_type = null

/datum/status_effect/haste/on_apply()
	. = ..()
	owner.add_movespeed_modifier(/datum/movespeed_modifier/haste)
	owner.add_actionspeed_modifier(/datum/actionspeed_modifier/haste)

/datum/status_effect/haste/tick()
	var/mob/living/carbon/human/carbon_human = owner

	carbon_human.adjust_nutrition(-0.2)

	for(var/datum/reagent/toxin/R in carbon_human.reagents.reagent_list)
		carbon_human.reagents.remove_reagent(R.type,1)

/datum/status_effect/haste/on_remove()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/haste)
	owner.remove_actionspeed_modifier(/datum/actionspeed_modifier/haste)


/datum/status_effect/age_curse
	id = "age_curse"
	status_type = STATUS_EFFECT_REPLACE
	alert_type = null
	tick_interval = 1 SECONDS

/datum/status_effect/age_curse/on_apply()
	to_chat(owner, span_userdanger("Your body is aging quickly!"))
	return TRUE

/datum/status_effect/age_curse/tick(seconds_between_ticks)
	. = ..()
	if(!ishuman(owner))
		return
	var/mob/living/carbon/human/human_owner = owner
	human_owner.age += 1

/datum/status_effect/age_curse/on_remove()
	var/mob/living/carbon/human/human_owner = owner
	human_owner.apply_status_effect(/datum/status_effect/rapidaging/lesser)


/datum/status_effect/eldritch_echoes
	id = "eldritch_echoes"
	status_type = STATUS_EFFECT_REPLACE
	alert_type = null
	duration = 3 MINUTES
	tick_interval = 1 SECONDS

/datum/status_effect/eldritch_echoes/on_apply()
	to_chat(owner, span_userdanger("You hear something akin to chanting in the distance..."))
	return TRUE

/datum/status_effect/eldritch_echoes/on_remove()
	var/turf/targeted_turf = get_turf(owner)
	playsound(targeted_turf, 'sound/effects/curse/curseattack.ogg', 80, TRUE)

	var/mob/living/carbon/human/human_owner = owner
	human_owner.adjustBruteLoss(30)
	human_owner.adjustFireLoss(30)
	human_owner.Knockdown(4 SECONDS)
	to_chat(owner, span_userdanger("The chanting grows inexplicably louder as wounds manifest upon you!"))
