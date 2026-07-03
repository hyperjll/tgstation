/obj/machinery/quantumpad/satellite
	name = "satellite teleportation pad"
	resistance_flags = FIRE_PROOF | ACID_PROOF | INDESTRUCTIBLE

/obj/machinery/quantumpad/satellite/crowbar_act(mob/living/user, obj/item/tool)
	return FALSE // Can't allow you to do that, Star Fox.
