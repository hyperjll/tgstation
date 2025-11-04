/datum/traitor_objective_category/long_term_trespass
	name = "Trespass into an area and linger"
	objectives = list(
		/datum/traitor_objective/long_term_trespass = 1,
	)

/datum/traitor_objective/long_term_trespass
	name = "Trespass into %AREA1% and use an experimental station scanner to gather data over a long period of time."
	description = "You will be given a handheld device that you'll need to use in the %AREA1% in order to provide use with a proper, detailed map of the station and it's contents. Be sure to remain for 3 Minutes or the scan will be interrupted!"

	progression_minimum = 30 MINUTES
	progression_reward = list(7 MINUTES, 10 MINUTES)
	telecrystal_reward = list(2, 4)

	var/progression_objectives_minimum = 10 MINUTES

	/// Have we sent a station scanner yet?
	var/scanner_sent = FALSE
	/// Areas that need to be scanned
	var/list/area/scan_areas

/datum/traitor_objective/long_term_trespass/can_generate_objective(datum/mind/generating_for, list/possible_duplicates)
	if(length(possible_duplicates) > 0)
		return FALSE
	if(handler.get_completion_progression(/datum/traitor_objective) < progression_objectives_minimum)
		return FALSE
	if(SStraitor.get_taken_count(/datum/traitor_objective/locate_weakpoint) > 0)
		return FALSE
	return TRUE

/datum/traitor_objective/long_term_trespass/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	scan_areas = list()
	/// List of high-security areas that we pick required ones from
	var/list/allowed_areas = typecacheof(list(/area/station/command,
		/area/station/comms,
		/area/station/security,
	))

	var/list/blacklisted_areas = typecacheof(list(/area/station/ai,
		/area/station/security/prison,
	))

	var/list/possible_areas = GLOB.the_station_areas.Copy()
	for(var/area/possible_area as anything in possible_areas)
		if(!is_type_in_typecache(possible_area, allowed_areas) || initial(possible_area.outdoors) || is_type_in_typecache(possible_area, blacklisted_areas))
			possible_areas -= possible_area

	for(var/i in 1 to 1)
		scan_areas[pick_n_take(possible_areas)] = TRUE

	var/area/scan_area1 = scan_areas[1]
	replace_in_name("%AREA1%", initial(scan_area1.name))
	RegisterSignal(SSdcs, COMSIG_GLOB_TRAITOR_OBJECTIVE_COMPLETED, PROC_REF(on_global_obj_completed))
	return TRUE

/datum/traitor_objective/long_term_trespass/ungenerate_objective()
	UnregisterSignal(SSdcs, COMSIG_GLOB_TRAITOR_OBJECTIVE_COMPLETED)

/datum/traitor_objective/long_term_trespass/proc/on_global_obj_completed(datum/source, datum/traitor_objective/objective)
	SIGNAL_HANDLER
	if(istype(objective, /datum/traitor_objective/long_term_trespass))
		fail_objective()

/datum/traitor_objective/long_term_trespass/generate_ui_buttons(mob/user)
	var/list/buttons = list()
	if(!scanner_sent)
		buttons += add_ui_button("", "Pressing this will materialize a station scanner in your hand.", "globe", "scanner")
	return buttons

/datum/traitor_objective/long_term_trespass/ui_perform_action(mob/living/user, action)
	. = ..()
	switch(action)
		if("scanner")
			if(scanner_sent)
				return
			scanner_sent = TRUE
			var/obj/item/station_scanner/scanner = new(user.drop_location(), src)
			user.put_in_hands(scanner)
			scanner.balloon_alert(user, "the station scanner materializes in your hand")

/datum/traitor_objective/long_term_trespass/proc/finish_scan()
	succeed_objective()


/obj/item/station_scanner
	name = "station scanner"
	desc = "A device that scans the entirety of the station in a manner similar to the station's blueprints to avoid detection. It has to be used in %AREA1%."
	icon = 'hypermods/icons/obj/antags/syndicate_tools.dmi'
	icon_state = "station_scanner"
	inhand_icon_state = "weakpoint_locator"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	throwforce = 0
	w_class = WEIGHT_CLASS_SMALL
	throw_speed = 3
	throw_range = 5
	var/datum/weakref/objective_weakref

/obj/item/station_scanner/Initialize(mapload, datum/traitor_objective/locate_weakpoint/objective)
	. = ..()
	objective_weakref = WEAKREF(objective)
	if(!objective)
		return
	var/area/area1 = objective.scan_areas[1]
	desc = replacetext(desc, "%AREA1%", initial(area1.name))

/obj/item/station_scanner/Destroy(force)
	objective_weakref = null
	return ..()

/obj/item/station_scanner/attack_self(mob/living/user, modifiers)
	. = ..()
	if(!istype(user) || loc != user || !user.mind) //No TK cheese
		return

	var/datum/traitor_objective/long_term_trespass/objective = objective_weakref.resolve()

	if(!objective || objective.objective_state == OBJECTIVE_STATE_INACTIVE)
		to_chat(user, span_warning("Your time to use [src] has not come yet."))
		return

	if(objective.handler.owner != user.mind)
		to_chat(user, span_warning("You have zero clue how to use [src]."))
		return

	var/area/user_area = get_area(user)
	if(!(user_area.type in objective.scan_areas))
		balloon_alert(user, "invalid area!")
		playsound(user, 'sound/machines/buzz/buzz-sigh.ogg', 30, TRUE)
		return

	user.visible_message(span_danger("[user] presses a few buttons on [src] and it starts ominously beeping!"), span_notice("You activate [src] and start scanning the area. Do not exit [get_area_name(user, TRUE)] until the scan finishes!"))
	playsound(user, 'sound/machines/beep/triple_beep.ogg', 30, TRUE)

	if(!do_after(user, 3 MINUTES, src, IGNORE_USER_LOC_CHANGE | IGNORE_TARGET_LOC_CHANGE | IGNORE_HELD_ITEM | IGNORE_INCAPACITATED | IGNORE_SLOWDOWNS, extra_checks = CALLBACK(src, PROC_REF(scan_checks), user, user_area, objective), hidden = TRUE))
		playsound(user, 'sound/machines/buzz/buzz-sigh.ogg', 30, TRUE)
		return

	playsound(user, 'sound/machines/ding.ogg', 100, TRUE)

	to_chat(user, span_notice("Scan finished. Data gathered has been sent directly to Syndicate Command. Please dispose of the station scanner."))
	objective.finish_scan()

/obj/item/station_scanner/proc/scan_checks(mob/living/user, area/user_area, datum/traitor_objective/locate_weakpoint/parent_objective)
	if(get_area(user) != user_area)
		return FALSE

	if(parent_objective.objective_state != OBJECTIVE_STATE_ACTIVE)
		return FALSE

	var/atom/current_loc = loc
	while(!isturf(current_loc) && !ismob(current_loc))
		current_loc = current_loc.loc

	if(current_loc != user)
		return FALSE

	return TRUE
