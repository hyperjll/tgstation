/datum/traitor_objective_category/vendor_hack
	name = "Hack a Vending Machine to make it hostile"
	objectives = list(
		/datum/traitor_objective/vendor_hack = 1,
	)

/datum/traitor_objective/vendor_hack
	name = "Hack a vending machine to render it aware and hostile."
	description = "Right click on a vending machine to begin the hacking process. While the vending machine won't come alive for some time, your tampering can still be noticed by on-lookers."

	progression_minimum = 10 MINUTES
	progression_reward = list(3 MINUTES, 5 MINUTES)
	telecrystal_reward = list(0, 1)


/datum/traitor_objective/vendor_hack/can_generate_objective(datum/mind/generating_for, list/possible_duplicates)
	if(length(possible_duplicates) > 0)
		return FALSE
	return TRUE

/datum/traitor_objective/vendor_hack/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	AddComponent(/datum/component/traitor_objective_mind_tracker, generating_for, \
		signals = list(COMSIG_LIVING_UNARMED_ATTACK = PROC_REF(on_unarmed_attack)))

	return TRUE

/datum/traitor_objective/vendor_hack/ungenerate_objective()
	UnregisterSignal(SSdcs, COMSIG_GLOB_TRAITOR_OBJECTIVE_COMPLETED)

/datum/traitor_objective/vendor_hack/proc/on_unarmed_attack(mob/user, obj/machinery/vending/target, proximity_flag, modifiers)
	SIGNAL_HANDLER
	if(!proximity_flag)
		return
	if(!modifiers[RIGHT_CLICK])
		return
	if(!istype(target))
		return
	INVOKE_ASYNC(src, PROC_REF(begin_hack), user, target)
	return COMPONENT_CANCEL_ATTACK_CHAIN

/datum/traitor_objective/vendor_hack/proc/begin_hack(mob/user, obj/machinery/vending/target)
	if(!target.try_hack(user))
		return

	succeed_objective()
