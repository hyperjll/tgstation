//////////////////////////////////////////////
//                                          //
//           SPY INFILTRATORS               //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/latejoin/spy
	name = "Spy Infiltrator"
	config_tag = "Latejoin Spy"
	pref_flag = ROLE_SPY_INFILTRATOR
	//antag_flag_override = ROLE_SPY
	preview_antag_datum = /datum/antagonist/spy
	//required_candidates = 1
	weight = 6
	//cost = 3
	//requirements = list(5,5,5,5,5,5,5,5,5,5)
	repeatable = TRUE

/datum/dynamic_ruleset/latejoin/spy/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/spy)

//////////////////////////////////////////////
//                                          //
//           WEREWOLF INVADERS              //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/latejoin/werewolves
	name = "Werewolf Invader"
	config_tag = "Latejoin Werewolf"
	pref_flag = ROLE_WEREWOLF_INVADER
	//antag_flag_override = ROLE_WEREWOLF
	preview_antag_datum = /datum/antagonist/werewolf
	//required_candidates = 1
	weight = alist(
		DYNAMIC_TIER_LOW = 0,
		DYNAMIC_TIER_LOWMEDIUM = 0,
		DYNAMIC_TIER_MEDIUMHIGH = 1,
		DYNAMIC_TIER_HIGH = 2,
	)
	//cost = 10
	//requirements = list(50,45,40,30,15,10,10,10,10,10)
	repeatable = TRUE

/datum/dynamic_ruleset/latejoin/werewolves/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/werewolf/invader)
