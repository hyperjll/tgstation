/datum/crafting_recipe/syndihandcannon
	name = "Syndicate Handcannon"
	result = /obj/item/gun/ballistic/handcannon/syndicate
	time = 10 SECONDS
	reqs = list(/obj/item/stack/sheet/iron = 10,
				/obj/item/stack/sheet/mineral/titanium = 10,
				/obj/item/stack/sheet/mineral/wood = 5)
	category = CAT_WEAPON_RANGED
	tool_behaviors = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WRENCH)
	crafting_flags = CRAFT_MUST_BE_LEARNED
