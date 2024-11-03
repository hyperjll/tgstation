/datum/design/biosigimplant
	name = "Biosignaller Implant Case"
	id = "biosigimplant"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*4, /datum/material/glass =SMALL_MATERIAL_AMOUNT*2.5, /datum/material/gold =SMALL_MATERIAL_AMOUNT*0.5)
	build_path = /obj/item/implantcase/biosig
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_MISC
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/selfawareimplant
	name = "Self-Awareness Implant Case"
	id = "selfawareimplant"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*0.5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*0.5, /datum/material/gold =SMALL_MATERIAL_AMOUNT*0.5)
	build_path = /obj/item/implantcase/selfaware
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_MISC
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/robusttec
	name = "Superior R.O.B.U.S.T Implant Case"
	id = "robusttec"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*0.5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*0.5, /datum/material/gold =SMALL_MATERIAL_AMOUNT*2.5, /datum/material/uranium =SMALL_MATERIAL_AMOUNT*2.5)
	build_path = /obj/item/implantcase/robusttec
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_HEALTH
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/robustteclesser
	name = "R.O.B.U.S.T Implant Case"
	id = "robustteclesser"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*0.5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*0.5, /datum/material/uranium =SMALL_MATERIAL_AMOUNT*2.5)
	build_path = /obj/item/implantcase/robusttec/lesser
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_HEALTH
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/robusttecantirot
	name = "R.O.T.B.U.S.T Implant Case"
	id = "robusttecantirot"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*0.5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*0.5, /datum/material/silver =SMALL_MATERIAL_AMOUNT*0.2, /datum/material/uranium =SMALL_MATERIAL_AMOUNT*0.2)
	build_path = /obj/item/implantcase/robusttec/antirot
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_HEALTH
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL
