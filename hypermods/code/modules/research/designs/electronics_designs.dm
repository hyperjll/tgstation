/datum/design/ai_reactivate_camera
	name = "AI Reactivate Camera Upgrade"
	desc = "An upgrade package that lets an AI reboot cameras in mass, restoring their functionality."
	id = "ai_reactivate_camera"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/glass =SHEET_MATERIAL_AMOUNT * 2.5)
	build_path = /obj/item/aiupgrade/reactivate_cameras
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_UPGRADES
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/ai_heal_brute
	name = "AI Bluespace Brutepack Upgrade"
	desc = "An upgrade package that lets an AI remotely heal any humans of brute damage."
	id = "ai_heal_brute"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 4, /datum/material/glass =SHEET_MATERIAL_AMOUNT * 4)
	build_path = /obj/item/aiupgrade/heal_brute
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_UPGRADES
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/ai_heal_burn
	name = "AI Bluespace Burnpack Upgrade"
	desc = "An upgrade package that lets an AI remotely heal any humans of burn damage."
	id = "ai_heal_burn"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 4, /datum/material/glass =SHEET_MATERIAL_AMOUNT * 4)
	build_path = /obj/item/aiupgrade/heal_burn
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_UPGRADES
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/ai_heal_tox
	name = "AI Bluespace Toxpack Upgrade"
	desc = "An upgrade package that lets an AI remotely heal any humans of toxin damage."
	id = "ai_heal_tox"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 4, /datum/material/glass =SHEET_MATERIAL_AMOUNT * 4)
	build_path = /obj/item/aiupgrade/heal_tox
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_UPGRADES
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/ai_heal_oxy
	name = "AI Bluespace Oxypack Upgrade"
	desc = "An upgrade package that lets an AI remotely heal any humans of oxygen damage."
	id = "ai_heal_oxy"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 4, /datum/material/glass =SHEET_MATERIAL_AMOUNT * 4)
	build_path = /obj/item/aiupgrade/heal_oxy
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_UPGRADES
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/ai_battery_upgrade
	name = "AI Electrical Storage Upgrade"
	desc = "An upgrade package that lets an AI store larger amounts of backup power."
	id = "ai_battery_upgrade"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 5, /datum/material/glass =SHEET_MATERIAL_AMOUNT * 5, /datum/material/gold =SHEET_MATERIAL_AMOUNT * 2.5)
	build_path = /obj/item/battery_upgrade
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_UPGRADES
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/ai_spacecoin_miner_upgrade
	name = "AI Spacecoin Mining Upgrade"
	desc = "An upgrade package that lets an AI generate revenue for the station's cargo department at the cost of halving backup power generation."
	id = "ai_spacecoin_miner_upgrade"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 5, /datum/material/glass =SHEET_MATERIAL_AMOUNT * 5, /datum/material/gold =SHEET_MATERIAL_AMOUNT * 5)
	build_path = /obj/item/spacecoin_miner_upgrade
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_UPGRADES
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE
