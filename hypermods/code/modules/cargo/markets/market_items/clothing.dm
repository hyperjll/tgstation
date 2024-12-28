/datum/market_item/clothing/insuls
	name = "Insulated Gloves"
	desc = "Highly sought after by less-than-honorable thieves and aspiring engineers alike. \
			These gloves protect against electrical shocks."
	item = /obj/item/clothing/gloves/color/yellow

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3.5
	stock_max = 4
	availability_prob = 50

/datum/market_item/clothing/punch_mitts
	name = "Punching Mitts"
	desc = "A specialized pair of fingerless gloves which allow the wearer to rapidly pummel wildlife. \
			Maybe also works on humans?"
	item = /obj/item/clothing/gloves/fingerless/punch_mitts

	price_min = CARGO_CRATE_VALUE * 5
	price_max = CARGO_CRATE_VALUE * 8.5
	stock_max = 2
	availability_prob = 20

/datum/market_item/clothing/dolphin
	name = "Dolphin Gloves"
	desc = "A pair of sleek, aerodynamic tackling gloves that are only really useful for gimmicks."
	item = /obj/item/clothing/gloves/tackler/dolphin

	price_min = CARGO_CRATE_VALUE * 3
	price_max = CARGO_CRATE_VALUE * 4
	stock_max = 4
	availability_prob = 50

/datum/market_item/clothing/tinkerer
	name = "Tinkerer Gloves"
	desc = "A pair of gloves that increases construction speed, often used by those unable to acquire \
			Rapid-Construction-Devices."
	item = /obj/item/clothing/gloves/tinkerer

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3.5
	stock_max = 4
	availability_prob = 50
