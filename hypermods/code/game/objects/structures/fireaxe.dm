/obj/structure/fireaxecabinet/batteringram
	name = "battering ram cabinet"
	desc = "There is a small label that reads \"For Special Operations Only\" along with details for safe use of the ram. As if."
	icon = 'hypermods/icons/obj/structures/wallmounts.dmi'
	icon_state = "batteringram"
	item_path = /obj/item/batteringram
	item_overlay = "ram"
	must_be_unwielded = FALSE

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/fireaxecabinet/batteringram, 32)

/obj/structure/fireaxecabinet/batteringram/empty
	populate_contents = FALSE

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/fireaxecabinet/batteringram/empty, 32)

/obj/item/wallframe/fireaxecabinet/batteringram
	name = "battering ram cabinet"
	desc = "Place to put your big KNOCK-KNOCK stick in. Apply to wall to use."
	icon = 'hypermods/icons/obj/structures/wallmounts.dmi'
	icon_state = "batteringram"
	result_path = /obj/structure/fireaxecabinet/batteringram/empty
