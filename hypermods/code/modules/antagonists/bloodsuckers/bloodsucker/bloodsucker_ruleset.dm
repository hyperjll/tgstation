//////////////////////////////////////////////
//                                          //
//        ROUNDSTART BLOODSUCKER            //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/roundstart/bloodsucker
	name = "Bloodsuckers"
	config_tag = "Roundstart Bloodsuckers"
	pref_flag = ROLE_BLOODSUCKER
	preview_antag_datum = /datum/antagonist/bloodsucker
	//required_candidates = 1
	weight = alist(
		DYNAMIC_TIER_LOW = 0,
		DYNAMIC_TIER_LOWMEDIUM = 1,
		DYNAMIC_TIER_MEDIUMHIGH = 2,
		DYNAMIC_TIER_HIGH = 3,
	)
	//cost = 14
	min_pop = 20
	//scaling_cost = 9
	//requirements = list(101,101,60,30,30,25,20,15,10,10)
	max_antag_cap = list("denominator" = 24, "offset" = 1)

/datum/dynamic_ruleset/roundstart/bloodsucker/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/bloodsucker)

//////////////////////////////////////////////
//                                          //
//          MIDROUND BLOODSUCKER            //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/midround/bloodsucker
	name = "Vampiric Accident"
	config_tag = "Midround Bloodsuckers"
	midround_type = HEAVY_MIDROUND
	preview_antag_datum = /datum/antagonist/bloodsucker
	pref_flag = ROLE_VAMPIRICACCIDENT
	//antag_flag_override = ROLE_BLOODSUCKER
	//required_candidates = 1
	weight = alist(
		DYNAMIC_TIER_LOW = 0,
		DYNAMIC_TIER_LOWMEDIUM = 1,
		DYNAMIC_TIER_MEDIUMHIGH = 2,
		DYNAMIC_TIER_HIGH = 3,
	)
	//cost = 14
	min_pop = 20
	//requirements = list(101,101,60,30,30,25,20,20,14,14)
	repeatable = FALSE

/datum/dynamic_ruleset/midround/bloodsucker/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/bloodsucker/morepoints)

//////////////////////////////////////////////
//                                          //
//          LATEJOIN BLOODSUCKER            //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/latejoin/bloodsucker
	name = "Bloodsucker Breakout"
	config_tag = "Latejoin Bloodsuckers"
	preview_antag_datum = /datum/antagonist/bloodsucker
	pref_flag = ROLE_BLOODSUCKERBREAKOUT
	//antag_flag_override = ROLE_BLOODSUCKER
	//required_candidates = 1
	weight = alist(
		DYNAMIC_TIER_LOW = 0,
		DYNAMIC_TIER_LOWMEDIUM = 1,
		DYNAMIC_TIER_MEDIUMHIGH = 2,
		DYNAMIC_TIER_HIGH = 3,
	)
	//cost = 10
	min_pop = 20
	//requirements = list(101,101,60,20,20,20,20,20,14,14)
	repeatable = FALSE

/datum/dynamic_ruleset/latejoin/bloodsucker/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/bloodsucker/morepoints)

