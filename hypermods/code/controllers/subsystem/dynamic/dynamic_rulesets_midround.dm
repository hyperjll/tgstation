/// Midround Heretic Ruleset (From Living)
/datum/dynamic_ruleset/midround/from_living/hereticmid
	name = "Heretic Awakening"
	config_tag = "Midround Heretic"
	preview_antag_datum = /datum/antagonist/heretic
	pref_flag = ROLE_HERETIC_MIDROUND
	//antag_flag_override = ROLE_HERETIC
	//required_candidates = 1
	midround_type = LIGHT_MIDROUND
	weight = alist(
		DYNAMIC_TIER_LOW = 0,
		DYNAMIC_TIER_LOWMEDIUM = 1,
		DYNAMIC_TIER_MEDIUMHIGH = 3,
		DYNAMIC_TIER_HIGH = 3,
	)
	//cost = 5
	//requirements = list(50,40,20,10,5,5,3,3,3,3)
	min_pop = 30 // Ensures good spread of sacrifice targets
	repeatable = TRUE

/datum/dynamic_ruleset/midround/from_living/hereticmid/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/heretic)
