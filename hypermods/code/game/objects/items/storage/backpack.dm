/obj/item/storage/backpack/bluespacechameleon
	name = "backpack"
	actions_types = list(/datum/action/item_action/chameleon/change/backpack)

/obj/item/storage/backpack/bluespacechameleon/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_CONTRABAND_BLOCKER, INNATE_TRAIT)
	atom_storage.max_total_storage = 40
	atom_storage.max_specific_storage = WEIGHT_CLASS_HUGE


/obj/item/storage/backpack/bluespacechameleondeluxe
	name = "backpack"
	actions_types = list(/datum/action/item_action/chameleon/change/backpack)

/obj/item/storage/backpack/bluespacechameleondeluxe/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_CONTRABAND_BLOCKER, INNATE_TRAIT)
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
	ADD_TRAIT(src, TRAIT_CONTRABAND_BLOCKER, INNATE_TRAIT)
	atom_storage.max_total_storage = 24


/obj/item/storage/backpack/syndicate
	name = "syndicate backpack"
	desc = "A rather stylish backpack, with a suspicious black and red theme."
	icon = 'hypermods/icons/obj/storage/backpack.dmi'
	worn_icon = 'hypermods/icons/mob/clothing/back/backpack.dmi'
	icon_state = "backpack-syndicate"
	lefthand_file = 'hypermods/icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/equipment/backpack_righthand.dmi'
	inhand_icon_state = "backpack-syndicate"
	armor_type = /datum/armor/backpack_syndicate

/datum/armor/backpack_syndicate
	fire = 100
	acid = 100

/obj/item/storage/backpack/syndicate/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_CONTRABAND_BLOCKER, INNATE_TRAIT)
	atom_storage.max_total_storage = 32
	atom_storage.max_specific_storage = WEIGHT_CLASS_HUGE
