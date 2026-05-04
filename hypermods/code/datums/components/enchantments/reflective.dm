/datum/component/enchantment/reflective
	examine_description = "It has been blessed with the ability to reflect certain projectiles sometimes."
	max_level = 5

/datum/component/enchantment/reflective/apply_effect(obj/item/target)
	target.reflect_chance = 5 * level
