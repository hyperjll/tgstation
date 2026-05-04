/datum/component/enchantment/determination
	examine_description = "It has been blessed with the gift of determination."
	max_level = 3
	forbidden_item_type = /obj/item/clothing

/datum/component/enchantment/determination/on_attack(obj/item/source, mob/living/target, mob/living/user)
	if(!isliving(target))
		return

	user.reagents.add_reagent(/datum/reagent/determination, (1 * level))
