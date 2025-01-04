/obj/item/storage/belt/chameleon/bluespace
	name = "toolbelt"
	desc = "Holds tools."
	actions_types = list(/datum/action/item_action/chameleon/change/belt)

/obj/item/storage/belt/chameleon/bluespace/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_BULKY
	atom_storage.max_total_storage = 42
	atom_storage.silent = TRUE

/obj/item/storage/belt/utility/full/powertools/syndircd/PopulateContents()
	new /obj/item/screwdriver/power(src)
	new /obj/item/crowbar/power(src)
	new /obj/item/weldingtool/experimental(src)
	new /obj/item/multitool(src)
	new /obj/item/construction/rcd/syndicate(src)
	new /obj/item/extinguisher/mini(src)
	new /obj/item/stack/cable_coil(src)

/obj/item/storage/belt/sabre/syndicate
	name = "syndicate commanders sheath"
	desc = "A nifty container for an evil sword. Given to the most trusted syndicate operatives."
	icon = 'hypermods/icons/obj/weapons/sword.dmi'
	icon_state = "scabbard_syndie"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/swords_righthand.dmi'
	inhand_icon_state = "scabbard-syndie"
	worn_icon = 'hypermods/icons/mob/clothing/belt.dmi'
	worn_icon_state = "scabbard-syndie"
	w_class = WEIGHT_CLASS_BULKY
	interaction_flags_click = parent_type::interaction_flags_click | NEED_DEXTERITY | NEED_HANDS

/obj/item/storage/belt/sabre/syndicate/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)

	atom_storage.max_slots = 1
	atom_storage.do_rustle = FALSE
	atom_storage.max_specific_storage = WEIGHT_CLASS_BULKY
	atom_storage.set_holdable(/obj/item/melee/sabre/syndicate)
	atom_storage.click_alt_open = FALSE

/obj/item/storage/belt/sabre/syndicate/PopulateContents()
	new /obj/item/melee/sabre/syndicate(src)
	update_appearance()
