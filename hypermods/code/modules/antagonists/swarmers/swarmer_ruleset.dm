/datum/dynamic_ruleset/midround/from_ghosts/swarmers
	name = "Swarmers"
	config_tag = "Midround Swarmers"
	midround_type = LIGHT_MIDROUND
	preview_antag_datum = /datum/antagonist/swarmer
	pref_flag = ROLE_SWARMER
	//required_type = /mob/dead/observer
	//required_candidates = 1
	weight = alist(
		DYNAMIC_TIER_LOW = 0,
		DYNAMIC_TIER_LOWMEDIUM = 0,
		DYNAMIC_TIER_MEDIUMHIGH = 1,
		DYNAMIC_TIER_HIGH = 1,
	)
	ruleset_flags = RULESET_INVADER
	//cost = 10
	//required_enemies = list(2,2,1,1,1,1,1,0,0,0)
	min_pop = 30 // Enough to expand and still having enemies
	repeatable = FALSE
	signup_atom_appearance = /mob/living/basic/swarmer
	var/spawn_loc = null

/datum/dynamic_ruleset/midround/from_ghosts/swarmers/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/swarmer)

/datum/dynamic_ruleset/midround/from_ghosts/swarmers/can_be_selected()
	return ..() && !isnull(find_maintenance_spawn(atmos_sensitive = TRUE, require_darkness = FALSE))

/datum/dynamic_ruleset/midround/from_ghosts/swarmers/create_ruleset_body()
	return new /mob/living/basic/swarmer(find_maintenance_spawn(atmos_sensitive = TRUE, require_darkness = FALSE))

/datum/dynamic_ruleset/midround/from_ghosts/swarmers/execute()
	priority_announce("Long-range sensors indicate [station_name()] has been breached by swarmers. The crew is advised to protect precious material stores and disable the threat.", "Intrusion Alert")

	return ..()
