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
