/datum/techweb_node/ai_upgrades
	id = TECHWEB_NODE_AI_UPGRADES
	display_name = "AI Upgrade Modules"
	description = "Unique pre-loaded data disks containing software capable of allowing artifical intelligences to do much more to aid itself and the humans who surround it."
	prereq_ids = list(TECHWEB_NODE_AI)
	design_ids = list(
		"ai_battery_upgrade",
		"ai_reactivate_camera",
		"ai_rgb_camera_light",
		"ai_heal_brute",
		"ai_heal_burn",
		"ai_heal_tox",
		"ai_heal_oxy",
		"ai_spacecoin_miner_upgrade"
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)
	announce_channels = list(RADIO_CHANNEL_SCIENCE, RADIO_CHANNEL_COMMAND)

/datum/techweb_node/ai_upgrades_illegal
	id = TECHWEB_NODE_AI_UPGRADES_ILLEGAL
	display_name = "Illegal AI Upgrade Modules"
	description = "Illegal pre-loaded data disks containing software capable of allowing artifical intelligences to do much more to aid itself and the humans who surround it."
	prereq_ids = list(TECHWEB_NODE_AI_UPGRADES, TECHWEB_NODE_SYNDICATE_BASIC)
	design_ids = list(
		"ai_cam_upgrade"
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)
	announce_channels = list(RADIO_CHANNEL_SCIENCE, RADIO_CHANNEL_COMMAND)

