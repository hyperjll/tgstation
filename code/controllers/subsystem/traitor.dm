SUBSYSTEM_DEF(traitor)
	name = "Traitor"
	flags = SS_KEEP_TIMING
	wait = 10 SECONDS
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME

	/// A list of all uplink items mapped by type
	var/list/uplink_items_by_type = list()
	/// A list of all uplink items
	var/list/uplink_items = list()

	/// File to load configurations from.
	var/configuration_path = "config/traitor_objective.json"
	/// Global configuration data that gets applied to each objective when it is created.
	/// Basic objective format
	/// '/datum/traitor_objective/path/to/objective': {
	///   "global_progression_influence_intensity": 0
	/// }
	var/configuration_data = list()

	/// The coefficient multiplied by the current_global_progression for new joining traitors to calculate their progression
	var/newjoin_progression_coeff = 1
	/// The current progression that all traitors should be at in the round, you can't have less than this
	var/current_global_progression = 0
	/// The current uplink handlers being managed
	var/list/datum/uplink_handler/uplink_handlers = list()
	/// The current scaling per minute of progression.
	var/current_progression_scaling = 1 MINUTES
	/// Used to handle the probability of getting an objective.
	var/datum/traitor_category_handler/category_handler
	/// The current debug handler for objectives. Used for debugging objectives
	var/datum/traitor_objective_debug/traitor_debug_panel
	/// Used by the debug menu, decides whether newly created objectives should generate progression and telecrystals. Do not modify for non-debug purposes.
	var/generate_objectives = TRUE
	/// Objectives that have been completed by type. Used for limiting objectives.
	var/list/taken_objectives_by_type = list()
	/// A list of all existing objectives by type
	var/list/all_objectives_by_type = list()

/datum/controller/subsystem/traitor/Initialize()
	category_handler = new()
	traitor_debug_panel = new(category_handler)

	for(var/theft_item in subtypesof(/datum/objective_item/steal))
		new theft_item

	if(fexists(configuration_path))
		var/list/data = json_decode(file2text(file(configuration_path)))
		for(var/typepath in data)
			var/actual_typepath = text2path(typepath)
			if(!actual_typepath)
				log_world("[configuration_path] has an invalid type ([typepath]) that doesn't exist in the codebase! Please correct or remove [typepath]")
			configuration_data[actual_typepath] = data[typepath]
	return SS_INIT_SUCCESS

/datum/controller/subsystem/traitor/fire(resumed)
	var/previous_progression = current_global_progression
	current_global_progression = (STATION_TIME_PASSED()) * CONFIG_GET(number/traitor_scaling_multiplier)
	var/progression_increment = current_global_progression - previous_progression

	for(var/datum/uplink_handler/handler in uplink_handlers)
		if(!handler.has_progression || QDELETED(handler))
			uplink_handlers -= handler
		if(handler.progression_points < current_global_progression)
			// If we got unsynced somehow, just set them to the current global progression
			// Prevents problems with precision errors.
			handler.progression_points = current_global_progression
		else
			var/amount_to_give = progression_scaling_delta + (progression_scaling_delta * deviance)
			amount_to_give = clamp(amount_to_give, 0, progression_scaling_delta * 2)
			handler.progression_points += amount_to_give
		handler.update_objectives()
		handler.on_update()

/datum/controller/subsystem/traitor/proc/register_uplink_handler(datum/uplink_handler/uplink_handler)
	if(!uplink_handler.has_progression)
		return
	uplink_handlers |= uplink_handler
	// An uplink handler can be registered multiple times if they get assigned to new uplinks, so
	// override is set to TRUE here because it is intentional that they could get added multiple times.
	RegisterSignal(uplink_handler, COMSIG_QDELETING, PROC_REF(uplink_handler_deleted), override = TRUE)

/datum/controller/subsystem/traitor/proc/uplink_handler_deleted(datum/uplink_handler/uplink_handler)
	SIGNAL_HANDLER
	uplink_handlers -= uplink_handler

/datum/controller/subsystem/traitor/proc/on_objective_taken(datum/traitor_objective/objective)
	if(!istype(objective))
		return

	add_objective_to_list(objective, taken_objectives_by_type)

/datum/controller/subsystem/traitor/proc/get_taken_count(datum/traitor_objective/objective_type)
	return length(taken_objectives_by_type[objective_type])


/datum/controller/subsystem/traitor/proc/add_objective_to_list(datum/traitor_objective/objective, list/objective_list)
	var/datum/traitor_objective/current_type = objective.type
	while(current_type != /datum/traitor_objective)
		if(!objective_list[current_type])
			objective_list[current_type] = list(objective)
		else
			objective_list[current_type] += objective
		current_type = type2parent(current_type)
