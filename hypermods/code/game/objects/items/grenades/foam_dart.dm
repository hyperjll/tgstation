/obj/item/grenade/foam_dart
	name = "foam dart grenade"
	desc = "A recent addition to Donk Co.'s toy collection, these grenades shoot out foam darts. A perfect addition to your warfare simulations!"
	icon = 'hypermods/icons/obj/weapons/grenade.dmi'
	icon_state = "foam-dart"
	base_icon_state = "foam-dart"
	inhand_icon_state = "flashbang"
	shrapnel_type = /obj/projectile/bullet/foam_dart
	shrapnel_radius = 5

/obj/item/grenade/foam_dart/detonate()
	. = ..()
	qdel(src)

/obj/item/grenade/foam_dart/riot
	shrapnel_type = /obj/projectile/bullet/foam_dart/riot
