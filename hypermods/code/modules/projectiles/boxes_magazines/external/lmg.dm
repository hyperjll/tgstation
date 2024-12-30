/obj/item/ammo_box/magazine/r7mm
	name = "hi-cap box magazine (7mm)"
	desc = "A high-capacity magazine of 7mm rounds to be used with the Antares light machine gun."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "r7mm-50"
	ammo_type = /obj/item/ammo_casing/m7mm
	caliber = CALIBER_A7MM
	max_ammo = 100

/obj/item/ammo_box/magazine/r7mm/hollow
	name = "hi-cap box magazine (Hollow-Point 7mm)"
	ammo_type = /obj/item/ammo_casing/m7mm/hollow

/obj/item/ammo_box/magazine/r7mm/ap
	name = "hi-cap box magazine (Armor Penetrating 7mm)"
	ammo_type = /obj/item/ammo_casing/m7mm/ap

/obj/item/ammo_box/magazine/r7mm/incen
	name = "hi-cap box magazine (Incendiary 7mm)"
	ammo_type = /obj/item/ammo_casing/m7mm/incen

/obj/item/ammo_box/magazine/r7mm/match
	name = "hi-cap box magazine (Match 7mm)"
	ammo_type = /obj/item/ammo_casing/m7mm/match

/obj/item/ammo_box/magazine/r7mm/bouncy
	name = "hi-cap box magazine (Rubber 7mm)"
	ammo_type = /obj/item/ammo_casing/m7mm/bouncy

/obj/item/ammo_box/magazine/r7mm/update_icon_state()
	. = ..()
	icon_state = "r7mm-[min(round(ammo_count(), 20), 100)]" //Min is used to prevent high capacity magazines from attempting to get sprites with larger capacities
