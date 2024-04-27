/obj/item/gun/ballistic/shotgun/cane
	name = "cane"
	desc = "A cane traditionally used by the blind to help them see. Folds down to be easier to transport."
	icon = 'icons/obj/weapons/staff.dmi'
	icon_state = "cane"
	inhand_icon_state = "stick"
	fire_sound = 'sound/weapons/gun/shotgun/shot.ogg'
	fire_sound_volume = 90
	rack_sound = 'sound/weapons/gun/shotgun/rack.ogg'
	load_sound = 'sound/weapons/gun/shotgun/insert_shell.ogg'
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	w_class = WEIGHT_CLASS_NORMAL
	force = 1
	slot_flags = ITEM_SLOT_BACK
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot
	weapon_weight = WEAPON_MEDIUM
	semi_auto = FALSE
	internal_magazine = TRUE
	casing_ejector = FALSE
	bolt_wording = "pump"
	cartridge_wording = "shell"
	tac_reloads = FALSE

/obj/item/gun/ballistic/shotgun/cane/lethal
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/lethal

/obj/item/gun/ballistic/shotgun/automatic/combat/kammerer
	name = "\improper Kammerer"
	desc = "A semi-automatic shotgun with a four-shell capacity. Often favored over compact shotguns for their slightly better performance."
	fire_delay = 2
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	icon = 'icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "Kammerer"
	inhand_icon_state = "kammerer"
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/kammerer
	w_class = WEIGHT_CLASS_HUGE

// Syndicate uplink shotgun for traitors

/obj/item/gun/ballistic/shotgun/automatic/combat/kammerer/syndicate
	name = "\improper Kammerer"
	desc = "A semi-automatic shotgun with a four-shell capacity. Often favored over compact shotguns for their slightly better performance."
	fire_delay = 2
	icon = 'icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "Kammerer"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/kammerer/syndicate
	w_class = WEIGHT_CLASS_HUGE
