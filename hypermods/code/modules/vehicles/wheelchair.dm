/obj/vehicle/ridden/wheelchair/explosive
	foldabletype = /obj/item/wheelchair/explosive

/obj/vehicle/ridden/wheelchair/explosive/generate_actions()
	. = ..()
	if(!bell_attached)
		return
	initialize_controller_action_type(/datum/action/vehicle/ridden/wheelchair/kaboom, VEHICLE_CONTROL_DRIVE)

/obj/item/wheelchair/explosive
	unfolded_type = /obj/vehicle/ridden/wheelchair/explosive
