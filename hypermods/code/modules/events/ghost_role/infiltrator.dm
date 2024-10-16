/datum/round_event_control/infiltrator
	name = "Infiltrator Arrival"
	typepath = /datum/round_event/ghost_role/infiltrator
	weight = 2
	max_occurrences = 1
	category = EVENT_CATEGORY_INVASION
	description = "A syndicate infiltrator arrives via space and onto the station."

/datum/round_event/ghost_role/infiltrator
	minimum_required = 1
	role_name = "infiltrator"
	fakeable = FALSE

/datum/round_event/ghost_role/infiltrator/spawn_role()
	var/mob/chosen_one = SSpolling.poll_ghost_candidates(check_jobban = ROLE_INFILTRATOR, role = ROLE_INFILTRATOR, alert_pic = /obj/item/clothing/head/helmet/space/syndicate, amount_to_pick = 1)
	if(isnull(chosen_one))
		return NOT_ENOUGH_PLAYERS
	var/spawn_location = find_space_spawn()
	if(isnull(spawn_location))
		return MAP_ERROR
	var/mob/living/carbon/human/infiltrator = new(spawn_location)
	infiltrator.randomize_human_appearance(~RANDOMIZE_SPECIES)
	infiltrator.dna.update_dna_identity()
	var/datum/mind/Mind = new /datum/mind(chosen_one.key)
	Mind.set_assigned_role(SSjob.get_job_type(/datum/job/infiltrator))
	Mind.special_role = ROLE_INFILTRATOR
	Mind.active = TRUE
	Mind.transfer_to(infiltrator)
	if(!infiltrator.client?.prefs.read_preference(/datum/preference/toggle/nuke_ops_species)) // Eh, we'll let this decide.
		var/species_type = infiltrator.client.prefs.read_preference(/datum/preference/choiced/species)
		infiltrator.set_species(species_type) //Apply the preferred species to our freshly-made body.

	Mind.add_antag_datum(/datum/antagonist/traitor/infiltrator/invader)

	message_admins("[ADMIN_LOOKUPFLW(infiltrator)] has been made into infiltrator by an event.")
	infiltrator.log_message("was spawned as a infiltrator by an event.", LOG_GAME)
	spawned_mobs += infiltrator
	return SUCCESSFUL_SPAWN
