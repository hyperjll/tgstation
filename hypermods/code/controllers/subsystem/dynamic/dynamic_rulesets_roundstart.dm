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
	weight = alist(
		DYNAMIC_TIER_LOW = 0,
		DYNAMIC_TIER_LOWMEDIUM = 0,
		DYNAMIC_TIER_MEDIUMHIGH = 1,
		DYNAMIC_TIER_HIGH = 1,
	)
	ruleset_flags = RULESET_HIGH_IMPACT
	min_pop = 30 // plenty of people for the zombie horde/anti-zombie force
	//cost = 20
	////scaling_cost = 10
	//requirements = list(75,70,65,60,55,50,45,40,35,30)
	max_antag_cap = list("denominator" = 30)

/datum/dynamic_ruleset/roundstart/iinfected/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/initial_infected)

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
	weight = alist(
		DYNAMIC_TIER_LOW = 0,
		DYNAMIC_TIER_LOWMEDIUM = 1,
		DYNAMIC_TIER_MEDIUMHIGH = 1,
		DYNAMIC_TIER_HIGH = 2,
	)
	//cost = 10
	//scaling_cost = 10
	min_pop = 20 // Werewolves are basically designed as mass-murderers and require atleast SOME pop.
	//requirements = list(50,45,40,30,15,10,10,10,10,10)
	max_antag_cap = list("denominator" = 38)

/datum/dynamic_ruleset/roundstart/werewolves/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/werewolf)

//////////////////////////////////////////////
//                                          //
//           COMMANDO OPERATIVES            //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/roundstart/nukies/commando
	name = "Commando Operatives"
	config_tag = "Roundstart Commandops"
	preview_antag_datum = /datum/antagonist/nukeop/commando
	pref_flag = ROLE_COMMANDO_OPERATIVE
	weight = alist(
		DYNAMIC_TIER_LOW = 0,
		DYNAMIC_TIER_LOWMEDIUM = 0,
		DYNAMIC_TIER_MEDIUMHIGH = 1,
		DYNAMIC_TIER_HIGH = 3,
	)

/datum/dynamic_ruleset/roundstart/nukies/commando/assign_role(datum/mind/candidate, datum/team/nuke_team, datum/mind/most_experienced)
	if(most_experienced == candidate)
		candidate.add_antag_datum(/datum/antagonist/nukeop/commando/leader)
	else
		candidate.add_antag_datum(/datum/antagonist/nukeop/commando)
