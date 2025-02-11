/datum/component/riding/vehicle/syndiway
	keytype = /obj/item/key/syndicate
	vehicle_move_delay = 1 // secway is 1.75
	ride_check_flags = RIDER_NEEDS_LEGS | RIDER_NEEDS_ARMS | UNBUCKLE_DISABLED_RIDER

/datum/component/riding/vehicle/syndiway/handle_specials()
	. = ..()
	set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 4), TEXT_SOUTH = list(0, 4), TEXT_EAST = list(0, 4), TEXT_WEST = list( 0, 4)))
	set_vehicle_dir_layer(SOUTH, ABOVE_MOB_LAYER)

/datum/component/riding/vehicle/syndiway/driver_move(mob/living/user, direction)
	var/obj/vehicle/ridden/syndiway/the_syndiway = parent

	if(keycheck(user) && the_syndiway.eddie_murphy)
		if(COOLDOWN_FINISHED(src, message_cooldown))
			the_syndiway.visible_message(span_warning("[the_syndiway] sputters and refuses to move!"))
			playsound(get_turf(the_syndiway), 'sound/effects/stall.ogg', 70)
			COOLDOWN_START(src, message_cooldown, 0.75 SECONDS)
		return COMPONENT_DRIVER_BLOCK_MOVE
	return ..()
