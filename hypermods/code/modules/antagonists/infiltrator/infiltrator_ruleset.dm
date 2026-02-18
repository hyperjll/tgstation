/datum/dynamic_ruleset/midround/from_ghosts/infiltrator
	name = "Infiltrator"
	config_tag = "Midround Infiltrator"
	preview_antag_datum = /datum/antagonist/traitor/infiltrator/invader
	pref_flag = ROLE_INFILTRATOR
	//required_enemies = list(2,2,1,1,1,1,1,0,0,0)
	//required_candidates = 1
	weight = alist( // Hehe, super high weights
		DYNAMIC_TIER_LOW = 1,
		DYNAMIC_TIER_LOWMEDIUM = 1,
		DYNAMIC_TIER_MEDIUMHIGH = 2,
		DYNAMIC_TIER_HIGH = 3,
	)
	min_pop = 15
	ruleset_flags = RULESET_INVADER
	midround_type = LIGHT_MIDROUND
	jobban_flag = ROLE_INFILTRATOR
	//cost = 5
	//requirements = list(101,101,101,80,60,50,30,20,10,10)
	var/list/spawn_locs = list()

/datum/dynamic_ruleset/midround/from_ghosts/infiltrator/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/traitor/infiltrator/invader)

/datum/dynamic_ruleset/midround/from_ghosts/infiltrator/execute()
	for(var/obj/effect/landmark/carpspawn/carp_spawn in GLOB.landmarks_list)
		if(!isturf(carp_spawn.loc))
			stack_trace("Carp spawn found not on a turf: [carp_spawn.type] on [isnull(carp_spawn.loc) ? "null" : carp_spawn.loc.type]")
			continue
		spawn_locs += carp_spawn.loc
	if(!spawn_locs.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR
	return ..()

/datum/dynamic_ruleset/midround/from_ghosts/infiltrator/create_ruleset_body(mob/applicant)
	var/datum/mind/player_mind = applicant.mind
	player_mind.active = TRUE

	var/mob/living/carbon/human/infiltrator = new (pick(spawn_locs))
	player_mind.transfer_to(infiltrator)
	player_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator/invader)

	message_admins("[ADMIN_LOOKUPFLW(infiltrator)] has been made into an infiltrator by the midround ruleset.")
	log_game("DYNAMIC: [key_name(infiltrator)] was spawned as an infiltrator by the midround ruleset.")
	return infiltrator
