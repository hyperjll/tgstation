//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Miscellaneous ///////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/misc/telecrystal
	name = "Redspace Crystal Crate"
	desc = "(!&$#@$ ATTENTION OPERATIVES, PLEASE ENSURE OUR TECHNOLOGIES ARE NOT HARVESTED BY NANOTRASEN OR IT'S ALLIES. GLORY TO THE SYNDICATE."
	contraband = TRUE
	cost = 5000
	contains = list(/obj/item/stack/telecrystal)
	crate_name = "crate"
	crate_type = /obj/structure/closet/crate


/datum/supply_pack/misc/randomjunk
	name = "Random Junk Crate"
	desc = "We've got a LOT of random junk laying around in our warehouses collecting dust. We'll happily sell it off at dirt-cheap rates. All junk ordered comes in a cardboard box."
	cost = 300
	contains = list(/obj/item/storage/box/randomjunk)
	crate_name = "random junk crate"
	crate_type = /obj/structure/closet/crate
