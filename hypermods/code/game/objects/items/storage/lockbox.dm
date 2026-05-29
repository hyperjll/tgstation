/obj/item/storage/lockbox/personal
	name = "personal lockbox"
	desc = "A small lockbox used for personal storage and transportation of important goods. Comes equipped with an anti-theft system. Be sure to swipe an ID to claim, lock and unlock it."
	icon_state = "lockbox+l"
	icon_closed = "lockbox"
	icon_locked = "lockbox+l"
	icon_broken = "lockbox+b"
	icon_open = "lockbox"
	inhand_icon_state = "lockbox"
	lefthand_file = 'icons/mob/inhands/equipment/briefcase_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/briefcase_righthand.dmi'
	w_class = WEIGHT_CLASS_HUGE
	var/datum/bank_account/identifing_account

/obj/item/storage/lockbox/personal/tool_act(mob/living/user, obj/item/tool, list/modifiers)
	var/obj/item/card/id/card = tool.GetID()
	if(isnull(card))
		return ..()

	if(isnull(identifing_account))
		identifing_account = card.registered_account
		balloon_alert(user, "identity registered!")
		return ITEM_INTERACT_SUCCESS

	if(can_unlock(user, card))
		toggle_locked(user)
		return ITEM_INTERACT_SUCCESS

	return ITEM_INTERACT_BLOCKING

/obj/item/storage/lockbox/personal/can_unlock(mob/living/user, obj/item/card/id/id_card, silent = FALSE)
	if(id_card.registered_account == identifing_account)
		return TRUE
	if(!silent)
		balloon_alert(user, "incorrect identification!")
	return FALSE
