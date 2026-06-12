/datum/uplink_category/explosives
	name = "Explosive Weapons"
	weight = 23

/datum/uplink_item/explosives
	category = /datum/uplink_category/explosives

/datum/uplink_item/explosives/syndicate_minibomb
	name = "Syndicate Minibomb"
	desc = "The minibomb is a grenade with a five-second fuse. Upon detonation, it will create a small hull breach \
			in addition to dealing high amounts of damage to nearby personnel."
	progression_minimum = 30 MINUTES
	item = /obj/item/grenade/syndieminibomb
	cost = 2
	limited_stock = 4
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS /// Ops get their own version.
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/explosives/earthcracker
	name = "E-2 Earthcracker"
	desc = "The E-2 Earthcracker makes for a great partner to any conventional explosive. Set the device up on any station hull, arm, and activate.\
		What remains is a conventionally dangerous weakpoint, that will crack open a random pattern of floors upon being hit with an explosive force.\
		That pattern of cracks will in-turn also create additional cracks, ad-finimum if not repaired. It can also be used for mining out rock, though that's less advised."
	item = /obj/item/earthcracker
	cost = 2
	limited_discount_stock = 2
