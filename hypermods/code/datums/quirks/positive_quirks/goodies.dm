/datum/quirk/item_quirk/goodies
	name = "Goodie Smuggler"
	desc = "Just before your trip, you got a bit scared and decided to prepare for the worst. You'll be bringing something extra with you aboard Space Station 13."
	icon = FA_ICON_BRIEFCASE
	value = 8
	medical_record_text = "Patient exhibits an almost supernatural ability to sense incoming 'potential' danger, and is often driven to prepare in advance."
	//mail_goodies = list()

/datum/quirk/item_quirk/goodies/add_unique(client/client_source)
	var/list/item_list = list(
		/obj/item/storage/box/randomcyberneticimplants,
		/obj/item/antag_spawner/nanotrasen/assistant,
		/obj/item/storage/medkit/regular,
		/obj/item/storage/medkit/brute,
		/obj/item/storage/medkit/fire,
		/obj/item/storage/medkit/toxin,
		/obj/item/storage/medkit/o2,
		/obj/item/storage/pill_bottle/tricordrazine,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/clothing/suit/armor/vest/old,
		/obj/item/defibrillator/compact/loaded,
		/obj/item/reagent_containers/hypospray/buyable
	)

	var/item_to_give = pick(item_list)

	give_item_to_holder(item_to_give, list(LOCATION_BACKPACK = ITEM_SLOT_BACKPACK, LOCATION_HANDS = ITEM_SLOT_HANDS))
