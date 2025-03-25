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
