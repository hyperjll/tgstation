/obj/machinery/vending/wardrobe/cap_wardrobe
	name = "\improper CapDrobe"
	desc = "A vending machine for captain outfits."
	icon = 'hypermods/icons/obj/machines/vending.dmi'
	icon_state = "capdrobe"
	icon_deny = "capdrobe-deny"
	product_slogans = "Dress for success!;Suited and booted!;It's show time!;Why leave style up to fate? Use the Captain's Autodrobe!"
	vend_reply = "Thank you for using the CapDrobe!"
	products = list(/obj/item/clothing/under/rank/captain = 1,
					/obj/item/clothing/under/rank/captain/skirt = 1,
					/obj/item/clothing/under/rank/captain/parade = 1,
					/obj/item/clothing/suit/armor/vest/capcarapace = 1,
					/obj/item/clothing/suit/armor/vest/capcarapace/captains_formal = 1,
					/obj/item/clothing/suit/hooded/wintercoat/captain = 1,
					/obj/item/clothing/suit/jacket/capjacket = 1,
					/obj/item/clothing/glasses/sunglasses/gar/giga = 1,
					/obj/item/clothing/gloves/captain = 1,
					/obj/item/clothing/head/hats/caphat = 1,
					/obj/item/clothing/head/hats/caphat/parade = 1,
					/obj/item/clothing/neck/cloak/cap = 1,
					/obj/item/clothing/shoes/laceup = 1)
	premium = list(/obj/item/clothing/head/costume/crown/fancy = 1,
				   /obj/item/implanter/biosig = 1,
				   /obj/item/clothing/glasses/sunglasses = 1)
	contraband = list(/obj/item/storage/lockbox/loyalty = 1)
	refill_canister = /obj/item/vending_refill/capdrobe
	default_price = PAYCHECK_CREW
	extra_price = PAYCHECK_COMMAND
	payment_department = ACCOUNT_SEC

	emagvendorreplace = TRUE
	replacewith = /obj/machinery/vending/emagged/wardrobe/cap_wardrobe

/obj/item/vending_refill/capdrobe
	machine_name = "CapDrobe"
	icon_state = "refill_costume"
