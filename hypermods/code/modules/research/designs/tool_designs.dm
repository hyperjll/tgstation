/datum/design/autosurgeon
	name = "Autosurgeon"
	id = "autosurgeon"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*3, /datum/material/glass = SMALL_MATERIAL_AMOUNT, /datum/material/titanium = SMALL_MATERIAL_AMOUNT*5, /datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT * 1.5)
	build_path = /obj/item/autosurgeon/unlocked
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL
