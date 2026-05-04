/datum/component/enchantment/sharpness
	examine_description = "It has been blessed with the gift of sharpness."
	max_level = 5
	forbidden_item_type = /obj/item/clothing

/datum/component/enchantment/sharpness/apply_effect(obj/item/target)
	target.force += 2 * level
