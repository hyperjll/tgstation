/datum/crafting_recipe/syndifultonpack
	name = "Syndicate Fulton Extraction Pack"
	result = /obj/item/extraction_pack/syndicate
	time = 10 SECONDS
	reqs = list(/obj/item/stack/sheet/cloth = 10,
				/obj/item/stock_parts/servo = 5,
				/obj/item/stock_parts/scanning_module = 5)
	category = CAT_MISC
	always_available = FALSE

/datum/crafting_recipe/syndifultonbeacon
	name = "Syndicate Extraction Beacon"
	result = /obj/item/fulton_core/syndicate
	time = 5 SECONDS
	reqs = list(/obj/item/stock_parts/subspace/amplifier = 1,
				/obj/item/stock_parts/servo = 5,
				/obj/item/stock_parts/micro_laser = 3)
	category = CAT_MISC
	always_available = FALSE
	tool_behaviors = list(TOOL_WELDER, TOOL_WIRECUTTER, TOOL_SCREWDRIVER)
