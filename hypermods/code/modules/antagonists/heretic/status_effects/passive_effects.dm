/datum/status_effect/timemendsall
	id = "time mends all"
	duration = STATUS_EFFECT_PERMANENT
	alert_type = null
	var/healing = -4
	var/stunresist = -40
	var/toggled = FALSE

/datum/status_effect/timemendsall/tick()
	var/mob/living/carbon/human/carbon_human = owner
	if(iscarbon(carbon_human) && carbon_human.age >= 50) // First we determine if your eligable.
		if(toggled)
			to_chat(carbon_human, span_notice("You no longer feel time itself wind around your form!"))
			turnoff()
	else
		if(!toggled)
			to_chat(carbon_human, span_notice("You feel time itself wind around your form..."))
			turnon()

		carbon_human.AdjustAllImmobility(stunresist)

		if(carbon_human.getBruteLoss())
			carbon_human.age += 1
			carbon_human.adjustBruteLoss(healing)

		if(carbon_human.getFireLoss())
			carbon_human.age += 1
			carbon_human.adjustFireLoss(healing)

		if(carbon_human.getToxLoss())
			carbon_human.age += 1
			carbon_human.adjustToxLoss(healing)

		if(carbon_human.getOxyLoss())
			carbon_human.age += 1
			carbon_human.adjustOxyLoss(healing)

/datum/status_effect/timemendsall/proc/turnon()
	toggled = TRUE
	ADD_TRAIT(owner, TRAIT_BATON_RESISTANCE, "time_mends_all")
	owner.add_actionspeed_modifier(/datum/actionspeed_modifier/timemendsall)

/datum/status_effect/timemendsall/proc/turnoff()
	toggled = FALSE
	REMOVE_TRAIT(owner, TRAIT_BATON_RESISTANCE, "time_mends_all")
	owner.remove_actionspeed_modifier(/datum/actionspeed_modifier/timemendsall)


/datum/status_effect/timemendsall/ascension
	id = "ascended time mends all"
	healing = -12
	stunresist = -100


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


/datum/status_effect/cursed_flames
	id = "cursed_flames"
	status_type = STATUS_EFFECT_REPLACE
	alert_type = null
	duration = 20 SECONDS
	tick_interval = 5 SECONDS

/datum/status_effect/cursed_flames/tick(seconds_between_ticks)
	. = ..()
	if(!ishuman(owner))
		return
	var/mob/living/carbon/human/human_owner = owner
	human_owner.adjust_fire_stacks(1)
	if(human_owner.fire_stacks < 1)
		human_owner.ignite_mob()
