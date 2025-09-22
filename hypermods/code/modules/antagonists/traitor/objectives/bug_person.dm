/datum/traitor_objective_category/bug_person
	name = "Bug an entity for surveillence"
	objectives = list(
		/datum/traitor_objective/target_player/bug_person = 1,
	)

/datum/traitor_objective/target_player/bug_person
	name = "Place a bug on %TARGET% the %JOB TITLE%"
	description = "Use the button below to materialize the biological scanner within your hand, where you'll then be able to place it on the person. Additionally, if the bug isn't removed after %TIME% minutes you'll be rewarded with %TC% telecrystals."

	progression_minimum = 0 MINUTES

	progression_reward = list(4 MINUTES, 8 MINUTES)
	telecrystal_reward = 2

	var/list/possible_targets = list()
	/// The current time fulfilled around the item
	var/time_fulfilled = 0
	/// The bug that will be put onto the item
	var/obj/item/traitor_bug_mob/bug
	/// Bonus Telecrystals after the bug remains for this length of time.
	var/bonus_time = 1

	/// Extra TC given should you allow the bug to persist after placement without getting destroyed.
	var/extra_tc = 2

	duplicate_type = /datum/traitor_objective/target_player

/datum/traitor_objective/target_player/bug_person/New(datum/uplink_handler/handler)
	. = ..()
	bonus_time = rand(2, 4) // this is multiplied by 1 MINUTE, so anywhere from 2 to 4 min
	extra_tc = rand(2, 3)

/datum/traitor_objective/target_player/bug_person/can_generate_objective(generating_for, list/possible_duplicates)
	if(length(possible_duplicates) > 0)
		return FALSE
	return ..()

/datum/traitor_objective/target_player/bug_person/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	for(var/datum/mind/possible_target as anything in get_crewmember_minds())
		var/target_area = get_area(possible_target.current)
		if(possible_target == generating_for)
			continue
		if(!ishuman(possible_target.current))
			continue
		if(possible_target.current.stat == DEAD)
			continue
		var/datum/antagonist/traitor/traitor = possible_target.has_antag_datum(/datum/antagonist/traitor)
		if(traitor && traitor.uplink_handler.telecrystals >= 0)
			continue
		if(istype(target_area, /area/shuttle/arrival))
			continue
		possible_targets += possible_target

	if(length(possible_targets))
		target = pick(possible_targets)
	if(!target)
		return FALSE

	var/datum/mind/target_mind = pick(possible_targets)
	set_target(target_mind.current)

	replace_in_name("%TARGET%", target.name)
	replace_in_name("%JOB TITLE%", target_mind.assigned_role.title)
	replace_in_name("%TIME%", bonus_time)
	replace_in_name("%TC%", extra_tc)
	return TRUE

/datum/traitor_objective/target_player/bug_person/generate_ui_buttons(mob/user)
	var/list/buttons = list()
	if(!bug)
		buttons += add_ui_button("", "Pressing this will materialize a scanner in your hand, which you can place on the target item", "wifi", "summon_bug")
	else if(bug.planted_on)
		buttons += add_ui_button("[DisplayTimeText(time_fulfilled)]", "This tells you how much time you have spent around the target item after the scanner has been planted.", "clock", "none")
		buttons += add_ui_button("Skip Time", "Pressing this will succeed the mission. You will not get the extra TC and progression.", "forward", "cash_out")
	return buttons

/datum/traitor_objective/target_player/bug_person/ungenerate_objective()
	STOP_PROCESSING(SSprocessing, src)
	if(bug)
		UnregisterSignal(bug, list(COMSIG_TRAITOR_BUG_PLANTED_OBJECT, COMSIG_TRAITOR_BUG_PRE_PLANTED_OBJECT))
	bug = null

/datum/traitor_objective/target_player/bug_person/ui_perform_action(mob/living/user, action)
	. = ..()
	switch(action)
		if("summon_bug")
			if(bug)
				return
			bug = new(user.drop_location())
			user.put_in_hands(bug)
			bug.balloon_alert(user, "the scanner materializes in your hand")
			bug.target_mob_type = target
			bug.target_mob_mind = target.mind

			AddComponent(/datum/component/traitor_objective_register, bug, \
				fail_signals = list(COMSIG_QDELETING), \
				penalty = telecrystal_penalty)
			RegisterSignal(bug, COMSIG_TRAITOR_BUG_PLANTED_OBJECT, PROC_REF(on_bug_planted))
		if("cash_out")
			if(!bug.planted_on)
				return
			succeed_objective()

/datum/traitor_objective/target_player/bug_person/proc/on_bug_planted(obj/item/source, mob/location)
	SIGNAL_HANDLER
	if(objective_state == OBJECTIVE_STATE_ACTIVE)
		START_PROCESSING(SSprocessing, src)

/datum/traitor_objective/target_player/bug_person/process(seconds_per_tick)
	var/mob/owner = handler.owner?.current
	if(objective_state != OBJECTIVE_STATE_ACTIVE || !bug.planted_on)
		return PROCESS_KILL
	if(!owner)
		fail_objective()
		return PROCESS_KILL
	time_fulfilled += seconds_per_tick * (1 SECONDS)
	if(time_fulfilled >= bonus_time * (1 MINUTES))
		telecrystal_reward += extra_tc
		succeed_objective()
		return PROCESS_KILL
	handler.on_update()


/obj/item/traitor_bug_mob
	name = "suspicious device"
	desc = "It looks dangerous."
	item_flags = NOBLUDGEON

	icon = 'icons/obj/antags/syndicate_tools.dmi'
	icon_state = "bug"

	/// The object on which this bug can be planted on. Has to be a type.
	var/mob/target_mob_type
	/// The object this bug is currently planted on.
	var/mob/planted_on
	/// The mind of our target. Used to prevent this bug from working on all of a certain mob type.
	var/target_mob_mind
	/// The time it takes to place this bug.
	var/deploy_time = 10 SECONDS

	/// Radio shit
	var/obj/item/radio/radio


/obj/item/traitor_bug_mob/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_EXAMINE_SKIP, INNATE_TRAIT)

	radio = new(src)
	radio.broadcasting = TRUE
	radio.listening = FALSE
	radio.canhear_range = 0
	radio.radio_noise = FALSE
	radio.keyslot = new /obj/item/encryptionkey/syndicate
	radio.subspace_transmission = TRUE
	radio.recalculateChannels()
	radio.frequency = FREQ_SYNDICATE
	radio.set_broadcasting(TRUE)

/obj/item/traitor_bug_mob/examine(mob/user)
	. = ..()
	if(planted_on)
		return

	if(IS_TRAITOR(user))
		if(target_mob_type)
			. += span_notice("This device must be placed by <b>clicking on the [initial(target_mob_type.name)]</b> with it.")
		. += span_notice("Remember, you may leave behind fingerprints or fibers on the device. Use <b>soap</b> or similar to scrub it clean to be safe!")

/obj/item/traitor_bug_mob/interact_with_atom(atom/movable/target, mob/living/user, list/modifiers)
	if(!target_mob_type || !ismovable(target))
		return NONE
	if(SHOULD_SKIP_INTERACTION(target, src, user))
		return NONE
	var/result = SEND_SIGNAL(src, COMSIG_TRAITOR_BUG_PRE_PLANTED_OBJECT, target)
	if(!(result & COMPONENT_FORCE_PLACEMENT))
		var/mob/living/target_human = target
		if(result & COMPONENT_FORCE_FAIL_PLACEMENT || !istype(target_human, target_mob_type))
			balloon_alert(user, "you can't attach this onto here!")
			return ITEM_INTERACT_BLOCKING
		if(target_human.mind != target_mob_mind)
			balloon_alert(user, "this isn't the right target!")
			return ITEM_INTERACT_BLOCKING
	if(!do_after(user, deploy_time, target, hidden = TRUE))
		return ITEM_INTERACT_BLOCKING
	if(planted_on)
		return ITEM_INTERACT_BLOCKING
	forceMove(target)
	target.vis_contents += src
	vis_flags |= VIS_INHERIT_PLANE
	planted_on = target
	RegisterSignal(planted_on, COMSIG_QDELETING, PROC_REF(handle_planted_on_deletion))
	SEND_SIGNAL(src, COMSIG_TRAITOR_BUG_PLANTED_OBJECT, target)
	return ITEM_INTERACT_SUCCESS

/obj/item/traitor_bug_mob/proc/handle_planted_on_deletion()
	planted_on = null

/obj/item/traitor_bug_mob/Destroy()
	if(planted_on)
		vis_flags &= ~VIS_INHERIT_PLANE
		planted_on.vis_contents -= src
	return ..()

/obj/item/traitor_bug_mob/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change = TRUE)
	. = ..()
	if(planted_on)
		vis_flags &= ~VIS_INHERIT_PLANE
		planted_on.vis_contents -= src
		anchored = FALSE
		UnregisterSignal(planted_on, COMSIG_QDELETING)
		planted_on = null
