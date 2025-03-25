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

// Drozd and Lecter

/obj/item/ammo_box/magazine/r556
	name = "rifle magazine (5.56mm)"
	desc = "A standard 30-round magazine for the Drozd or Lecter. Filled with 5.56 rounds."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "mag556"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = CALIBER_556
	max_ammo = 30

/obj/item/ammo_box/magazine/r556/update_icon_state()
	. = ..()
	if (ammo_count() >= 1)
		icon_state = initial(icon_state)
	else
		icon_state = initial(icon_state) + "_empty"


/obj/item/ammo_box/magazine/r556/ap
	name = "rifle magazine (Armor-Piercing 5.56mm)"
	desc = "A specialized 30-round magazine. Filled with AP 5.56 rounds. \
			These rounds sacrifice some stopping power for bypassing standard protective equipment."
	icon_state = "mag556A"
	ammo_type = /obj/item/ammo_casing/a556/ap

/obj/item/ammo_box/magazine/r556/inc
	name = "rifle magazine (Incendiary 5.56mm)"
	desc = "A specialized 30-round magazine. Filled with incendiary 5.56 rounds. \
			These rounds do less damage but set targets ablaze."
	icon_state = "mag556I"
	ammo_type = /obj/item/ammo_casing/a556/inc

/obj/item/ammo_box/magazine/r556/rubber
	name = "rifle magazine (Rubber 5.56mm)"
	desc = "A specialized 30-round magazine. Filled with rubber 5.56 rounds. \
			These rounds possess minimal lethality but batter and weaken targets before they collapse from exhaustion."
	icon_state = "mag556R"
	ammo_type = /obj/item/ammo_casing/a556/rubber
