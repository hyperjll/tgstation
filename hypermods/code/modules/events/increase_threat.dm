/datum/round_event_control/new_threat
	name = "New Threat"
	description = "Attempts to force a light midround ruleset. Will also set the security level to blue if it's green."
	typepath = /datum/round_event/new_threat
	weight = 1
	category = EVENT_CATEGORY_INVASION
	max_occurrences = 2

/datum/round_event/new_threat/start()
	SSdynamic.try_spawn_midround(LIGHT_MIDROUND)

/datum/round_event/new_threat/announce(fake)
	if(SSsecurity_level.get_current_level_as_number() < SEC_LEVEL_BLUE)
		SSsecurity_level.set_level(SEC_LEVEL_BLUE, announce = FALSE)
		priority_announce("[SSsecurity_level.current_security_level.elevating_to_announcement]\n\nA summary has been copied and printed to all communications consoles.", "Security level elevated.", ANNOUNCER_INTERCEPT, color_override = SSsecurity_level.current_security_level.announcement_color)
