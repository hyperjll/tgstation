/datum/chemical_reaction/nicotine
	results = list(/datum/reagent/drug/nicotine = 0.5)
	required_reagents = list(/datum/reagent/bromine = 1, /datum/reagent/hydrogen = 1, /datum/reagent/ash = 1)
	required_temp = 477
	reaction_tags = REACTION_TAG_EASY | REACTION_TAG_OTHER | REACTION_TAG_DRUG

/datum/chemical_reaction/syndimethamphetamine
	results = list(/datum/reagent/drug/syndimethamphetamine = 2)
	required_reagents = list(/datum/reagent/vestine = 1, /datum/reagent/drug/methamphetamine = 1)
	required_temp = 300

/datum/chemical_reaction/bath_salts/alt
	results = list(/datum/reagent/drug/bath_salts = 4)
	required_reagents = list(/datum/reagent/vestine = 1, /datum/reagent/saltpetre = 1, /datum/reagent/space_cleaner = 1)
	required_temp = 300

/datum/chemical_reaction/maint_tar1/alt
	results = list(/datum/reagent/drug/maint/tar = 3)
	required_reagents = list(/datum/reagent/vestine = 1, /datum/reagent/bromine = 1, /datum/reagent/fuel = 1)
	required_temp = 300

/datum/chemical_reaction/painkillers
	results = list(/datum/reagent/drug/painkillers = 5)
	required_reagents = list(/datum/reagent/medicine/c2/libital = 2, /datum/reagent/consumable/ethanol = 2, /datum/reagent/oxygen = 1)
	required_temp = 300
	reaction_tags = REACTION_TAG_EASY | REACTION_TAG_HEALING | REACTION_TAG_OTHER | REACTION_TAG_DRUG

/datum/chemical_reaction/opium
	results = list(/datum/reagent/drug/opium = 3)
	required_reagents = list(/datum/reagent/drug/painkillers = 2, /datum/reagent/drug/space_drugs = 1)
	required_temp = 300
	reaction_tags = REACTION_TAG_OTHER | REACTION_TAG_HEALING | REACTION_TAG_DRUG

/datum/chemical_reaction/heroin
	results = list(/datum/reagent/drug/heroin = 1)
	required_reagents = list(/datum/reagent/drug/painkillers = 2, /datum/reagent/medicine/morphine = 1, /datum/reagent/oxygen = 1)
	required_temp = 480
	reaction_tags = REACTION_TAG_OTHER | REACTION_TAG_HEALING | REACTION_TAG_DRUG
