/datum/design/borg_upgrade_unistorage
	name = "Universal Apparatus"
	id = "borg_upgrade_unistorage"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/unistorage
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*10,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT*5,
	)
	construction_time = 5 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ALL
	)

/datum/design/borg_upgrade_arcd
	name = "Engineering Cyborg ARCD"
	id = "borg_upgrade_arcd"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/arcd
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT*5,
		/datum/material/diamond = SHEET_MATERIAL_AMOUNT*2,
		/datum/material/bluespace = SHEET_MATERIAL_AMOUNT*3,
	)
	construction_time = 15 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ENGINEERING
	)

/datum/design/borg_upgrade_advancedmats
	name = "Advanced Materials"
	id = "borg_upgrade_advancedmats"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/advancedmats
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/plasma = SHEET_MATERIAL_AMOUNT*3.5,
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ENGINEERING
	)

/datum/design/borg_upgrade_medreagentgun
	name = "Reagent Gun"
	id = "borg_upgrade_medreagentgun"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/medreagentgun
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/diamond = HALF_SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_MEDICAL
	)

/datum/design/borg_upgrade_medimplanter
	name = "Implanter"
	id = "borg_upgrade_medimplanter"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/medimplanter
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*3,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT*3,
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_MEDICAL
	)

/datum/design/borg_upgrade_borghypoexotic
	name = "Exotic Hypospray"
	id = "borg_upgrade_borghypoexotic"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/borghypoexotic
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT*5,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 15 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_MEDICAL
	)

/datum/design/borg_adv_upgrade_botanytools
	name = "Advanced Botany Tools"
	id = "borg_upgrade_advbotanytools"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/advbotanytools
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT*1.2,
		/datum/material/diamond = HALF_SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 15 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_SERVICE
	)

/datum/design/borg_upgrade_rapidlightingdevice
	name = "Rapid Lighting Device"
	id = "borg_upgrade_rapidlightingdevice"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/rapidlightingdevice
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT*3,
		/datum/material/diamond = HALF_SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_SERVICE
	)

/datum/design/borg_upgrade_janisprayer
	name = "Janitorial Sprayer"
	id = "borg_upgrade_janisprayer"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/janisprayer
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/diamond = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/bluespace = SHEET_MATERIAL_AMOUNT*3,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_JANITOR
	)

/datum/design/borg_upgrade_fulton
	name = "Security Cyborg Fulton Pack"
	id = "borg_upgrade_fulton"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/secfultons
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT*5,
		/datum/material/plastic = SHEET_MATERIAL_AMOUNT*5,
		/datum/material/bluespace = SHEET_MATERIAL_AMOUNT*2.5,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_SECURITY
	)

/**
/datum/design/borg_upgrade_
	name = ""
	id = "borg_upgrade_"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/diamond = HALF_SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_
	)
**/

/datum/design/ai_brain
	name = "AI-uplink brain"
	desc = "Can be inserted into a body with NO ORGANIC INTERNAL ORGANS (robotic organs only) to allow AIs to control it. Comes with its own health sensors beacon. MUST be a humanoid or bad things happen to the consciousness."
	id = "ai_brain"
	build_type = MECHFAB
	materials = list(
		/datum/material/titanium = HALF_SHEET_MATERIAL_AMOUNT*1.7,
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT*1.35,
		/datum/material/gold =SMALL_MATERIAL_AMOUNT*7.5
	)
	construction_time = 10 SECONDS
	build_path = /obj/item/organ/brain/cybernetic/ai
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG + RND_SUBCATEGORY_CYBERNETICS_ADVANCED_LIMBS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

//Justice (emaged only)
/datum/design/justice_chassis
	name = "Exosuit Chassis (\"Justice\")"
	id = "justice_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/justice
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*20)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_JUSTICE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/justice_torso
	name = "Exosuit Torso (\"Justice\")"
	id = "justice_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/justice_torso
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 50,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT * 5,
	)
	construction_time = 30 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_JUSTICE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/justice_left_arm
	name = "Exosuit Left Arm (\"Justice\")"
	id = "justice_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/justice_left_arm
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT * 2,
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_JUSTICE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/justice_right_arm
	name = "Exosuit Right Arm (\"Justice\")"
	id = "justice_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/justice_right_arm
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_JUSTICE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/justice_left_leg
	name = "Exosuit Left Leg (\"Justice\")"
	id = "justice_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/justice_left_leg
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_JUSTICE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/justice_right_leg
	name = "Exosuit Right Leg (\"Justice\")"
	id = "justice_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/justice_right_leg
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_JUSTICE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/justice_armor
	name = "Exosuit Armor (\"Justice\")"
	id = "justice_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/justice_armor
	materials = list(
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/plastic=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/diamond=SHEET_MATERIAL_AMOUNT*1,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_JUSTICE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)
