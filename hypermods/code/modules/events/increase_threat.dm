/datum/round_event_control/increase_threat
	name = "Threat Increase"
	description = "Increases the midround threat available to dynamic mode by 10. Will also set the security level to blue if it's green."
	typepath = /datum/round_event/increase_threat
	weight = 1
	category = EVENT_CATEGORY_ENTITIES
	max_occurrences = 1

/datum/round_event/increase_threat/start()
	SSdynamic.mid_round_budget += 10

/datum/round_event/increase_threat/announce(fake)
	if(SSsecurity_level.get_current_level_as_number() < SEC_LEVEL_BLUE)
		SSsecurity_level.set_level(SEC_LEVEL_BLUE, announce = FALSE)
	priority_announce("[SSsecurity_level.current_security_level.elevating_to_announcement]\n\nA summary has been copied and printed to all communications consoles.", "Security level elevated.", ANNOUNCER_INTERCEPT, color_override = SSsecurity_level.current_security_level.announcement_color)
