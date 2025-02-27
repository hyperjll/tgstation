/obj/item/clothing/gloves/chameleon/thiefgloves
	name = "thieves gloves"
	desc = "These tactical gloves are fireproof and shock resistant. They also have small bluespace pockets for concealing contraband."
	icon = 'icons/obj/clothing/gloves.dmi'
	icon_state = "black"
	inhand_icon_state = "blackgloves"
	clothing_traits = list(TRAIT_THIEF)
	strip_delay = 80
	siemens_coefficient = 0
	slot_flags = ITEM_SLOT_HANDS
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	armor_type = /datum/armor/thiefgloves
	actions_types = list(/datum/action/item_action/chameleon/change/gloves)

/datum/armor/thiefgloves
	bio = 60
	fire = 80
	acid = 50

/obj/item/clothing/gloves/chameleon/thiefgloves/Initialize(mapload)
	. = ..()
	create_storage(storage_type = /datum/storage)
	atom_storage.max_total_storage = 8
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	slot_flags = 4 // Fixes the item slot not being gloves.
