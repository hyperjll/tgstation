/obj/item/grenade/c4/x4/gibtonite
	name = "gibtonite charge"
	desc = "A refined chunk of Gibtonite. It's designed to detonate shortly after being stuck against an object or person."
	icon = 'hypermods/icons/obj/weapons/grenade.dmi'
	icon_state = "plasticgib0"
	inhand_icon_state = "plasticgib"

/obj/item/grenade/c4/breaching
	name = "breaching charge"
	desc = "A timed device that releases a relatively strong concussive force, strong enough to destroy rock and metal."
	icon = 'hypermods/icons/obj/weapons/grenade.dmi'
	icon_state = "bcharge0"
	boom_sizes = list(0, 0, 1)

/obj/item/grenade/c4/breaching/Initialize(mapload)
	. = ..()
	plastic_overlay = mutable_appearance(icon, "bcharge2", HIGH_OBJ_LAYER)
