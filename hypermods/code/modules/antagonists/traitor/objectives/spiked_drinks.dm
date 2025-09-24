/datum/traitor_objective_category/vendor_drink_spike
	name = "Spike a vendor's drinks with harmful substances"
	objectives = list(
		/datum/traitor_objective/vendor_drink_spike = 1,
	)

/datum/traitor_objective/vendor_drink_spike
	name = "Spike a Cola Vending Machine to cause havoc amongst the crew."
	description = "Right click on a cola vending machine on the station to begin hacking it. The AI won't be alerted, so just worry about having on-lookers. If you cannot hack a vendor, it's probably already been spiked!"

	progression_minimum = 0 MINUTES
	progression_reward = list(2 MINUTES, 4 MINUTES)
	telecrystal_reward = list(0, 1)

	duplicate_type = /datum/traitor_objective/vendor_drink_spike

/datum/traitor_objective/vendor_drink_spike/can_generate_objective(datum/mind/generating_for, list/possible_duplicates)
	if(length(possible_duplicates) > 0)
		return FALSE
	return TRUE

/datum/traitor_objective/vendor_drink_spike/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	AddComponent(/datum/component/traitor_objective_mind_tracker, generating_for, \
		signals = list(COMSIG_LIVING_UNARMED_ATTACK = PROC_REF(on_unarmed_attack)))
	return TRUE

/datum/traitor_objective/vendor_drink_spike/ungenerate_objective()
	UnregisterSignal(SSdcs, COMSIG_GLOB_TRAITOR_OBJECTIVE_COMPLETED)

/datum/traitor_objective/vendor_drink_spike/proc/on_unarmed_attack(mob/user, obj/machinery/vending/cola/target, proximity_flag, modifiers)
	SIGNAL_HANDLER
	if(!proximity_flag)
		return
	if(!modifiers[RIGHT_CLICK])
		return
	if(!istype(target))
		return
	INVOKE_ASYNC(src, PROC_REF(begin_hack), user, target)
	return COMPONENT_CANCEL_ATTACK_CHAIN

/datum/traitor_objective/vendor_drink_spike/proc/begin_hack(mob/user, obj/machinery/vending/cola/target)
	if(target.force_spiked_drinks)
		return

	if(!target.try_hack_vendor(user))
		return

	succeed_objective()
