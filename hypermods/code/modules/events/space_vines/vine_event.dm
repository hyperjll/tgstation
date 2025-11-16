/datum/round_event_control/spacetendons
	name = "Space Tendons"
	typepath = /datum/round_event/spacetendons
	weight = 0
	max_occurrences = 1
	min_players = 30
	category = EVENT_CATEGORY_ENTITIES
	description = "Tendons (Meatzu) begins to overtake the station."
	min_wizard_trigger_potency = 4
	max_wizard_trigger_potency = 7
	admin_setup = list(
		/datum/event_admin_setup/set_location/spacetendons,
		/datum/event_admin_setup/multiple_choice/spacetendons,
		/datum/event_admin_setup/input_number/spacetendons_potency,
		/datum/event_admin_setup/input_number/spacetendons_production,
	)

/datum/round_event/spacetendons
	fakeable = FALSE
	///Override location the vines will spawn in.
	var/turf/override_turf
	///used to confirm if admin selected mutations should be used or not.
	var/mutations_overridden = FALSE
	///Admin selected mutations that the kudzu will spawn with, can be set to none to act as mutationless kudzu.
	var/list/override_mutations = list()
	///Potency of the spawned kudzu.
	var/potency
	///Production value of the spawned kuduz.
	var/production

/datum/round_event/spacetendons/start()
	var/list/final_turf_candidates = list() // final list of eligible empty floor turfs in the hallway areas that can be chosen

	if(override_turf)
		final_turf_candidates += override_turf
	else
		var/obj/structure/spacetendons/vine = new()
		var/list/floor_candidates = list()
		for(var/area/station/hallway/area in shuffle(GLOB.areas.Copy()))
			for(var/turf/open/floor in area.get_turfs_from_all_zlevels())
				if(isopenspaceturf(floor))
					continue
				floor_candidates += floor

		// Enter() is expensive to call on potentially hundreds to thousands of turfs at once and can even lead to server crashes.
		// We can pick() a subset instead and get close enough results at a fraction of the cost.
		var/turfs_to_test = 100
		var/list/sampled_floor_candidates = pick_n(floor_candidates, min(turfs_to_test, length(floor_candidates))) // results in at most 100 calls of Enter(), a reasonable amount while still feeling random.

		for(var/turf/open/floor as anything in sampled_floor_candidates)
			if(floor.Enter(vine))
				final_turf_candidates += floor
		qdel(vine)

	if(!length(final_turf_candidates))
		return

	// Pick a turf to spawn at if we can
	var/turf/floor = pick(final_turf_candidates)
	var/list/selected_mutations = list()

	if(mutations_overridden)
		selected_mutations = override_mutations
	else
		selected_mutations = list(pick(valid_subtypesof(/datum/spacevine_mutation)))

	if(isnull(potency))
		potency = rand(50, 100)

	if(isnull(production))
		production = rand(1, 4)

	new /datum/spacetendons_controller(floor, selected_mutations, potency, production, src) //spawn a controller at turf with randomized stats and a single random mutation

/datum/event_admin_setup/set_location/spacetendons
	input_text = "Spawn vines at current location?"

/datum/event_admin_setup/set_location/spacetendons/apply_to_event(datum/round_event/spacetendons/event)
	event.override_turf = chosen_turf

/datum/event_admin_setup/multiple_choice/spacetendons
	input_text = "Select starting mutations."
	min_choices = 0

/datum/event_admin_setup/multiple_choice/spacetendons/prompt_admins()
	var/customize_mutations = tgui_alert(usr, "Select mutations?", event_control.name, list("Custom", "Random", "Cancel"))
	switch(customize_mutations)
		if("Custom")
			return ..()
		if("Random")
			choices = list("[pick(subtypesof(/datum/spacetendon_mutation))]")
		else
			return ADMIN_CANCEL_EVENT

/datum/event_admin_setup/multiple_choice/spacetendons/get_options()
	return subtypesof(/datum/spacetendon_mutation/)

/datum/event_admin_setup/multiple_choice/spacetendons/apply_to_event(datum/round_event/spacetendons/event)
	var/list/type_choices = list()
	for(var/choice in choices)
		type_choices += text2path(choice)
	event.mutations_overridden = TRUE
	event.override_mutations = type_choices

/datum/event_admin_setup/input_number/spacetendons_potency
	input_text = "Set vine's potency (effects mutation frequency + max severity)"
	max_value = 100

/datum/event_admin_setup/input_number/spacetendons_potency/prompt_admins()
	default_value = rand(50, 100)
	return ..()

/datum/event_admin_setup/input_number/spacetendons_potency/apply_to_event(datum/round_event/spacevine/event)
	event.potency = chosen_value

/datum/event_admin_setup/input_number/spacetendons_production
	input_text = "Set vine's production (effects spreading cap + speed) (lower is faster)"
	min_value = 1
	max_value = 10

/datum/event_admin_setup/input_number/spacetendons_production/prompt_admins()
	default_value = rand(1, 4)
	return ..()

/datum/event_admin_setup/input_number/spacetendons_production/apply_to_event(datum/round_event/spacevine/event)
	event.production = chosen_value
