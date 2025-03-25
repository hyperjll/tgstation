/datum/objective/traitor_progression
	name = "traitor progression"
	explanation_text = "Become a living legend by getting a total of %REPUTATION% reputation points"

	var/possible_range = list(40 MINUTES, 90 MINUTES)
	var/required_total_progression_points

/datum/objective/traitor_progression/New(text)
	. = ..()
	required_total_progression_points = round(rand(possible_range[1], possible_range[2]))
	explanation_text = replacetext(explanation_text, "%REPUTATION%", DISPLAY_PROGRESSION(required_total_progression_points))

/datum/objective/traitor_progression/check_completion()
	if(!owner)
		return FALSE
	var/datum/antagonist/traitor/traitor = owner.has_antag_datum(/datum/antagonist/traitor)
	if(!traitor)
		return FALSE
	if(!traitor.uplink_handler)
		return FALSE
	if(traitor.uplink_handler.progression_points < required_total_progression_points)
		return FALSE
	return TRUE

/datum/objective/traitor_objectives
	name = "traitor objective"
	explanation_text = "Complete objectives colletively worth more than %REPUTATION% reputation points"

	var/possible_range = list(20 MINUTES, 30 MINUTES)
	var/required_progression_in_objectives

/datum/objective/traitor_objectives/New(text)
	. = ..()
	required_progression_in_objectives = round(rand(possible_range[1], possible_range[2]))
	explanation_text = replacetext(explanation_text, "%REPUTATION%", DISPLAY_PROGRESSION(required_progression_in_objectives))

/datum/objective/traitor_objectives/check_completion()
	if(!owner)
		return FALSE
	var/datum/antagonist/traitor/traitor = owner.has_antag_datum(/datum/antagonist/traitor)
	if(!traitor)
		return FALSE
	if(!traitor.uplink_handler)
		return FALSE
	var/total_points = 0
	for(var/datum/traitor_objective/objective as anything in traitor.uplink_handler.completed_objectives)
		if(objective.objective_state != OBJECTIVE_STATE_COMPLETED)
			continue
		total_points += objective.progression_reward
	if(total_points < required_progression_in_objectives)
		return FALSE
	return TRUE
