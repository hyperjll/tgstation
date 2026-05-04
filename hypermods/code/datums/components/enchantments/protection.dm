/datum/component/enchantment/protection
	examine_description = "It has been blessed with the gift of protection."
	max_level = 5
	required_item_type = /obj/item/clothing

/datum/component/enchantment/protection/apply_effect(obj/item/target)
	var/obj/item/clothing/our_clothing = target

	var/enchant_armor_bonus = (5 * level)

	var/datum/armor/our_armor = our_clothing.get_armor()
	var/list/armorlist = our_armor.get_rating_list()

	// So... mathematics. If you had... level 5 protection you'd have a
	// 0.25 multiplier to the difference of armor between your current rating and the maximum 100
	// against that damage type: So if you have 75 protection against melee,
	// you'd have 25 armor left to go, which is multiplied to a mere quarter (at level 5)
	// giving you an extra 6.25 melee armor at level 5 protection.
	// lvl 1 protection would be 1.25 in that scenario.
	// If it only had 25 armor instead, you'd have 75 * 0.25.
	// So 18.75 extra melee armor, totaling 43.75 melee armor at lvl 5 protection
	// The protection enchantment provided at minimum 1 armor, if you ever had 99% armor somehow, then congrats!
	armorlist[ACID] += CEILING((100 - armorlist[ACID]) * (enchant_armor_bonus / 100), 1)
	armorlist[BIO] += CEILING((100 - armorlist[BIO]) * (enchant_armor_bonus / 100), 1)
	armorlist[BOMB] += CEILING((100 - armorlist[BOMB]) * (enchant_armor_bonus / 100), 1)
	armorlist[BULLET] += CEILING((100 - armorlist[BULLET]) * (enchant_armor_bonus / 100), 1)
	armorlist[CONSUME] += CEILING((100 - armorlist[CONSUME]) * (enchant_armor_bonus / 100), 1)
	armorlist[ENERGY] += CEILING((100 - armorlist[ENERGY]) * (enchant_armor_bonus / 100), 1)
	armorlist[FIRE] += CEILING((100 - armorlist[FIRE]) * (enchant_armor_bonus / 100), 1)
	armorlist[LASER] += CEILING((100 - armorlist[LASER]) * (enchant_armor_bonus / 100), 1)
	armorlist[MELEE] += CEILING((100 - armorlist[MELEE]) * (enchant_armor_bonus / 100), 1)
	armorlist[WOUND] += CEILING((100 - armorlist[WOUND]) * (enchant_armor_bonus / 100), 1)

	our_clothing.set_armor(our_armor.generate_new_with_specific(armorlist))
