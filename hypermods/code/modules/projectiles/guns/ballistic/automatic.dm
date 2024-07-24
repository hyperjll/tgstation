// AKM Automatic Rifle.

/obj/item/gun/ballistic/automatic/akm
	name = "\improper AKM Assault Rifle"
	desc = "An old Cold War relic chambered in 7.12x82. Rusted, but not busted."
	icon = 'hypermods/icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "AKMS"
	inhand_icon_state = "akm"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	accepted_magazine_type = /obj/item/ammo_box/magazine/ak712x82
	spread = 15
	fire_delay = 2
	can_suppress = FALSE
	actions_types = list()
	mag_display = TRUE
	mag_display_ammo = FALSE
	fire_sound = 'hypermods/sound/weapons/rifleshot.ogg'

// Lecter Automatic Rifle

/obj/item/gun/ballistic/automatic/lecter
	name = "\improper Lecter"
	desc = "A high end military grade assault rifle. Uses 5.56mm rifle ammo."
	icon = 'hypermods/icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "Lecter"
	inhand_icon_state = "lecter"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	accepted_magazine_type = /obj/item/ammo_box/magazine/r556
	fire_delay = 2
	burst_size = 2
	spread = 2
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_MEDIUM
	mag_display = TRUE
	mag_display_ammo = TRUE
	empty_indicator = TRUE
	custom_price = 7500

/obj/item/gun/ballistic/automatic/lecter/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.4 SECONDS)

/obj/item/gun/ballistic/automatic/lecter/freshprint
	spawnwithmagazine = FALSE
	pin = null


// Drozd SMG

/obj/item/gun/ballistic/automatic/drozd
	name = "\improper Drozd"
	desc = "An excellent fully automatic Heavy SMG. Uses 5.56mm rifle ammo."
	icon = 'hypermods/icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "Drozd"
	inhand_icon_state = "drozd"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	accepted_magazine_type = /obj/item/ammo_box/magazine/r556
	fire_delay = 2
	burst_size = 3
	spread = 1
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_MEDIUM
	mag_display = TRUE
	mag_display_ammo = TRUE
	empty_indicator = TRUE
	custom_price = 8000

/obj/item/gun/ballistic/automatic/drozd/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.3 SECONDS)

/obj/item/gun/ballistic/automatic/drozd/freshprint
	spawnwithmagazine = FALSE
	pin = null
