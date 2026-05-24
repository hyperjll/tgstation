/// The advanced syndicate infiltrator shuttle port.
/obj/docking_port/mobile/adv_infiltrator
	name = "syndicate advanced infiltrator"
	shuttle_id = "syndicate_adv"
	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)
	hidden = TRUE
	dir = 8
	port_direction = 4

/obj/docking_port/mobile/adv_infiltrator/Initialize(mapload)
	. = ..()
	SSpoints_of_interest.make_point_of_interest(src)

/obj/docking_port/mobile/adv_infiltrator/Destroy(force)
	SSpoints_of_interest.remove_point_of_interest(src)
	return ..()
