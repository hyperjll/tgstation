//////////////////////////////////////////////
//                                          //
//           ROMEROL SMUGGLERS              //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/roundstart/iinfected
	name = "Initial Infected"
	config_tag = "Roundstart Initial Infected"
	pref_flag = ROLE_INITIAL_INFECTED
	preview_antag_datum = /datum/antagonist/initial_infected
	minimum_required_age = 0
	//required_candidates = 1
	weight = list(
		DYNAMIC_TIER_LOW = 0,
		DYNAMIC_TIER_LOWMEDIUM = 0,
		DYNAMIC_TIER_MEDIUMHIGH = 1,
		DYNAMIC_TIER_HIGH = 1,
	)
	ruleset_flags = RULESET_HIGH_IMPACT
	//cost = 20
	////scaling_cost = 10
	//requirements = list(75,70,65,60,55,50,45,40,35,30)
	max_antag_cap = list("denominator" = 30)

/datum/dynamic_ruleset/roundstart/iinfected/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/traitor)

//////////////////////////////////////////////
//                                          //
//                WEREWOLVES                //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/roundstart/werewolves
	name = "Werewolf"
	config_tag = "Roundstart Werewolves"
	pref_flag = ROLE_WEREWOLF
	preview_antag_datum = /datum/antagonist/werewolf
	minimum_required_age = 0
	//required_candidates = 1
	weight = list(
		DYNAMIC_TIER_LOW = 0,
		DYNAMIC_TIER_LOWMEDIUM = 1,
		DYNAMIC_TIER_MEDIUMHIGH = 1,
		DYNAMIC_TIER_HIGH = 2,
	)
	//cost = 10
	//scaling_cost = 10
	min_pop = 20
	//requirements = list(50,45,40,30,15,10,10,10,10,10)
	max_antag_cap = list("denominator" = 38)

/datum/dynamic_ruleset/roundstart/werewolves/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/traitor)
