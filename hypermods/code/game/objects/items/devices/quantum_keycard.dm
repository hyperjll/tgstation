/obj/item/quantum_keycard/satellite
	name = "satellite quantum keycard"

/obj/item/quantum_keycard/satellite/Initialize(mapload)
	. = ..()
	var/obj/machinery/quantumpad/satellite/pad_to_link = locate(/obj/machinery/quantumpad/satellite)
	set_pad(pad_to_link)
