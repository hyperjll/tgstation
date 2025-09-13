/datum/traitor_objective_category/bank_heist
	name = "Heist the Station's Vault"
	objectives = list(
		/datum/traitor_objective/bank_heist = 1,
	)

/datum/traitor_objective/bank_heist
	name = "Hack a bank machine in the vault to steal all of the credits and leave the station in debt"
	description = "Right click on a bank machine within the vault to begin the hacking process. Once started, the AI will know that you are hacking a bank machine, so be ready to run or have yourself disguised to prevent being caught. This objective will invalidate itself if another traitor completes it first."

	progression_minimum = 40 MINUTES
	progression_reward = list(20 MINUTES, 30 MINUTES)
	telecrystal_reward = list(6, 10)

	var/progression_objectives_minimum = 10 MINUTES

/datum/traitor_objective/bank_heist/can_generate_objective(datum/mind/generating_for, list/possible_duplicates)
	if(length(possible_duplicates) > 0)
		return FALSE
	if(SStraitor.get_taken_count(/datum/traitor_objective/bank_heist) > 0)
		return FALSE
	if(handler.get_completion_progression(/datum/traitor_objective) < progression_objectives_minimum)
		return FALSE
	return TRUE

/datum/traitor_objective/bank_heist/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	AddComponent(/datum/component/traitor_objective_mind_tracker, generating_for, \
		signals = list(COMSIG_LIVING_UNARMED_ATTACK = PROC_REF(on_unarmed_attack)))
	RegisterSignal(SSdcs, COMSIG_GLOB_TRAITOR_OBJECTIVE_COMPLETED, PROC_REF(on_global_obj_completed))
	return TRUE

/datum/traitor_objective/bank_heist/ungenerate_objective()
	UnregisterSignal(SSdcs, COMSIG_GLOB_TRAITOR_OBJECTIVE_COMPLETED)

/datum/traitor_objective/bank_heist/proc/on_global_obj_completed(datum/source, datum/traitor_objective/objective)
	SIGNAL_HANDLER
	if(istype(objective, /datum/traitor_objective/bank_heist))
		fail_objective()

/datum/traitor_objective/bank_heist/proc/on_unarmed_attack(mob/user, obj/machinery/computer/bank_machine/target, proximity_flag, modifiers)
	SIGNAL_HANDLER
	if(!proximity_flag)
		return
	if(!modifiers[RIGHT_CLICK])
		return
	if(!istype(target))
		return
	INVOKE_ASYNC(src, PROC_REF(begin_hack), user, target)
	return COMPONENT_CANCEL_ATTACK_CHAIN

/datum/traitor_objective/bank_heist/proc/begin_hack(mob/user, obj/machinery/computer/bank_machine/target)
	if(!target.try_hack_console(user))
		return

	succeed_objective()
