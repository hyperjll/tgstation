/datum/techweb_node/cyber/health_implants
	id = TECHWEB_NODE_HEALTH_IMPLANTS
	display_name = "Health Implants"
	description = "Medical implants designed to be useful to both medical and non-medical personnel."
	prereq_ids = list(TECHWEB_NODE_CYBER_IMPLANTS)
	design_ids = list(
		"biosigimplant",
		"selfawareimplant",
		"robustteclesser",
		"robusttecantirot",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_4_POINTS)
	announce_channels = list(RADIO_CHANNEL_SCIENCE, RADIO_CHANNEL_MEDICAL)
