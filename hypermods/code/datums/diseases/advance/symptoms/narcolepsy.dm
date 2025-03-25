/datum/symptom/insomnia
	name = "Insomnia"
	desc = "The virus alters brain patterns within the host, suppressing the brain's natural sleep functionality."
	stealth = -1
	resistance = 0
	stage_speed = 0
	transmittable = 2
	level = 12
	symptom_delay_min = 30
	symptom_delay_max = 85
	threshold_descs = list(
		"Resistance 8" = "The stamina drain no longer occurs.",
	)
	var/stamdrain = TRUE

/datum/symptom/insomnia/Start(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	if(A.totalResistance() >= 8)
		stamdrain = FALSE

/datum/symptom/insomnia/on_stage_change(datum/disease/advance/A)
	. = ..()
	if(!.)
		return FALSE
	var/mob/living/carbon/M = A.affected_mob
	if(A.stage >= 4)
		ADD_TRAIT(M, TRAIT_SLEEPIMMUNE, DISEASE_TRAIT)
	else
		REMOVE_TRAIT(M, TRAIT_SLEEPIMMUNE, DISEASE_TRAIT)
	return TRUE

/datum/symptom/insomnia/Activate(datum/disease/advance/A)
	. = ..()
	if(!.)
		return

	var/mob/living/M = A.affected_mob
	switch(A.stage)
		if(1, 2, 3, 4)
			if(prob(50))
				to_chat(M, span_notice("You suddenly find it difficult to blink."))

		if(5)
			if(stamdrain && (M.getStaminaLoss() < 20))
				M.adjustStaminaLoss(2.5)
