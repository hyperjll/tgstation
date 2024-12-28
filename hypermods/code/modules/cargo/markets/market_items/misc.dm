/datum/market_item/misc/mystery_gift
	name = "Mystery Present"
	desc = "They could be anything... and everything! \
			(We're not liable for any damage, destruction, or disappointment followed my this purchase)."
	item = /obj/item/gift/anything

	price_min = CARGO_CRATE_VALUE *3
	price_max = CARGO_CRATE_VALUE *5
	stock_max = 2
	availability_prob = 5

/datum/market_item/misc/spyglasskit
	name = "Nerd Co. Spy Kit"
	desc = "A box containing a spy cam disguised as a pocket protector, and a pair of sunglasses to view the camera from."
	item = /obj/item/storage/box/rxglasses/spyglasskit

	price_min = CARGO_CRATE_VALUE *3
	price_max = CARGO_CRATE_VALUE *5
	stock_max = 1
	availability_prob = 15

/datum/market_item/misc/horsenow
	name = "Horse Drop-Off"
	desc = "A beacon for a quick drop-off of a fully grown horse! Cosplay as a western outlaw like nobody else! \
			Neither guns nor apples included."
	item = /obj/item/sbeacondrop/horse

	price_min = CARGO_CRATE_VALUE *10
	price_max = CARGO_CRATE_VALUE *15
	stock_max = 1
	availability_prob = 15

/datum/market_item/misc/pointytape
	name = "Pointy Tape"
	desc = "A single roll of pointy tape! This stuff can make anything embeddable! Banned in the Spinward Sector, use with caution."
	item = /obj/item/stack/sticky_tape/pointy

	price_min = CARGO_CRATE_VALUE *1.8
	price_max = CARGO_CRATE_VALUE *3
	stock_max = 5
	availability_prob = 40
