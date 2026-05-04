/datum/component/enchantment/clockwork_shield
	examine_description = "It has been blessed with the gift of shield generation."
	max_level = 3
	required_item_type = /obj/item/clothing

/datum/component/enchantment/clockwork_shield/on_equip(obj/item/source, mob/living/target, mob/living/user)
	if(!isliving(source.loc))
		return
	var/mob/living/our_equipee = source.loc
	if(our_equipee.has_status_effect(/datum/status_effect/clockwork_tile))
		var/max_charge_lvl_scale = (1 * level)
		source.AddComponent( \
			/datum/component/shielded, \
			max_charges = max_charge_lvl_scale, \
			recharge_start_delay = 20 SECONDS, \
			charge_increment_delay = 5 SECONDS, \
			shield_icon_file = 'hypermods/icons/obj/clock_cult/clockwork_effects.dmi', \
			shield_icon = "clock_shield", \
		)
