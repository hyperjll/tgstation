/obj/item/gun/ballistic/rifle/sniper_rifle/hristov
	name = "\improper Hristov"
	desc = "A long ranged weapon that does significant damage. Often found in the hands of Nanotrasen's snipers. Has an internal magazine."
	icon = 'hypermods/icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "Hristov"
	inhand_icon_state = "hristov"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	fire_sound_volume = 90
	vary_fire_sound = FALSE
	internal_magazine = TRUE
	recoil = 2
	rack_delay = 1 SECONDS
	weapon_weight = WEAPON_HEAVY
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/hristov
	spread = 0
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK
	actions_types = list()
	bolt_type = BOLT_TYPE_LOCKING
	bolt_locked = FALSE
	can_suppress = FALSE
	mag_display = FALSE
	tac_reloads = FALSE
	semi_auto = FALSE
	custom_price = 10000
	worn_icon = 'hypermods/icons/mob/clothing/back.dmi'

/obj/item/gun/ballistic/rifle/sniper_rifle/hristov/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 4) //enough range to at least make extremely good use of the penetrator rounds

/obj/item/gun/ballistic/rifle/sniper_rifle/hristov/freshprint
	pin = null


/obj/item/gun/ballistic/rifle/hunting_rifle
	name = "old hunting rifle"
	desc = "The Kittiwake from Cormorant Precision Arms, a classic high-powered hunting and police rifle, reliable in almost any environment. This one shows years of use."
	icon = 'hypermods/icons/obj/weapons/guns/48x32.dmi'
	icon_state = "ohr"
	inhand_icon_state = "ohr"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	worn_icon = 'hypermods/icons/mob/clothing/back.dmi'

/obj/item/gun/ballistic/rifle/hunting_rifle/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 2)


/obj/item/ammo_box/magazine/sniper_rounds/betelgeuse
	name = "\improper Betelgeuse sniper rifle"
	desc = "A high end black-and-red sniper rifle developed by the Gorlex Marauders. Uses .50 BMG ammo."
	icon = 'hypermods/icons/obj/weapons/guns/64x32.dmi'
	icon_state = "sniper"
	inhand_icon_state = "sniper"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	actions_types = null // TOGGLING FIREMODE BREAKS THIS GUN FOR SOME FUCKING REASON.
	worn_icon = 'hypermods/icons/mob/clothing/back.dmi'

/obj/item/gun/ballistic/rifle/sniper_rifle/betelgeuse/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 8) //enough range to at least make extremely good use of the penetrator rounds
