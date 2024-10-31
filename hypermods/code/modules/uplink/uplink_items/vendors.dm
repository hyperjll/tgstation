/datum/uplink_category/vendors
	name = "Currency Reliant"
	weight = 3

/datum/uplink_item/vendors
	category = /datum/uplink_category/vendors
	uplink_item_flags = SYNDIE_ILLEGAL_TECH


/datum/uplink_item/vendors/liberation
	name = "Liberation Station"
	desc = "A big, clunky 'liberation' vending machine that's sponsored by the big dogs themselves! \
			It's got all the things you could ever want: Junk Food, Beer, Ammunition, and Firearms galore! \
			It's been reinforced with the best armor plating we could muster to ensure your precious goods aren't disposed of easily."
	progression_minimum = 50 MINUTES
	cant_discount = TRUE
	item = /obj/machinery/vending/liberationinvuln
	cost = 14 // 3 TC per 5k credits, gun purchases are each 5k.
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	var/pod_item = /obj/machinery/vending/liberationinvuln

/datum/uplink_item/vendors/liberation/spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/obj/machinery/vending/liberationinvuln/poditem = new pod_item()
	if(!istype(poditem))
		CRASH("uplink produced the wrong item instead of the [pod_item].")

	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = poditem,
	))
	return source //For log icon


/datum/uplink_item/vendors/cybermed
	name = "CyberMed ++"
	desc = "A big, clunky medical item vendor containing quality medicine and medical equipment for low prices! \
			All proceeds go to US."
	cant_discount = TRUE
	item = /obj/machinery/vending/medical/syndicate/cybersun
	cost = 6
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	var/pod_item = /obj/machinery/vending/medical/syndicate/cybersun

/datum/uplink_item/vendors/cybermed/spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/obj/machinery/vending/medical/syndicate/cybersun/poditem = new pod_item()
	if(!istype(poditem))
		CRASH("uplink produced the wrong item instead of the [pod_item].")

	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = poditem,
	))
	return source //For log icon


/datum/uplink_item/vendors/donksofttoyvendor
	name = "Donksoft Toy Vendor"
	desc = "One of Donk Co.'s popular toy vending machines, contains an assortment of fun toys that mimic real contraband. \
			Sponsored by Donk Co."
	cant_discount = TRUE
	item = /obj/machinery/vending/donksofttoyvendor
	cost = 2
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	var/pod_item = /obj/machinery/vending/donksofttoyvendor

/datum/uplink_item/vendors/donksofttoyvendor/spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/obj/machinery/vending/donksofttoyvendor/poditem = new pod_item()
	if(!istype(poditem))
		CRASH("uplink produced the wrong item instead of the [pod_item].")

	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = poditem,
	))
	return source //For log icon


/datum/uplink_item/vendors/toyliberation
	name = "Donksoft Liberation Station"
	desc = "One of Donk Co.'s more nefarious toy vending machines, contains an assortment of fun toys that mimic real contraband. \
			Most guns come loaded with riot darts, and boxes of riot darts are available for purchase. Sponsored by Donk Co."
	progression_minimum = 10 MINUTES
	cant_discount = TRUE
	item = /obj/machinery/vending/toyliberationstation
	cost = 8
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	var/pod_item = /obj/machinery/vending/toyliberationstation

/datum/uplink_item/vendors/toyliberation/spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/obj/machinery/vending/toyliberationstation/poditem = new pod_item()
	if(!istype(poditem))
		CRASH("uplink produced the wrong item instead of the [pod_item].")

	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = poditem,
	))
	return source //For log icon


/datum/uplink_item/vendors/donksnack
	name = "Donk Co. Vendor"
	desc = "One of Donk Co.'s highly prized donkpocket vendors! Comes with (nearly) all flavors of the donk pocket, right from the comfort of the vending machine! \
			Purchasing donk pockets in bulk is also an option from this vendor."
	cant_discount = TRUE
	item = /obj/machinery/vending/donksnack
	cost = 3
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	var/pod_item = /obj/machinery/vending/donksnack

/datum/uplink_item/vendors/donksnack/spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/obj/machinery/vending/donksnack/poditem = new pod_item()
	if(!istype(poditem))
		CRASH("uplink produced the wrong item instead of the [pod_item].")

	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = poditem,
	))
	return source //For log icon


/datum/uplink_item/vendors/cent_wardrobe
	name = "CentCom Wardrobe"
	desc = "A wardrobe vending machine smuggled away from Nanotrasen's supply lines after continuous raids upon cargo vessels. \
			It contains a wide variety of official attire members of Nanotrasen's Central Command are well-known for."
	progression_minimum = 90 MINUTES
	cant_discount = TRUE
	item = /obj/machinery/vending/wardrobe/cent_wardrobe
	cost = 10 // This can lead to a shitton of fuckery.
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	var/pod_item = /obj/machinery/vending/wardrobe/cent_wardrobe

/datum/uplink_item/vendors/cent_wardrobe/spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/obj/machinery/vending/wardrobe/cent_wardrobe/poditem = new pod_item()
	if(!istype(poditem))
		CRASH("uplink produced the wrong item instead of the [pod_item].")

	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = poditem,
	))
	return source //For log icon


/datum/uplink_item/vendors/syndichem
	name = "SyndiChem"
	desc = "A popular vending machine available on syndicate bases across the galaxy. \
			They contain a wide variety of useful assembly parts and grenade casings for the aspiring chemist."
	progression_minimum = 7 MINUTES
	cant_discount = TRUE
	item = /obj/machinery/vending/syndichem
	cost = 6
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	var/pod_item = /obj/machinery/vending/syndichem

/datum/uplink_item/vendors/syndichem/spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/obj/machinery/vending/syndichem/poditem = new pod_item()
	if(!istype(poditem))
		CRASH("uplink produced the wrong item instead of the [pod_item].")

	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = poditem,
	))
	return source //For log icon


/datum/uplink_item/vendors/hotdog
	name = "Hotdoggo-Vend"
	desc = "A popular vending machine that's since gone out-of-date, it's prizes will likely reflect this. \
			Contains a wide variety of hotdogs, sausages and sauces at your conveinence. \
			Hotdogs from this vendor are said to have been made with love."
	cant_discount = TRUE
	item = /obj/machinery/vending/hotdog
	cost = 5
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	var/pod_item = /obj/machinery/vending/hotdog

/datum/uplink_item/vendors/hotdog/spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/obj/machinery/vending/hotdog/poditem = new pod_item()
	if(!istype(poditem))
		CRASH("uplink produced the wrong item instead of the [pod_item].")

	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = poditem,
	))
	return source //For log icon


/datum/uplink_item/vendors/ammovend
	name = "Ammunition Vendor"
	desc = "A favorite amongst would-be terrorists and agents alike! \
			This vendor has a wide assortment of ready-to-go ammunition for syndicate ballistic weaponry for all the agents out there! \
			Prices tend to be a bit expensive, and all proceeds are going right to us!"
	progression_minimum = 20 MINUTES
	cant_discount = TRUE
	item = /obj/machinery/vending/syndiammo
	cost = 10
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	var/pod_item = /obj/machinery/vending/syndiammo

/datum/uplink_item/vendors/ammovend/spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/obj/machinery/vending/syndiammo/poditem = new pod_item()
	if(!istype(poditem))
		CRASH("uplink produced the wrong item instead of the [pod_item].")

	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = poditem,
	))
	return source //For log icon

/**
/datum/uplink_item/vendors/
	name = ""
	desc = ""
	progression_minimum = 20 MINUTES
	cant_discount = TRUE
	item = /obj/machinery/vending/
	cost =
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	var/pod_item = /obj/machinery/vending/

/datum/uplink_item/vendors//spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/poditem = new pod_item()
	if(!istype(poditem))
		CRASH("uplink produced the wrong item instead of the [pod_item].")

	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = poditem,
	))
	return source //For log icon


**/

