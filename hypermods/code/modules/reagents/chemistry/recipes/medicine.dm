/datum/chemical_reaction/dexalin
	results = list(/datum/reagent/medicine/dexalin = 3)
	required_reagents = list(/datum/reagent/lemoline = 1, /datum/reagent/oxygen = 2, /datum/reagent/toxin/plasma = 5)

/datum/chemical_reaction/dexalinplus
	results = list(/datum/reagent/medicine/dexalinplus = 3)
	required_reagents = list(/datum/reagent/medicine/dexalin = 1, /datum/reagent/iron = 1, /datum/reagent/carbon = 1)

/datum/chemical_reaction/inaprovaline
	results = list(/datum/reagent/medicine/inaprovaline = 3)
	required_reagents = list(/datum/reagent/oxygen = 1, /datum/reagent/consumable/sugar = 1, /datum/reagent/carbon = 1)

/datum/chemical_reaction/inaprovalineplus
	results = list(/datum/reagent/medicine/coagulant/inaprovaline = 1)
	required_reagents = list(/datum/reagent/medicine/inaprovaline = 1, /datum/reagent/medicine/epinephrine = 1)

/datum/chemical_reaction/bicaridine
	results = list(/datum/reagent/medicine/bicaridine = 4)
	required_reagents = list(/datum/reagent/carbon = 1, /datum/reagent/oxygen = 1, /datum/reagent/consumable/sugar = 1, /datum/reagent/lemoline = 1)

/datum/chemical_reaction/kelotane
	results = list(/datum/reagent/medicine/kelotane = 3)
	required_reagents = list(/datum/reagent/lemoline = 1, /datum/reagent/silicon = 1, /datum/reagent/carbon = 1)

/datum/chemical_reaction/dermaline
	results = list(/datum/reagent/medicine/dermaline = 3)
	required_reagents = list(/datum/reagent/medicine/kelotane = 1, /datum/reagent/oxygen = 1, /datum/reagent/phosphorus = 1)

/datum/chemical_reaction/dylovene
	results = list(/datum/reagent/medicine/dylovene = 3)
	required_reagents = list(/datum/reagent/potassium = 1, /datum/reagent/silicon = 1, /datum/reagent/nitrogen = 1)

/datum/chemical_reaction/antitoxin
	results = list(/datum/reagent/medicine/antitoxin = 4)
	required_reagents = list(/datum/reagent/lemoline = 1, /datum/reagent/silicon = 1, /datum/reagent/nitrogen = 1, /datum/reagent/potassium = 1)

/datum/chemical_reaction/hyronalin
	results = list(/datum/reagent/medicine/hyronalin = 2)
	required_reagents = list(/datum/reagent/medicine/dylovene = 1, /datum/reagent/uranium/radium = 1)

/datum/chemical_reaction/arithrazine
	results = list(/datum/reagent/medicine/arithrazine = 2)
	required_reagents = list(/datum/reagent/medicine/hyronalin = 1, /datum/reagent/hydrogen = 1)

/datum/chemical_reaction/tranexamicacid
	results = list(/datum/reagent/medicine/coagulant/tranexamicacid = 3)
	required_reagents = list(/datum/reagent/toxin/acid = 1, /datum/reagent/consumable/sugar = 1, /datum/reagent/medicine/coagulant/inaprovaline = 1)

/datum/chemical_reaction/ultravasculine
	results = list(/datum/reagent/medicine/ultravasculine = 2)
	required_reagents = list(/datum/reagent/toxin/plasma = 5, /datum/reagent/toxin/histamine = 2)

/datum/chemical_reaction/tricordrazine
	results = list(/datum/reagent/medicine/tricordrazine = 3)
	required_reagents = list(/datum/reagent/medicine/bicaridine = 1, /datum/reagent/medicine/dermaline = 1, /datum/reagent/medicine/antitoxin = 1)

/datum/chemical_reaction/stimulants
	results = list(/datum/reagent/medicine/stimulants = 3)
	required_reagents = list(/datum/reagent/vestine = 1, /datum/reagent/medicine/ephedrine = 1, /datum/reagent/oxygen = 2)
	required_temp = 370
