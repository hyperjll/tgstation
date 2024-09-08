/obj/item/gun/ballistic/chinalake
	name = "\improper China Lake"
	desc = "The syndicate's favored grenade launcher. Uses specialized grenades for massive destruction of property and personnel. Makes a wonderful 'BA-CHUNK' sound when fired."
	icon = 'hypermods/icons/obj/weapons/guns/wide_guns.dmi'
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	icon_state = "China-Lake"
	inhand_icon_state = "chinalake"
	fire_sound = "hypermods/sound/weapons/china_lake.ogg"
	fire_sound_volume = 90
	w_class = WEIGHT_CLASS_BULKY
	pin = /obj/item/firing_pin/implant/pindicate
	throw_speed = 2
	throw_range = 7
	force = 5
	bolt_type = BOLT_TYPE_LOCKING
	bolt_locked = FALSE
	internal_magazine = TRUE
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/chinalake

/obj/item/gun/ballistic/chinalake/unrestricted
	pin = /obj/item/firing_pin
