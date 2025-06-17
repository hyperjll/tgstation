/datum/round_event_control/ert_setup
	name = "Emergency Response Team"
	typepath = /datum/round_event/ghost_role/ert_setup
	weight = 0 //its weight is relative to how much stationary and neglected the nuke disk is. See nuclearbomb.dm. Shouldn't be dynamic hijackable.
	max_occurrences = 1
	category = EVENT_CATEGORY_INVASION
	description = "A team of Central Command personnel arrive, likely with intentions to interact with the station."
	admin_setup = list(/datum/event_admin_setup/ert_setup, /datum/event_admin_setup/input_number/minimum_players)

/datum/round_event_control/ert_setup/revs
	name = "Anti-Rev Deathsquad"
	typepath = /datum/round_event/ghost_role/ert_setup/revs
	admin_setup = null

/datum/round_event/ghost_role/ert_setup
	minimum_required = 1
	role_name = "emergency response personnel"
	fakeable = FALSE
	var/ghost_poll_role = ROLE_ERT
	var/ert_team_chosen = /datum/antagonist/ert/official
	var/amount_of_ert = 1
	var/kill_everyone_mission = FALSE

/datum/round_event/ghost_role/ert_setup/revs
	role_name = "deathsquad"
	amount_of_ert = 8 // Up to EIGHT deathsquad. Good riddance, crew.
	ghost_poll_role = ROLE_REV_HEAD // I'm setting this to REV_HEAD instead of DEATHSQUAD for now until i can figure out what's borked about that role, and to reward people for actually having head rev pref on
	ert_team_chosen = /datum/antagonist/ert/deathsquad

/datum/round_event/ghost_role/ert_setup/spawn_role()
	var/list/mob/dead/observer/chosen_one = SSpolling.poll_ghost_candidates(check_jobban = ROLE_DEATHSQUAD, role = ghost_poll_role, alert_pic = /obj/item/clothing/head/beret/centcom_formal, role_name_text = role_name, amount_to_pick = amount_of_ert)
	// I'm using
	if(isnull(chosen_one))
		return NOT_ENOUGH_PLAYERS
	var/spawn_location = pick(GLOB.emergencyresponseteamspawn)
	if(isnull(spawn_location))
		return MAP_ERROR
	var/mob/living/carbon/human/ert_member = new(spawn_location)
	ert_member.randomize_human_appearance(~RANDOMIZE_SPECIES)
	ert_member.dna.update_dna_identity()
	var/datum/mind/Mind = new /datum/mind(chosen_one.key)
	Mind.set_assigned_role(SSjob.get_job_type(/datum/job/ert_generic))
	Mind.special_role = ROLE_DEATHSQUAD
	Mind.active = TRUE
	Mind.transfer_to(ert_member)
	if(!ert_member.client?.prefs.read_preference(/datum/preference/toggle/nuke_ops_species)) // I'm just gonna use the nukie species toggle for this one, nobodies gonna care that much, right?
		var/species_type = ert_member.client.prefs.read_preference(/datum/preference/choiced/species)
		ert_member.set_species(species_type) //Apply the preferred species to our freshly-made body.

	Mind.add_antag_datum(ert_team_chosen)

	message_admins("[ADMIN_LOOKUPFLW(ert_member)] has been made into a ERT member by an event.")
	ert_member.log_message("was spawned as a ERT member by an event.", LOG_GAME)
	spawned_mobs += ert_member
	return SUCCESSFUL_SPAWN


/datum/event_admin_setup/ert_setup
	var/ert_team_pick

/datum/event_admin_setup/ert_setup/prompt_admins()
	var/ert_types = list()
	for(var/datum/antagonist/ert/ert_type as anything in subtypesof(/datum/antagonist/ert/))
		ert_types += ert_type

	var/ert_choice = tgui_input_list(
		usr,
		"Select your ERT type.",
		"ERT Type Choice",
		ert_types,
	)
	if(!ert_choice)
		return
	ert_team_pick = ert_choice
	return ..()

/datum/event_admin_setup/ert_setup/apply_to_event(datum/round_event/ghost_role/ert_setup/event)
	event.ert_team_chosen = ert_team_pick


/datum/event_admin_setup/input_number/minimum_players
	input_text = "Set minimum amount of ERT members to grab."
	min_value = 1
	max_value = 9

/datum/event_admin_setup/input_number/minimum_players/prompt_admins()
	default_value = rand(1, 9)
	return ..()

/datum/event_admin_setup/input_number/minimum_players/apply_to_event(datum/round_event/ghost_role/ert_setup/event)
	event.amount_of_ert = chosen_value
