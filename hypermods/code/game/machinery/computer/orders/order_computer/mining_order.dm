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

/obj/machinery/computer/order_console/syndicate_voucher/attackby(obj/item/weapon, mob/user, params)
	if(istype(weapon, /obj/item/syndicate_voucher))
		redeem_voucher(weapon, user)
		return
	return ..()

/obj/machinery/computer/order_console/syndicate_voucher/update_icon_state()
	icon_state = "[initial(icon_state)][powered() ? null : "-off"]"
	return ..()


/obj/machinery/computer/order_console/syndicate_voucher/proc/redeem_voucher(obj/item/syndicate_voucher/voucher, mob/redeemer)
	var/static/list/set_types
	if(!set_types)
		set_types = list()
		for(var/datum/s_voucher_set/static_set as anything in subtypesof(/datum/s_voucher_set))
			set_types[initial(static_set.name)] = new static_set

	var/list/items = list()
	for(var/set_name in set_types)
		var/datum/s_voucher_set/current_set = set_types[set_name]
		var/datum/radial_menu_choice/option = new
		option.image = image(icon = current_set.icon, icon_state = current_set.icon_state)
		option.info = span_boldnotice(current_set.description)
		items[set_name] = option

	var/selection = show_radial_menu(redeemer, src, items, custom_check = CALLBACK(src, PROC_REF(check_menu), voucher, redeemer), radius = 38, require_near = TRUE, tooltips = TRUE)
	if(!selection)
		return

	var/datum/s_voucher_set/chosen_set = set_types[selection]
	for(var/item in chosen_set.set_items)
		new item(drop_location())

	//SSblackbox.record_feedback("tally", "mining_voucher_redeemed", 1, selection)
	qdel(voucher)

/obj/machinery/computer/order_console/syndicate_voucher/proc/check_menu(obj/item/syndicate_voucher/voucher, mob/living/redeemer)
	if(!istype(redeemer))
		return FALSE
	if(redeemer.incapacitated)
		return FALSE
	if(QDELETED(voucher))
		return FALSE
	if(!redeemer.is_holding(voucher))
		return FALSE
	return TRUE


/obj/item/syndicate_voucher
	name = "requisitions voucher"
	desc = "A voucher to be used at special equipment vendor found on syndicate operative bases. Just looking at that golden sheen makes your innards flutter with excitement."
	icon = 'hypermods/icons/obj/machines/voucher_machine.dmi'
	icon_state = "voucher_token"
	w_class = WEIGHT_CLASS_TINY
