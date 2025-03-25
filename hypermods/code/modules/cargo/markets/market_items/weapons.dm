/datum/market_item/weapon/battle_rifle
	name = "NT BR-38 battle rifle"
	desc = "Nanotrasen's prototype security weapon, found exclusively in the hands of their private security teams. Chambered in .38 pistol rounds. \
			Don't ask us how we came into possession of this rifle."
	item = /obj/item/gun/ballistic/automatic/battle_rifle

	price_min = CARGO_CRATE_VALUE * 30
	price_max = CARGO_CRATE_VALUE * 60
	stock_max = 4
	availability_prob = 25

/datum/market_item/weapon/megasting
	name = "Mega Stingbang"
	desc = "A terror amongst the greytide, this stingbang provides a glimpse into hell itself to those caught within the blast."
	item = /obj/item/grenade/stingbang/mega

	price_min = CARGO_CRATE_VALUE * 5
	price_max = CARGO_CRATE_VALUE * 7
	stock_max = 3
	availability_prob = 30

/datum/market_item/weapon/pipepistol
	name = "Pipe Pistol"
	desc = "A handcrafted pipe pistol that uses improvised junk rounds. Chambers a maximum of 3 at a time."
	item = /obj/item/gun/ballistic/rifle/boltaction/pipegun/pistol

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 4
	stock_max = 1
	availability_prob = 75
