/obj/item/grapple_gun/nopressure
	name = "grapple gun"
	desc = "A small specialised airgun capable of launching a climbing hook into a distant rock face and pulling the user toward it via motorised zip-line. A handy tool for traversing the craggy landscape of lavaland!"
	icon = 'icons/obj/mining.dmi'
	icon_state = "grapple_gun"
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	inhand_icon_state = "gun"
	item_flags = NOBLUDGEON

/obj/item/grapple_gun/nopressure/Initialize(mapload)
	. = ..()
	obj_flags |= EMAGGED // Starts out emagged to bypass pressure requirements
