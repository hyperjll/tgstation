#define WAND_OPEN "open"
#define WAND_BOLT "bolt"
#define WAND_EMERGENCY "emergency"

/obj/item/quickhack
	icon_state = "quickhack"
	base_icon_state = "quickhack"
	inhand_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	icon = 'hypermods/icons/obj/devices/remote.dmi'
	w_class = WEIGHT_CLASS_TINY
	name = "quickhack"
	desc = "A highly illegal, disposable device that can fake an AI's 'open' signal to a door a few times."
	var/region_access = REGION_ALL_STATION
	var/list/access_list
	var/mode = WAND_OPEN
	var/uses_left = 10

/obj/item/quickhack/Initialize(mapload)
	. = ..()
	access_list = SSid_access.get_region_access_list(list(region_access))
	update_icon_state()

/obj/item/quickhack/examine(mob/user)
	. = ..()
	if(IS_TRAITOR(user) || IS_NUKE_OP(user) || user.mind?.has_antag_datum(/datum/antagonist/spy)) //helpful to other syndicates
		. += "Has [uses_left] uses left."

/obj/item/quickhack/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(!istype(interacting_with, /obj/machinery/door) && !isturf(interacting_with))
		return NONE
	return ranged_interact_with_atom(interacting_with, user, modifiers)

/obj/item/quickhack/ranged_interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	var/obj/machinery/door/door

	if (istype(interacting_with, /obj/machinery/door))
		door = interacting_with
		if (!door.opens_with_door_remote)
			return ITEM_INTERACT_BLOCKING

	else
		for (var/obj/machinery/door/door_on_turf in get_turf(interacting_with))
			if (door_on_turf.opens_with_door_remote)
				door = door_on_turf
				break

		if (isnull(door))
			return ITEM_INTERACT_BLOCKING

	if (!door.check_access_list(access_list) || !door.requiresID())
		interacting_with.balloon_alert(user, "can't access!")
		return ITEM_INTERACT_BLOCKING

	var/obj/machinery/door/airlock/airlock = door

	if (!door.hasPower() || (istype(airlock) && !airlock.canAIControl()))
		interacting_with.balloon_alert(user, mode == WAND_OPEN ? "it won't budge!" : "nothing happens!")
		return ITEM_INTERACT_BLOCKING

	switch (mode)
		if (WAND_OPEN)
			if (door.density)
				door.open()
			else
				door.close()

	uses_left -= 1

	if(uses_left <= 0)
		src.balloon_alert(user, "out of uses!")
		qdel(src)

	return ITEM_INTERACT_SUCCESS

#undef WAND_OPEN
#undef WAND_BOLT
#undef WAND_EMERGENCY
