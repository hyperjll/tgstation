/datum/uplink_category/ammo
	name = "Ammunition"
	weight = 7

/datum/uplink_item/ammo
	category = /datum/uplink_category/ammo
	surplus = 40

/datum/uplink_item/ammo/toydarts
	name = "Box of Riot Darts"
	desc = "A box of 40 Donksoft riot darts, for reloading any compatible foam dart magazine. Don't forget to share!"
	item = /obj/item/ammo_box/foambox/riot
	cost = 2
	surplus = 0
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND
	purchasable_from = ~UPLINK_SERIOUS_OPS

/datum/uplink_item/ammo/revolver
	name = ".357 Speed Loader"
	desc = "A speed loader that contains seven additional .357 Magnum rounds; usable with the .357 Revolver, Python, and Syndicate revolver. \
			For when you really need a lot of things dead."
	item = /obj/item/ammo_box/a357
	cost = 4
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY) //nukies get their own version
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND
