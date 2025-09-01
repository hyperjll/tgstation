/datum/crafting_recipe/shutters/alt
	name = "Shutters"
	reqs = list(
		/obj/item/stack/sheet/iron = 10,
		/obj/item/stack/cable_coil = 5,
		/obj/item/electronics/airlock = 1,
	)
	result = /obj/machinery/door/poddoor/shutters/preopen
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_MULTITOOL, TOOL_WIRECUTTER, TOOL_WELDER)
	time = 10 SECONDS
	category = CAT_DOORS
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF
