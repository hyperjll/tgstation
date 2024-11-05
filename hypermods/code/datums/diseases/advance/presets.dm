//Randomly generated symptom, for virus crates and events
/datum/disease/advance/isolatedsymptom
	copy_type = /datum/disease/advance

/datum/disease/advance/isolatedsymptom/New(max_symptoms, max_level = 12)
	if(!max_symptoms)
		max_symptoms = rand(1, 1)
	var/list/datum/symptom/possible_symptoms = list()
	for(var/symptom in subtypesof(/datum/symptom))
		var/datum/symptom/S = symptom
		if(!initial(S.naturally_occuring))
			continue
		if(initial(S.level) > max_level)
			continue
		if(initial(S.level) <= 0) //unobtainable symptoms
			continue
		possible_symptoms += S
	for(var/i in 1 to max_symptoms)
		var/datum/symptom/chosen_symptom = pick_n_take(possible_symptoms)
		if(chosen_symptom)
			var/datum/symptom/S = new chosen_symptom
			symptoms += S
	Refresh()

	name = "Isolated Symptom #[rand(1,100)]"

// Syndicate stuff

/datum/disease/advance/syndicate
	copy_type = /datum/disease/advance

/datum/disease/advance/syndicate/New()
	name = "Syndicate Virus Gene"
	symptoms = list(new/datum/symptom/syndicatebuff)
	..()

/datum/disease/advance/syndicatestealth
	copy_type = /datum/disease/advance

/datum/disease/advance/syndicatestealth/New()
	name = "Syndicate Stealthy Virus Gene"
	symptoms = list(new/datum/symptom/syndicatebuffstealth)
	..()

/datum/disease/advance/syndicateresist
	copy_type = /datum/disease/advance

/datum/disease/advance/syndicateresist/New()
	name = "Syndicate Resistant Virus Gene"
	symptoms = list(new/datum/symptom/syndicatebuffresist)
	..()

/datum/disease/advance/syndicatespeed
	copy_type = /datum/disease/advance

/datum/disease/advance/syndicatespeed/New()
	name = "Syndicate Fast-Acting Virus Gene"
	symptoms = list(new/datum/symptom/syndicatebuffspeed)
	..()

/datum/disease/advance/syndicatetrans
	copy_type = /datum/disease/advance

/datum/disease/advance/syndicatetrans/New()
	name = "Syndicate Transmissable Virus Gene"
	symptoms = list(new/datum/symptom/syndicatebufftrans)
	..()


/datum/disease/advance/supersyndicate
	copy_type = /datum/disease/advance

/datum/disease/advance/supersyndicate/New()
	name = "S. Augmented Virus"
	symptoms = list(new/datum/symptom/supersyndicatebuff,
					new/datum/symptom/inorganic_adaptation,
					new/datum/symptom/heal/darkness,
					new/datum/symptom/heal/water,
					new/datum/symptom/heal/starlight,
					new/datum/symptom/heal/plasma,
					new/datum/symptom/heal/radiation,
					new/datum/symptom/oxygen)
	..()


/datum/disease/advance/onerandompos
	copy_type = /datum/disease/advance

/datum/disease/advance/onerandompos/New()
	name = "Weak Positive Virus"

	var/list/datum/symptom/possible_symptoms = list(
		/datum/symptom/good_genetic_mutation,
		/datum/symptom/heal/fatigue,
		/datum/symptom/heal/calorie,
		/datum/symptom/heal/darkness,
		/datum/symptom/heal/water,
		/datum/symptom/heal/starlight,
		/datum/symptom/heal/plasma,
		/datum/symptom/heal/radiation,
		/datum/symptom/heal/chem,
		/datum/symptom/heal/coma,
		/datum/symptom/oxygen,
		/datum/symptom/actionspd,
		/datum/symptom/mind_restoration,
		/datum/symptom/sensory_restoration,
	)

	var/symptom = pick(possible_symptoms)

	symptoms = list(new symptom)
	..()
