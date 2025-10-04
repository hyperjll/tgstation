/datum/objective/assist
	name = "assist"
	var/target_role_type = FALSE
	admin_grantable = TRUE
	martyr_compatible = TRUE
	completion_credit_reward = 50

/datum/objective/assist/get_target()
	return find_target()

/datum/objective/assist/check_completion()
	if(!target)
		return TRUE
	if(!length(target.antag_datums)) // We somehow got someone with no antag datums. Guess it's done?
		return TRUE
	if(length(target.antag_datums))
		for(var/datum/antagonist/antag in target.antag_datums)
			for(var/datum/objective/O in antag.objectives)
				if(istype(O, /datum/objective/assist))//assuming someone gives people assist objectives in a circle for some reason
					continue
				if(!O.check_completion())
					return FALSE
	return TRUE

/datum/objective/assist/update_explanation_text()
	..()
	if(target && target.current)
		explanation_text = "Ensure [target.name], the [!target_role_type ? target.assigned_role.title : target.special_roles] completes their objectives. Please confirm or ensure their allegiance to the syndicate before any attempts to aid them."
	else
		explanation_text = "Free Objective"

/datum/objective/assist/admin_edit(mob/admin)
	admin_simple_target_pick(admin)


/datum/objective/assist/traitor //Even rarer version that goes after other traitors.
	name = "assist traitor"
	martyr_compatible = TRUE
	admin_grantable = TRUE
	completion_credit_reward = 50

/datum/objective/assist/traitor/get_target()
	return find_traitor_target()

/datum/objective/assist/traitor/proc/find_traitor_target()
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
		explanation_text = "Ensure [target.name], the [!target_role_type ? target.assigned_role.title : target.special_roles] completes their objectives. Please confirm or ensure their allegiance to the syndicate before any attempts to aid them."
