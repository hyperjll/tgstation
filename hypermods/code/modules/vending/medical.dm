/obj/machinery/vending/chemical
	name = "\improper NanoChemicals"
	desc = "It's a chemical dispensery with bottled chemicals. It's since gone out of style in favor of the typical chem dispenser."
	icon = 'hypermods/icons/obj/machines/vending.dmi'
	icon_state = "chemicals"
	icon_deny = "chemicals-deny"
	panel_type = "panel11"
	product_ads = "Fancy yourself a chemist?;Bubbles and froths!;Mix and match!;Natural chemicals!;Not recommended for children.;Don't you want some?;Ping!"
	products = list(
		/obj/item/reagent_containers/cup/bottle/aluminium = 50,
		/obj/item/reagent_containers/cup/bottle/bromine = 50,
		/obj/item/reagent_containers/cup/bottle/carbon = 50,
		/obj/item/reagent_containers/cup/bottle/chlorine = 50,
		/obj/item/reagent_containers/cup/bottle/copper = 50,
		/obj/item/reagent_containers/cup/bottle/ethanol = 50,
		/obj/item/reagent_containers/cup/bottle/fluorine = 50,
		/obj/item/reagent_containers/cup/bottle/hydrogen = 50,
		/obj/item/reagent_containers/cup/bottle/iodine = 50,
		/obj/item/reagent_containers/cup/bottle/iron = 50,
		/obj/item/reagent_containers/cup/bottle/lithium = 50,
		/obj/item/reagent_containers/cup/bottle/mercury = 50,
		/obj/item/reagent_containers/cup/bottle/nitrogen = 50,
		/obj/item/reagent_containers/cup/bottle/oxygen = 50,
		/obj/item/reagent_containers/cup/bottle/phosphorus = 50,
		/obj/item/reagent_containers/cup/bottle/potassium = 50,
		/obj/item/reagent_containers/cup/bottle/radium = 50,
		/obj/item/reagent_containers/cup/bottle/silicon = 50,
		/obj/item/reagent_containers/cup/bottle/sodium = 50,
		/obj/item/reagent_containers/cup/bottle/stable_plasma = 50,
		/obj/item/reagent_containers/cup/bottle/sugar = 50,
		/obj/item/reagent_containers/cup/bottle/sulfur = 50,
		/obj/item/reagent_containers/cup/bottle/sacid = 50,
		/obj/item/reagent_containers/cup/bottle/water = 50,
		/obj/item/reagent_containers/cup/bottle/welding_fuel = 50,
	)
	contraband = list(
		/obj/item/reagent_containers/cup/bottle/formaldehyde = 4,
		/obj/item/reagent_containers/cup/bottle/plasma = 4,
		/obj/item/reagent_containers/cup/bottle/uranium = 4,
	)
	premium = list(
		/obj/item/stack/sheet/plastic = 2,
		/obj/item/reagent_containers/cup/bottle/silver = 4,
		/obj/item/reagent_containers/cup/bottle/gold = 4,
		/obj/item/reagent_containers/cup/bottle/acidic_buffer = 20,
		/obj/item/reagent_containers/cup/bottle/basic_buffer = 20,
	)
	default_price = 10
	extra_price = 100
	payment_department = ACCOUNT_MED
	refill_canister = /obj/item/vending_refill/chemical

	emagvendorreplace = TRUE
	replacewith = /obj/machinery/vending/emagged/chemical

/obj/item/vending_refill/chemical
	machine_name = "NanoChemicals"
	icon_state = "refill_medical"
