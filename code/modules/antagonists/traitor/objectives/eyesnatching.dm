/datum/traitor_objective_category/eyesnatching
	name = "Eyesnatching"
	objectives = list(
		/datum/traitor_objective/target_player/eyesnatching = 1,
		/datum/traitor_objective/target_player/eyesnatching/heads = 1,
	)
	weight = OBJECTIVE_WEIGHT_UNLIKELY

/datum/traitor_objective/target_player/eyesnatching
	name = "Steal the eyes of %TARGET% the %JOB TITLE%"
	description = "%TARGET% messed with the wrong people. Steal their eyes to teach them a lesson. You will be provided an experimental eyesnatcher device to aid you in your mission."

	progression_minimum = 10 MINUTES

	progression_reward = list(4 MINUTES, 8 MINUTES)
	telecrystal_reward = list(1, 2)

	/// If we're targeting heads of staff or not
	var/heads_of_staff = FALSE
	/// Have we already spawned an eyesnatcher
	var/spawned_eyesnatcher = FALSE

	duplicate_type = /datum/traitor_objective/target_player

/datum/traitor_objective/target_player/eyesnatching/supported_configuration_changes()
	. = ..()
	. += NAMEOF(src, objective_period)
	. += NAMEOF(src, maximum_objectives_in_period)

/datum/traitor_objective/target_player/eyesnatching/New(datum/uplink_handler/handler)
	. = ..()
	AddComponent(/datum/component/traitor_objective_limit_per_time, \
		/datum/traitor_objective/target_player, \
		time_period = objective_period, \
		maximum_objectives = maximum_objectives_in_period \
	)

/datum/traitor_objective/target_player/eyesnatching/heads
	progression_reward = list(6 MINUTES, 12 MINUTES)
	telecrystal_reward = list(2, 3)

	heads_of_staff = TRUE

/datum/traitor_objective/target_player/eyesnatching/generate_objective(datum/mind/generating_for, list/possible_duplicates)

	var/list/already_targeting = list() //List of minds we're already targeting. The possible_duplicates is a list of objectives, so let's not mix things
	for(var/datum/objective/task as anything in handler.primary_objectives)
		if(!istype(task.target, /datum/mind))
			continue
		already_targeting += task.target //Removing primary objective kill targets from the list

	var/list/possible_targets = list()
	var/try_target_late_joiners = FALSE
	if(generating_for.late_joiner)
		try_target_late_joiners = TRUE

	for(var/datum/mind/possible_target as anything in get_crewmember_minds())
		if(possible_target == generating_for)
			continue

		if(possible_target in already_targeting)
			continue

		if(!ishuman(possible_target.current))
			continue

		if(possible_target.current.stat == DEAD)
			continue

		if(possible_target.has_antag_datum(/datum/antagonist/traitor))
			continue

		if(!possible_target.assigned_role)
			continue

		if(heads_of_staff)
			if(!(possible_target.assigned_role.job_flags & JOB_HEAD_OF_STAFF))
				continue
		else
			if(possible_target.assigned_role.job_flags & JOB_HEAD_OF_STAFF)
				continue

		var/mob/living/carbon/human/targets_current = possible_target.current
		if(!targets_current.get_organ_by_type(/obj/item/organ/eyes))
			continue

		possible_targets += possible_target

	for(var/datum/traitor_objective/target_player/objective as anything in possible_duplicates)
		possible_targets -= objective.target?.mind

	if(try_target_late_joiners)
		var/list/all_possible_targets = possible_targets.Copy()
		for(var/datum/mind/possible_target as anything in all_possible_targets)
			if(!possible_target.late_joiner)
				possible_targets -= possible_target

		if(!possible_targets.len)
			possible_targets = all_possible_targets

	if(!possible_targets.len)
		return FALSE //MISSION FAILED, WE'LL GET EM NEXT TIME

	var/datum/mind/target_mind = pick(possible_targets)
	set_target(target_mind.current)

	replace_in_name("%TARGET%", target_mind.name)
	replace_in_name("%JOB TITLE%", target_mind.assigned_role.title)
	RegisterSignal(target, COMSIG_CARBON_LOSE_ORGAN, PROC_REF(check_eye_removal))
	AddComponent(/datum/component/traitor_objective_register, target, fail_signals = list(COMSIG_QDELETING))
	return TRUE

/datum/traitor_objective/target_player/eyesnatching/proc/check_eye_removal(datum/source, obj/item/organ/eyes/removed)
	SIGNAL_HANDLER

	if(!istype(removed))
		return

	succeed_objective()

/datum/traitor_objective/target_player/eyesnatching/generate_ui_buttons(mob/user)
	var/list/buttons = list()
	if(!spawned_eyesnatcher)
		buttons += add_ui_button("", "Pressing this will materialize an eyesnatcher, which can be used on incapacitaded or restrained targets to forcefully remove their eyes.", "syringe", "eyesnatcher")
	return buttons

/datum/traitor_objective/target_player/eyesnatching/ui_perform_action(mob/living/user, action)
	. = ..()
	switch(action)
		if("eyesnatcher")
			if(spawned_eyesnatcher)
				return
			spawned_eyesnatcher = TRUE
			var/obj/item/eyesnatcher/eyesnatcher = new(user.drop_location())
			user.put_in_hands(eyesnatcher)
			eyesnatcher.balloon_alert(user, "the snatcher materializes in your hand")
