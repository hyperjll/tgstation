/obj/item/storage/backpack/bluespacechameleon
	name = "backpack"
	actions_types = list(/datum/action/item_action/chameleon/change/backpack)

/obj/item/storage/backpack/bluespacechameleon/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 40
	atom_storage.max_specific_storage = WEIGHT_CLASS_HUGE


/obj/item/storage/backpack/bluespacechameleondeluxe
	name = "backpack"
	actions_types = list(/datum/action/item_action/chameleon/change/backpack)

/obj/item/storage/backpack/bluespacechameleondeluxe/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 80
	atom_storage.max_specific_storage = WEIGHT_CLASS_HUGE


/obj/item/storage/backpack/invisible
	name = "backpack"
	desc = "It may be invisible, but it's not intangible."
	icon_state = "backpack"
	inhand_icon_state = null
	alpha = 0

/obj/item/storage/backpack/invisible/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 24
