/obj/projectile/energy/pickpocket
	name = "grappler"
	icon = 'hypermods/icons/obj/weapons/guns/projectiles.dmi'
	icon_state = "pickpocket"

/obj/projectile/energy/pickpocket/steal/on_hit(atom/target, mob/user, blocked, pierce_hit)
	if((blocked != 100) && iscarbon(target))
		var/mob/living/carbon/human/victim = target
		var/obj/item/back_item = victim.get_item_by_slot(ITEM_SLOT_BACK)

		if(isnull(back_item))
			return FALSE

		var/item = pick(back_item.atom_storage.return_inv(recursive = FALSE))
		if(isnull(item))
			return FALSE

		to_chat(victim, span_warning("Your [back_item] feels lighter..."))
		to_chat(firer, span_notice("The [item] flies out of [victim][p_s()] [back_item] and into your hand."))
		var/mob/living/carbon/carbon_firer = firer
		carbon_firer.put_in_hands(item)

/obj/projectile/energy/pickpocket/plant/on_hit(atom/target, mob/firer, blocked, pierce_hit)
	if((blocked != 100) && iscarbon(target))
		var/mob/living/carbon/human/victim = target
		var/obj/item/back_item = victim.get_item_by_slot(ITEM_SLOT_BACK)

		if(isnull(back_item))
			return FALSE

		var/obj/item/gun/energy/pickpocket/thegun = fired_from
		var/heldItems = thegun.heldItem
		if(isnull(heldItems))
			return FALSE

		to_chat(victim, span_warning("Your [back_item] feels heavier..."))
		to_chat(firer, span_notice("You plant the [heldItems] out of [victim][p_s()] [back_item]."))
		thegun.heldItem.forceMove(back_item)
		thegun.heldItem = null
