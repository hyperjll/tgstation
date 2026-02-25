/obj/item/cigarette/interdyne
	desc = "An interdyne brand cigarette."
	chem_volume = 60
	smoketime = 2 MINUTES
	smoke_all = TRUE
	lung_harm = 0.2
	list_reagents = list(/datum/reagent/drug/nicotine = 7.5, /datum/reagent/drug/nicotwaine = 2.5, /datum/reagent/medicine/omnizine = 5, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/drug/happiness = 15, /datum/reagent/drug/opium = 10, /datum/reagent/medicine/ultravasculine = 2, /datum/reagent/medicine/mannitol = 3)

/obj/item/cigarette/interdyne/smoke_in_face(mob/living/getting_smoked)
	. = ..()
	getting_smoked.adjust_eye_blur(6 SECONDS)
	getting_smoked.adjust_temp_blindness(2 SECONDS)

/obj/item/cigarette/cigar/interdyne
	smoketime = 6 MINUTES
	smoke_all = TRUE
	chem_volume = 120
	lung_harm = 0.2
	list_reagents = list(/datum/reagent/drug/nicotine = 10, /datum/reagent/drug/nicotwaine = 5, /datum/reagent/medicine/omnizine = 30, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/drug/happiness = 30, /datum/reagent/drug/opium = 15, /datum/reagent/medicine/ultravasculine = 2.5, /datum/reagent/medicine/ambuzol = 5, /datum/reagent/medicine/mannitol = 7.5)
	choke_time_max = 30 SECONDS

/obj/item/cigarette/cigar/payload
	smoke_all = TRUE
	chem_volume = 300
