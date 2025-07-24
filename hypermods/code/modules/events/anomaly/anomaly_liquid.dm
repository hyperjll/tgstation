/datum/round_event_control/anomaly/anomaly_liquid
	name = "Anomaly: Liquid"
	typepath = /datum/round_event/anomaly/anomaly_liquid

	max_occurrences = 5
	weight = 20
	description = "This anomaly floods the area with it's reagents over time, and will spawn reagent monsters when going critical."
	min_wizard_trigger_potency = 1
	max_wizard_trigger_potency = 4

/datum/round_event/anomaly/anomaly_liquid
	start_when = ANOMALY_START_HARMFUL_TIME
	announce_when = ANOMALY_ANNOUNCE_HARMFUL_TIME
	anomaly_path = /obj/effect/anomaly/liquid

/datum/round_event/anomaly/anomaly_liquid/announce(fake)
	if(isnull(impact_area))
		impact_area = placer.findValidArea()
	priority_announce("Liquid anomaly detected on [ANOMALY_ANNOUNCE_HARMFUL_TEXT] [impact_area.name].", "Anomaly Alert")
