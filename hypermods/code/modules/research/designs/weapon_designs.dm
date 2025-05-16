/datum/design/laser_rifle
	name = "Laser Rifle Part Kit (Lethal)"
	desc = "A kit to augment a laser gun into a laser rifle, a more effective model."
	id = "laser_rifle"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 7, /datum/material/gold = SHEET_MATERIAL_AMOUNT * 5)
	build_path = /obj/item/weaponcrafting/gunkit/laserrifle
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_KITS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/mk58pistol
	name = "Mk58"
	desc = "A modernized handgun of remarkable quality often provided to security forces occupying areas with suitable gravity."
	id = "mk58"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 12, /datum/material/plastic = SHEET_MATERIAL_AMOUNT * 4)
	build_path = /obj/item/gun/ballistic/automatic/pistol/mk58/freshprint
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/v38_rubber
	name = "Magazine (v38 Rubber) (Less Lethal)"
	desc = "Designed to quickly incapacitate targets in a hurry. Rubber bullets are bouncy and less-than-lethal."
	id = "v38_rubber"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 12)
	build_path = /obj/item/ammo_box/magazine/v38/rubber
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/v38_lethal
	name = "Magazine (v38) (Lethal)"
	desc = "Designed to quickly incapacitate or kill targets in a hurry. Deadly against unarmored foes."
	id = "v38_lethal"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 15)
	build_path = /obj/item/ammo_box/magazine/v38
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/v38_ap
	name = "AP Magazine (v38 AP) (Lethal)"
	desc = "Designed to quickly incapacitate or kill targets in a hurry. Less damaging, but doesn't suffer against armor."
	id = "v38_ap"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 15, /datum/material/diamond = SHEET_MATERIAL_AMOUNT * 2.5)
	build_path = /obj/item/ammo_box/magazine/v38/ap
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/v38_frost
	name = "Magazine (v38 Frost) (Lethal)"
	desc = "Designed to quickly incapacitate or kill targets in a hurry. Less effective against armor, but chills bodies."
	id = "v38_frost"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 15, /datum/material/plasma = SHEET_MATERIAL_AMOUNT * 2.5)
	build_path = /obj/item/ammo_box/magazine/v38/frost
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/v38_talon
	name = "Magazine (v38 Talon) (Lethal)"
	desc = "Designed to quickly incapacitate or kill targets in a hurry. Not as directly lethal, but painful while causing blood loss."
	id = "v38_talon"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 15, /datum/material/silver = SHEET_MATERIAL_AMOUNT * 2.5)
	build_path = /obj/item/ammo_box/magazine/v38/talon
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/v38_bluespace
	name = "Magazine (v38 Bluespace) (Lethal)"
	desc = "Designed to quickly incapacitate or kill targets in a hurry. Less damaging, but incredibly fast."
	id = "v38_bluespace"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 15, /datum/material/bluespace = SHEET_MATERIAL_AMOUNT * 2.5)
	build_path = /obj/item/ammo_box/magazine/v38/bluespace
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/lecter
	name = "Lecter"
	desc = "A high-end military-grade assault rifle capable of mowing down dangerous attackers. Uses 5.56mm rifle ammo."
	id = "lecter"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 20, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 6, /datum/material/plastic = SHEET_MATERIAL_AMOUNT * 4)
	build_path = /obj/item/gun/ballistic/automatic/lecter/freshprint
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/drozd
	name = "Drozd"
	desc = "An excellent, fully automatic Heavy SMG. Uses 5.56mm rifle ammo."
	id = "drozd"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 20, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 6, /datum/material/titanium = SHEET_MATERIAL_AMOUNT * 6, /datum/material/plastic = SHEET_MATERIAL_AMOUNT * 4)
	build_path = /obj/item/gun/ballistic/automatic/drozd/freshprint
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/ntmag_556
	name = "Magazine (5.56) (Lethal)"
	desc = "Designed to quickly incapacitate or kill targets."
	id = "ntmag_556"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 25)
	build_path = /obj/item/ammo_box/magazine/r556
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/ntmag_556_rubber
	name = "Magazine (5.56 Rubber) (Less Lethal)"
	desc = "Designed to quickly incapacitate targets. Deals significant damage to one's will (to live)."
	id = "ntmag_556_rubber"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 20)
	build_path = /obj/item/ammo_box/magazine/r556/rubber
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/ntmag_556_ap
	name = "Magazine (5.56 AP) (Lethal)"
	desc = "Designed to quickly incapacitate or kill targets. Sacrifices outright damage for armor penetration."
	id = "ntmag_556_ap"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 25, /datum/material/diamond = SHEET_MATERIAL_AMOUNT * 5)
	build_path = /obj/item/ammo_box/magazine/r556/ap
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/ntmag_556_inc
	name = "Magazine (5.56 Incendiary) (Lethal)"
	desc = "Designed to quickly incapacitate or kill targets. Leaves behind trails of fire after being fired."
	id = "ntmag_556_inc"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 25, /datum/material/plasma = SHEET_MATERIAL_AMOUNT * 5)
	build_path = /obj/item/ammo_box/magazine/r556/inc
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/hristov
	name = "Hristov"
	desc = "A long ranged weapon that does significant damage. Uses 7.62 ammo."
	id = "hristov"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 10, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 5, /datum/material/titanium = SHEET_MATERIAL_AMOUNT * 10, /datum/material/plastic = SHEET_MATERIAL_AMOUNT * 4)
	build_path = /obj/item/gun/ballistic/rifle/sniper_rifle/hristov/freshprint
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/nt_a762
	name = "Bullet (7.62mm) (Lethal)"
	desc = "A highly lethal bullet designed to be fired from a Hristov."
	id = "nt_a762"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3)
	build_path = /obj/item/ammo_casing/a762
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/nt_a762_raze
	name = "Bullet (7.62mm RAZE) (Lethal)"
	desc = "A highly lethal bullet designed to be fired from a Hristov. Emits a highly intense burst of radiation after being shot into something."
	id = "nt_a762_raze"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3, /datum/material/uranium = SHEET_MATERIAL_AMOUNT * 3)
	build_path = /obj/item/ammo_casing/a762/raze
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/nt_a762_pen
	name = "Bullet (7.62mm Anti-Material) (Lethal)"
	desc = "A highly lethal bullet designed to be fired from a Hristov. Bypasses structures and armor alike."
	id = "nt_a762_pen"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3, /datum/material/titanium = SHEET_MATERIAL_AMOUNT * 2, /datum/material/diamond = SHEET_MATERIAL_AMOUNT * 2)
	build_path = /obj/item/ammo_casing/a762/pen
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/nt_a762_vulcan
	name = "Bullet (7.62mm Vulcan) (Lethal)"
	desc = "A highly lethal bullet designed to be fired from a Hristov. Bullets upon impact explode violently without causing major hazards."
	id = "nt_a762_vulcan"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3, /datum/material/plasma = SHEET_MATERIAL_AMOUNT * 3)
	build_path = /obj/item/ammo_casing/a762/vulcan
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/kammerer
	name = "Kammerer"
	desc = "A semi-automatic shotgun with a four-shell capacity. Often favored over compact shotguns for their slightly better performance."
	id = "kammerer"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 14, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 6, /datum/material/plastic = SHEET_MATERIAL_AMOUNT * 4)
	build_path = /obj/item/gun/ballistic/shotgun/automatic/combat/kammerer/nopin
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/enforcer
	name = "Enforcer"
	desc = "A semi-auto shotgun for combat in narrow corridors, originally conceived to compete against the syndicate's famous 'Bulldog'."
	id = "enforcer"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 18, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 2, /datum/material/titanium = SHEET_MATERIAL_AMOUNT * 5, /datum/material/plastic = SHEET_MATERIAL_AMOUNT * 4)
	build_path = /obj/item/gun/ballistic/shotgun/enforcer/nopin
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/secsyringegun
	name = "Security Syringe Pistol"
	desc = "A somewhat compact syringe gun capable of firing syringes at high speeds.."
	id = "secsyringegun"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 15, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 10, /datum/material/titanium = SHEET_MATERIAL_AMOUNT * 5)
	build_path = /obj/item/gun/syringe/security
	category = list(
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/dummypayload
	name = "Dummy Payload"
	desc = "A bomb payload that doesn't actually do anything. Useful for training security officers in the technique of bomb defusal."
	id = "dummypayload"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 1, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 1)
	build_path = /obj/item/bombcore/training
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/emppayload
	name = "EMP Payload"
	desc = "A bomb payload with an EMP get-up. Can also be inserted into grenade casings to make a classic EMP grenade."
	id = "emppayload"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 5)
	build_path = /obj/item/bombcore/emp/small
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/flashpayload
	name = "Flash Payload"
	desc = "A bomb payload containing flash-creation chemical solutions. Can also be inserted into grenade casings to make a flashbang."
	id = "flashpayload"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 2)
	build_path = /obj/item/bombcore/flash
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/stingbangpayload
	name = "Stingbang Payload"
	desc = "A grenade payload with an awful lot of rubber balls. Can be inserted into grenade casings to make a stingbang."
	id = "stingbangpayload"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 4, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 3)
	build_path = /obj/item/bombcore/stingbang
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/cryopayload
	name = "Cryogenic Payload"
	desc = "A grenade payload filled with frost-inducing chemicals. Can be inserted into grenade casings to make a cryogenic grenade."
	id = "cryopayload"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 3, /datum/material/plasma = SHEET_MATERIAL_AMOUNT * 1)
	build_path = /obj/item/bombcore/cryogenic
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/mfpayload
	name = "Metal Foam Payload"
	desc = "A grenade payload with an aluminium foam compartment. Can be inserted into grenade casings to make a metal foam grenade."
	id = "mfpayload"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 4, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 2)
	build_path = /obj/item/bombcore/metal_foam
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/smfpayload
	name = "Smart Metal Foam Payload"
	desc = "A grenade payload with an aluminium foam compartment. Can be inserted into grenade casings to make a smart metal foam grenade."
	id = "smfpayload"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 4, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 4)
	build_path = /obj/item/bombcore/smart_metal_foam
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/pepperpayload
	name = "Tear Gas Payload"
	desc = "A grenade payload with a pepperspray compartment. Can be inserted into grenade casings to make a tear gas grenade."
	id = "pepperpayload"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 3)
	build_path = /obj/item/bombcore/pepper
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/fdpayload
	name = "Foam Dart Payload"
	desc = "A grenade payload with everyones favorite foam darts! Can be inserted into grenade casings to make a foam dart grenade."
	id = "fdpayload"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 1)
	build_path = /obj/item/bombcore/foam_dart
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/rdpayload
	name = "Riot Dart Payload"
	desc = "A grenade payload with riot darts. Can be inserted into grenade casings to make a riot dart grenade."
	id = "rdpayload"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 1)
	build_path = /obj/item/bombcore/riot_dart
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/hepayload
	name = "HE Payload"
	desc = "A grenade payload containing an assortment of highly explosive chemicals. Can be inserted into grenade casings to make a HE grenade."
	id = "hepayload"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 5)
	build_path = /obj/item/bombcore/highexplosive
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/dspayload
	name = "Disabler Stinger Payload"
	desc = "A grenade payload with an admittedly shoddy looking disabler beam generator. Can be inserted into grenade casings to make a disabler stinger grenade."
	id = "dspayload"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 5)
	build_path = /obj/item/bombcore/estinger
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/espayload
	name = "Energy Stinger Payload"
	desc = "A grenade payload with high concentrations of light-based energy. Can be inserted into grenade casings to make a energy stinger grenade."
	id = "espayload"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 5)
	build_path = /obj/item/bombcore/estinger_lethal
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/wt550
	name = "WT-550 Autorifle"
	desc = "A long-since recalled rifle originally produced by Nanotrasen but has since been outlawed after much public backlash regarding heat distribution resulting in unintended discombobulation. Uses 4.6x30mm rounds."
	id = "wt550-gun"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 30, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 10, /datum/material/plastic = SHEET_MATERIAL_AMOUNT * 10, /datum/material/silver = SHEET_MATERIAL_AMOUNT * 3)
	build_path = /obj/item/gun/ballistic/automatic/wt550/freshprint
	category = list(
		RND_CATEGORY_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY
