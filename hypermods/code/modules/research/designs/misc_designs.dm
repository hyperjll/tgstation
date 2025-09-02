/datum/design/quickcams
	name = "Quick Camera Setup"
	desc = "A quick-and-easy camera installation package. Simply attach and go."
	id = "quickcams"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 2.5)
	build_path = /obj/item/wallframe/camera/autosetup
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/secflash
	name = "Security Flash"
	desc = "A flash with a military-grade high-durability bulb, provides better results when flashing around yourself."
	id = "secflash"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 2.5)
	build_path = /obj/item/assembly/flash/handheld/upgraded
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/secradiomine
	name = "Radio Mine"
	desc = "A camoflauging mine, when stepped on, it'll sample some of the victim's DNA and broadcast an encrypted message over the security radio, informing officers on who stepped on it and where they are."
	id = "secradiomine"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 6, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 4, /datum/material/gold = SHEET_MATERIAL_AMOUNT * 4)
	build_path = /obj/item/deployablemine/radio/security
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/anomaly_belt_shell
	name = "Anomaly Belt Shell"
	desc = "An experimental belt with built-in anomaly core integration. Who knows what it could do with an anomaly core?"
	id = "anomaly_belt_shell"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*5,
		/datum/material/uranium = SHEET_MATERIAL_AMOUNT*4,
		/datum/material/diamond = SHEET_MATERIAL_AMOUNT * 2.5,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT*2.5,
		/datum/material/gold = SHEET_MATERIAL_AMOUNT * 2.5,
	)
	build_path = /obj/item/anomaly_belt_shell
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/antaglocker
	name = "A.N.T.A.G Locker"
	desc = "The Anti-Non-Trained-Assignee-Gate (or ANTAG) is an electronic upgrade for NT's stun baton design. It connects directly to Nanotrasen's Security Database to verify the neural patterns of the user."
	id = "antaglocker"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/gold = SHEET_MATERIAL_AMOUNT * 0.5)
	build_path = /obj/item/antaglocker
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/extraction_pack
	name = "Fulton Extraction Pack"
	desc = "A fulton extraction pack designed to be used in any environment to secure assets and deliver them to specific locations designated by fulton cores."
	id = "extraction_pack"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 3, /datum/material/plastic = SHEET_MATERIAL_AMOUNT * 5)
	build_path = /obj/item/extraction_pack/non_miner
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY | DEPARTMENT_BITFLAG_MEDICAL

/datum/design/fulton_core
	name = "Fulton Core"
	desc = "A landmark beacon used as an endpoint for fulton extractions. Place one down, and you'll be able to send things to it with an extraction pack!"
	id = "fulton_core"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/gold = SHEET_MATERIAL_AMOUNT * 1)
	build_path = /obj/item/fulton_core
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY | DEPARTMENT_BITFLAG_MEDICAL

/datum/design/anomaly_stabilizer
	name = "Anomaly Stabilizer"
	desc = "An advanced tool capable of stabilizing anomalies at the cost of their core, designed to allow anomalies to operate indefinitely and allow constant passive research income."
	id = "anomaly_stabilizer"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT, /datum/material/silver =SHEET_MATERIAL_AMOUNT, /datum/material/plasma =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/uranium =SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/anomaly_stabilizer
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE
