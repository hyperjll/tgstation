/obj/item/ammo_box/magazine/internal/bow
	name = "bow... magazine?" //shouldnt see this item
	ammo_type = /obj/item/ammo_casing/arrow
	caliber = CALIBER_ARROW
	max_ammo = 1
	start_empty = TRUE

/obj/item/ammo_box/magazine/internal/bow/energy
	ammo_type = /obj/item/ammo_casing/arrow/energy
	start_empty = FALSE
	var/list/selectable_types = list(/obj/item/ammo_casing/arrow/energy, /obj/item/ammo_casing/arrow/energy/disabler)

/obj/item/ammo_box/magazine/internal/bow/energy/advanced
	selectable_types = list(/obj/item/ammo_casing/arrow/energy, /obj/item/ammo_casing/arrow/energy/disabler, /obj/item/ammo_casing/arrow/energy/xray, /obj/item/ammo_casing/arrow/energy/pulse, /obj/item/ammo_casing/arrow/energy/shock)

/obj/item/ammo_box/magazine/internal/bow/energy/ert
	selectable_types = list(/obj/item/ammo_casing/arrow/energy, /obj/item/ammo_casing/arrow/energy/disabler, /obj/item/ammo_casing/arrow/energy/pulse, /obj/item/ammo_casing/arrow/energy/shock)

/obj/item/ammo_box/magazine/internal/bow/energy/syndicate
	selectable_types = list(/obj/item/ammo_casing/arrow/energy, /obj/item/ammo_casing/arrow/energy/xray, /obj/item/ammo_casing/arrow/energy/shock)
