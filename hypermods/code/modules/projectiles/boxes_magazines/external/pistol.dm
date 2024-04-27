/obj/item/ammo_box/magazine/m10mm/cs
	name = "pistol magazine (10mm Caseless)"
	icon_state = "9x19p"
	base_icon_state = "9x19p"
	desc = "A 10mm pistol magazine. Loaded with rounds which are engineered without casings, but suffer damage and speed as a result."
	ammo_type = /obj/item/ammo_casing/caseless/c10mm/cs

/obj/item/ammo_box/magazine/m10mm/sp
	name = "pistol magazine (10mm Soporific)"
	icon_state = "9x19pS"
	base_icon_state = "9x19pS"
	desc= "A 10mm pistol magazine. Loaded with rounds which administer a small dose of tranquilizer on hit."
	ammo_type = /obj/item/ammo_casing/c10mm/sp

/obj/item/ammo_box/magazine/m10mm/emp
	name = "pistol magazine (10mm EMP)"
	icon_state = "9x19pE"
	base_icon_state = "9x19pE"
	desc = "A 10mm pistol magazine. Loaded with rounds which release a small EMP pulse upon hitting a target."
	ammo_type = /obj/item/ammo_casing/c10mm/emp



/obj/item/ammo_box/magazine/m45/cs
	name = "handgun magazine (.45 Caseless)"
	icon_state = "cs45-8"
	base_icon_state = "cs45"
	ammo_type = /obj/item/ammo_casing/caseless/c45/cs
	caliber = CALIBER_45
	max_ammo = 8
	multiple_sprites = AMMO_BOX_PER_BULLET
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/m45/sp
	name = "handgun magazine (.45 Soporific)"
	icon_state = "sleep45-8"
	base_icon_state = "sleep45"
	ammo_type = /obj/item/ammo_casing/c45/sp
	caliber = CALIBER_45
	max_ammo = 8

/obj/item/ammo_box/magazine/m45/emp
	name = "handgun magazine (.45 EMP)"
	icon_state = "emp45-8"
	base_icon_state = "emp45"
	ammo_type = /obj/item/ammo_casing/c45/emp
	caliber = CALIBER_45
	max_ammo = 8

/obj/item/ammo_box/magazine/m45/venom
	name = "handgun magazine (.45 Venom)"
	icon_state = "venom45-8"
	base_icon_state = "venom45"
	ammo_type = /obj/item/ammo_casing/c45/venom
	caliber = CALIBER_45
	max_ammo = 8
