/datum/traitor_objective_category/smuggle_plasma
	name = "Smuggle plasma off the station"
	objectives = list(
		/datum/traitor_objective/smuggle_plasma = 1,
	)

/datum/traitor_objective/smuggle_plasma
	name = "Smuggle atleast %TARGETAMT% of %TARGET% and deliver it to %AREA%"
	description = "We'd like to acquire %TARGET% as cheap as possible, preferably by theft from our enemy. Deliver the goods to %AREA%, where our transport pod will be waiting. \
		Be sure to send atleast %TARGETAMT%, or you'll have the bill sent straight back to you."

	duplicate_type = /datum/traitor_objective/smuggle_plasma

	/// Area that the target needs to be delivered to
	var/area/dropoff_area
	/// Have we called the pod yet?
	var/pod_called = FALSE
	/// What items are possible to be smuggled?
	var/target_items = list(
		/obj/item/stack/sheet/mineral/plasma,
	)
	/// What item do we ACTUALLY want smuggled?
	var/obj/item/smuggle_item_target
	/// Amount of the item we want that's required to be extracted.
	var/target_amt = 10

	progression_minimum = 0 MINUTES
	progression_reward = list(2 MINUTES, 4 MINUTES)
	telecrystal_reward = list(1, 2)

/datum/traitor_objective/smuggle_plasma/New(datum/uplink_handler/handler)
	. = ..()
	smuggle_item_target = pick(target_items)

/datum/traitor_objective/smuggle_plasma/can_generate_objective(datum/mind/generating_for, list/possible_duplicates)
	if(length(possible_duplicates) > 0)
		return FALSE
	return TRUE

/datum/traitor_objective/smuggle_plasma/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	var/list/possible_areas = GLOB.the_station_areas.Copy()
	for(var/area/possible_area as anything in possible_areas)
		if(ispath(possible_area, /area/station/hallway) || ispath(possible_area, /area/station/security) || initial(possible_area.outdoors))
			possible_areas -= possible_area

	dropoff_area = pick(possible_areas)
	replace_in_name("%TARGET%", smuggle_item_target.name)
	replace_in_name("%TARGETAMT%", target_amt)
	replace_in_name("%AREA%", initial(dropoff_area.name))
	return TRUE

/datum/traitor_objective/smuggle_plasma/ungenerate_objective()
	dropoff_area = null

/datum/traitor_objective/smuggle_plasma/generate_ui_buttons(mob/user)
	var/list/buttons = list()
	if(!pod_called)
		buttons += add_ui_button("Call Extraction Pod", "Pressing this will call down an extraction pod.", "rocket", "call_pod")
	return buttons

/datum/traitor_objective/smuggle_plasma/ui_perform_action(mob/living/user, action)
	. = ..()
	switch(action)
		if("call_pod")
			if(pod_called)
				return
			var/area/user_area = get_area(user)

			if(user_area.type != dropoff_area)
				to_chat(user, span_warning("You must be in [initial(dropoff_area.name)] to call the extraction pod."))
				return

			call_pod(user)

/datum/traitor_objective/smuggle_plasma/proc/call_pod(mob/living/user)
	pod_called = TRUE
	var/obj/structure/closet/supplypod/smugglepod/new_pod = new()
	RegisterSignal(new_pod, COMSIG_ATOM_ENTERED, PROC_REF(enter_check))
	new /obj/effect/pod_landingzone(get_turf(user), new_pod)

/datum/traitor_objective/smuggle_plasma/proc/enter_check(obj/structure/closet/supplypod/smugglepod/source, entered_atom)
	SIGNAL_HANDLER
	if(!istype(source))
		CRASH("Smuggle objective's enter_check called with source being not an extraction pod: [source ? source.type : "N/A"]")

	for(var/obj/item/stack/item_in_pod in source.contents)
		if((item_in_pod.type == smuggle_item_target || item_in_pod.parent_type == smuggle_item_target) && item_in_pod.amount >= target_amt)
			succeed_objective()
			source.start_exit_sequence(source)
			return

	fail_objective(penalty_cost = telecrystal_penalty)
	source.start_exit_sequence(source)
