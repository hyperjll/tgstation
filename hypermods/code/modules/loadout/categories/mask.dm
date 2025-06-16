/// Mask Slot Items (Deletes overrided items)
/datum/loadout_category/mask
	category_name = "Masks"
	category_ui_icon = FA_ICON_MASK_FACE
	type_to_generate = /datum/loadout_item/mask
	tab_order = 2

/datum/loadout_item/mask
	abstract_type = /datum/loadout_item/mask

/datum/loadout_item/mask/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE)
	outfit.mask = item_path


/datum/loadout_item/mask/cigarette
	name = "Cigarette"
	item_path = /obj/item/cigarette/space_cigarette

/datum/loadout_item/mask/cigar
	name = "Cigar"
	item_path = /obj/item/cigarette/cigar/premium

/datum/loadout_item/mask/bandana
	name = "Bandana"
	item_path = /obj/item/clothing/mask/bandana

/datum/loadout_item/mask/striped
	name = "Striped Bandana"
	item_path = /obj/item/clothing/mask/bandana/striped

/datum/loadout_item/mask/skull
	name = "Skull Bandana"
	item_path = /obj/item/clothing/mask/bandana/skull

/datum/loadout_item/mask/facescarf
	name = "Facescarf"
	item_path = /obj/item/clothing/mask/facescarf

/datum/loadout_item/mask/kitsune
	name = "Kitsune"
	item_path = /obj/item/clothing/mask/kitsune

/datum/loadout_item/mask/rebellion
	name = "Rebellion"
	item_path = /obj/item/clothing/mask/rebellion

/datum/loadout_item/mask/driscoll
	name = "Driscoll"
	item_path = /obj/item/clothing/mask/gas/driscoll


