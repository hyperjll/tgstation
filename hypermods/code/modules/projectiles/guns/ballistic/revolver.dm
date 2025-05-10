/obj/item/gun/ballistic/revolver/python
	name = "\improper Python"
	desc = "A modernized 9 round revolver. Uses .357 ammo."
	icon = 'hypermods/icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "Python"
	inhand_icon_state = "python"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder/python

/obj/item/gun/ballistic/revolver/derringer
	name = "derringer pistol"
	desc = "A old-style double-chamber pistol. Load individually with .357 rounds."
	icon = 'hypermods/icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "derringer" // Shoutout to SynnGraffkin at https://github.com/Whitesands13/Whitesands/pull/655 for the original icon! - hyperjll
	w_class = WEIGHT_CLASS_TINY
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder/derringer // 2 rounds max
	fire_sound_volume = 40 // Quieter?
	fire_delay = 0 // Like rust's db but more 2d

/obj/item/gun/ballistic/revolver/derringer/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_box)) // prevent speedloader usage
		return TRUE
	. = ..()

/obj/item/gun/ballistic/revolver/c38/kestrel
	name = "\improper Kestrel revolver"
	desc = "A hefty combat revolver developed by Cormorant Precision Arms. Uses .38 rounds. \
			Can be modified with a wrench to accept .357 rounds."
	icon = 'hypermods/icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "kestral"

	can_modify_ammo = TRUE
	initial_caliber = CALIBER_38
	initial_fire_sound = 'sound/items/weapons/gun/revolver/shot.ogg'
	alternative_caliber = CALIBER_357
	alternative_fire_sound = 'sound/items/weapons/gun/revolver/shot_alt.ogg'
	alternative_ammo_misfires = FALSE

/obj/item/gun/ballistic/revolver/syndicate/cowboy/wild
	name = "wild revolver"
	desc = "A wild-west six-chamber revolver. Can be spun to randomly change ammo types."
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder
	fire_sound = 'hypermods/sound/weapons/gun/revolver/wild_rev_shotmid.ogg'
	load_sound = 'hypermods/sound/weapons/gun/revolver/wild_rev_reload.ogg'
	initial_caliber = CALIBER_357
	var/list/caliber_list = list(
		CALIBER_357,
		CALIBER_38,
		CALIBER_45,
		CALIBER_556,
		CALIBER_9MM,
		CALIBER_10MM
	)

/obj/item/gun/ballistic/revolver/syndicate/cowboy/wild/examine(mob/user)
	. = ..()
	. += "It's currently chambered in [magazine.caliber]."

/obj/item/gun/ballistic/revolver/syndicate/cowboy/wild/do_spin()
	. = ..()
	unload_ammo()
	magazine.caliber = pick(caliber_list)

/obj/item/gun/ballistic/revolver/syndicate/cowboy/wild/spin()
	. = ..()
	sleep(0.25 SECONDS) // Just to ensure the "chamber spun" balloon alert isn't overlapping
	var/mob/user = usr
	balloon_alert(user, "Using [magazine.caliber]")
