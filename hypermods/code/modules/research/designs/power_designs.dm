/datum/design/emproof_cell
	name = "EMP-Proof Power Cell"
	desc = "A power cell that holds 5 KW of energy. It's been enhanced with illegal technology to make it invulnerable to EMP's."
	id = "emproof_cell"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 7, /datum/material/gold = SMALL_MATERIAL_AMOUNT * 1.5, /datum/material/glass = SMALL_MATERIAL_AMOUNT * 6, /datum/material/diamond = SMALL_MATERIAL_AMOUNT * 1, /datum/material/titanium = SMALL_MATERIAL_AMOUNT * 2.5, /datum/material/plasma = SMALL_MATERIAL_AMOUNT * 1.3)
	construction_time = 10 SECONDS
	build_path = /obj/item/stock_parts/power_store/cell/emproof/empty
	category = list(
		RND_CATEGORY_STOCK_PARTS + RND_SUBCATEGORY_STOCK_PARTS_4
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/emproof_battery
	name = "EMP-Proof Megacell"
	desc = "A megacell that holds 1 MJ of energy. It's been enhanced with illegal technology to make it invulnerable to EMP's."
	id = "emproof_battery"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 10, /datum/material/gold = SMALL_MATERIAL_AMOUNT * 1.5, /datum/material/glass = SMALL_MATERIAL_AMOUNT * 8, /datum/material/diamond = SMALL_MATERIAL_AMOUNT * 2, /datum/material/titanium = SMALL_MATERIAL_AMOUNT * 5, /datum/material/plasma = SMALL_MATERIAL_AMOUNT * 3)
	construction_time = 10 SECONDS
	build_path = /obj/item/stock_parts/power_store/battery/emproof/empty
	category = list(
		RND_CATEGORY_STOCK_PARTS + RND_SUBCATEGORY_STOCK_PARTS_4
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING
