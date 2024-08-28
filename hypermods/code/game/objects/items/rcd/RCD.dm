/obj/item/construction/rcd/syndicate
	name = "syndicate RCD"
	desc = "A reverse-engineered RCD with black market upgrades that allow this device to deconstruct reinforced walls. Property of Donk Co."
	icon_state = "ircd"
	inhand_icon_state = "ircd"
	canRturf = TRUE
	max_matter = 1000

/obj/item/construction/rcd/syndicate/ranged
	name = "syndicate ARCD"
	desc = "A reverse-engineered RCD with black market upgrades that allow this device to deconstruct reinforced walls, all from a distance! Property of Donk Co."
	icon_state = "ircd"
	inhand_icon_state = "ircd"
	canRturf = TRUE
	max_matter = 1000
	ranged = TRUE

/obj/item/rcd_ammo/syndicate
	custom_materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*240, /datum/material/glass=SHEET_MATERIAL_AMOUNT*160)
	ammoamt = 1000

/obj/item/construction/rcd/borg/arcd
	name = "advanced rapid-construction-device (ARCD)"
	desc = "A prototype RCD with ranged capability but requires more energy to use."
	canRturf = TRUE
	delay_mod = 0.6
	ranged = TRUE
	icon_state = "arcd"
	inhand_icon_state = "oldrcd"
	energyfactor = 0.182 * STANDARD_CELL_CHARGE
	upgrade = RCD_ALL_UPGRADES & ~RCD_UPGRADE_SILO_LINK
