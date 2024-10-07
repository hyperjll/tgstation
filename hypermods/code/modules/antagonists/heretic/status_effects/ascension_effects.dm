/datum/status_effect/rapidaging
	id = "rapid aging"
	duration = INFINITY
	alert_type = null
	var/probability = 5

/datum/status_effect/rapidaging/tick(seconds_between_ticks)
	if(iscarbon(owner) && prob(probability))
		var/mob/living/carbon/human/carbon_human = owner
		carbon_human.age += 1
		agecheck()
		probability = 5
	else
		probability += 5

/datum/status_effect/rapidaging/proc/agecheck()
	var/mob/living/carbon/human/carbon_human = owner

	if(carbon_human.age > 60)
		carbon_human.set_facial_haircolor("#cccccc", update = FALSE)
		carbon_human.set_haircolor("#cccccc", update = TRUE)

	if(carbon_human.age > 100)
		carbon_human.become_nearsighted(type)
		if(prob(carbon_human.age / 1))
			var/datum/disease/heart_disease = new /datum/disease/heart_failure()
			carbon_human.ForceContractDisease(heart_disease, FALSE, TRUE)
			if(carbon_human.gender == MALE)
				carbon_human.set_facial_hairstyle("Beard (Very Long)", update = TRUE)

	if(carbon_human.age > 969)
		carbon_human.visible_message(span_notice("[carbon_human] becomes older than any man should be.. and crumbles into dust!"))
		carbon_human.dust(just_ash = FALSE, drop_items = TRUE, force = FALSE)

/datum/status_effect/rapidaging/lesser // Just here to apply to proc above
	id = "age checker"
	duration = 1
	alert_type = null
	probability = 0 // Don't want any accidentally age-ups with this one

/datum/status_effect/rapidaging/lesser/tick(seconds_between_ticks)
	agecheck()
