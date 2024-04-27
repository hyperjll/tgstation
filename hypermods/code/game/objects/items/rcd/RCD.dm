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
