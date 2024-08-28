/datum/techweb_node/borg_utility_adv
	id = TECHWEB_NODE_BORG_UTILITY_ADV
	display_name = "Advanced Utility Cyborg Upgrades"
	description = "Coming extra super prepared for this one."
	prereq_ids = list(TECHWEB_NODE_BORG_UTILITY)
	design_ids = list(
		"borg_upgrade_unistorage",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_4_POINTS)

/datum/techweb_node/borg_engi_adv
	id = TECHWEB_NODE_BORG_ENGI_ADV
	display_name = "Advanced Engineering Cyborg Upgrades"
	description = "Super tools for super cyborgs."
	prereq_ids = list(TECHWEB_NODE_BORG_ENGI)
	design_ids = list(
		"borg_upgrade_arcd",
		"borg_upgrade_advancedmats",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)

/datum/techweb_node/borg_medical_adv
	id = TECHWEB_NODE_BORG_MEDICAL_ADV
	display_name = "Advanced Medical Cyborg Upgrades"
	description = "Making your medical cyborgs scary 101."
	prereq_ids = list(TECHWEB_NODE_BORG_MEDICAL)
	design_ids = list(
		"borg_upgrade_medreagentgun",
		"borg_upgrade_medimplanter",
		"borg_upgrade_borghypoexotic",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)

/datum/techweb_node/borg_service_adv
	id = TECHWEB_NODE_BORG_SERVICES_ADV
	display_name = "Advanced Service Cyborg Upgrades"
	description = "Finally, some good cyborg upgrades."
	prereq_ids = list(TECHWEB_NODE_BORG_SERVICES)
	design_ids = list(
		"borg_upgrade_botanytools",
		"borg_upgrade_rapidlightingdevice",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)

/datum/techweb_node/borg_janitor
	id = TECHWEB_NODE_BORG_JANITOR
	display_name = "Jasnitorial Cyborg Upgrades"
	description = "Tra-la-la, just cleaning up the crime scene!"
	prereq_ids = list(TECHWEB_NODE_CYBERNETICS)
	design_ids = list(
		"borg_upgrade_janisprayer",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)

