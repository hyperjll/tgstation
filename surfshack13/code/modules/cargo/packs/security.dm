/datum/supply_pack/security/armory/combatknives
	name = "Combat Knives Crate"
	desc = "Contains three sharpened combat knives. Each knife guaranteed to fit snugly inside any Nanotrasen-standard boot. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 4.5
	contains = list(/obj/item/knife/combat,
					/obj/item/knife/combat,
					/obj/item/knife/combat)
	crate_name = "combat knife crate"

/datum/supply_pack/imports/wt550
	name = "WT-550 Auto Rifle Crate"
	desc = "Contains two high-powered, semiautomatic rifles chambered in 4.6x30mm. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 7
	contains = list(
		/obj/item/gun/ballistic/automatic/wt550 = 2,
		/obj/item/ammo_box/magazine/wt550m9 = 2,
	)
	crate_name = "wt-550 auto rifle crate"

/datum/supply_pack/imports/wt550ammo
	name = "WT-550 Standard Ammo Crate"
	desc = "Contains four 20-round magazine for the WT-550 Auto Rifle. Each magazine is designed to facilitate rapid tactical reloads. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/ammo_box/magazine/wt550m9 = 4)
	crate_name = "wt-550 standard ammo crate"
