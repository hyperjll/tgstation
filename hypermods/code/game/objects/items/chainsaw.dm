/obj/item/chainsaw/botany
	name = "botany chainsaw"
	desc = "A versatile power tool. Useful for limbing trees and delimbing humans. Excellent in cutting down plants and vines."
	icon = 'hypermods/icons/obj/weapons/chainsaw.dmi'
	icon_state = "c_saw"
	inhand_icon_state = "c_saw"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/chainsaw_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/chainsaw_righthand.dmi'
	tool_behaviour = TOOL_SAW
	force = 3
	demolition_mod = 1
	force_on = 5
//	var/icon_name = "c_saw"
//	var/item_name = "c_saw"
/**
/obj/item/chainsaw/botany/attack_self(mob/user)
	on = !on
	to_chat(user, "As you pull the starting cord dangling from [src], [on ? "it begins to whirr." : "the chain stops moving."]")
	force = on ? force_on : initial(force)
	throwforce = on ? force_on : initial(force)
	icon_state = "[icon_name]_[on ? "on" : "off"]"
	inhand_icon_state = "[item_name]_[on ? "on" : "off"]"
	var/datum/component/butchering/butchering = src.GetComponent(/datum/component/butchering)
	butchering.butchering_enabled = on
**/
/obj/item/chainsaw/botany/attack(target, mob/user, proximity_flag)
	. = ..()
	var/mob/living/carbon/human/species/L = target
	if(ishuman(L) && ispodperson(L) || (L.faction == "plants") || (L.faction == "vines") && proximity_flag)
		L.apply_damage(15, BRUTE)

/obj/item/chainsaw/botany/syndicate
	name = "syndicate chainsaw"
	desc = "A powerful versatile power tool. Useful for limbing trees and delimbing humans. Excellent in cutting down plants and vines."
	icon = 'hypermods/icons/obj/weapons/chainsaw.dmi'
	icon_state = "c_saw_s"
	inhand_icon_state = "c_saw_s"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/chainsaw_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/chainsaw_righthand.dmi'
	force = 13
	demolition_mod = 1.5
	force_on = 35
//	icon_name = "c_saw_s"
//	item_name = "c_saw_s"


/obj/item/chainsaw/energy
	name = "energy chainsaw"
	desc = "A powerful versatile power tool. Uses hardlight technology to tear away at your target."
	icon = 'hypermods/icons/obj/weapons/chainsaw.dmi'
	icon_state = "echainsaw"
	inhand_icon_state = "echainsaw"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/chainsaw_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/chainsaw_righthand.dmi'
	force = 15
	demolition_mod = 2
	force_on = 45
/**
/obj/item/chainsaw/energy/attack_self(mob/user)
	on = !on
	to_chat(user, "As you pull the starting cord dangling from [src], [on ? "it begins to whirr." : "the chain stops moving."]")
	force = on ? force_on : initial(force)
	throwforce = on ? force_on : initial(force)
	icon_state = "echainsaw_[on ? "on" : "off"]"
	inhand_icon_state = "echainsaw_[on ? "on" : "off"]"
	var/datum/component/butchering/butchering = src.GetComponent(/datum/component/butchering)
	butchering.butchering_enabled = on

	if(on)
		hitsound = 'sound/items/weapons/chainsawhit.ogg'
		chainsaw_loop.start()
	else
		hitsound = SFX_SWING_HIT
		chainsaw_loop.stop()

	toolspeed = on ? 0.5 : initial(toolspeed) //Turning it on halves the speed
	if(src == user.get_active_held_item()) //update inhands
		user.update_held_items()
	update_item_action_buttons()
**/