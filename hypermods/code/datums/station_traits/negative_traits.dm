/datum/station_trait/random_event_weight_modifier/ninjas
	name = "Spider Clan Activity"
	report_message = "We've recieved some disturbing reports about a shady organization called the 'Spider Clan' showing a drastic increase in activity. Be prepared for the worst."
	trait_type = STATION_TRAIT_NEGATIVE
	weight = 2
	event_control_path = /datum/round_event_control/space_ninja
	weight_multiplier = 1.5
	max_occurrences_modifier = 3
	trait_to_give = STATION_TRAIT_NINJAS
