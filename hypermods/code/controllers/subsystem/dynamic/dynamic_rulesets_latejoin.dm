//////////////////////////////////////////////
//                                          //
//           SPY INFILTRATORS               //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/latejoin/spy
	name = "Spy Infiltrator"
	antag_flag = ROLE_SPY_INFILTRATOR
	antag_flag_override = ROLE_SPY
	antag_datum = /datum/antagonist/spy
	protected_roles = list(
		JOB_CAPTAIN,
		JOB_DETECTIVE,
		JOB_HEAD_OF_PERSONNEL, // AA = bad
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
	weight = 6
	cost = 3
	requirements = list(5,5,5,5,5,5,5,5,5,5)
	repeatable = TRUE

//////////////////////////////////////////////
//                                          //
//           LATEJOIN BLOOD BROTHER         //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/latejoin/brotherinitiate
	name = "Brother Initiate"
	antag_flag = ROLE_BROTHER_INITIATE
	antag_flag_override = ROLE_BROTHER
	antag_datum = /datum/antagonist/brother
	protected_roles = list(
		JOB_CAPTAIN,
		JOB_DETECTIVE,
		JOB_HEAD_OF_PERSONNEL,
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
	weight = 9
	cost = 5
	requirements = list(5,5,5,5,5,5,5,5,5,5)
	repeatable = TRUE
