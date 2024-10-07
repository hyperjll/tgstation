/datum/status_effect/timemendsall
	id = "time mends all"
	duration = INFINITY
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
