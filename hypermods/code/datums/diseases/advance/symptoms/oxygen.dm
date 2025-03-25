/datum/symptom/anemia
	name = "Anemia"
	desc = "The virus eats the host's blood cells to sustain itself."
	stealth = 0
	resistance = 1
	stage_speed = -1
	transmittable = 1
	severity = 5
	level = 12
	base_message_chance = 5
	symptom_delay_min = 1
	symptom_delay_max = 1
	threshold_descs = list(
		"Resistance 10" = "The virus can consume large amounts of blood, leading to suffocation.",
		"Stealth 6" = "This symptom remains hidden until active.",
	)
	var/nobloodlimit = FALSE
	var/stealthy = FALSE

/datum/symptom/anemia/Start(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	if(A.totalResistance() >= 8) //blood regeneration
		nobloodlimit = TRUE
	if(A.totalStealth() >= 6)
		stealthy = TRUE

/datum/symptom/anemia/Activate(datum/disease/advance/advanced_disease)
	. = ..()
	if(!.)
		return

	var/mob/living/carbon/infected_mob = advanced_disease.affected_mob
	switch(advanced_disease.stage)
		if(1, 2, 3)
			if(prob(base_message_chance) && !(stealthy))
				to_chat(infected_mob, span_warning("[pick("You body begins to sweat.", "You notice how sickly you look.", "It's getting harder to concentrate.")]"))
		if(4, 5)
			if(nobloodlimit && infected_mob.blood_volume < BLOOD_VOLUME_NORMAL)
				infected_mob.blood_volume -= 1
			if(infected_mob.blood_volume > BLOOD_VOLUME_NORMAL)
				infected_mob.blood_volume -= 1
	return
