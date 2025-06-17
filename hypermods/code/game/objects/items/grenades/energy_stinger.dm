/obj/item/grenade/energy_stinger
	name = "disabler stinger"
	desc = "A special fragmentation grenade utilizing energy-based weaponry"
	icon = 'hypermods/icons/obj/weapons/grenade.dmi'
	icon_state = "energy_stinger"
	base_icon_state = "energy_stinger"
	inhand_icon_state = "flashbang"
	shrapnel_type = /obj/projectile/beam/disabler
	shrapnel_radius = 5

/obj/item/grenade/energy_stinger/detonate()
	. = ..()
	qdel(src)

/obj/item/grenade/energy_stinger/lethal
	name = "energy stinger"
	shrapnel_type = /obj/projectile/beam/laser