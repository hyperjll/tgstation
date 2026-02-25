/obj/structure/closet/secure_closet/armory4
	name = "armory explosives locker"
	icon_state = "armory"
	req_access = list(ACCESS_ARMORY)

/obj/structure/closet/secure_closet/armory4/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/grenade/syndieminibomb/concussion(src)
	for(var/i in 1 to 3)
		/obj/item/grenade/energy_stinger/lethal
	for(var/i in 1 to 3)
		new /obj/item/grenade/stingbang(src)
	for(var/i in 1 to 3)
		new /obj/item/grenade/smokebomb(src)
