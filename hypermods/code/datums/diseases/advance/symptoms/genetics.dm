/datum/symptom/good_genetic_mutation
	name = "Beneficial DNA Activator"
	desc = "The virus bonds with the DNA of the host, activating random dormant beneficial mutations within their DNA to improve host survivability. When the virus is cured, the host's genetic alterations are undone."
	stealth = -4
	resistance = -3
	stage_speed = -1
	transmittable = -2
	level = 12
	base_message_chance = 50
	symptom_delay_min = 30
	symptom_delay_max = 60
	var/no_reset = FALSE
	var/mutadone_proof = NONE
	threshold_descs = list(
		"Resistance 10" = "The positive mutations caused by the virus are mutadone-proof (but will still be undone when the virus is cured if the resistance 16 threshold is not met).",
		"Resistance 16" = "The host's genetic alterations are not undone when the virus is cured.",
		"Stage Speed 10" = "The virus activates dormant mutations at a much faster rate.",
	)

/datum/symptom/good_genetic_mutation/Start(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	if(A.totalStageSpeed() >= 10) //activate dormant mutations more often at around 1.5x the pace
		symptom_delay_min = 20
		symptom_delay_max = 40
	if(A.totalResistance() >= 8) // Fuck your mutadone sprays.
		mutadone_proof = (POSITIVE)
	if(A.totalResistance() >= 14) // A true god amongst men.
		no_reset = TRUE

/datum/symptom/good_genetic_mutation/Activate(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	var/mob/living/carbon/C = A.affected_mob
	if(!C.has_dna())
		return
	switch(A.stage)
		if(4, 5)
			to_chat(C, span_warning("[pick("Your skin feels rubbery.", "You feel a spark of energy curl up within you.")]"))
			C.easy_random_mutate((POSITIVE), TRUE, TRUE, TRUE, mutadone_proof)

/datum/symptom/good_genetic_mutation/End(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	if(!no_reset)
		var/mob/living/carbon/M = A.affected_mob
		if(M.has_dna())
			M.dna.remove_all_mutations(list(MUT_NORMAL, MUT_EXTRA), FALSE)
