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
	availability_prob = 45

/datum/market_item/consumable/heroin_refined
	name = "Refined Heroin"
	desc = "The good stuff maintenance junkies are always heatin' up."
	item = /obj/item/reagent_containers/syringe/contraband/heroin

	stock_min = 1
	stock_max = 5
	price_min = CARGO_CRATE_VALUE * 0.45
	price_max = CARGO_CRATE_VALUE * 0.65
	availability_prob = 55
