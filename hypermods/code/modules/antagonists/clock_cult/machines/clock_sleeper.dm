/obj/machinery/sleeper/clockwork
	name = "Clockwork Sleeper"
	desc = "An enclosed machine used to stabilize and heal servants."
	icon = 'hypermods/icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_clockwork"
	base_icon_state = "sleeper_clockwork"
	circuit = /obj/item/circuitboard/machine/sleeper/clockwork
	min_health = -75
	controls_inside = FALSE // I briefly considered this being TRUE. But it's probably best it's not.

/obj/item/circuitboard/machine/sleeper/clockwork
	build_path = /obj/machinery/sleeper/clockwork
	req_components = list(
		/datum/stock_part/matter_bin/clock = 1,
		/datum/stock_part/servo/clock = 1,
		/obj/item/stack/cable_coil = 1,
		/obj/item/stack/sheet/glass = 2)
