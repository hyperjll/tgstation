/obj/item/reagent_containers/cup/bottle/potion/flight/syndicate
	icon = 'hypermods/icons/obj/mining_zones/artefacts.dmi'
	icon_state = "syndi_potionflask"
	fill_icon = 'hypermods/icons/obj/mining_zones/artefacts.dmi'
	fill_icon_state = "syndi_potionflask_fill"
	desc = "An ornate red bottle, with an \"S\" embossed into the underside. Filled with an experimental flight potion. Mileage may vary."

/obj/item/reagent_containers/cup/bottle/potion/flight/syndicate/update_overlays()
	. = ..()
	if(reagents?.total_volume)
		. += "syndi_potionflask_cap"
