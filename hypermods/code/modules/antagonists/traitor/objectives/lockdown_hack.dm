/datum/traitor_objective_category/lockdown_hack
	name = "Utilize a bug in an AI Upload Console"
	objectives = list(
		/datum/traitor_objective/lockdown_hack = 1,
	)

/datum/traitor_objective/lockdown_hack
	name = "Hack an AI Upload Console in the AI Upload Chamber to cause a temporary station-wide lockdown"
	description = "Right click on an AI Upload Console within the AI Upload Chamber to begin the hacking process. Once started, the AI will be alerted to your presence if not already, so be ready to run or have yourself disguised to prevent being caught. This objective will invalidate itself if another traitor completes it first."

	progression_minimum = 20 MINUTES
	progression_reward = list(8 MINUTES, 16 MINUTES)
	telecrystal_reward = list(6, 10)

	duplicate_type = /datum/traitor_objective/lockdown_hack

	var/progression_objectives_minimum = 10 MINUTES

/datum/traitor_objective/lockdown_hack/can_generate_objective(datum/mind/generating_for, list/possible_duplicates)
	if(length(possible_duplicates) > 0)
		return FALSE
	if(SStraitor.get_taken_count(/datum/traitor_objective/lockdown_hack) > 0)
		return FALSE
	if(handler.get_completion_progression(/datum/traitor_objective) < progression_objectives_minimum)
		return FALSE
	return TRUE

/datum/traitor_objective/lockdown_hack/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	AddComponent(/datum/component/traitor_objective_mind_tracker, generating_for, \
		signals = list(COMSIG_LIVING_UNARMED_ATTACK = PROC_REF(on_unarmed_attack)))
	RegisterSignal(SSdcs, COMSIG_GLOB_TRAITOR_OBJECTIVE_COMPLETED, PROC_REF(on_global_obj_completed))
	return TRUE

/datum/traitor_objective/lockdown_hack/ungenerate_objective()
	UnregisterSignal(SSdcs, COMSIG_GLOB_TRAITOR_OBJECTIVE_COMPLETED)

/datum/traitor_objective/lockdown_hack/proc/on_global_obj_completed(datum/source, datum/traitor_objective/objective)
	SIGNAL_HANDLER
	if(istype(objective, /datum/traitor_objective/lockdown_hack))
		fail_objective()

/datum/traitor_objective/lockdown_hack/proc/on_unarmed_attack(mob/user, obj/machinery/computer/upload/ai/target, proximity_flag, modifiers)
	SIGNAL_HANDLER
	if(!proximity_flag)
		return
	if(!modifiers[RIGHT_CLICK])
		return
	if(!istype(target))
		return
	INVOKE_ASYNC(src, PROC_REF(begin_hack), user, target)
	return COMPONENT_CANCEL_ATTACK_CHAIN

/datum/traitor_objective/lockdown_hack/proc/begin_hack(mob/user, obj/machinery/computer/upload/ai/target)
	if(!target.try_hack_console(user))
		return

	succeed_objective()
