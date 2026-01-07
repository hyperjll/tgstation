/datum/market_item/consumable/robusta_coffeepack
	name = "Robust Coffee Pack"
	desc = "A bag containing fresh, dry coffee robusta beans. Guarenteed to put some pep in your step! \
			Ethically sourced and packaged by Waffle Corp."
	item = /obj/item/storage/box/coffeepack/robusta
	stock = 5

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3.4
	availability_prob = 30

/datum/market_item/consumable/opium_refined
	name = "Refined Opium"
	desc = "Become the dragon."
	item = /obj/item/reagent_containers/syringe/contraband/opium

	stock_min = 1
	stock_max = 5
	price_min = CARGO_CRATE_VALUE * 0.4
	price_max = CARGO_CRATE_VALUE * 0.6
	availability_prob = 75

/datum/market_item/consumable/heroin_refined
	name = "Refined Heroin"
	desc = "The good stuff maintenance junkies are always heatin' up."
	item = /obj/item/reagent_containers/syringe/contraband/heroin

	stock_min = 1
	stock_max = 5
	price_min = CARGO_CRATE_VALUE * 0.45
	price_max = CARGO_CRATE_VALUE * 0.65
	availability_prob = 55

/datum/market_item/consumable/mystery_soda
	name = "Mystery Fizz"
	desc = "The wonder-drink that has gamblers and suicidal people alike heavily invested and addicted."
	item = /obj/item/reagent_containers/cup/soda_cans/mystery

	stock_min = 2
	stock_max = 8
	price_min = CARGO_CRATE_VALUE * 0.2
	price_max = CARGO_CRATE_VALUE * 0.6
	availability_prob = 55

/datum/market_item/consumable/medkit
	name = "Medkit"
	desc = "A medical kit containing a wide-variety of basic medical supplies."
	item = /obj/item/storage/medkit/regular

	stock_min = 1
	stock_max = 5
	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 1.2
	availability_prob = 75

/datum/market_item/consumable/medkit_brute
	name = "Brute Trauma Treatment Kit"
	desc = "A medical kit containing a selection of items for healing brute-based damage."
	item = /obj/item/storage/medkit/brute

	stock_min = 1
	stock_max = 5
	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 1.25
	availability_prob = 75

/datum/market_item/consumable/medkit_fire
	name = "Burn Treatment Kit"
	desc = "A medical kit containing a selection of items for healing burn-based damage."
	item = /obj/item/storage/medkit/fire

	stock_min = 1
	stock_max = 5
	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 1.25
	availability_prob = 75

/datum/market_item/consumable/medkit_toxin
	name = "Toxin Treatment Kit"
	desc = "A medical kit containing a selection of items for reversing the effects of poisoning and radiation."
	item = /obj/item/storage/medkit/toxin

	stock_min = 1
	stock_max = 5
	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 1.15
	availability_prob = 75

/datum/market_item/consumable/medkit_oxy
	name = "Oxygen Deprivation Treatment Kit"
	desc = "A medical kit containing a selection of items for combatting oxygen deprevation and bloodloss."
	item = /obj/item/storage/medkit/o2

	stock_min = 1
	stock_max = 5
	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 1.1
	availability_prob = 75

/datum/market_item/consumable/bottle_toxin
	name = "Toxin Bottle"
	desc = "A basic, all-purpose poison for any devious plot."
	item = /obj/item/reagent_containers/cup/bottle/toxin

	stock_min = 2
	stock_max = 8
	price_min = CARGO_CRATE_VALUE * 0.3
	price_max = CARGO_CRATE_VALUE * 0.4
	availability_prob = 55

/datum/market_item/consumable/jerrycan_random
	name = "Mystery Jerrycan"
	desc = "A jerrycan of reagents found within our warehouses, we didn't bother to check what was in them."
	item = /obj/item/reagent_containers/cup/jerrycan/random

	stock_min = 1
	stock_max = 5
	price_min = CARGO_CRATE_VALUE * 1.8
	price_max = CARGO_CRATE_VALUE * 3.2
	availability_prob = 75
