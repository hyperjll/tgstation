/obj/item/card/mining_point_card/thousand
	points = 1000

/obj/item/card/mining_point_card/twofifty
	points = 250


/obj/machinery/computer/order_console/syndicate_voucher
	name = "syndicate requisitions machine"
	desc = "A high-durability requisitions machine which dispenses specialized equipment loadouts. Requires a requisition voucher to acquire anything from it."
	icon = 'hypermods/icons/obj/machines/voucher_machine.dmi'
	icon_state = "voucher"
	icon_keyboard = null
	icon_screen = null
	circuit = null
	armor = list(MELEE = 100, BULLET = 100, LASER = 100, ENERGY = 100, BOMB = 50, BIO = 50, RAD = 50, FIRE = 100, ACID = 75)

/obj/machinery/computer/order_console/syndicate_voucher/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/voucher_redeemer, /obj/item/syndicate_voucher, /datum/voucher_set/nukies)

/obj/machinery/computer/order_console/syndicate_voucher/update_icon_state()
	icon_state = "[initial(icon_state)][powered() ? null : "-off"]"
	return ..()

/obj/item/syndicate_voucher
	name = "requisitions voucher"
	desc = "A voucher to be used at special equipment vendor found on syndicate operative bases. Just looking at that golden sheen makes your innards flutter with excitement."
	icon = 'hypermods/icons/obj/machines/voucher_machine.dmi'
	icon_state = "voucher_token"
	w_class = WEIGHT_CLASS_TINY
