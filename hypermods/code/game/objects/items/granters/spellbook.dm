/obj/item/book/granter/action/spellpage/curator
	name = "Arcane Spellpage"
	desc = "Teaches one of five mystical arcane practices, allowing a practiced curator to cast basic magic spells. One use only."
	pages_to_mastery = 3

/obj/item/book/granter/action/spellpage/curator/on_reading_start(mob/living/user)
	var/list/spell_icons = list()
	var/list/name_to_spell = list()
	for(var/datum/action/type as anything in list(/datum/action/cooldown/spell/pointed/blind/curator, /datum/action/cooldown/spell/smoke/curator,  /datum/action/cooldown/spell/aoe/knock/curator, /datum/action/cooldown/spell/emp/disable_tech/curator, /datum/action/cooldown/spell/basic_heal/regeneration))
		if(!(locate(type) in user.actions))
			spell_icons[initial(type.name)] = image(icon = initial(type.button_icon), icon_state = initial(type.button_icon_state))
			name_to_spell[initial(type.name)] = type
	var/picked_spell = show_radial_menu(user, src, spell_icons, custom_check = CALLBACK(src, PROC_REF(check_menu), user), radius = 36, require_near = TRUE)
	if(!picked_spell)
		return FALSE
	granted_action = name_to_spell[picked_spell]
	return TRUE

/obj/item/book/granter/action/spellpage/curator/on_reading_finished(mob/living/user)
	var/datum/action/new_action = new granted_action(user.mind || user)
	new_action.Grant(user)
	to_chat(user, span_warning("The book disappears into a burst of mystical embers."))
	qdel(src)

/obj/item/book/granter/action/spellpage/can_learn(mob/living/user)
	for(var/type in list(/datum/action/cooldown/spell/pointed/blind/curator, /datum/action/cooldown/spell/smoke/curator,  /datum/action/cooldown/spell/aoe/knock/curator, /datum/action/cooldown/spell/emp/disable_tech/curator, /datum/action/cooldown/spell/basic_heal/regeneration))
		if(!(locate(type) in user.actions))
			return TRUE
	to_chat(user, span_warning("You already know all of the most basic wizard spells!"))
	return FALSE

/**
 * Checks if we are allowed to interact with a radial menu
 *
 * Arguments:
 * * user The human mob interacting with the menu
 */
/obj/item/book/granter/action/spellpage/curator/proc/check_menu(mob/living/carbon/human/user)
	if(!istype(user))
		return FALSE
	if(!user.is_holding(src))
		return FALSE
	if(user.incapacitated)
		return FALSE
	if(!user.mind)
		return FALSE
	return TRUE
/*
 * Upgraded spellbook (traitor job in uplink)
 */
/obj/item/book/granter/action/spellpage/curator/greater
	name = "Arcane Spellbook"
	desc = "Teaches one of three greater mystical arcane practices, allowing a practiced curator to cast far-more advanced magic spells. One use only."
	pages_to_mastery = 5

/obj/item/book/granter/action/spellpage/curator/greater/on_reading_start(mob/living/user)
	var/list/spell_icons = list()
	var/list/name_to_spell = list()
	for(var/datum/action/type as anything in list(/datum/action/cooldown/spell/lichdom,  /datum/action/cooldown/spell/pointed/mind_transfer, /datum/action/cooldown/spell/sanguine_strike))
		if(!(locate(type) in user.actions))
			spell_icons[initial(type.name)] = image(icon = initial(type.button_icon), icon_state = initial(type.button_icon_state))
			name_to_spell[initial(type.name)] = type
	var/picked_spell = show_radial_menu(user, src, spell_icons, custom_check = CALLBACK(src, PROC_REF(check_menu), user), radius = 36, require_near = TRUE)
	if(!picked_spell)
		return FALSE
	granted_action = name_to_spell[picked_spell]
	return TRUE

/obj/item/book/granter/action/spellpage/curator/greater/on_reading_finished(mob/living/user)
	var/datum/action/new_action = new granted_action(user.mind || user)
	new_action.Grant(user)
	to_chat(user, span_warning("The book disappears into a burst of mystical energies."))
	qdel(src)

/obj/item/book/granter/action/spellpage/curator/greater/can_learn(mob/living/user)
	for(var/type in list(/datum/action/cooldown/spell/lichdom,  /datum/action/cooldown/spell/pointed/mind_transfer, /datum/action/cooldown/spell/sanguine_strike))
		if(!(locate(type) in user.actions))
			return TRUE
	to_chat(user, span_warning("You already know all that this book could ever teach!"))
	return FALSE

/**
 * Checks if we are allowed to interact with a radial menu
 *
 * Arguments:
 * * user The human mob interacting with the menu
 */
/obj/item/book/granter/action/spellpage/curator/greater/check_menu(mob/living/carbon/human/user)
	if(!istype(user))
		return FALSE
	if(!user.is_holding(src))
		return FALSE
	if(user.incapacitated)
		return FALSE
	if(!user.mind)
		return FALSE
	return TRUE
