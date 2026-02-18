/datum/dynamic_ruleset/roundstart/clock_cult
	name = "Clock Cult"
	config_tag = "Roundstart Clock Cult"
	pref_flag = ROLE_CLOCK_CULTIST
	preview_antag_datum = /datum/antagonist/clock_cultist
	minimum_required_age = 14
	//required_candidates = 3
	weight = alist(
		DYNAMIC_TIER_LOW = 0,
		DYNAMIC_TIER_LOWMEDIUM = 1,
		DYNAMIC_TIER_MEDIUMHIGH = 3,
		DYNAMIC_TIER_HIGH = 3,
	)
	blacklisted_roles = list(
		JOB_HEAD_OF_PERSONNEL,
	)
	//cost = 20
	//requirements = list(100,90,80,60,40,30,10,10,10,10)
	ruleset_flags = RULESET_HIGH_IMPACT
	min_antag_cap = list("denominator" = 20, "offset" = 1)
	min_pop = 30
	ruleset_lazy_templates = list(LAZY_TEMPLATE_KEY_REEBE)

/datum/dynamic_ruleset/roundstart/clock_cult/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/clock_cultist)
