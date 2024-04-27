// AKM Automatic Rifle.

/obj/item/gun/ballistic/automatic/akm
	name = "\improper AKM Assault Rifle"
	desc = "An old Cold War relic chambered in 7.12x82. Rusted, but not busted."
	icon = 'icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "AKMS"
	inhand_icon_state = "akm"
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	accepted_magazine_type = /obj/item/ammo_box/magazine/ak712x82
	spread = 15
	fire_delay = 2
	can_suppress = FALSE
	actions_types = list()
	mag_display = TRUE
	mag_display_ammo = FALSE
	fire_sound = 'sound/weapons/rifleshot.ogg'
