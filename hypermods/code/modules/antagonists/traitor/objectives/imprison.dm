/datum/objective/imprison //Rare syndicate primary objective that requires a target to be in prison by the end of the shift.
	name = "imprison"
	martyr_compatible = TRUE
	admin_grantable = TRUE
	var/target_role_type = FALSE

/datum/objective/imprison/check_completion()
	if (!target)
		return TRUE
	if (target.current && HAS_TRAIT(target.current, TRAIT_SUICIDED)) // But... if they suicide then it should default to victory.
		return TRUE
	var/atom/A = target.current
	var/turf/target_turf = get_turf(A)
	if (istype(target_turf.loc, /area/station/security/prison) && considered_alive(target))
		return TRUE
	if (istype(target_turf.loc, /area/shuttle/escape/brig) && considered_alive(target))
		return TRUE
	return FALSE

/datum/objective/imprison/update_explanation_text()
	..()
	if(target?.current)
		explanation_text = "Ensure [target.name] the [!target_role_type ? target.assigned_role.title : target.special_roles] is both imprisoned and alive by the end."
	else
		explanation_text = "Free objective."

/datum/objective/imprison/admin_edit(mob/admin)
	admin_simple_target_pick(admin)

/datum/objective/imprison/get_target()
	return find_target()

/datum/objective/imprison/vs_traitor //Even rarer version that goes after other traitors.
	name = "imprison traitor"
	martyr_compatible = TRUE
	admin_grantable = TRUE

/datum/objective/imprison/vs_traitor/get_target()
	return find_traitor_target()

/datum/objective/imprison/vs_traitor/proc/find_traitor_target()
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
		explanation_text = "Ensure [target.name] the [!target_role_type ? target.assigned_role.title : target.special_roles] is both imprisoned and alive by the end. Our intel suggests they may be a syndicate agent."
