//////////////////////////////////////////////
//                                          //
//           ROMEROL SMUGGLERS              //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/roundstart/iinfected
	name = "Initial Infected"
	antag_flag = ROLE_INITIAL_INFECTED
	antag_datum = /datum/antagonist/initial_infected
	minimum_required_age = 0
	protected_roles = list(
		JOB_CAPTAIN,
		JOB_DETECTIVE,
		JOB_HEAD_OF_SECURITY,
		JOB_PRISONER,
		JOB_SECURITY_OFFICER,
		JOB_WARDEN,
	)
	restricted_roles = list(
		JOB_AI,
		JOB_CYBORG,
	)
	required_candidates = 1
	weight = 1
	cost = 20
	scaling_cost = 10
	requirements = list(75,70,65,60,55,50,45,40,35,30)
	antag_cap = list("denominator" = 30)

/datum/dynamic_ruleset/roundstart/iinfected/pre_execute(population)
	. = ..()
	for (var/i in 1 to get_antag_cap_scaling_included(population))
		if(candidates.len <= 0)
			break
		var/mob/M = pick_n_take(candidates)
		assigned += M.mind
		M.mind.special_role = ROLE_INITIAL_INFECTED
		M.mind.restricted_roles = restricted_roles
		GLOB.pre_setup_antags += M.mind
	return TRUE

//////////////////////////////////////////////
//                                          //
//                WEREWOLVES                //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/roundstart/werewolves
	name = "Werewolf"
	antag_flag = ROLE_WEREWOLF
	antag_datum = /datum/antagonist/werewolf
	minimum_required_age = 0
	protected_roles = list(
		JOB_CAPTAIN,
		JOB_DETECTIVE,
		JOB_HEAD_OF_SECURITY,
		JOB_SECURITY_OFFICER,
		JOB_WARDEN,
	)
	restricted_roles = list(
		JOB_AI,
		JOB_CYBORG,
	)
	required_candidates = 1
	weight = 8
	cost = 10
	scaling_cost = 10
	minimum_players = 20
	requirements = list(50,45,40,30,15,10,10,10,10,10)
	antag_cap = list("denominator" = 38)

/datum/dynamic_ruleset/roundstart/werewolves/pre_execute(population)
	. = ..()
	for (var/i in 1 to get_antag_cap_scaling_included(population))
		if(candidates.len <= 0)
			break
		var/mob/M = pick_n_take(candidates)
		assigned += M.mind
		M.mind.special_role = ROLE_WEREWOLF
		M.mind.restricted_roles = restricted_roles
		GLOB.pre_setup_antags += M.mind
	return TRUE
