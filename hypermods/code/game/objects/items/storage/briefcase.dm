/// A briefcase for holding EVERYTHING.

/obj/item/storage/briefcase/secure/bluespace
	name = "secure briefcase"
	desc = "A large briefcase with a digital locking system."
	icon_state = "secure"
	base_icon_state = "secure"
	inhand_icon_state = "sec-case"

/obj/item/storage/briefcase/secure/bluespace/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 80
	atom_storage.max_specific_storage = WEIGHT_CLASS_BULKY
	AddComponent(/datum/component/lockable_storage)

/// A briefcase that contains various sought-after spoils
/obj/item/storage/briefcase/secure/riches

/obj/item/storage/briefcase/secure/riches/PopulateContents()
	new /obj/item/clothing/suit/armor/vest(src)
	new /obj/item/gun/ballistic/automatic/pistol(src)
	new /obj/item/suppressor(src)
	new /obj/item/melee/baton/telescopic(src)
	new /obj/item/clothing/mask/balaclava(src)
	new /obj/item/bodybag(src)
	new /obj/item/soap/nanotrasen(src)

/// A special counterfeiting briefcase.

/obj/item/storage/briefcase/secure/cargonia
	name = "secure briefcase"
	desc = "A large briefcase with a digital locking system."
	icon_state = "secure"
	base_icon_state = "secure"
	inhand_icon_state = "sec-case"
	force = 25

/obj/item/storage/briefcase/secure/cargonia/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_total_storage = 60
	regenerate_cash()

/obj/item/storage/briefcase/secure/cargonia/proc/regenerate_cash()
	addtimer(CALLBACK(src, PROC_REF(regenerate_cash)), 30 SECONDS)

	var/mob/user = get(loc, /mob)
	if(!istype(user))
		return
	if(IS_TRAITOR(user))
		var/turf/floor = get_turf(src)
		var/obj/item/I = new /obj/item/stack/spacecash/c1000(floor)
		if(!atom_storage.attempt_insert(I, user, override = TRUE, force = STORAGE_SOFT_LOCKED))
			qdel(I)


/obj/item/storage/briefcase/secure/luckywinner
	name = "secure briefcase"
	desc = "A large briefcase with a digital locking system."
	icon_state = "secure"
	base_icon_state = "secure"
	inhand_icon_state = "sec-case"
	force = 25

/obj/item/storage/briefcase/secure/luckywinner/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_total_storage = 60
	regenerate_soda()

/obj/item/storage/briefcase/secure/luckywinner/proc/regenerate_soda()
	addtimer(CALLBACK(src, PROC_REF(regenerate_soda)), 30 SECONDS)

	var/mob/user = get(loc, /mob)
	if(!istype(user))
		return
	if(IS_TRAITOR(user))
		//var/turf/floor = get_turf(src)
		var/list/types = subtypesof(/obj/item/reagent_containers/cup/soda_cans/)
		for(var/i in 1 to 1)
			var/type = pick(types)
			new type(src)
//		if(!atom_storage.attempt_insert(type, user, override = TRUE, force = STORAGE_SOFT_LOCKED))
//			qdel(type)


/obj/item/storage/briefcase/lobbyist/PopulateContents()
	..() // in case you need any paperwork done after your rampage
	new /obj/item/clothing/neck/tie/red(src)
	new /obj/item/clothing/under/syndicate/tacticool(src)
	new /obj/item/clothing/under/syndicate/tacticool/skirt(src)
	new /obj/item/clothing/suit/jacket/trenchcoat(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/encryptionkey/syndicate(src)
	new /obj/item/phone(src)
	new /obj/item/food/magicrockcandy(src)
	new /obj/item/stack/spacecash/c10000(src)
	new /obj/item/stack/spacecash/c10000(src)
	new /obj/item/stack/spacecash/c10000(src)

/obj/item/storage/briefcase/sniper_traitor/PopulateContents()
	..() // in case you need any paperwork done after your rampage
	new /obj/item/gun/ballistic/rifle/sniper_rifle(src)
	new /obj/item/clothing/neck/tie/red/hitman(src)
	new /obj/item/clothing/under/syndicate/sniper(src)
	new /obj/item/ammo_box/magazine/sniper_rounds(src)
	new /obj/item/ammo_box/magazine/sniper_rounds(src)
	new /obj/item/ammo_box/magazine/sniper_rounds(src)

/obj/item/storage/briefcase/shotgun_traitor/PopulateContents()
	..() // in case you need any paperwork done after your rampage
	new /obj/item/gun/ballistic/shotgun/automatic/combat/kammerer/syndicate(src)
	new /obj/item/clothing/under/syndicate/combat(src)
	new /obj/item/storage/box/lethalshot/syndi(src)
	new /obj/item/storage/box/lethalshot/syndi(src)
	new /obj/item/storage/box/incendiaryshells/syndi(src)

/obj/item/storage/briefcase/akm_traitor/PopulateContents()
	..() // in case you need any paperwork done after your rampage
	new /obj/item/gun/ballistic/automatic/akm(src)
	new /obj/item/clothing/under/syndicate/camo(src)
	new /obj/item/ammo_box/magazine/ak712x82(src)
	new /obj/item/ammo_box/magazine/ak712x82(src)
	new /obj/item/ammo_box/magazine/ak712x82(src)
