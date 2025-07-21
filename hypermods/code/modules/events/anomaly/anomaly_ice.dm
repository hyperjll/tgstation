/datum/round_event_control/anomaly/anomaly_ice
	name = "Anomaly: Cryogenic"
	typepath = /datum/round_event/anomaly/anomaly_ice

	max_occurrences = 5
	weight = 20
	description = "This anomaly shoots ice blasts, cools the area, and floods the area with freon when going critical."
	min_wizard_trigger_potency = 1
	max_wizard_trigger_potency = 4

/datum/round_event/anomaly/anomaly_ice
	start_when = ANOMALY_START_HARMFUL_TIME
	announce_when = ANOMALY_ANNOUNCE_HARMFUL_TIME
	anomaly_path = /obj/effect/anomaly/ice

/datum/round_event/anomaly/anomaly_ice/announce(fake)
	if(isnull(impact_area))
		impact_area = placer.findValidArea()
	priority_announce("Cryogenic anomaly detected on [ANOMALY_ANNOUNCE_HARMFUL_TEXT] [impact_area.name].", "Anomaly Alert")
