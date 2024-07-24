/datum/techweb_node/sec_equip_adv
	id = TECHWEB_NODE_SEC_EQUIP_ADV
	display_name = "Advanced Security Equipment"
	description = "Better equipment for more demanding tasks."
	prereq_ids = list(TECHWEB_NODE_SEC_EQUIP)
	design_ids = list(
		"quickcams",
		"secflash",
		"secradiomine",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)

/datum/techweb_node/ballistics
	id = TECHWEB_NODE_BALLISTICS
	display_name = "Standard Ballistics"
	description = "Firearms meant for subdueing more resistant targets."
	prereq_ids = list(TECHWEB_NODE_SEC_EQUIP_ADV)
	design_ids = list(
		"v38_rubber",
		"v38_lethal",
		"mk58",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)

/datum/techweb_node/ballistics_adv
	id = TECHWEB_NODE_BALLISTICS_ADV
	display_name = "Advanced Ballistics"
	description = "Firearms meant for subdueing the most resistant of targets."
	prereq_ids = list(TECHWEB_NODE_BALLISTICS)
	design_ids = list(
		"lecter",
		"ntmag_556",
		"ntmag_556_rubber",
		"kammerer",
		"secsyringegun",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_4_POINTS)

/datum/techweb_node/ballistics_super
	id = TECHWEB_NODE_BALLISTICS_SUPER
	display_name = "Ultimate Ballistics"
	description = "When the entire station falls into chaos, your foes shall know fear."
	prereq_ids = list(TECHWEB_NODE_BALLISTICS_ADV)
	design_ids = list(
		"drozd",
		"ntmag_556_ap",
		"ntmag_556_inc",
		"hristov",
		"nt_a762",
		"nt_a762_raze",
		"nt_a762_pen",
		"nt_a762_vulcan",
		"enforcer",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)
