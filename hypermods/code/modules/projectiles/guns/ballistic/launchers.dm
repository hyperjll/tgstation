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
	worn_icon = 'hypermods/icons/mob/clothing/back.dmi'

/obj/item/gun/ballistic/chinalake/unrestricted
	pin = /obj/item/firing_pin

// Syndicate Grenadier Specialist Primary

/obj/item/gun/ballistic/rigil_gl
	name = "\improper Rigil Grenade Launcher"
	desc = "The syndicate grenadiers famous grenade launcher. Primarily uses 40mm grenades."
	icon = 'hypermods/icons/obj/weapons/guns/64x32.dmi'
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	icon_state = "grenade_launcher"
	inhand_icon_state = "grenade_launcher"
	fire_sound = 'sound/items/weapons/gun/general/grenade_launch.ogg'
	fire_sound_volume = 70
	w_class = WEIGHT_CLASS_BULKY
	pin = /obj/item/firing_pin/implant/pindicate
	throw_speed = 2
	throw_range = 7
	force = 5
	can_suppress = FALSE
	bolt_type = BOLT_TYPE_NO_BOLT
	internal_magazine = TRUE
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder/grenademulti
	worn_icon = 'hypermods/icons/mob/clothing/back.dmi'

/obj/item/gun/ballistic/rigil_gl/unrestricted
	pin = /obj/item/firing_pin
