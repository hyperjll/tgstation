/datum/objective/protect/traitor_only //The opposite of killing a dude.
	name = "protect traitor"
	martyr_compatible = TRUE
	admin_grantable = TRUE

/datum/objective/protect/traitor_only/check_completion()
	var/obj/item/organ/brain/brain_target
	if(isnull(target))
		return FALSE
	if(human_check)
		brain_target = target.current?.get_organ_slot(ORGAN_SLOT_BRAIN)
	//Protect will always succeed when someone suicides
	return !target || (target.current && HAS_TRAIT(target.current, TRAIT_SUICIDED)) || considered_alive(target, enforce_human = human_check) || (brain_target && HAS_TRAIT(brain_target, TRAIT_SUICIDED))

/datum/objective/protect/traitor_only/update_explanation_text()
	..()
	if(target?.current)
		explanation_text = "Protect [target.name] the [!target_role_type ? target.assigned_role.title : target.special_role]. They are believed to be a syndicate agent, use your codewords or aid them in silence. Be sure to confirm their allegiance first."
	else
		explanation_text = "Free objective."

/datum/objective/protect/traitor_only/admin_edit(mob/admin)
	admin_simple_target_pick(admin)

/datum/objective/protect/traitor_only/get_target()
	return find_traitor_target()

/datum/objective/protect/traitor_only/proc/find_traitor_target()
	var/list/possible_targets = list()
	for(var/mob/living/carbon/human/player in GLOB.player_list)
		if(player.stat == DEAD || player.mind == owner)
			continue
		if(player.mind?.has_antag_datum(/datum/antagonist/traitor))
			possible_targets += player.mind

	if(!possible_targets.len)
		find_target() //if no traitors on station, this becomes a normal assassination obj
		return
	else
		target = pick(possible_targets)

	if(target?.current)
		explanation_text = "Protect [target.name] the [!target_role_type ? target.assigned_role.title : target.special_role]. They are believed to be a syndicate agent, use your codewords or aid them in silence. Be sure to confirm their allegiance first."
