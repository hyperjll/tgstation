/datum/crafting_recipe/lockermech
	name = "Locker Mech"
	result = /obj/vehicle/sealed/mecha/locker_mech
	reqs = list(/obj/item/stack/cable_coil = 20,
				/obj/item/stack/sheet/iron = 20, // for the locker
				/obj/item/storage/toolbox/electrical = 2, // For feet
				/obj/item/tank/internals/oxygen = 1, // For air
				/obj/item/electronics/airlock = 1, //You are stealing the motors from airlocks
				/obj/item/extinguisher = 2, //For bastard pneumatics
				/obj/item/stack/sticky_tape = 4, //to make it airtight
				/obj/item/flashlight = 1, //For the mech light
				/obj/item/stack/sheet/cloth = 5) // for tension belt
	time = 30 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WELDER, TOOL_WIRECUTTER, TOOL_WRENCH, TOOL_MULTITOOL)
	category = CAT_ROBOT
