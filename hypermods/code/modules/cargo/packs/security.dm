//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Security ////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/security/secmodsuit
	name = "Security MODsuit Crate"
	desc = "Contains a single MODsuit designed for Security Personnel."
	cost = CARGO_CRATE_VALUE * 25
	access = ACCESS_SECURITY
	contains = list(/obj/item/mod/control/pre_equipped/security)
	crate_name = "security modsuit crate"

//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Armory //////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/security/armory/mk58
	name = "Mk58 Pistols Crate"
	desc = "Contains three Mk58 Pistols and a spare magazine for each."
	cost = CARGO_CRATE_VALUE * 15
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/automatic/pistol/mk58,
					/obj/item/gun/ballistic/automatic/pistol/mk58,
					/obj/item/gun/ballistic/automatic/pistol/mk58,
					/obj/item/ammo_box/magazine/v38,
					/obj/item/ammo_box/magazine/v38,
					/obj/item/ammo_box/magazine/v38)
	crate_name = "mk58 pistol crate"

/datum/supply_pack/security/armory/mk58single
	name = "Mk58 Pistol Crate Single-Pack"
	desc = "Contains one Mk58 Pistol and a spare magazine for it."
	cost = CARGO_CRATE_VALUE * 8.75
	contains = list(/obj/item/gun/ballistic/automatic/pistol/mk58,
					/obj/item/ammo_box/magazine/v38)
	crate_name = "mk58 pistol crate"

/datum/supply_pack/security/armory/kammerer
	name = "Kammerer Crate"
	desc = "Contains three Kammerers and three boxes of lethal shells."
	cost = CARGO_CRATE_VALUE * 20
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/shotgun/automatic/combat/kammerer,
					/obj/item/gun/ballistic/shotgun/automatic/combat/kammerer,
					/obj/item/gun/ballistic/shotgun/automatic/combat/kammerer,
					/obj/item/storage/box/lethalshot,
					/obj/item/storage/box/lethalshot,
					/obj/item/storage/box/lethalshot)
	crate_name = "kammerer crate"

/datum/supply_pack/security/armory/kammerersingle
	name = "Kammerer Crate Single-Pack"
	desc = "Contains one Kammerer and one boxes of lethal shells."
	cost = CARGO_CRATE_VALUE * 12.5
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/shotgun/automatic/combat/kammerer,
					/obj/item/storage/box/lethalshot)
	crate_name = "single kammerer crate"

/datum/supply_pack/security/armory/enforcer
	name = "Enforcer Crate"
	desc = "Contains three Enforcers and three boxes of lethal shells."
	cost = CARGO_CRATE_VALUE * 30
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/shotgun/enforcer,
					/obj/item/gun/ballistic/shotgun/enforcer,
					/obj/item/gun/ballistic/shotgun/enforcer,
					/obj/item/storage/box/lethalshot,
					/obj/item/storage/box/lethalshot,
					/obj/item/storage/box/lethalshot)
	crate_name = "enforcer crate"

/datum/supply_pack/security/armory/enforcersingle
	name = "Enforcer Crate Single-Pack"
	desc = "Contains one Enforcer and one boxes of lethal shells."
	cost = CARGO_CRATE_VALUE * 17.5
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/shotgun/enforcer,
					/obj/item/storage/box/lethalshot)
	crate_name = "single enforcer crate"


/datum/supply_pack/security/armory/hristov
	name = "Hristov Crate"
	desc = "Contains two Hristov Sniper Rifles and two bandoliers containing twelve additional rounds."
	cost = CARGO_CRATE_VALUE * 37.5
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/rifle/sniper_rifle/hristov,
					/obj/item/gun/ballistic/rifle/sniper_rifle/hristov,
					/obj/item/storage/belt/bandolier/hristov,
					/obj/item/storage/belt/bandolier/hristov)
	crate_name = "hristov crate"

/datum/supply_pack/security/armory/hristovsingle
	name = "Hristov Crate Single-Pack"
	desc = "Contains one Hristov Sniper Rifle and a bandolier containing twelve additional rounds."
	cost = CARGO_CRATE_VALUE * 20
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/rifle/sniper_rifle/hristov,
					/obj/item/storage/belt/bandolier/hristov)
	crate_name = "hristov crate"

/datum/supply_pack/security/armory/lecter
	name = "Lecter Crate"
	desc = "Contains two Lecters and four additional magazines."
	cost = CARGO_CRATE_VALUE * 40
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/automatic/lecter,
					/obj/item/gun/ballistic/automatic/lecter,
					/obj/item/ammo_box/magazine/r556,
					/obj/item/ammo_box/magazine/r556,
					/obj/item/ammo_box/magazine/r556,
					/obj/item/ammo_box/magazine/r556)
	crate_name = "lecter crate"

/datum/supply_pack/security/armory/lectersingle
	name = "Lecter Crate Single-Pack"
	desc = "Contains one Lecter and two additional magazines."
	cost = CARGO_CRATE_VALUE * 22.5
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/automatic/lecter,
					/obj/item/ammo_box/magazine/r556,
					/obj/item/ammo_box/magazine/r556)
	crate_name = "lecter crate"

/datum/supply_pack/security/armory/drozd
	name = "Drozd Crate"
	desc = "Contains two Drozd and four additional magazines."
	cost = CARGO_CRATE_VALUE * 50
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/automatic/drozd,
					/obj/item/gun/ballistic/automatic/drozd,
					/obj/item/ammo_box/magazine/r556,
					/obj/item/ammo_box/magazine/r556,
					/obj/item/ammo_box/magazine/r556,
					/obj/item/ammo_box/magazine/r556)
	crate_name = "drozd crate"

/datum/supply_pack/security/armory/drozdsingle
	name = "Drozd Crate Single-Pack"
	desc = "Contains one Drozd and two additional magazines."
	cost = CARGO_CRATE_VALUE * 30
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/automatic/drozd,
					/obj/item/ammo_box/magazine/r556,
					/obj/item/ammo_box/magazine/r556)
	crate_name = "drozd crate"

/datum/supply_pack/security/armory/sabersmg
	name = "Saber SMG Crate"
	desc = "Contains three NT-Saber SMG's and 6 9mm magazines."
	cost = CARGO_CRATE_VALUE * 30
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/automatic/proto/unrestricted,
					/obj/item/gun/ballistic/automatic/proto/unrestricted,
					/obj/item/gun/ballistic/automatic/proto/unrestricted,
					/obj/item/ammo_box/magazine/smgm9mm,
					/obj/item/ammo_box/magazine/smgm9mm,
					/obj/item/ammo_box/magazine/smgm9mm,
					/obj/item/ammo_box/magazine/smgm9mm,
					/obj/item/ammo_box/magazine/smgm9mm,
					/obj/item/ammo_box/magazine/smgm9mm)
	crate_name = "saber smg crate"

/datum/supply_pack/security/armory/sabersmgsingle
	name = "Saber SMG Crate Single-Pack"
	desc = "Contains one NT-Saber SMG's and 2 9mm magazines."
	cost = CARGO_CRATE_VALUE * 22.5
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/automatic/proto/unrestricted,
					/obj/item/ammo_box/magazine/smgm9mm)
	crate_name = "saber smg crate"

/datum/supply_pack/security/armory/ntargrifle
	name = "NT-ARG Rifle Crate"
	desc = "Contains three NT-ARG 'Boarder' Rifles, and 6 5.56mm magazines."
	cost = CARGO_CRATE_VALUE * 75
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/automatic/ar,
					/obj/item/gun/ballistic/automatic/ar,
					/obj/item/gun/ballistic/automatic/ar,
					/obj/item/ammo_box/magazine/r556,
					/obj/item/ammo_box/magazine/r556,
					/obj/item/ammo_box/magazine/r556,
					/obj/item/ammo_box/magazine/r556,
					/obj/item/ammo_box/magazine/r556,
					/obj/item/ammo_box/magazine/r556)
	crate_name = "nt-arg rifle crate"

/datum/supply_pack/security/armory/ntargriflesingle
	name = "NT-ARG Rifle Crate Single-Pack"
	desc = "Contains one NT-ARG 'Boarder' Rifles, and 2 5.56mm magazines."
	cost = CARGO_CRATE_VALUE * 40
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/automatic/ar,
					/obj/item/ammo_box/magazine/r556)
	crate_name = "nt-arg rifle crate"

/**
/datum/supply_pack/security/armory/
	name = " Crate"
	desc = "Contains three  and ."
	cost = CARGO_CRATE_VALUE * 15
	access = ACCESS_ARMORY
	contains = list(,
					,
					,
					)
	crate_name = " crate"

/datum/supply_pack/security/armory/single
	name = " Crate Single-Pack"
	desc = "Contains one  and ."
	cost = CARGO_CRATE_VALUE * 7.5
	access = ACCESS_ARMORY
	contains = list(,
					)
	crate_name = " crate"
**/

//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Imported Weaponry ///////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/weaponry
	group = "Imported Weaponry"
	crate_name = "weapons crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/weaponry/exoticammo
	name = "Exotic Ammo Crate"
	desc = "Contains variety magazines for the following: 3 v38 magazines, 2 smg 9mm magazines, 4 variety 5.56 rifle magazines, and an uzi 9mm magazine."
	cost = CARGO_CRATE_VALUE * 35
	access = ACCESS_ARMORY
	contains = list(/obj/item/ammo_box/magazine/v38/frost,
					/obj/item/ammo_box/magazine/v38/talon,
					/obj/item/ammo_box/magazine/v38/bluespace,
					/obj/item/ammo_box/magazine/smgm9mm/ap,
					/obj/item/ammo_box/magazine/smgm9mm/fire,
					/obj/item/ammo_box/magazine/r556/ap,
					/obj/item/ammo_box/magazine/r556/inc,
					/obj/item/ammo_box/magazine/r556/rubber,
					/obj/item/ammo_box/magazine/r556/ap,
					/obj/item/ammo_box/magazine/uzim9mm)
	crate_name = "exotic ammo crate"

/datum/supply_pack/weaponry/ammo10mmrestock
	name = "Random 10mm Ammo Crate"
	desc = "(!&@#$%@ OPERATIVE, WITHIN THIS CRATE LIES THREE RANDOM 10mm MAGAZINES, ENSURE YOUR GOODS ARE NOT STOLEN."
	contraband = TRUE
	hidden = TRUE
	cost = CARGO_CRATE_VALUE * 20
	contains = list(/obj/item/storage/box/syndie_kit/pistolammo10mm/random)
	crate_name = "crate"

/datum/supply_pack/weaponry/ammo357restock
	name = "Random .357 Ammo Crate"
	desc = "(!&@#$%@ OPERATIVE, WITHIN THIS CRATE LIES TWO RANDOM .357 SPEEDLOADERS, ENSURE YOUR GOODS ARE NOT STOLEN."
	contraband = TRUE
	hidden = TRUE
	cost = CARGO_CRATE_VALUE * 30
	contains = list(/obj/item/storage/box/syndie_kit/revolverammo/random)
	crate_name = "crate"

/datum/supply_pack/weaponry/ammo45restock
	name = ".45 Ammo Crate"
	desc = "Contains one of each kind of .45 ammo magazine for your M1911s: Eight magazines in total."
	contraband = TRUE
	hidden = TRUE
	cost = CARGO_CRATE_VALUE * 25
	contains = list(/obj/item/ammo_box/magazine/m45,
					/obj/item/ammo_box/magazine/m45/cs,
					/obj/item/ammo_box/magazine/m45/sp,
					/obj/item/ammo_box/magazine/m45/ap,
					/obj/item/ammo_box/magazine/m45/hp,
					/obj/item/ammo_box/magazine/m45/inc,
					/obj/item/ammo_box/magazine/m45/emp,
					/obj/item/ammo_box/magazine/m45/venom)
	crate_name = "crate"

/datum/supply_pack/weaponry/ammoakmsrestock
	name = "7.12x82 Ammo Crate"
	desc = "(!&@#$%@ OPERATIVE, WITHIN THIS CRATE LIES FOUR REGULAR 7.12x82mm MAGAZINES WHICH ARE COMPATIBLE WITH THE AKMS, ENSURE YOUR GOODS ARE NOT STOLEN."
	contraband = TRUE
	hidden = TRUE
	cost = CARGO_CRATE_VALUE * 37.5
	contains = list(/obj/item/ammo_box/magazine/ak712x82,
					/obj/item/ammo_box/magazine/ak712x82,
					/obj/item/ammo_box/magazine/ak712x82,
					/obj/item/ammo_box/magazine/ak712x82)
	crate_name = "crate"

/datum/supply_pack/weaponry/ammovarietyakmsrestock
	name = "Specialized 7.12x82 Ammo Crate"
	desc = "(!&@#$%@ OPERATIVE, WITHIN THIS CRATE LIES THREE SPECIALIZED 7.12x82mm MAGAZINES FOR THE AKMS, ENSURE YOUR GOODS ARE NOT STOLEN."
	contraband = TRUE
	hidden = TRUE
	cost = CARGO_CRATE_VALUE * 37.5
	contains = list(/obj/item/ammo_box/magazine/ak712x82/ap,
					/obj/item/ammo_box/magazine/ak712x82/hp,
					/obj/item/ammo_box/magazine/ak712x82/incendiary)
	crate_name = "crate"

/datum/supply_pack/weaponry/ammorestock
	name = "Tommy Gun Ammo Crate"
	desc = "(!&@#$%@ OPERATIVE, WITHIN THIS CRATE LIES TWO DRUM MAGAZINES FOR THE 'TOMMY GUN', ENSURE YOUR GOODS ARE NOT STOLEN."
	contraband = TRUE
	hidden = TRUE
	cost = CARGO_CRATE_VALUE * 37.5
	contains = list(/obj/item/ammo_box/magazine/tommygunm45,
					/obj/item/ammo_box/magazine/tommygunm45)
	crate_name = "crate"

/datum/supply_pack/weaponry/ammorestock
	name = "Harpoon Quiver Crate"
	desc = "(!&@#$%@ OPERATIVE, WITHIN THIS CRATE LIES A SINGLE HARPOON QUIVER, ENSURE YOUR GOODS ARE NOT STOLEN."
	contraband = TRUE
	hidden = TRUE
	cost = CARGO_CRATE_VALUE * 37.5
	contains = list(/obj/item/storage/harpoon_quiver)
	crate_name = "crate"

/datum/supply_pack/weaponry/c4
	name = "Composition C4 Crate"
	desc = "(!&@#$%@ Contains three plastic c4 explosives."
	contraband = TRUE
	hidden = TRUE
	cost = CARGO_CRATE_VALUE * 40
	contains = list(/obj/item/grenade/c4,
					/obj/item/grenade/c4,
					/obj/item/grenade/c4)
	crate_name = "crate"

/datum/supply_pack/weaponry/fragnade
	name = "Fragmentation Grenade Crate"
	desc = "(!&@#$%@ Contains three Fragmentation Grenades."
	contraband = TRUE
	hidden = TRUE
	cost = CARGO_CRATE_VALUE * 50
	contains = list(/obj/item/grenade/frag,
					/obj/item/grenade/frag,
					/obj/item/grenade/frag)
	crate_name = "crate"

/datum/supply_pack/weaponry/gyrojet
	name = "Gyrojet Pistols Crate"
	desc = "Contains two Gyrojet Pistols and 2 specialized .75 magazines."
	cost = CARGO_CRATE_VALUE * 100
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/automatic/gyropistol,
					/obj/item/gun/ballistic/automatic/gyropistol,
					/obj/item/ammo_box/magazine/m75,
					/obj/item/ammo_box/magazine/m75)
	crate_name = "gyrojet pistols crate"

/datum/supply_pack/weaponry/m1911
	name = "M1911 Pistols Crate"
	desc = "Contains two M1911 Pistols and 4 .45 ACP magazines."
	cost = CARGO_CRATE_VALUE * 17.5
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/automatic/pistol/m1911,
					/obj/item/gun/ballistic/automatic/pistol/m1911,
					/obj/item/ammo_box/magazine/m45,
					/obj/item/ammo_box/magazine/m45,
					/obj/item/ammo_box/magazine/m45,
					/obj/item/ammo_box/magazine/m45)
	crate_name = "m1911 pistols crate"

/datum/supply_pack/weaponry/pumpshotgun
	name = "Pump Shotgun Crate"
	desc = "Contains two Pump Shotguns, and two boxes filled with lethal shots."
	cost = CARGO_CRATE_VALUE * 25
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/shotgun,
					/obj/item/gun/ballistic/shotgun,
					/obj/item/storage/box/lethalshot,
					/obj/item/storage/box/lethalshot)
	crate_name = "pump shotgun crate"

/datum/supply_pack/weaponry/deserteagle
	name = "Desert Eagle Crate"
	desc = "Contains one Desert Eagle, and two magazines for it."
	cost = CARGO_CRATE_VALUE * 30
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/automatic/pistol/deagle,
					/obj/item/ammo_box/magazine/m50,
					/obj/item/ammo_box/magazine/m50)
	crate_name = "desert eagle crate"

/datum/supply_pack/weaponry/sakhnosks
	name = "Sakhno SKS Crate"
	desc = "Contains one Sakhno SKS semi-automatic rifle and three surplus boxes of ammunition."
	cost = CARGO_CRATE_VALUE * 15
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/rifle/sks,
					/obj/item/storage/toolbox/ammobox/strilka310/surplus,
					/obj/item/storage/toolbox/ammobox/strilka310/surplus,
					/obj/item/storage/toolbox/ammobox/strilka310/surplus)
	crate_name = "sakhno sks crate"

/datum/supply_pack/weaponry/type3uzi
	name = "Type U3 Uzi Crate"
	desc = "Contains two Type U3 Uzi's and 4 spare magazines -- popular among gangsters."
	cost = CARGO_CRATE_VALUE * 40
	access = ACCESS_ARMORY
	contains = list(/obj/item/gun/ballistic/automatic/mini_uzi,
					/obj/item/gun/ballistic/automatic/mini_uzi,
					/obj/item/ammo_box/magazine/uzim9mm,
					/obj/item/ammo_box/magazine/uzim9mm,
					/obj/item/ammo_box/magazine/uzim9mm,
					/obj/item/ammo_box/magazine/uzim9mm)
	crate_name = "uzi crate"

/datum/supply_pack/weaponry/liberationvending
	name = "Liberation Station"
	desc = "Contains one liberation station vending machine, thank the Americans later."
	cost = CARGO_CRATE_VALUE * 250
	access = ACCESS_ARMORY
	contains = list(/obj/machinery/vending/liberationstation/expensive)
	crate_name = "liberty vendor crate"
