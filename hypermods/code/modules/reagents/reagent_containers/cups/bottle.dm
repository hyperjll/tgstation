/obj/item/reagent_containers/cup/bottle/omnizine
	name = "omnizine bottle"
	desc = "A small bottle of omnizine. Drink in moderation."
	custom_price = 100
	custom_premium_price = 200
	list_reagents = list(/datum/reagent/medicine/omnizine = 30)

/obj/item/reagent_containers/cup/bottle/probital
	name = "probital bottle"
	list_reagents = list(/datum/reagent/medicine/c2/probital = 30)

/obj/item/reagent_containers/cup/bottle/modafinil
	name = "modafinil bottle"
	list_reagents = list(/datum/reagent/medicine/modafinil = 30)

/obj/item/reagent_containers/cup/bottle/methamphetamine
	name = "methamphetamine bottle"
	custom_price = 50
	custom_premium_price = 100
	list_reagents = list(/datum/reagent/drug/methamphetamine = 30)

/obj/item/reagent_containers/cup/bottle/libital
	name = "libital bottle"
	desc = "A small bottle of libital."
	custom_price = 25
	list_reagents = list(/datum/reagent/medicine/c2/libital = 30)

/obj/item/reagent_containers/cup/bottle/aiuri
	name = "aiuri bottle"
	desc = "A small bottle of aiuri."
	custom_price = 25
	list_reagents = list(/datum/reagent/medicine/c2/aiuri = 30)

/obj/item/reagent_containers/cup/bottle/syriniver
	name = "syriniver bottle"
	list_reagents = list(/datum/reagent/medicine/c2/syriniver = 30)
	custom_price = 25

/obj/item/reagent_containers/cup/bottle/convermol
	name = "convermol bottle"
	list_reagents = list(/datum/reagent/medicine/c2/convermol = 30)
	custom_price = 25

/obj/item/reagent_containers/cup/bottle/stimulants
	name = "stimulants bottle"
	desc = "A small bottle of stimulants."
	list_reagents = list(/datum/reagent/medicine/stimulants = 30)

/obj/item/reagent_containers/cup/bottle/nocturine
	name = "nocturine bottle"
	list_reagents = list(/datum/reagent/toxin/nocturine = 30)

/obj/item/reagent_containers/cup/bottle/nocturine/full
	name = "nocturine bottle"
	list_reagents = list(/datum/reagent/toxin/nocturine = 50)

/obj/item/reagent_containers/cup/bottle/sal_acid
	name = "salicyclic acid bottle"
	list_reagents = list(/datum/reagent/medicine/sal_acid = 30)
	custom_premium_price = 50

/obj/item/reagent_containers/cup/bottle/oxandrolone
	name = "oxandrolone bottle"
	list_reagents = list(/datum/reagent/medicine/oxandrolone = 30)
	custom_premium_price = 50

/obj/item/reagent_containers/cup/bottle/salbutamol
	name = "salbutamol bottle"
	list_reagents = list(/datum/reagent/medicine/salbutamol = 30)
	custom_premium_price = 50

/obj/item/reagent_containers/cup/bottle/coagulant
	name = "sanguirite bottle"
	list_reagents = list(/datum/reagent/medicine/coagulant = 30)
	custom_premium_price = 50

/obj/item/reagent_containers/cup/bottle/lavaland
	name = "lavaland extract mix bottle"
	custom_price = 50
	custom_premium_price = 100
	list_reagents = list(/datum/reagent/medicine/tricordrazine = 6, /datum/reagent/medicine/epinephrine = 12, /datum/reagent/medicine/lavaland_extract = 6, /datum/reagent/medicine/omnizine = 6)

/obj/item/reagent_containers/cup/bottle/oculine
	name = "oculine bottle"
	list_reagents = list(/datum/reagent/medicine/oculine = 30)

/obj/item/reagent_containers/cup/bottle/inacusiate
	name = "inacusiate bottle"
	list_reagents = list(/datum/reagent/medicine/inacusiate = 30)

/obj/item/reagent_containers/cup/bottle/ipecacide
	name = "ipecacide bottle"
	list_reagents = list(/datum/reagent/impurity/ipecacide = 30)

/obj/item/reagent_containers/cup/bottle/bicaridine
	name = "bicaridine bottle"
	list_reagents = list(/datum/reagent/medicine/bicaridine = 30)

/obj/item/reagent_containers/cup/bottle/dermaline
	name = "dermaline bottle"
	list_reagents = list(/datum/reagent/medicine/dermaline = 30)

/obj/item/reagent_containers/cup/bottle/dylovene
	name = "dylovene bottle"
	list_reagents = list(/datum/reagent/medicine/dylovene = 30)

/obj/item/reagent_containers/cup/bottle/dexalin
	name = "dexalin bottle"
	list_reagents = list(/datum/reagent/medicine/dexalin = 30)

/obj/item/reagent_containers/cup/bottle/hyronalin
	name = "hyronalin bottle"
	list_reagents = list(/datum/reagent/medicine/hyronalin = 30)

/obj/item/reagent_containers/cup/bottle/inaprovaline
	name = "inaprovaline bottle"
	list_reagents = list(/datum/reagent/medicine/inaprovaline = 30)

/obj/item/reagent_containers/cup/bottle/higadrite
	name = "higadrite bottle"
	desc = "A small bottle of higadrite, used for stabilizing livers. \
			It prevents a build-up of toxins while your liver is non-functional. \
			Also used to repair the tissue of the host's liver."
	list_reagents = list(/datum/reagent/medicine/higadrite = 30)

/obj/item/reagent_containers/cup/bottle/ephedrine
	name = "ephedrine bottle"
	list_reagents = list(/datum/reagent/medicine/ephedrine = 30)

/// Red-space flasks of eternal whatever -- expensive traitor shit.

/obj/item/reagent_containers/cup/bottle/eternal
	name = "Eternal Flask"
	desc = "A deceptively stylish glass bottle that's been augmented with redspace technology. It doesn't produce anything, for whatever reason."
	var/generate_reagent = null
	var/generate_amount = 1
	var/last_generate = 0
	var/generate_delay = 50 //deciseconds or 5 seconds

/obj/item/reagent_containers/cup/bottle/eternal/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/cup/bottle/eternal/Destroy()
	. = ..()
	STOP_PROCESSING(SSobj, src)

/obj/item/reagent_containers/cup/bottle/eternal/process()
	if(world.time < last_generate + generate_delay)
		return
	last_generate = world.time
	reagents.add_reagent(generate_reagent, generate_amount)

/obj/item/reagent_containers/cup/bottle/eternal/omnizine
	name = "Eternal Flask of Omnizine"
	desc = "A deceptively stylish glass bottle that's been augmented with redspace technology. It generates an endless supply of it's reagents over time."
	list_reagents = list(/datum/reagent/medicine/omnizine = 50)
	generate_reagent = /datum/reagent/medicine/omnizine

/obj/item/reagent_containers/cup/bottle/eternal/mutagen
	name = "Eternal Flask of Unstable Mutagen"
	desc = "A deceptively stylish glass bottle that's been augmented with redspace technology. It generates an endless supply of it's reagents over time."
	list_reagents = list(/datum/reagent/toxin/mutagen = 50)
	generate_reagent = /datum/reagent/toxin/mutagen

/obj/item/reagent_containers/cup/bottle/eternal/diethylamine
	name = "Eternal Flask of Diethylamine"
	desc = "A deceptively stylish glass bottle that's been augmented with redspace technology. It generates an endless supply of it's reagents over time."
	list_reagents = list(/datum/reagent/diethylamine = 50)
	generate_reagent = /datum/reagent/diethylamine

/obj/item/reagent_containers/cup/bottle/eternal/diseasedblood
	name = "Eternal Flask of Diseased Blood"
	desc = "A deceptively stylish glass bottle that's been augmented with redspace technology. It generates an endless supply of it's reagents over time."
	list_reagents = list(/datum/reagent/diseasedblood = 50)
	generate_reagent = /datum/reagent/diseasedblood

/obj/item/reagent_containers/cup/bottle/eternal/stimpack
	name = "Eternal Flask of Stimulants"
	desc = "A deceptively stylish glass bottle that's been augmented with redspace technology. It generates an endless supply of it's reagents over time."
	list_reagents = list(/datum/reagent/medicine/stimulants = 50)
	generate_reagent = /datum/reagent/medicine/stimulants

/obj/item/reagent_containers/cup/bottle/eternal/stable_plasma
	list_reagents = list(/datum/reagent/stable_plasma = 200)
	generate_reagent = /datum/reagent/stable_plasma
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/silver
	list_reagents = list(/datum/reagent/silver = 200)
	generate_reagent = /datum/reagent/silver
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/gold
	list_reagents = list(/datum/reagent/gold = 200)
	generate_reagent = /datum/reagent/gold
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/uranium
	list_reagents = list(/datum/reagent/uranium = 200)
	generate_reagent = /datum/reagent/uranium
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/plasma
	list_reagents = list(/datum/reagent/toxin/plasma = 200)
	generate_reagent = /datum/reagent/toxin/plasma
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/hydrogen
	list_reagents = list(/datum/reagent/hydrogen = 200)
	generate_reagent = /datum/reagent/hydrogen
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/lithium
	list_reagents = list(/datum/reagent/lithium = 200)
	generate_reagent = /datum/reagent/lithium
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/carbon
	list_reagents = list(/datum/reagent/carbon = 200)
	generate_reagent = /datum/reagent/carbon
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/nitrogen
	list_reagents = list(/datum/reagent/nitrogen = 200)
	generate_reagent = /datum/reagent/nitrogen
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/oxygen
	list_reagents = list(/datum/reagent/oxygen = 200)
	generate_reagent = /datum/reagent/oxygen
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/fluorine
	list_reagents = list(/datum/reagent/fluorine = 200)
	generate_reagent = /datum/reagent/fluorine
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/sodium
	list_reagents = list(/datum/reagent/sodium = 200)
	generate_reagent = /datum/reagent/sodium
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/aluminium
	list_reagents = list(/datum/reagent/aluminium = 200)
	generate_reagent = /datum/reagent/aluminium
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/silicon
	list_reagents = list(/datum/reagent/silicon = 200)
	generate_reagent = /datum/reagent/silicon
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/phosphorus
	list_reagents = list(/datum/reagent/phosphorus = 200)
	generate_reagent = /datum/reagent/phosphorus
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/sulfur
	list_reagents = list(/datum/reagent/sulfur = 200)
	generate_reagent = /datum/reagent/sulfur
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/chlorine
	list_reagents = list(/datum/reagent/chlorine = 200)
	generate_reagent = /datum/reagent/chlorine
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/potassium
	list_reagents = list(/datum/reagent/potassium = 200)
	generate_reagent = /datum/reagent/potassium
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/iron
	list_reagents = list(/datum/reagent/iron = 200)
	generate_reagent = /datum/reagent/iron
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/copper
	list_reagents = list(/datum/reagent/copper = 200)
	generate_reagent = /datum/reagent/copper
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/mercury
	list_reagents = list(/datum/reagent/mercury = 200)
	generate_reagent = /datum/reagent/mercury
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/radium
	list_reagents = list(/datum/reagent/uranium/radium = 200)
	generate_reagent = /datum/reagent/uranium/radium
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/water
	list_reagents = list(/datum/reagent/water = 200)
	generate_reagent = /datum/reagent/water
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/ethanol
	list_reagents = list(/datum/reagent/consumable/ethanol = 200)
	generate_reagent = /datum/reagent/consumable/ethanol
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/sugar
	list_reagents = list(/datum/reagent/consumable/sugar = 200)
	generate_reagent = /datum/reagent/consumable/sugar
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/acid
	list_reagents = list(/datum/reagent/toxin/acid = 200)
	generate_reagent = /datum/reagent/toxin/acid
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/fuel
	list_reagents = list(/datum/reagent/fuel = 200)
	generate_reagent = /datum/reagent/fuel
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/iodine
	list_reagents = list(/datum/reagent/iodine = 200)
	generate_reagent = /datum/reagent/iodine
	volume = 200
	generate_amount = 5

/obj/item/reagent_containers/cup/bottle/eternal/bromine
	list_reagents = list(/datum/reagent/bromine = 200)
	generate_reagent = /datum/reagent/bromine
	volume = 200
	generate_amount = 5


/obj/item/reagent_containers/cup/bottle/random_symptom
	name = "Isolated symptom culture bottle"
	desc = "A small bottle. Contains an unknown isolated symptom."
	spawned_disease = /datum/disease/advance/isolatedsymptom

/obj/item/reagent_containers/cup/bottle/syndisymptombuffer
	name = "S. Gene culture bottle"
	desc = "A small bottle. Contains a sample of an incredibly refined and powerful virus gene."
	spawned_disease = /datum/disease/advance/syndicate

/obj/item/reagent_containers/cup/bottle/syndisymptombuffer/stealth
	name = "STE. Gene culture bottle"
	spawned_disease = /datum/disease/advance/syndicatestealth

/obj/item/reagent_containers/cup/bottle/syndisymptombuffer/resist
	name = "SRE. Gene culture bottle"
	spawned_disease = /datum/disease/advance/syndicateresist

/obj/item/reagent_containers/cup/bottle/syndisymptombuffer/speed
	name = "SPD. Gene culture bottle"
	spawned_disease = /datum/disease/advance/syndicatespeed

/obj/item/reagent_containers/cup/bottle/syndisymptombuffer/trans
	name = "STR. Gene culture bottle"
	spawned_disease = /datum/disease/advance/syndicatetrans


/obj/item/reagent_containers/cup/bottle/uranium
	name = "liquid uranium bottle"
	list_reagents = list(/datum/reagent/uranium = 30)

/obj/item/reagent_containers/cup/bottle/mutagenvirusfood
	name = "mutagenic agar bottle"
	list_reagents = list(/datum/reagent/toxin/mutagen/mutagenvirusfood = 30)

/obj/item/reagent_containers/cup/bottle/mutagenvirusfoodsugar
	name = "sucrose agar bottle"
	list_reagents = list(/datum/reagent/toxin/mutagen/mutagenvirusfood/sugar = 30)

/obj/item/reagent_containers/cup/bottle/plasmavirusfoodweak
	name = "weakened virus plasma bottle"
	list_reagents = list(/datum/reagent/toxin/plasma/plasmavirusfood/weak = 30)

/obj/item/reagent_containers/cup/bottle/plasmavirusfood
	name = "virus plasma bottle"
	list_reagents = list(/datum/reagent/toxin/plasma/plasmavirusfood = 30)

/obj/item/reagent_containers/cup/bottle/synaptizinevirusfood
	name = "virus rations bottle"
	list_reagents = list(/datum/reagent/medicine/synaptizine/synaptizinevirusfood = 30)

/obj/item/reagent_containers/cup/bottle/uraniumvirusfood
	name = "decaying uranium gel bottle"
	list_reagents = list(/datum/reagent/uranium/uraniumvirusfood = 30)

/obj/item/reagent_containers/cup/bottle/uraniumvirusfoodunstable
	name = "unstable uranium gel bottle"
	list_reagents = list(/datum/reagent/uranium/uraniumvirusfood/unstable = 30)

/obj/item/reagent_containers/cup/bottle/uraniumvirusfoodstable
	name = "stable uranium gel bottle"
	list_reagents = list(/datum/reagent/uranium/uraniumvirusfood/stable = 30)


/obj/item/reagent_containers/cup/bottle/stable_plasma
	name = "stable plasma bottle"
	list_reagents = list(/datum/reagent/stable_plasma = 30)

/obj/item/reagent_containers/cup/bottle/gold
	name = "gold bottle"
	list_reagents = list(/datum/reagent/gold = 30)

/obj/item/reagent_containers/cup/bottle/uranium
	name = "uranium bottle"
	list_reagents = list(/datum/reagent/uranium = 30)
