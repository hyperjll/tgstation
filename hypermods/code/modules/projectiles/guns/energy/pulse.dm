/obj/item/gun/energy/pulse/destroyer/fake
	name = "scoped pulse destroyer"
	desc = "Has a holographic scope built in. Otherwise, a normal destroyer in every way."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/fake_pulse)

/obj/item/gun/energy/pulse/destroyer/fake/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 2)
