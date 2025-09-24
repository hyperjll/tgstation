/datum/traitor_objective_category/alert_console_hack
	name = "Cause a False Alarm"
	objectives = list(
		/datum/traitor_objective/alert_console_hack = 1,
	)

/datum/traitor_objective/alert_console_hack
	name = "Hack a station alert console to cause a random false alarm to disrupt workplace productivity."
	description = "Right click on a station alert console on the station to begin hacking it. The AI won't be alerted, so just worry about having on-lookers."

	progression_minimum = 0 MINUTES
	progression_reward = list(2 MINUTES, 5 MINUTES)
	telecrystal_reward = list(1, 2)

	duplicate_type = /datum/traitor_objective/alert_console_hack

/datum/traitor_objective/alert_console_hack/can_generate_objective(datum/mind/generating_for, list/possible_duplicates)
	if(length(possible_duplicates) > 0)
		return FALSE
	return TRUE

/datum/traitor_objective/alert_console_hack/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	AddComponent(/datum/component/traitor_objective_mind_tracker, generating_for, \
		signals = list(COMSIG_LIVING_UNARMED_ATTACK = PROC_REF(on_unarmed_attack)))
	return TRUE

/datum/traitor_objective/alert_console_hack/ungenerate_objective()
	UnregisterSignal(SSdcs, COMSIG_GLOB_TRAITOR_OBJECTIVE_COMPLETED)

/datum/traitor_objective/alert_console_hack/proc/on_unarmed_attack(mob/user, obj/machinery/computer/station_alert/station_only/target, proximity_flag, modifiers)
	SIGNAL_HANDLER
	if(!proximity_flag)
		return
	if(!modifiers[RIGHT_CLICK])
		return
	if(!istype(target))
		return
	INVOKE_ASYNC(src, PROC_REF(begin_hack), user, target)
	return COMPONENT_CANCEL_ATTACK_CHAIN

/datum/traitor_objective/alert_console_hack/proc/begin_hack(mob/user, obj/machinery/computer/station_alert/station_only/target)
	if(!target.try_hack_console(user))
		return

	succeed_objective()
