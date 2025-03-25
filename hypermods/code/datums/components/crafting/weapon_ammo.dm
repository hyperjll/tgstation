/datum/crafting_recipe/cannonball
	name = "Cannonball"
	result = /obj/item/ammo_casing/caseless/cannonball
	time = 5 SECONDS
	reqs = list(/obj/item/stack/sheet/iron = 10)
	category = CAT_WEAPON_AMMO
	tool_behaviors = list(TOOL_WELDER, TOOL_SCREWDRIVER)
	crafting_flags = CRAFT_MUST_BE_LEARNED

/datum/crafting_recipe/cannonball/emp
	name = "EMP Cannonball"
	result = /obj/item/ammo_casing/caseless/cannonball/emp
	time = 5 SECONDS
	reqs = list(/obj/item/stack/sheet/iron = 10,
				/obj/item/stack/cable_coil = 10,
				/datum/reagent/iron = 20,
				/datum/reagent/uranium = 20)
	category = CAT_WEAPON_AMMO
	tool_behaviors = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	crafting_flags = CRAFT_MUST_BE_LEARNED

/datum/crafting_recipe/cannonball/explosive
	name = "Explosive Cannonball"
	result = /obj/item/ammo_casing/caseless/cannonball/explosive
	time = 5 SECONDS
	reqs = list(/obj/item/stack/sheet/iron = 10,
				/datum/reagent/gunpowder = 50)
	category = CAT_WEAPON_AMMO
	tool_behaviors = list(TOOL_WELDER, TOOL_SCREWDRIVER)
	crafting_flags = CRAFT_MUST_BE_LEARNED
