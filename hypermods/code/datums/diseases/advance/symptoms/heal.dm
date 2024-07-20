/datum/symptom/heal/fatigue
	name = "Neural Stimulation"
	desc = "The virus aids the central nervous system of the host, eliminating fatigue and reducing the effectiveness of stuns."
	stealth = 0
	resistance = 1
	stage_speed = 1
	transmittable = -1
	level = 11
	base_message_chance = 0.2
	passive_message = "You feel energized!" //random message to infected but not actively healing people
	threshold_descs = list(
		"Resistance 10" = "Reduces all stun times by 40% rather than the usual 20%.",
		"Stage Speed 5" = "Doubles stamina regeneration.",
		"Stealth 5" = "The virus produces chemicals that allow the host to be able to move even while in critical condition.",
		"Transmission 6" = "The virus produces chemicals that allow the host will move 5% faster when they have no fatigue."
	)
	power = 1
	var/resistmult = 1
	var/softcrit = FALSE
	var/movespeedmult = FALSE

/datum/symptom/heal/fatigue/Activate(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	var/mob/living/M = A.affected_mob
	switch(A.stage)
		if(4, 5)
			if(passive_message && prob(0.2) && passive_message_condition(M))
				to_chat(M, passive_message)
				return
			Heal(M, A)
	return

/datum/symptom/heal/fatigue/Start(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	if(A.totalResistance() >= 10)
		resistmult = 2
	if(A.totalStageSpeed() >= 5)
		power = 2
	if(A.totalStealth() >= 5)
		softcrit = TRUE
	if(A.totalTransmittable() >= 6)
		movespeedmult = TRUE

/datum/symptom/heal/fatigue/Heal(mob/living/carbon/M, datum/disease/advance/A, actual_power)

	M.adjustStaminaLoss(-(2.5*power))

	M.AdjustAllImmobility(-(20*resistmult), FALSE)

	if(softcrit && !M.reagents.has_reagent(/datum/reagent/antihardcrit,0.1))
		M.reagents.add_reagent(/datum/reagent/antihardcrit, 0.1)

	if(movespeedmult && !M.getStaminaLoss() && !M.reagents.has_reagent(/datum/reagent/diseasensstim,0.1))
		M.reagents.add_reagent(/datum/reagent/diseasensstim, 0.1)

/datum/symptom/heal/fatigue/passive_message_condition(mob/living/M)
	if(!M.getStaminaLoss())
		return TRUE
	return FALSE


/datum/symptom/heal/calorie
	name = "Nutritional Healing"
	desc = "The virus uses newly obtained nutrients inside the body to repair damaged tissue cells. Most effective on well-fed hosts."
	stealth = 0
	resistance = 1
	stage_speed = 1
	transmittable = 1
	level = 11
	passive_message = span_notice("Your body feels like it's healing...")
	required_organ = ORGAN_SLOT_LIVER
	threshold_descs = list(
		"Stage Speed 5" = "Being obese allows for slow regeneration.",
	)
	var/fatregen = FALSE

/datum/symptom/heal/calorie/Start(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	if(A.totalStageSpeed() >= 5)
		fatregen = TRUE

/datum/symptom/heal/calorie/Heal(mob/living/carbon/M, datum/disease/advance/A, actual_power)
	if(M.getBruteLoss() || M.getFireLoss() || M.getToxLoss())
		if(!M.reagents.has_reagent(/datum/reagent/medicine/metafactor, 1))
			M.reagents.add_reagent(/datum/reagent/medicine/metafactor, 0.1)

	if(fatregen && (HAS_TRAIT_FROM(M, TRAIT_FAT, OBESITY)))
		M.adjustBruteLoss(-0.2)
		M.adjustFireLoss(-0.2)
		M.adjustToxLoss(-0.1)

/datum/symptom/heal/calorie/passive_message_condition(mob/living/carbon/infected_mob)
	if(infected_mob.getBruteLoss() || infected_mob.getFireLoss())
		return TRUE

	return FALSE
