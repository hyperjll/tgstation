// AKM Mags

/obj/item/ammo_box/magazine/ak712x82
	name = "rifle magazine (7.12x82mm)"
	desc = "A 30-round 7.12x82mm magazine designed with the AKM specifically in mind."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "ak762x82"
	ammo_type = /obj/item/ammo_casing/mm712x82
	caliber = "7.12x82"
	max_ammo = 30

/obj/item/ammo_box/magazine/ak712x82/update_icon_state()
	. = ..()
	if (ammo_count() >= 1)
		icon_state = initial(icon_state)
	else
		icon_state = initial(icon_state) + "_empty"

/obj/item/ammo_box/magazine/ak712x82/ap
	name = "armor-piercing rifle magazine (7.12x82mm)"
	desc = "A 30-round 7.12x82mm magazine fitted with armor-piercing rounds and designed with the AKM specifically in mind."
	icon_state = "ak762x82P"
	ammo_type = /obj/item/ammo_casing/mm712x82/ap

/obj/item/ammo_box/magazine/ak712x82/hp
	name = "hollow-point rifle magazine (7.12x82mm)"
	desc = "A 30-round 7.12x82mm magazine fitted with hollow-point rounds and designed with the AKM specifically in mind."
	icon_state = "ak762x82L"
	ammo_type = /obj/item/ammo_casing/mm712x82/hollow

/obj/item/ammo_box/magazine/ak712x82/incendiary
	name = "incendiary rifle magazine (7.12x82mm)"
	desc = "A 30-round 7.12x82mm magazine fitted with incendiary rounds and designed with the AKM specifically in mind."
	icon_state = "ak762x82I"
	ammo_type = /obj/item/ammo_casing/mm712x82/inc
