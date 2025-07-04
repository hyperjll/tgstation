// File ordered by progression

/datum/uplink_category/suits
	name = "Space Suits"
	weight = 11

/datum/uplink_item/suits
	category = /datum/uplink_category/suits
	surplus = 40

/datum/uplink_item/suits/infiltrator_bundle
	name = "Infiltrator MODsuit"
	desc = "Developed by the Roseus Galactic Actors Guild in conjunction with the Gorlex Marauders to produce a functional suit for urban operations, \
			this suit proves to be cheaper than your standard issue MODsuit, with none of the movement restrictions of the space suits employed by the company. \
			However, this greater mobility comes at a cost, and the suit is ineffective at protecting the wearer from the vacuum of space. \
			The suit does come pre-equipped with a special psi-emitter stealth module that makes it impossible to recognize the wearer \
			as well as causing significant demoralization amongst Nanotrasen crew."
	item = /obj/item/mod/control/pre_equipped/infiltrator
	cost = 6
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/suits/space_suit
	name = "Syndicate Space Suit"
	desc = "This red and black Syndicate space suit is less encumbering than Nanotrasen variants, \
			fits inside bags, and has a weapon slot. Nanotrasen crew members are trained to report red space suit \
			sightings, however."
	item = /obj/item/storage/box/syndie_kit/space
	cost = 2

/datum/uplink_item/suits/modsuit
	name = "Syndicate MODsuit"
	desc = "The feared MODsuit of a Syndicate agent. Features armoring and a set of inbuilt modules including the following: \
			A Shock Absorber, DNA Lock, Jetpack, Jump Jet, Syndicate Storage Module, and much more! Spacefaring ability included!"
	item = /obj/item/mod/control/pre_equipped/traitor
	cost = 8
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS //you can't buy it in nuke, because the elite modsuit costs the same while being better
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/suits/modsuit/elite_traitor
	name = "Elite Syndicate MODsuit"
	desc = "An upgraded, elite version of the Syndicate MODsuit. It features fireproofing, and also \
			provides the user with superior armor and mobility compared to the standard Syndicate MODsuit."
	item = /obj/item/mod/control/pre_equipped/traitor_elite
	// This one costs more than the nuke op counterpart
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	progression_minimum = 30 MINUTES
	cost = 16
	cant_discount = TRUE
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND
