/obj/item/gun/ballistic/revolver/python
	name = "\improper Python"
	desc = "A modernized 9 round revolver. Uses .357 ammo."
	icon = 'icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "Python"
	inhand_icon_state = "python"
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder/python

/obj/item/gun/ballistic/revolver/derringer
	name = "derringer pistol"
	desc = "A old-style double-chamber pistol. Load individually with .357 rounds."
	icon_state = "derringer" // Shoutout to SynnGraffkin at https://github.com/Whitesands13/Whitesands/pull/655 for the original icon! - hyperjll
	w_class = WEIGHT_CLASS_TINY
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder/derringer // 2 rounds max
	fire_sound_volume = 40 // Quieter?
	fire_delay = 0 // Like rust's db but more 2d

/obj/item/gun/ballistic/revolver/derringer/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_box)) // prevent speedloader usage
		return TRUE
	. = ..()
