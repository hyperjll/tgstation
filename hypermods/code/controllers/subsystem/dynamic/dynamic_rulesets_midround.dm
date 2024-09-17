/// Midround Heretic Ruleset (From Living)
/datum/dynamic_ruleset/midround/from_living/hereticmid
	name = "Heretic Awakening"
	midround_ruleset_style = MIDROUND_RULESET_STYLE_LIGHT
	antag_datum = /datum/antagonist/heretic
	antag_flag = ROLE_HERETIC_MIDROUND
	antag_flag_override = ROLE_HERETIC
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
		ROLE_POSITRONIC_BRAIN,
	)
	required_candidates = 1
	weight = 20
	cost = 5
	requirements = list(50,40,20,10,5,5,3,3,3,3)
	repeatable = TRUE

/datum/dynamic_ruleset/midround/from_living/hereticmid/execute()
	var/mob/picked_mob = pick(candidates)
	assigned += picked_mob.mind
	picked_mob.mind.special_role = antag_flag
	var/datum/antagonist/heretic/new_heretic = picked_mob.mind.add_antag_datum(antag_datum)

	// Heretics passively gain influence over time.
	// As a consequence, latejoin heretics start out at a massive
	// disadvantage if the round's been going on for a while.
	// Let's give them some influence points when they arrive.
	new_heretic.knowledge_points += round((world.time - SSticker.round_start_time) / new_heretic.passive_gain_timer)
	// BUT let's not give smugglers a million points on arrival.
	// Limit it to four missed passive gain cycles (4 points).
	new_heretic.knowledge_points = min(new_heretic.knowledge_points, 5)

	return TRUE
