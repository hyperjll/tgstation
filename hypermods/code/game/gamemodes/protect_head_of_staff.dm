/datum/objective/protect/head_of_staff // behold, the anti-rev
	name = "protect head of staff"
	martyr_compatible = TRUE
	admin_grantable = TRUE

/datum/objective/protect/head_of_staff/get_target()
	return find_head_target()

/datum/objective/protect/head_of_staff/proc/find_head_target()
	var/list/com_targets = SSjob.get_all_heads()
	if(!com_targets.len)
		find_target()
		return
	else
		target = pick(com_targets)

	if(target?.current)
		explanation_text = "Protect [target.name] the [!target_role_type ? target.assigned_role.title : target.special_roles]."
