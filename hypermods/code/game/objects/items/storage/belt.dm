/obj/item/storage/belt/chameleon/bluespace
	name = "toolbelt"
	desc = "Holds tools."
	actions_types = list(/datum/action/item_action/chameleon/change/belt)

/obj/item/storage/belt/chameleon/bluespace/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_BULKY
	atom_storage.max_total_storage = 42
	atom_storage.silent = TRUE
