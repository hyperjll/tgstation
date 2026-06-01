/obj/item/chainsaw/botany
	name = "botany chainsaw"
	desc = "A versatile power tool. Useful for limbing trees and delimbing humans. Excellent in cutting down plants and vines."
	icon = 'hypermods/icons/obj/weapons/chainsaw.dmi'
	icon_state = "c_saw"
	inhand_icon_state = "c_saw"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/chainsaw_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/chainsaw_righthand.dmi'
	tool_behaviour = TOOL_SAW
	force = 5
	demolition_mod = 1
	force_on = 15
	var/bonus_damage = 15
	var/bonus_damage_type = BRUTE

/obj/item/chainsaw/botany/afterattack(target, mob/user, proximity_flag)
	. = ..()
	var/mob/living/living_target = target
	if((ispodperson(living_target) || living_target.has_faction(FACTION_VINES) || living_target.has_faction(FACTION_PLANTS)) && proximity_flag)
		living_target.apply_damage(bonus_damage, bonus_damage_type)

/obj/item/chainsaw/botany/syndicate
	name = "syndicate chainsaw"
	desc = "A powerful versatile power tool. Useful for limbing trees and delimbing humans. Excellent in cutting down plants and vines."
	icon = 'hypermods/icons/obj/weapons/chainsaw.dmi'
	icon_state = "c_saw_s"
	inhand_icon_state = "c_saw_s"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/chainsaw_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/chainsaw_righthand.dmi'
	force = 15
	demolition_mod = 1.5
	force_on = 35


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
