/datum/crafting_recipe/chemical_payload_dp
	name = "Chemical Payload (Dummy Payload)"
	result = /obj/item/bombcore/chemical
	reqs = list(
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/bombcore/training = 1,
		/obj/item/grenade/chem_grenade = 2
	)
	parts = list(/obj/item/stock_parts/matter_bin = 1, /obj/item/grenade/chem_grenade = 2)
	time = 5 SECONDS
	category = CAT_CHEMISTRY

/datum/crafting_recipe/lrd
	name = "L.R.D"
	result = /obj/item/reagent_containers/hypospray/medipen/lrd
	reqs = list(
		/obj/item/stack/sheet/iron = 5,
		/obj/item/stack/sheet/glass = 2,
		/obj/item/stack/cable_coil = 2,
		/obj/item/reagent_containers/cup/beaker/large = 1,
		/datum/reagent/medicine/morphine = 20,
		/datum/reagent/medicine/sal_acid = 20,
		/datum/reagent/medicine/oxandrolone = 20,
		/datum/reagent/medicine/coagulant/tranexamicacid = 20,
		/datum/reagent/medicine/spaceacillin = 20
	)
	time = 20 SECONDS
	category = CAT_CHEMISTRY

/datum/crafting_recipe/neuralbooster
	name = "Neural Booster"
	result = /obj/item/reagent_containers/cup/bottle/neuralbooster
	reqs = list(
		/obj/item/reagent_containers/cup/bottle = 1,
		/datum/reagent/medicine/mindwipe = 5,
		/datum/reagent/drug/antidepressants = 10,
		/datum/reagent/medicine/neurine = 10,
	)
	time = 20 SECONDS
	category = CAT_CHEMISTRY

/datum/crafting_recipe/bruise_pack
	name = "Bruise Pack"
	result = /obj/item/stack/medical/bruise_pack
	reqs = list(
		/obj/item/stack/medical/wrap/gauze = 3,
		/datum/reagent/drug/opium = 15
	)
	time = 8 SECONDS
	category = CAT_CHEMISTRY
