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
	burst_delay = 2
	can_suppress = FALSE
	actions_types = list()
	mag_display = TRUE
	mag_display_ammo = FALSE
	fire_sound = 'hypermods/sound/weapons/rifleshot.ogg'

/obj/item/gun/ballistic/automatic/akm/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.5 SECONDS)

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
	burst_delay = 2
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
	burst_delay = 2
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

// Printable WT-550

/obj/item/gun/ballistic/automatic/wt550/freshprint
	spawnwithmagazine = FALSE
	pin = null

// Syndicate Medic Specialist Primary

/obj/item/gun/ballistic/automatic/veritate
	desc = "A personal defence weapon, developed by the Gorlex Marauders. Uses 9mm rounds."
	name = "\improper Veritate PDW"
	icon = 'hypermods/icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "vector"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	inhand_icon_state = "glocksyn"
	accepted_magazine_type = /obj/item/ammo_box/magazine/smgm9mm
	burst_size = 1
	can_suppress = FALSE
	bolt_type = BOLT_TYPE_OPEN
	show_bolt_icon = FALSE
	mag_display = TRUE
	actions_types = null // TOGGLING FIREMODE BREAKS THIS GUN FOR SOME FUCKING REASON.
	rack_sound = 'sound/items/weapons/gun/pistol/slide_lock.ogg'

/obj/item/gun/ballistic/automatic/veritate/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.3 SECONDS)

// Syndicate Heavy-Weapons Specialist Primary

/obj/item/gun/ballistic/automatic/antares
	desc = "A 100 round light machine gun, developed by the Gorlex Marauders. Uses 7mm rounds."
	name = "\improper Antares light machine gun"
	icon = 'hypermods/icons/obj/weapons/guns/64x32.dmi'
	icon_state = "lmg"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	inhand_icon_state = "lmg"
	accepted_magazine_type = /obj/item/ammo_box/magazine/r7mm
	w_class = WEIGHT_CLASS_BULKY
	burst_size = 2
	can_suppress = FALSE
	bolt_type = BOLT_TYPE_OPEN
	show_bolt_icon = FALSE
	mag_display = TRUE
	actions_types = null // TOGGLING FIREMODE BREAKS THIS GUN FOR SOME FUCKING REASON.
	fire_sound = 'sound/items/weapons/gun/l6/shot.ogg'
	rack_sound = 'sound/items/weapons/gun/l6/l6_rack.ogg'
	suppressed_sound = 'sound/items/weapons/gun/general/heavy_shot_suppressed.ogg'

/obj/item/gun/ballistic/automatic/antares/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.5 SECONDS)

// Syndicate Assault-Trooper Specialist Primary

/obj/item/gun/ballistic/automatic/sirius
	name = "\improper Sirius Assault rifle"
	desc = "A high end military grade assault rifle developed by the Gorlex Marauders. Uses 7.12x82 rifle ammo."
	icon = 'hypermods/icons/obj/weapons/guns/64x32.dmi'
	icon_state = "assault_rifle"
	inhand_icon_state = "assault_rifle"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	accepted_magazine_type = /obj/item/ammo_box/magazine/ak712x82
	fire_delay = 2
	spread = 6
	w_class = WEIGHT_CLASS_HUGE
	mag_display = TRUE
	actions_types = null // TOGGLING FIREMODE BREAKS THIS GUN FOR SOME FUCKING REASON.

/obj/item/gun/ballistic/automatic/sirius/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.4 SECONDS)

// Syndicate Scout Specialist Primary

/obj/item/gun/ballistic/automatic/bellatrix
	desc = "A submachine gun developed by the Gorlex Marauders. Uses 9mm rounds."
	name = "\improper Bellatrix submachine gun"
	icon = 'hypermods/icons/obj/weapons/guns/48x32.dmi'
	icon_state = "mp52"
	inhand_icon_state = "arg"
	accepted_magazine_type = /obj/item/ammo_box/magazine/smgm9mm
	burst_size = 3
	can_suppress = FALSE
	bolt_type = BOLT_TYPE_OPEN
	show_bolt_icon = FALSE
	mag_display = TRUE
	actions_types = null // TOGGLING FIREMODE BREAKS THIS GUN FOR SOME FUCKING REASON.
	rack_sound = 'sound/items/weapons/gun/pistol/slide_lock.ogg'

/obj/item/gun/ballistic/automatic/bellatrix/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.6 SECONDS)
