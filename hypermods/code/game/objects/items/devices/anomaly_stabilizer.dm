/obj/item/anomaly_stabilizer
	name = "anomaly stabilizer"
	desc = "A one-use device capable of permanently stabilizing anomalous objects but not otherworldly entities."
	icon = 'hypermods/icons/obj/devices/tool.dmi'
	icon_state = "stabilizer"
	inhand_icon_state = "electronic"
	worn_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT
	item_flags = NOBLUDGEON

/obj/item/anomaly_stabilizer/interact_with_atom(atom/target, mob/living/user, list/modifiers)
	if(!istype(target, /obj/effect/anomaly))
		return NONE
	var/obj/effect/anomaly/target_anomaly = target
	target_anomaly.stabilize()
	target_anomaly.was_stabilized_manually = TRUE
	do_sparks(3, FALSE, user)
	qdel(src)
