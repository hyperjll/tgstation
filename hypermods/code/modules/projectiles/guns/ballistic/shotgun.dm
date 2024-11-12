/obj/item/gun/ballistic/shotgun/cane
	name = "cane"
	desc = "A cane traditionally used by the blind to help them see. Folds down to be easier to transport."
	icon = 'icons/obj/weapons/staff.dmi'
	icon_state = "cane"
	inhand_icon_state = "stick"
	fire_sound = 'sound/items/weapons/gun/shotgun/shot.ogg'
	fire_sound_volume = 90
	rack_sound = 'sound/items/weapons/gun/shotgun/rack.ogg'
	load_sound = 'sound/items/weapons/gun/shotgun/insert_shell.ogg'
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
	icon = 'hypermods/icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "Kammerer"
	inhand_icon_state = "kammerer"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/kammerer
	w_class = WEIGHT_CLASS_HUGE

// Syndicate uplink shotgun for traitors

/obj/item/gun/ballistic/shotgun/automatic/combat/kammerer/syndicate
	name = "\improper Kammerer"
	desc = "A semi-automatic shotgun with a four-shell capacity. Often favored over compact shotguns for their slightly better performance."
	fire_delay = 2
	icon = 'hypermods/icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "Kammerer"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/kammerer/syndicate
	w_class = WEIGHT_CLASS_HUGE

/obj/item/gun/ballistic/shotgun/automatic/combat/nopin
	pin = null

/obj/item/gun/ballistic/shotgun/automatic/combat/kammerer/nopin
	pin = null

/obj/item/gun/ballistic/shotgun/enforcer
	name = "\improper Enforcer"
	desc = "A semi-auto shotgun for combat in narrow corridors, originally conceived to compete against the syndicate's famous 'Bulldog'. Must be loaded with shells one-by-one for a maximum of 7 shells."
	icon = 'hypermods/icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "Enforcer"
	inhand_icon_state = "enforcer"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_MEDIUM
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/enforcer
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 2
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	pin = /obj/item/firing_pin
	actions_types = list()
	semi_auto = TRUE
	custom_price = 7500

/obj/item/gun/ballistic/shotgun/enforcer/nopin
	pin = null

/obj/item/gun/ballistic/shotgun/spes
	name = "SPES-12"
	desc = "An expensive imported combat shotgun, popular with frontier militias and private military operators. Holds 8 shells."
	icon = 'hypermods/icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "spas"
	inhand_icon_state = "spas"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_MEDIUM
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/spes
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 2
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	pin = /obj/item/firing_pin
	actions_types = list()
	semi_auto = TRUE
	custom_price = 8000

/obj/item/gun/ballistic/shotgun/spes/New()
	if(prob(10))
		name = pick("SPEZZ-12", "SPESS-12", "SPETZ-12", "SPOCK-12", "SCHPATZL-12", "SABRINA-12", "SAURUS-12", "SABER-12", "SOSIG-12", "DINOHUNTER-12", "COMBAT-12", "SHOTASS-12", "SPES-12", "SHOOTY-12", "BLAM-12", "SPICY-12", "ANTKILLER-12", "SLAPS-12", "SPAGOOTER-12", "MARTIANSLAYER-12")
	..()

/obj/item/gun/ballistic/shotgun/enforcer/nopin
	pin = null
