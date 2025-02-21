/datum/crafting_recipe/chemical_payload_dp
	name = "Chemical Payload (Dummy Payload)"
	result = /obj/item/bombcore/chemical
	reqs = list(
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/bombcore/training = 1,
		/obj/item/grenade/chem_grenade = 2
	)
	parts = list(/obj/item/stock_parts/matter_bin = 1, /obj/item/grenade/chem_grenade = 2)
	time = 5 SECONDS
	category = CAT_CHEMISTRY
