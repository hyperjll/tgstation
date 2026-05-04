/datum/component/enchantment/durable
	examine_description = "It has been blessed with incredible durability."
	max_level = 5

/datum/component/enchantment/durable/apply_effect(obj/item/target)
	var/integrity_mult = 1 // I'm putting this here cuz level 1 durability would do nothing.
	if(level == 1)
		integrity_mult = 1.5
	else
		integrity_mult = level

	var/integrity_mult_calc = (target.max_integrity * integrity_mult)
	target.max_integrity = integrity_mult_calc
	target.atom_integrity = integrity_mult_calc
