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

/datum/crafting_recipe/laserrifle
	name = "Laser Rifle"
	result = /obj/item/gun/energy/laserrifle
	reqs = list(
		/obj/item/gun/energy/laser = 1,
		/obj/item/weaponcrafting/gunkit/laserrifle = 1,
	)
	time = 10 SECONDS
	category = CAT_WEAPON_RANGED

/datum/crafting_recipe/laserrifle/New()
	..()
	blacklist += subtypesof(/obj/item/gun/energy/laser)
