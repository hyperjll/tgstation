/datum/uplink_category/explosives
	name = "Explosive Weapons"
	weight = 23

/datum/uplink_item/explosives
	category = /datum/uplink_category/explosives

/datum/uplink_item/explosives/smoke
	name = "Smoke Grenades"
	desc = "A box that contains five smoke grenades a smoke implant with three uses and a gas smask. For when you want to sow discord, vanish \
		without a trace, or run with your arms awkwardly trailing behind you."
	item = /obj/item/storage/box/syndie_kit/smoke
	cost = 2

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
