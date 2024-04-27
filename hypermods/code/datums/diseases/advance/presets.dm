// Syndicate stuff

/datum/disease/advance/syndicate
	copy_type = /datum/disease/advance

/datum/disease/advance/syndicate/New()
	name = "Syndicate Virus Gene"
	symptoms = list(new/datum/symptom/syndicatebuff)
	..()

/datum/disease/advance/syndicate/stealth
	copy_type = /datum/disease/advance

/datum/disease/advance/syndicate/stealth/New()
	name = "Syndicate Stealthy Virus Gene"
	symptoms = list(new/datum/symptom/syndicatebuffstealth)
	..()

/datum/disease/advance/syndicate/resist
	copy_type = /datum/disease/advance

/datum/disease/advance/syndicate/resist/New()
	name = "Syndicate Resistant Virus Gene"
	symptoms = list(new/datum/symptom/syndicatebuffresist)
	..()

/datum/disease/advance/syndicate/speed
	copy_type = /datum/disease/advance

/datum/disease/advance/syndicate/speed/New()
	name = "Syndicate Fast-Acting Virus Gene"
	symptoms = list(new/datum/symptom/syndicatebuffspeed)
	..()

/datum/disease/advance/syndicate/trans
	copy_type = /datum/disease/advance

/datum/disease/advance/syndicate/trans/New()
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
