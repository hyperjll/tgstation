/datum/uplink_category/ammo
	name = "Ammunition"
	weight = 22

/datum/uplink_item/ammo
	category = /datum/uplink_category/ammo
	surplus = 40

/datum/uplink_item/ammo/toydarts
	name = "Donksoft Riot Pistol Ammunition Case"
	desc = "A case containing three spare magazines for the Donksoft riot pistol, along with a box of loose riot darts."
	item = /obj/item/storage/toolbox/guncase/traitor/ammunition/donksoft
	cost = 2
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND
	purchasable_from = ~UPLINK_SERIOUS_OPS

/datum/uplink_item/ammo/revolver
	name = ".357 Speed Loader"
	desc = "A speed loader that contains seven additional .357 Magnum rounds; usable with the .357 Revolver, Python, and Syndicate revolver. \
			For when you really need a lot of things dead."
	item = /obj/item/ammo_box/speedloader/c357
	cost = 4
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY) //nukies get their own version
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND
