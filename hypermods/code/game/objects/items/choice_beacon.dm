/obj/item/choice_beacon/brothers
	name = "suspicious beacon"
	desc = "Claim your special packages here, just mind any on-lookers."
	icon = 'hypermods/icons/obj/devices/remote.dmi'
	icon_state = "bbuplink"
	inhand_icon_state = "icra_delivery"
	company_source = "Cybersun Industries"
	company_message = span_bold("Good luck, future agent!")
	w_class = WEIGHT_CLASS_TINY

/obj/item/choice_beacon/brothers/generate_display_names()
	var/static/list/bb_kits
	if(!bb_kits)
		bb_kits = list()
		var/list/possible_bb_kits = list(
			/obj/item/storage/box/syndie_kit/observe,
			/obj/item/storage/box/syndie_kit/disruptor,
			/obj/item/storage/box/syndie_kit/anatomy,
			/obj/item/storage/box/syndie_kit/breacher,
			/obj/item/storage/box/syndie_kit/chameleondeluxe,
			/obj/item/storage/box/syndie_kit/communicator,
			/obj/item/storage/box/syndie_kit/sleeper,
			/obj/item/storage/box/syndie_kit/smuggler,
		)
		for(var/obj/item/storage/box/syndie_kit/bb_kit as anything in possible_bb_kits)
			bb_kits[initial(bb_kit.name)] = bb_kit
	return bb_kits
