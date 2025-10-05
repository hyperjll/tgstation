/datum/design/m9mm_mag
	name = "9mm Magazine (Lethal)"
	id = "m9mm_mag"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9)
	build_path = /obj/item/ammo_box/magazine/m9mm
	category = list(
		RND_CATEGORY_HACKED,
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m9mm_mag_ap
	name = "AP 9mm Magazine (Lethal)"
	id = "m9mm_mag_ap"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/diamond = SHEET_MATERIAL_AMOUNT*3)
	build_path = /obj/item/ammo_box/magazine/m9mm/ap
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m9mm_mag_hp
	name = "HP 9mm Magazine (Lethal)"
	id = "m9mm_mag_hp"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*8, /datum/material/titanium = SHEET_MATERIAL_AMOUNT*1)
	build_path = /obj/item/ammo_box/magazine/m9mm/hp
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m9mm_mag_inc
	name = "Incendiary 9mm Magazine (Lethal)"
	id = "m9mm_mag_inc"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/plasma = SHEET_MATERIAL_AMOUNT*2)
	build_path = /obj/item/ammo_box/magazine/m9mm/fire
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m9mm_mag_emp
	name = "EMP 9mm Magazine (Lethal)"
	id = "m9mm_mag_emp"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/uranium = SHEET_MATERIAL_AMOUNT*2)
	build_path = /obj/item/ammo_box/magazine/m9mm/emp
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m9mm_mag_sp
	name = "Soporific 9mm Magazine (Lethal)"
	id = "m9mm_mag_sp"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/plastic = SHEET_MATERIAL_AMOUNT*1, /datum/material/silver = SHEET_MATERIAL_AMOUNT*1)
	build_path = /obj/item/ammo_box/magazine/m9mm/sp
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m9mm_mag_cryo
	name = "Cryo 9mm Magazine (Lethal)"
	id = "m9mm_mag_cryo"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/plastic = SHEET_MATERIAL_AMOUNT*3, /datum/material/silver = SHEET_MATERIAL_AMOUNT*1)
	build_path = /obj/item/ammo_box/magazine/m9mm/cryo
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m9mm_mag_richochet
	name = "Richochet 9mm Magazine (Lethal)"
	id = "m9mm_mag_richochet"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/plastic = SHEET_MATERIAL_AMOUNT*6)
	build_path = /obj/item/ammo_box/magazine/m9mm/richochet
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m9mm_mag_bomb
	name = "Explosive 9mm Magazine (Lethal)"
	id = "m9mm_mag_bomb"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/plasma = SHEET_MATERIAL_AMOUNT*9, /datum/material/titanium = SHEET_MATERIAL_AMOUNT*2)
	build_path = /obj/item/ammo_box/magazine/m9mm/bomb
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m9mm_mag_sonic
	name = "Sonic 9mm Magazine (Lethal)"
	id = "m9mm_mag_sonic"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/plasma = SHEET_MATERIAL_AMOUNT*1, /datum/material/bluespace = SHEET_MATERIAL_AMOUNT*1)
	build_path = /obj/item/ammo_box/magazine/m9mm/sonic
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m9mm_mag_mutate
	name = "Mutate 9mm Magazine (Lethal)"
	id = "m9mm_mag_mutate"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/uranium = SHEET_MATERIAL_AMOUNT*1)
	build_path = /obj/item/ammo_box/magazine/m9mm/mutate
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY


/datum/design/m10mm_mag
	name = "10mm Magazine (Lethal)"
	id = "m10mm_mag"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9)
	build_path = /obj/item/ammo_box/magazine/m10mm
	category = list(
		RND_CATEGORY_HACKED,
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m10mm_mag_ap
	name = "AP 10mm Magazine (Lethal)"
	id = "m10mm_mag_ap"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/diamond = SHEET_MATERIAL_AMOUNT*3)
	build_path = /obj/item/ammo_box/magazine/m10mm/ap
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m10mm_mag_hp
	name = "HP 10mm Magazine (Lethal)"
	id = "m10mm_mag_hp"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*8, /datum/material/titanium = SHEET_MATERIAL_AMOUNT*1)
	build_path = /obj/item/ammo_box/magazine/m10mm/hp
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m10mm_mag_inc
	name = "Incendiary 10mm Magazine (Lethal)"
	id = "m10mm_mag_inc"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/plasma = SHEET_MATERIAL_AMOUNT*2)
	build_path = /obj/item/ammo_box/magazine/m10mm/fire
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m10mm_mag_emp
	name = "EMP 10mm Magazine (Lethal)"
	id = "m10mm_mag_emp"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/uranium = SHEET_MATERIAL_AMOUNT*2)
	build_path = /obj/item/ammo_box/magazine/m10mm/emp
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m10mm_mag_sp
	name = "Soporific 10mm Magazine (Lethal)"
	id = "m10mm_mag_sp"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/plastic = SHEET_MATERIAL_AMOUNT*1, /datum/material/silver = SHEET_MATERIAL_AMOUNT*1)
	build_path = /obj/item/ammo_box/magazine/m10mm/sp
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m10mm_mag_bleed
	name = "Bleedout 10mm Magazine (Lethal)"
	id = "m10mm_mag_bleed"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*8, /datum/material/silver = SHEET_MATERIAL_AMOUNT*1)
	build_path = /obj/item/ammo_box/magazine/m10mm/bleedout
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m10mm_mag_rad
	name = "Radiation 10mm Magazine (Lethal)"
	id = "m10mm_mag_rad"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/uranium = SHEET_MATERIAL_AMOUNT*1, /datum/material/gold = SHEET_MATERIAL_AMOUNT*1)
	build_path = /obj/item/ammo_box/magazine/m10mm/rad
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m10mm_mag_frag
	name = "Fragmentation 10mm Magazine (Lethal)"
	id = "m10mm_mag_frag"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/plasma = SHEET_MATERIAL_AMOUNT*9, /datum/material/titanium = SHEET_MATERIAL_AMOUNT*2)
	build_path = /obj/item/ammo_box/magazine/m10mm/fragment
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY


/datum/design/m45_mag
	name = ".45 Magazine (Lethal)"
	id = "m45_mag"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9)
	build_path = /obj/item/ammo_box/magazine/m45
	category = list(
		RND_CATEGORY_HACKED,
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m45_mag_ap
	name = "AP .45 Magazine (Lethal)"
	id = "m45_mag_ap"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/diamond = SHEET_MATERIAL_AMOUNT*3)
	build_path = /obj/item/ammo_box/magazine/m45/ap
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m45_mag_hp
	name = "HP .45 Magazine (Lethal)"
	id = "m45_mag_hp"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*8, /datum/material/titanium = SHEET_MATERIAL_AMOUNT*1)
	build_path = /obj/item/ammo_box/magazine/m45/hp
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m45_mag_inc
	name = "Incendiary .45 Magazine (Lethal)"
	id = "m45_mag_inc"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/plasma = SHEET_MATERIAL_AMOUNT*2)
	build_path = /obj/item/ammo_box/magazine/m45/inc
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m45_mag_emp
	name = "EMP .45 Magazine (Lethal)"
	id = "m45_mag_emp"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/uranium = SHEET_MATERIAL_AMOUNT*2)
	build_path = /obj/item/ammo_box/magazine/m45/emp
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m45_mag_sp
	name = "Soporific .45 Magazine (Lethal)"
	id = "m45_mag_sp"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/plastic = SHEET_MATERIAL_AMOUNT*1, /datum/material/silver = SHEET_MATERIAL_AMOUNT*1)
	build_path = /obj/item/ammo_box/magazine/m45/sp
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m45_mag_venom
	name = "Venom .45 Magazine (Lethal)"
	id = "m45_mag_venom"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/silver = SHEET_MATERIAL_AMOUNT*3)
	build_path = /obj/item/ammo_box/magazine/m45/venom
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m45_mag_pacify
	name = "Pacification .45 Magazine (Lethal)"
	id = "m45_mag_pacify"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/uranium = SHEET_MATERIAL_AMOUNT*6)
	build_path = /obj/item/ammo_box/magazine/m45/pacify
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m45_mag_delay
	name = "Delayed .45 Magazine (Lethal)"
	id = "m45_mag_delay"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/plasma = SHEET_MATERIAL_AMOUNT*4, /datum/material/gold = SHEET_MATERIAL_AMOUNT*2)
	build_path = /obj/item/ammo_box/magazine/m45/delay
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m45_mag_tranq
	name = "Tranquilizer.45 Magazine (Lethal)"
	id = "m45_mag_tranq"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*9, /datum/material/plastic = SHEET_MATERIAL_AMOUNT*9, /datum/material/plasma = SHEET_MATERIAL_AMOUNT*2)
	build_path = /obj/item/ammo_box/magazine/m45/tranq
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY


/datum/design/c357_sl
	name = "Speed Loader (.357) (Very Lethal)"
	id = "c357_sl"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*21)
	build_path = /obj/item/ammo_box/speedloader/c357
	category = list(
		RND_CATEGORY_HACKED,
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/c357
	name = "Ammo Box (.357) (Very Lethal)"
	id = "c357"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 600)
	build_path = /obj/item/ammo_box/c357/no_direct
	category = list(
		RND_CATEGORY_HACKED,
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/c357_sl_if
	name = "Ironfeather Speed Loader (.357) (Very Lethal)"
	id = "c357_sl_if"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*21)
	build_path = /obj/item/ammo_box/speedloader/c357/ironfeather
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/c357_sl_nc
	name = "Nutcracker Speed Loader (.357) (Very Lethal)"
	id = "c357_sl_nc"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*29)
	build_path = /obj/item/ammo_box/speedloader/c357/nutcracker
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/c357_sl_ms
	name = "Metalshock Speed Loader (.357) (Very Lethal)"
	id = "c357_sl_ms"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*21, /datum/material/silver = SHEET_MATERIAL_AMOUNT*3)
	build_path = /obj/item/ammo_box/speedloader/c357/metalshock
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/c357_sl_hp
	name = "Heartpiercer Speed Loader (.357) (Very Lethal)"
	id = "c357_sl_hp"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*21, /datum/material/diamond = SHEET_MATERIAL_AMOUNT*9)
	build_path = /obj/item/ammo_box/speedloader/c357/heartpiercer
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/c357_sl_ws
	name = "Wallstake Speed Loader (.357) (Very Lethal)"
	id = "c357_sl_ws"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*21, /datum/material/gold = SHEET_MATERIAL_AMOUNT*3)
	build_path = /obj/item/ammo_box/speedloader/c357/wallstake
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/c357_sl_bounce
	name = "Bouncy Speed Loader (.357) (Less Lethal)"
	id = "c357_sl_bounce"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*3, /datum/material/plastic = SHEET_MATERIAL_AMOUNT*18)
	build_path = /obj/item/ammo_box/speedloader/c357/bouncy
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/c357_sl_dum
	name = "DumDum Speed Loader (.357) (Very Lethal)"
	id = "c357_sl_dum"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*10, /datum/material/titanium = SHEET_MATERIAL_AMOUNT*10, /datum/material/diamond = SHEET_MATERIAL_AMOUNT*1)
	build_path = /obj/item/ammo_box/speedloader/c357/dumdum
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/c357_sl_trac
	name = "TRAC Speed Loader (.357) (Very Lethal)"
	id = "c357_sl_trac"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*19, /datum/material/gold = SHEET_MATERIAL_AMOUNT*1, /datum/material/uranium = SHEET_MATERIAL_AMOUNT*1)
	build_path = /obj/item/ammo_box/speedloader/c357/trac
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/c357_sl_hot
	name = "HotShot Speed Loader (.357) (Very Lethal)"
	id = "c357_sl_hot"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*15, /datum/material/plasma = SHEET_MATERIAL_AMOUNT*3, /datum/material/gold = SHEET_MATERIAL_AMOUNT*3)
	build_path = /obj/item/ammo_box/speedloader/c357/hotshot
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/c357_sl_ice
	name = "IceBlox Speed Loader (.357) (Very Lethal)"
	id = "c357_sl_ice"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*15, /datum/material/plasma = SHEET_MATERIAL_AMOUNT*3, /datum/material/silver = SHEET_MATERIAL_AMOUNT*3)
	build_path = /obj/item/ammo_box/speedloader/c357/iceblox
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY


/datum/design/m50_mag
	name = ".50 Magazine (Very Lethal)"
	id = "m50_mag"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*21)
	build_path = /obj/item/ammo_box/m50
	category = list(
		RND_CATEGORY_HACKED,
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m50_mag_ap
	name = "AP .50 Magazine (Very Lethal)"
	id = "m50_mag_ap"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*21, /datum/material/diamond = SHEET_MATERIAL_AMOUNT*9)
	build_path = /obj/item/ammo_box/m50/ap
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m50_mag_hp
	name = "HP .50 Magazine (Very Lethal)"
	id = "m50_mag_hp"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*21, /datum/material/titanium = SHEET_MATERIAL_AMOUNT*3)
	build_path = /obj/item/ammo_box/m50/hp
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m50_mag_inc
	name = "Incendiary .50 Magazine (Very Lethal)"
	id = "m50_mag_inc"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*21, /datum/material/plasma = SHEET_MATERIAL_AMOUNT*6)
	build_path = /obj/item/ammo_box/m50/inc
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m50_mag_emp
	name = "EMP .50 Magazine (Very Lethal)"
	id = "m50_mag_emp"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*21, /datum/material/uranium = SHEET_MATERIAL_AMOUNT*6)
	build_path = /obj/item/ammo_box/m50/emp
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m50_mag_hi
	name = "Hi-Power .50 Magazine (EXTREMELY Lethal)"
	id = "m50_mag_hi"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/titanium = SHEET_MATERIAL_AMOUNT*21)
	build_path = /obj/item/ammo_box/m50/hi
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m50_mag_demo
	name = "Demolish .50 Magazine (Very Lethal)"
	id = "m50_mag_demo"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/titanium = SHEET_MATERIAL_AMOUNT*12, /datum/material/plasma = SHEET_MATERIAL_AMOUNT*9)
	build_path = /obj/item/ammo_box/m50/demo
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m50_mag_rod
	name = "Immovable .50 Magazine (EXTREMELY Lethal)"
	id = "m50_mag_rod"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/titanium = SHEET_MATERIAL_AMOUNT*21, /datum/material/bluespace = SHEET_MATERIAL_AMOUNT*4)
	build_path = /obj/item/ammo_box/m50/rod
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m50_mag_bomb
	name = "Ordinance .50 Magazine (EXTREMELY Lethal)"
	id = "m50_mag_bomb"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*21, /datum/material/plasma = SHEET_MATERIAL_AMOUNT*21)
	build_path = /obj/item/ammo_box/m50/bomb
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/m50_mag_rep
	name = "Repulsive .50 Magazine (Very Lethal)"
	id = "m50_mag_rep"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*21, /datum/material/bluespace = SHEET_MATERIAL_AMOUNT*1, /datum/material/plasma = SHEET_MATERIAL_AMOUNT*3)
	build_path = /obj/item/ammo_box/m50/rep
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY
