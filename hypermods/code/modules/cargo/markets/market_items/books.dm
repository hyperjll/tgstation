/datum/market_item/books
	category = "Premium Books"
	abstract_path = /datum/market_item/books
	markets = list(/datum/market/curator)

/datum/market_item/books/slimes
	name = "Slime Encyclopedia"
	desc = "An encyclopedia documenting all known slime subspecies, and the possible remedies their cores can provide."
	item = /obj/item/magicbook/slimes

	price_min = CARGO_CRATE_VALUE * 2.5
	price_max = CARGO_CRATE_VALUE * 5
	stock_max = 3
	availability_prob = 100

/datum/market_item/books/food
	name = "Culinary Dreams"
	desc = "A book with a rather hard cover, a quick peer into the book's contents reveals eerily life-like foodstuffs."
	item = /obj/item/magicbook/food

	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 2.5
	stock_max = 3
	availability_prob = 100
