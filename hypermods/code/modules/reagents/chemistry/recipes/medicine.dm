/datum/chemical_reaction/dexalin
	results = list(/datum/reagent/medicine/dexalin = 3)
	required_reagents = list(/datum/reagent/lemoline = 1, /datum/reagent/oxygen = 2, /datum/reagent/toxin/plasma = 5)
	optimal_ph_min = 3
	optimal_ph_max = 9
	reaction_tags = REACTION_TAG_HEALING | REACTION_TAG_OXY

/datum/chemical_reaction/dexalinplus
	results = list(/datum/reagent/medicine/dexalinplus = 3)
	required_reagents = list(/datum/reagent/medicine/dexalin = 1, /datum/reagent/iron = 1, /datum/reagent/carbon = 1)
	optimal_ph_min = 6
	optimal_ph_max = 11
	reaction_tags = REACTION_TAG_HEALING | REACTION_TAG_OXY

/datum/chemical_reaction/inaprovaline
	results = list(/datum/reagent/medicine/inaprovaline = 3)
	required_reagents = list(/datum/reagent/oxygen = 1, /datum/reagent/consumable/sugar = 1, /datum/reagent/iron = 1)
	optimal_ph_min = 5
	optimal_ph_max = 8
	reaction_tags = REACTION_TAG_EASY | REACTION_TAG_HEALING | REACTION_TAG_OXY

/datum/chemical_reaction/inaprovalineplus
	results = list(/datum/reagent/medicine/coagulant/inaprovaline = 1)
	required_reagents = list(/datum/reagent/medicine/inaprovaline = 1, /datum/reagent/medicine/epinephrine = 1)
	optimal_ph_min = 5
	optimal_ph_max = 8
	reaction_tags = REACTION_TAG_HEALING | REACTION_TAG_OXY

/datum/chemical_reaction/bicaridine
	results = list(/datum/reagent/medicine/bicaridine = 4)
	required_reagents = list(/datum/reagent/carbon = 1, /datum/reagent/oxygen = 1, /datum/reagent/consumable/sugar = 1, /datum/reagent/lemoline = 1)
	optimal_ph_min = 6
	optimal_ph_max = 11
	reaction_tags = REACTION_TAG_HEALING | REACTION_TAG_BRUTE

/datum/chemical_reaction/kelotane
	results = list(/datum/reagent/medicine/kelotane = 3)
	required_reagents = list(/datum/reagent/lemoline = 1, /datum/reagent/silicon = 1, /datum/reagent/carbon = 1)
	optimal_ph_min = 6
	optimal_ph_max = 9
	reaction_tags = REACTION_TAG_HEALING | REACTION_TAG_BURN

/datum/chemical_reaction/dermaline
	results = list(/datum/reagent/medicine/dermaline = 3)
	required_reagents = list(/datum/reagent/medicine/kelotane = 1, /datum/reagent/oxygen = 1, /datum/reagent/phosphorus = 1)
	optimal_ph_min = 7
	optimal_ph_max = 9
	reaction_tags = REACTION_TAG_HEALING | REACTION_TAG_BURN

/datum/chemical_reaction/dylovene
	results = list(/datum/reagent/medicine/dylovene = 3)
	required_reagents = list(/datum/reagent/potassium = 1, /datum/reagent/silicon = 1, /datum/reagent/nitrogen = 1)
	required_temp = 360
	optimal_ph_min = 4
	optimal_ph_max = 6
	reaction_tags = REACTION_TAG_EASY | REACTION_TAG_HEALING

/datum/chemical_reaction/ambuzol
	results = list(/datum/reagent/medicine/ambuzol = 3)
	required_reagents = list(/datum/reagent/medicine/dylovene = 1, /datum/reagent/ammonia = 1, /datum/reagent/medicine/omnizine = 1)
	optimal_ph_min = 4
	optimal_ph_max = 5
	reaction_tags = REACTION_TAG_CHEMICAL | REACTION_TAG_TOXIN | REACTION_TAG_ORGAN

/datum/chemical_reaction/antitoxin
	results = list(/datum/reagent/medicine/antitoxin = 4)
	required_reagents = list(/datum/reagent/lemoline = 1, /datum/reagent/silicon = 1, /datum/reagent/nitrogen = 1, /datum/reagent/potassium = 1)
	optimal_ph_min = 6
	optimal_ph_max = 10
	reaction_tags = REACTION_TAG_HEALING | REACTION_TAG_TOXIN

/datum/chemical_reaction/hyronalin
	results = list(/datum/reagent/medicine/hyronalin = 2)
	required_reagents = list(/datum/reagent/medicine/dylovene = 1, /datum/reagent/uranium/radium = 1)
	optimal_ph_min = 4
	optimal_ph_max = 7
	reaction_tags = REACTION_TAG_HEALING | REACTION_TAG_TOXIN

/datum/chemical_reaction/arithrazine
	results = list(/datum/reagent/medicine/arithrazine = 2)
	required_reagents = list(/datum/reagent/medicine/hyronalin = 1, /datum/reagent/hydrogen = 1)
	optimal_ph_min = 3
	optimal_ph_max = 7
	reaction_tags = REACTION_TAG_HEALING | REACTION_TAG_TOXIN

/datum/chemical_reaction/tranexamicacid
	results = list(/datum/reagent/medicine/coagulant/tranexamicacid = 3)
	required_reagents = list(/datum/reagent/toxin/acid = 1, /datum/reagent/consumable/sugar = 1, /datum/reagent/medicine/coagulant/inaprovaline = 1)
	optimal_ph_min = 4
	optimal_ph_max = 9
	reaction_tags = REACTION_TAG_HEALING | REACTION_TAG_OXY

/datum/chemical_reaction/ultravasculine
	results = list(/datum/reagent/medicine/ultravasculine = 1)
	required_reagents = list(/datum/reagent/toxin/plasma = 1, /datum/reagent/medicine/diphenhydramine = 1)
	optimal_ph_min = 1
	optimal_ph_max = 5
	reaction_tags = REACTION_TAG_CHEMICAL | REACTION_TAG_TOXIN

/datum/chemical_reaction/ultravasculine/alt
	results = list(/datum/reagent/medicine/ultravasculine = 2)
	required_reagents = list(/datum/reagent/toxin/plasma = 5, /datum/reagent/toxin/histamine = 2)

/datum/chemical_reaction/tricordrazine
	results = list(/datum/reagent/medicine/tricordrazine = 3)
	required_reagents = list(/datum/reagent/medicine/bicaridine = 1, /datum/reagent/medicine/kelotane = 1, /datum/reagent/medicine/antitoxin = 1)
	optimal_ph_min = 5
	optimal_ph_max = 9
	reaction_tags = REACTION_TAG_HEALING | REACTION_TAG_BRUTE | REACTION_TAG_TOXIN

/datum/chemical_reaction/stimulants
	results = list(/datum/reagent/medicine/stimulants = 3)
	required_reagents = list(/datum/reagent/vestine = 1, /datum/reagent/medicine/ephedrine = 1, /datum/reagent/oxygen = 2)
	required_temp = 300
	reaction_tags = REACTION_TAG_CHEMICAL | REACTION_TAG_DRUG

/datum/chemical_reaction/styptic_powder
	results = list(/datum/reagent/medicine/styptic_powder = 4)
	required_reagents = list(/datum/reagent/aluminium = 1, /datum/reagent/hydrogen = 1, /datum/reagent/oxygen = 1, /datum/reagent/toxin/acid = 1)
	optimal_ph_min = 3
	optimal_ph_max = 9
	reaction_tags = REACTION_TAG_HEALING | REACTION_TAG_BRUTE

/datum/chemical_reaction/silver_sulfadiazine
	results = list(/datum/reagent/medicine/silver_sulfadiazine = 5)
	required_reagents = list(/datum/reagent/ammonia = 1, /datum/reagent/silver = 1, /datum/reagent/sulfur = 1, /datum/reagent/oxygen = 1, /datum/reagent/chlorine = 1)
	optimal_ph_min = 4
	optimal_ph_max = 10
	reaction_tags = REACTION_TAG_HEALING | REACTION_TAG_BURN

/datum/chemical_reaction/omnizine
	results = list(/datum/reagent/medicine/omnizine = 6)
	required_reagents = list(/datum/reagent/vestine = 1, /datum/reagent/phenol = 2, /datum/reagent/acetone = 2, /datum/reagent/water/salt = 1)
	required_temp = 300
	reaction_tags = REACTION_TAG_HEALING | REACTION_TAG_BRUTE | REACTION_TAG_TOXIN | REACTION_TAG_BURN | REACTION_TAG_OXY

/datum/chemical_reaction/medicine/pen_acid/alt
	results = list(/datum/reagent/medicine/pen_acid = 3)
	required_reagents = list(/datum/reagent/vestine = 1, /datum/reagent/ammonia = 1, /datum/reagent/consumable/salt = 1)
	required_temp = 300

/datum/chemical_reaction/medicine/atropine/alt
	results = list(/datum/reagent/medicine/atropine = 6)
	required_reagents = list(/datum/reagent/vestine = 1, /datum/reagent/acetone = 1, /datum/reagent/diethylamine = 1)
	required_temp = 300

/datum/chemical_reaction/medicine/modafinil/alt
	results = list(/datum/reagent/medicine/modafinil = 4)
	required_reagents = list(/datum/reagent/vestine = 1, /datum/reagent/ammonia = 1, /datum/reagent/toxin/acid = 1)
	required_temp = 300
