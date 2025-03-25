// Mostly just other voucher sets, the mining console gets all subtypes of /datum/voucher_set for item sets. So, we gotta start from scratch.

/datum/s_voucher_set
	/// Name of the set
	var/name
	/// Description of the set
	var/description
	/// Icon of the set
	var/icon
	/// Icon state of the set
	var/icon_state
	/// List of items contained in the set
	var/list/set_items = list()

/datum/s_voucher_set/silicon_friends_kit // 56 TC
	name = "Silicon Friends Kit"
	description = "Contains THREE syndicate silicon support beacons, as well as \
			three Martyr, one Rescue, and two Weapon Cyborg Modules! Come on, grab your friends!"
	icon = 'icons/obj/devices/voice.dmi'
	icon_state = "nukietalkie"
	set_items = list(
		/obj/item/antag_spawner/loadout/syndiborg, // 6 TC
		/obj/item/antag_spawner/loadout/syndiborg, // 6 TC
		/obj/item/antag_spawner/loadout/syndiborg, // 6 TC
		/obj/item/borg/upgrade/illegalweapons, // 10 TC
		/obj/item/borg/upgrade/illegalweapons, // 10 TC
		/obj/item/borg/upgrade/martyr, // 4 TC
		/obj/item/borg/upgrade/martyr, // 4 TC
		/obj/item/borg/upgrade/martyr, // 4 TC
		/obj/item/borg/upgrade/illegalrescue, // 6 TC
		)

/datum/s_voucher_set/catwalker_kit // 64 TC
	name = "Cat-Walker Kit"
	description = "Contains TEN Syndicat Beacons! This shall be a night to remember! \
			It even comes with two changeling extract medipens in case of accidental self-bombings."
	icon = 'hypermods/icons/mob/simple/pets.dmi'
	icon_state = "syndicat"
	set_items = list(
		/obj/item/antag_spawner/nuke_ops/syndicat, // 6 TC
		/obj/item/antag_spawner/nuke_ops/syndicat, // 6 TC
		/obj/item/antag_spawner/nuke_ops/syndicat, // 6 TC
		/obj/item/antag_spawner/nuke_ops/syndicat, // 6 TC
		/obj/item/antag_spawner/nuke_ops/syndicat, // 6 TC
		/obj/item/antag_spawner/nuke_ops/syndicat, // 6 TC
		/obj/item/antag_spawner/nuke_ops/syndicat, // 6 TC
		/obj/item/antag_spawner/nuke_ops/syndicat, // 6 TC
		/obj/item/antag_spawner/nuke_ops/syndicat, // 6 TC
		/obj/item/antag_spawner/nuke_ops/syndicat, // 6 TC
		/obj/item/reagent_containers/hypospray/medipen/limborganregen, // 2 TC
		/obj/item/reagent_containers/hypospray/medipen/limborganregen, // 2 TC
		)

/datum/s_voucher_set/recon_kit // 41 TC?
	name = "Recon Kit"
	description = "The essentials to make sure you gather the proper intelligence on the opposition. \
			Comes with a pair of X-Ray goggles, Binoculars, a Binary Translator, a Briefcase Launchpad, \
			an Overwatch Agent requester and more!"
	icon = 'icons/obj/devices/tool.dmi'
	icon_state = "binoculars"
	set_items = list(
		/obj/item/clothing/glasses/thermal/xray, // 8 TC?
		/obj/item/storage/briefcase/launchpad, // 6 TC
		/obj/item/binoculars, // 2 TC?
		/obj/item/encryptionkey/binary, // 5 TC
		/obj/item/flashlight/emp, // 4 TC
		/obj/item/antag_spawner/nuke_ops/overwatch, // 12 TC
		/obj/item/grenade/frag, // 2 TC?
		/obj/item/grenade/frag, // 2 TC?
		)

/datum/s_voucher_set/engineer_gaming // 64 TC
	name = "Engineer Gaming"
	description = "Makin' bacon. Embrace your inner space texan and make your claim with automated sentry guns today! \
			Contains 4 disposable sentry guns disguised as toolboxes."
	icon = 'icons/obj/storage/toolbox.dmi'
	icon_state = "red"
	set_items = list(
		/obj/item/storage/toolbox/emergency/turret/nukie, // 16 TC
		/obj/item/storage/toolbox/emergency/turret/nukie, // 16 TC
		/obj/item/storage/toolbox/emergency/turret/nukie, // 16 TC
		/obj/item/storage/toolbox/emergency/turret/nukie, // 16 TC
		)

/datum/s_voucher_set/sabotage_kit // 42 TC
	name = "Sabotage Kit"
	description = "Get in, fuck shit up, profit? Even if you fail to nuke the station, you'll be leaving it in RUINS. \
			Contains enough EMP supplies to cripple a station, a box of rigged power cells, rigged lights, radiation lights, \
			two boxes of syndicate radio mines, and a missile phone."
	icon = 'icons/obj/weapons/grenade.dmi'
	icon_state = "emp"
	set_items = list(
		/obj/item/sbeacondrop/emp, // 7 TC
		/obj/item/storage/box/syndie_kit/emp, // 2 TC
		/obj/item/storage/box/lights/mixed/syndirigged, // 7 TC
		/obj/item/storage/box/syndie_kit/syndirigcells, // 5 TC
		/obj/item/storage/box/lights/mixed/radiation, // 4 TC
		/obj/item/storage/box/syndie_kit/syndicate_radio_mine, // 4 TC
		/obj/item/storage/box/syndie_kit/syndicate_radio_mine, // 4 TC
		/obj/item/storage/box/syndie_kit/missilephone, // 9 TC
		)

/datum/s_voucher_set/assault_def_kit // 57 TC
	name = "Tower Defense Kit"
	description = "The favorite amongst syndicate operatives, get in quick, establish a new capital for the syndicate... \
			Demand the captain hand over the disk if they want you to move out? \
			Contains an Assault Pod Targeting Device, a Syndicate Forcefield Projector, and a Syndicate RCD."
	icon = 'icons/obj/devices/remote.dmi'
	icon_state = "designator_syndicate"
	set_items = list(
		/obj/item/assault_pod, // 30 TC
		/obj/item/forcefield_projector/syndicate, // 12 TC
		/obj/item/construction/rcd/syndicate, // 15 TC
		)

/datum/s_voucher_set/chemical_shooter_kit // 45 TC?
	name = "Water-Park Kit"
	description = "The favorite amongst our more clownly friends, for some kind of sick joke probably. \
			Contains a Hyper-Soaker, a toxic Chemical Sprayer, three large beakers of Nitric Acid, a Chemi-Compiler, and a box of bluespace beakers."
	icon = 'hypermods/icons/obj/weapons/guns/water.dmi'
	icon_state = "water"
	set_items = list(
		/obj/item/gun/water/syndicate, // 3 TC
		/obj/item/reagent_containers/spray/chemsprayer/syndicate, // 16 TC
		/obj/item/storage/portable_chem_mixer/chemicompiler, // 8 TC
		/obj/item/reagent_containers/cup/beaker/large/nitracid, // 5 TC?
		/obj/item/reagent_containers/cup/beaker/large/nitracid, // 5 TC?
		/obj/item/reagent_containers/cup/beaker/large/nitracid, // 5 TC?
		/obj/item/storage/box/beakers/bluespace, // 3 TC?
		)

/datum/s_voucher_set/bee_liberty_kit // 46 TC?
	name = "Bee Liberation Kit"
	description = "All who are supremely loyal to the Bee Liberation Front value this kit almost as if it were a badge of honor. \
			Contains a space-proof bee costume, The Stinger, a Wasp Crossbow, a macro wasp-revenge implanter, \
			and two pouches of killer wasp grenades."
	icon = 'hypermods/icons/obj/weapons/grenade.dmi'
	icon_state = "wasp"
	set_items = list(
		/obj/item/clothing/suit/hooded/bee_costume/spaceproof/nukie, // 3 TC?
		/obj/item/melee/beelibsword, // 7 TC
		/obj/item/gun/energy/recharge/ebow/wasp, // 12 TC
		/obj/item/storage/box/syndie_kit/waspimplantmacro, // 8 TC
		/obj/item/ammo_box/nadepouch/wasp, // 8 TC?
		/obj/item/ammo_box/nadepouch/wasp, // 8 TC?
		)

/datum/s_voucher_set/false_ninja_kit // 58 TC?
	name = "Ninjutsu Kit"
	description = "A favorite amongst our operatives, for those who watch a little too much of those 'japanese cartoons'. \
			Contains our re-purposed 'Ninja' MODsuit, a Katana, two chemical kill-switches, a krav maga implant, \
			and a scram implant for quick get-aways."
	icon = 'icons/obj/weapons/sword.dmi'
	icon_state = "katana"
	set_items = list(
		/obj/item/mod/control/pre_equipped/ninja/traitor, // 16 TC
		/obj/item/katana, // 10 TC
		/obj/item/reagent_containers/hypospray/medipen/chemkillswitch, // 8 TC
		/obj/item/reagent_containers/hypospray/medipen/chemkillswitch, // 8 TC
		/obj/item/storage/box/syndie_kit/krav_maga, // 12 TC
		/obj/item/storage/box/syndie_kit/scramimplant, // 6 TC
		)

/datum/s_voucher_set/mailman_kit // 40 TC?
	name = "Mailman Kit"
	description = "A rarely seen kit containing mail counterfeiting devices and fultons for transportation of \
			less-than-safe goods. Absolutely devilish if you know how to use it. \
			Also comes with some sponge capsules, a pickpocket gun, and two anomaly releasers."
	icon = 'icons/obj/antags/syndicate_tools.dmi'
	icon_state = "mail_counterfeit_device"
	set_items = list(
		/obj/item/storage/box/syndie_kit/mail_counterfeit, // 2 TC
		/obj/item/storage/box/syndie_kit/mail_counterfeit, // 2 TC
		/obj/item/storage/mail_counterfeit_device/advanced, // 2 TC?
		/obj/item/storage/mail_counterfeit_device/advanced, // 2 TC?
		/obj/item/storage/mail_counterfeit_device/advanced, // 2 TC?
		/obj/item/storage/box/syndie_kit/syndifulton, // 6 TC
		/obj/item/storage/box/syndie_kit/syndifulton, // 6 TC
		/obj/item/storage/box/spongecapsules, // 7 TC
		/obj/item/gun/energy/pickpocket, // 8 TC
		/obj/item/anomaly_releaser, // 2 TC
		/obj/item/anomaly_releaser, // 2 TC
		)

/datum/s_voucher_set/implant_man_kit // 79 TC
	name = "Implant Man Kit"
	description = "Probably the strangest kit available to our operatives, you'll be a certified robo-operative. \
			Contains a wide-variety of implants, including several offensive, defensive, and utility-based implants. \
			You'll have everything you'll need to really cause problems without any backpack clutter."
	icon = 'icons/obj/medical/syringe.dmi'
	icon_state = "implanter0"
	set_items = list(
		/obj/item/implanter/freedom, // 5 TC
		/obj/item/implanter/emp, // 1 TC
		/obj/item/implanter/explosive, // 2 TC
		/obj/item/implanter/storage, // 8 TC
		/obj/item/implanter/dnascramble, // 5 TC
		/obj/item/implanter/camouflage, // 16 TC
		/obj/item/implanter/robusttec, // 8 TC
		/obj/item/implanter/tactical_deniability/deluxe, // 10 TC
		/obj/item/autosurgeon/syndicate/esword/hidden/single_use, // 10 TC
		/obj/item/implanter/empshield, // 4 TC
		/obj/item/implanter/tesla, // 2 TC
		/obj/item/implanter/wasps, // 2 TC
		/obj/item/implanter/scram, // 6 TC
		)

/datum/s_voucher_set/fake_centcom_kit // 43 TC
	name = "Central Impersonator Kit"
	description = "Developed as a tactical espionage kit after previous operatives before you came up with this idea. \
			It contains nearly everything you'll need to disguise yourself as a representative of NT's Central Command. \
			It also comes with a modified CentCom MODsuit, and a freedom implanter."
	icon = 'icons/obj/clothing/under/centcom.dmi'
	icon_state = "officer"
	set_items = list(
		/obj/item/storage/box/syndie_kit/centcom_costume_better, // 30 TC
		/obj/item/mod/control/pre_equipped/corporate/traitor, // 8 TC
		/obj/item/implanter/freedom, // 5 TC
		)

/datum/s_voucher_set/standard_gl_kit // 54 TC
	name = "Standard Grenade Launcher Kit"
	description = "One of our favorites amongst those who love chemistry. \
			Contains a single Grenade Launcher, a Grenadier's Belt, and several pouches of various grenades."
	icon = 'icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "riotgun"
	set_items = list(
		/obj/item/gun/grenadelauncher, // 6 TC
		/obj/item/storage/belt/grenade/full, // 20 TC
		/obj/item/grenade/spawnergrenade/minisyndies, // 8 TC
		/obj/item/ammo_box/nadepouch/stingbang, // 4 TC
		/obj/item/ammo_box/nadepouch/frag, // 7 TC
		/obj/item/ammo_box/nadepouch/rads, // 4 TC
		/obj/item/ammo_box/nadepouch/highacidfoam, // 5 TC
		)

// Syndicate Classes below

/datum/s_voucher_set/class_grenadier_kit // 54 TC~~
	name = "Grenadier Class Kit"
	description = "Not to be confused with the 'Standard Grenade Launcher Kit', this kit contains \
			a much more standardized and reliable loadout. \
			Contains a Rigil Grenade Launcher, a pouch of stingbangs and fragmentation grenades, \
			4 boxes of 40mm grenades, and some variety 40mm grenades to spice things up."
	icon = 'hypermods/icons/obj/weapons/guns/64x32.dmi'
	icon_state = "grenade_launcher"
	set_items = list(
		/obj/item/gun/ballistic/rigil_gl, // 6 TC~~
		/obj/item/ammo_box/nadepouch/stingbang, //4 TC
		/obj/item/ammo_box/nadepouch/frag, // 7 TC
		/obj/item/ammo_box/a40mm, // 2TC
		/obj/item/ammo_box/a40mm, // 2TC
		/obj/item/ammo_box/a40mm, // 2TC
		/obj/item/ammo_box/a40mm, // 2TC
		/obj/item/ammo_box/a40mm/shocker, // 7 TC
		/obj/item/ammo_box/a40mm/spread, // 6 TC
		/obj/item/ammo_box/a40mm/sucking, // 6 TC
		/obj/item/ammo_box/a40mm/nuke, // 10 TC
		)

/datum/s_voucher_set/heavy_weapons_kit // 57 TC~~
	name = "Heavy Weapons Class Kit"
	description = "For operatives that aren't afraid of the frontline. \
			Contains a Antares LMG with a 100 round magazine of 7mm ammunition. \
			Also contains SIX additional magazines and an energy shield module."
	icon = 'hypermods/icons/obj/weapons/guns/64x32.dmi'
	icon_state = "lmg"
	set_items = list(
		/obj/item/gun/ballistic/automatic/antares, // 20 TC?
		/obj/item/ammo_box/magazine/r7mm, // 4 TC~~
		/obj/item/ammo_box/magazine/r7mm, // 4 TC~~
		/obj/item/ammo_box/magazine/r7mm/hollow, // 5 TC~~
		/obj/item/ammo_box/magazine/r7mm/ap, // 6 TC~~
		/obj/item/ammo_box/magazine/r7mm/incen, // 5 TC~~
		/obj/item/ammo_box/magazine/r7mm/match, // 5 TC~~
		/obj/item/mod/module/energy_shield, // 8 TC
		)

/datum/s_voucher_set/assault_trooper_kit // 52 TC
	name = "Assault Trooper Class Kit"
	description = "A no-nonsense loadout for a counter-strike \
			Contains a Sirius Assault rifle with a 30 round magazine of 7.12x82 ammunition. \
			Also contains three additional magazines, two AP magazines, and one magazine each of HP and Incendiary. \
			Comes with one FRAGmentation grenade, a pouch of regular frag grenades, a pouch of flashbangs, \
			and two breaching charges."
	icon = 'hypermods/icons/obj/weapons/guns/64x32.dmi'
	icon_state = "assault_rifle"
	set_items = list(
		/obj/item/gun/ballistic/automatic/sirius, // 13 TC?
		/obj/item/ammo_box/magazine/ak712x82, // 3 TC
		/obj/item/ammo_box/magazine/ak712x82, // 3 TC
		/obj/item/ammo_box/magazine/ak712x82, // 3 TC
		/obj/item/ammo_box/magazine/ak712x82/ap, // 4 TC
		/obj/item/ammo_box/magazine/ak712x82/ap, // 4 TC
		/obj/item/ammo_box/magazine/ak712x82/hp, // 4 TC
		/obj/item/ammo_box/magazine/ak712x82/incendiary, // 4 TC
		/obj/item/grenade/frag/mega, // 3 TC
		/obj/item/ammo_box/nadepouch/frag, // 7 TC
		/obj/item/ammo_box/nadepouch/flashbang, // 2 TC
		/obj/item/grenade/c4/breaching, // 1 TC
		/obj/item/grenade/c4/breaching, // 1 TC
		)

/datum/s_voucher_set/field_medic_kit // 55 TC
	name = "Field Medic Class Kit"
	description = "Most operatives simply buy their own medicine, but if you want to double-down.... \
			Contains a Veritate PDW with five spare magazines, a Premium Medical Suite, a Gorlex Hypospray, \
			a Hypospray Kit, and a Deluxe Combi-Stimpack bag."
	icon = 'hypermods/icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "vector"
	set_items = list(
		/obj/item/gun/ballistic/automatic/veritate, // 12 TC~~
		/obj/item/ammo_box/magazine/smgm9mm, // 2 TC~~
		/obj/item/ammo_box/magazine/smgm9mm, // 2 TC~~
		/obj/item/ammo_box/magazine/smgm9mm, // 2 TC~~
		/obj/item/ammo_box/magazine/smgm9mm, // 2 TC~~
		/obj/item/ammo_box/magazine/smgm9mm, // 2 TC~~
		/obj/item/storage/medkit/tactical/premium, // 15 TC
		/obj/item/reagent_containers/hypospray/gorlex, // 8 TC
		/obj/item/storage/medkit/hypospray, // 4 TC
		/obj/item/storage/bag/chemistry/syndimedipens/deluxe, // 6 TC
		)

/datum/s_voucher_set/infiltrator_kit // 45 TC?
	name = "Infiltrator Class Kit"
	description = "If you want to sneak onto the station/ship and subvert the AI, snatch the nuke disk or other useful items, \
			and/or commit other acts of sabotage, this is a good loadout. \
			Contains a Cobra loaded with tranquilizers with four spare tranquilizer magazines, an EMAG, \
			a Doorjack, a Chameleon Projector, a Chameleon Kit, an Advanced Mulligan, a Chameleon Module, and a surplus pinpointer."
	icon = 'hypermods/icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "Cobra"
	set_items = list(
		/obj/item/gun/ballistic/automatic/pistol/cobra/tranq, // 9 TC (7 + 2)
		/obj/item/ammo_box/magazine/m45/tranq, // 4 TC
		/obj/item/ammo_box/magazine/m45/tranq, // 4 TC
		/obj/item/ammo_box/magazine/m45/tranq, // 4 TC
		/obj/item/ammo_box/magazine/m45/tranq, // 4 TC
		/obj/item/card/emag, // 4 TC
		/obj/item/card/emag/doorjack, // 3 TC
		/obj/item/chameleon, // 7 TC
		/obj/item/storage/box/syndie_kit/chameleon, // 2 TC (also contains a voice mask)
		/obj/item/adv_mulligan, // 7 TC? This shit kinda op for a nukeop
		/obj/item/mod/module/chameleon, // 2 TC
		/obj/item/pinpointer/nuke/syndicate, // 2 TC
		)

/datum/s_voucher_set/scout_kit // 42 TC~~
	name = "Scout Class Kit"
	description = "This is basically designed for flanking. Go in invisible, strike their rear in close quarters, \
			disappear again once you're done or you need to tactically withdraw. \
			Contains a Bellatrix submachine gun using 9mm rounds with five spare magazines, a Doorjack, a Cloaking Device, \
			a Light Breaker, and a surplus pinpointer."
	icon = 'hypermods/icons/obj/weapons/guns/48x32.dmi'
	icon_state = "mp52"
	set_items = list(
		/obj/item/gun/ballistic/automatic/bellatrix, // 12 TC~~
		/obj/item/ammo_box/magazine/smgm9mm, // 2 TC~~
		/obj/item/ammo_box/magazine/smgm9mm, // 2 TC~~
		/obj/item/ammo_box/magazine/smgm9mm, // 2 TC~~
		/obj/item/ammo_box/magazine/smgm9mm, // 2 TC~~
		/obj/item/ammo_box/magazine/smgm9mm, // 2 TC~~
		/obj/item/card/emag/doorjack, // 3 TC
		/obj/item/cloaking_device, // 14 TC
		/obj/item/lightbreaker, // 4 TC
		/obj/item/pinpointer/nuke/syndicate, // 2 TC
		)

/datum/s_voucher_set/flamethrower_kit // 46 TC~~
	name = "Firebrand Class Kit"
	description = "The ultimate loadout for systematic suppression of carbon lifeforms in close quarters. \
			Contains a certified Vega Flamethrower filled with CLF3 and Nitric Acid, an Elite MODsuit with a flamethrower attachment, \
			a Stechkin APS machine pistol, two incendiary magazines, a minibomb, a stimulant syringe, \
			two pouches of incendiary grenades, and a single fireaxe."
	icon = 'hypermods/icons/obj/weapons/guns/water.dmi'
	icon_state = "syndthrower1"
	set_items = list(
		/obj/item/storage/backpack/duffelbag/syndie/firestarter, // 20 TC
		/obj/item/gun/water/nukeop, // 10 TC~~
		/obj/item/ammo_box/nadepouch/incendiary, // 4 TC
		/obj/item/ammo_box/nadepouch/incendiary, // 4 TC
		/obj/item/fireaxe, // 8 TC~~
		)

/datum/s_voucher_set/engineer_kit // 49 TC?
	name = "Engineer Class Kit"
	description = "Makin' bacon. \
			Contains disposable sentry gun, a genuine SPES shotgun with three boxes of buckshot, \
			and a full belt of power tools including a single pair of jaws of life and a syndicate RCD."
	icon = 'icons/obj/weapons/turrets.dmi'
	icon_state = "toolbox_lethal"
	set_items = list(
		/obj/item/storage/toolbox/emergency/turret/nukie, // 16 TC
		/obj/item/storage/toolbox/guncase/spes, // 13 TC
		/obj/item/storage/belt/utility/full/powertools/syndircd, // 20 TC?
		)

/datum/s_voucher_set/marksman_kit // 47 TC?
	name = "Marksman Class Kit"
	description = "Snipe people coming onto the scene before they ever see you. \
			Contains a Betelgeuse sniper rifle with an 8x scope and plenty of ammunition for sustained snipers. \
			Also comes with a pair of thermal goggles for target tracking."
	icon = 'hypermods/icons/obj/weapons/guns/64x32.dmi'
	icon_state = "sniper"
	set_items = list(
		/obj/item/ammo_box/magazine/sniper_rounds/betelgeuse, // 14 TC?
		/obj/item/ammo_box/magazine/sniper_rounds, // 2 TC
		/obj/item/ammo_box/magazine/sniper_rounds, // 2 TC
		/obj/item/ammo_box/magazine/sniper_rounds, // 2 TC
		/obj/item/ammo_box/magazine/sniper_rounds/penetrator, // 4 TC
		/obj/item/ammo_box/magazine/sniper_rounds/penetrator, // 4 TC
		/obj/item/ammo_box/magazine/sniper_rounds/penetrator, // 4 TC
		/obj/item/ammo_box/magazine/sniper_rounds/incendiary, // 4 TC
		/obj/item/ammo_box/magazine/sniper_rounds/disruptor, // 2 TC
		/obj/item/ammo_box/magazine/sniper_rounds/marksman, // 5 TC
		/obj/item/clothing/glasses/thermal/syndi, // 4 TC
		)

/datum/s_voucher_set/energy_knight_kit // 43 TC?
	name = "Energy Knight Class Kit"
	description = "Go medieval with a huge sword with escalating damage. \
			Contains the fabled Hadar heavy power-sword, a more powerful energy sword that becomes even better when used! \
			Also contains a Cybersun Juggernaut MODsuit for maximum defense."
	icon = 'hypermods/icons/obj/weapons/heavy_power_sword.dmi'
	icon_state = "hadar_sword2_low"
	set_items = list(
		/obj/item/storage/toolbox/guncase/hadar, // 25 TC?
		/obj/item/mod/control/pre_equipped/juggernaut, // 18 TC
		)
