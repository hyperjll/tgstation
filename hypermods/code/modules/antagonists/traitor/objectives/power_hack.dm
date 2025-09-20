/datum/traitor_objective_category/power_hack
	name = "Hack the Station's Powernet"
	objectives = list(
		/datum/traitor_objective/power_hack = 1,
	)

/datum/traitor_objective/power_hack
	name = "Hack the station's powernet to cause a temporary powernet failure."
	description = "Right click on a power flow control console to begin the hacking process, one is typically found within the Chief Engineer's office. Once started, the AI will know that you are hacking the control console, so be ready to run or have yourself disguised to prevent being caught. This objective will invalidate itself if another traitor completes it first."

	progression_minimum = 30 MINUTES
	progression_reward = list(15 MINUTES, 25 MINUTES)
	telecrystal_reward = list(5, 8)

	duplicate_type = /datum/traitor_objective/power_hack

	var/progression_objectives_minimum = 10 MINUTES

/datum/traitor_objective/power_hack/can_generate_objective(datum/mind/generating_for, list/possible_duplicates)
	if(length(possible_duplicates) > 0)
		return FALSE
	if(SStraitor.get_taken_count(/datum/traitor_objective/power_hack) > 0)
		return FALSE
	if(handler.get_completion_progression(/datum/traitor_objective) < progression_objectives_minimum)
		return FALSE
	return TRUE

/datum/traitor_objective/power_hack/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	AddComponent(/datum/component/traitor_objective_mind_tracker, generating_for, \
		signals = list(COMSIG_LIVING_UNARMED_ATTACK = PROC_REF(on_unarmed_attack)))
	RegisterSignal(SSdcs, COMSIG_GLOB_TRAITOR_OBJECTIVE_COMPLETED, PROC_REF(on_global_obj_completed))
	return TRUE

/datum/traitor_objective/power_hack/ungenerate_objective()
	UnregisterSignal(SSdcs, COMSIG_GLOB_TRAITOR_OBJECTIVE_COMPLETED)

/datum/traitor_objective/power_hack/proc/on_global_obj_completed(datum/source, datum/traitor_objective/objective)
	SIGNAL_HANDLER
	if(istype(objective, /datum/traitor_objective/power_hack))
		fail_objective()

/datum/traitor_objective/power_hack/proc/on_unarmed_attack(mob/user, obj/machinery/computer/apc_control/target, proximity_flag, modifiers)
	SIGNAL_HANDLER
	if(!proximity_flag)
		return
	if(!modifiers[RIGHT_CLICK])
		return
	if(!istype(target))
		return
	INVOKE_ASYNC(src, PROC_REF(begin_hack), user, target)
	return COMPONENT_CANCEL_ATTACK_CHAIN

/datum/traitor_objective/power_hack/proc/begin_hack(mob/user, obj/machinery/computer/apc_control/target)
	if(!target.try_hack_console(user))
		return

	succeed_objective()
