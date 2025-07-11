/obj/machinery/vending/gifts
	name = "\improper Gift Vendor"
	desc = "A vending machine acting as a minature gift shop."
	icon = 'hypermods/icons/obj/machines/vending.dmi'
	icon_state = "gifts"
	icon_deny = "gifts-deny"
	product_ads = "Toys For All!;Oh its a Gift!;A Gift for Your Loved ones!;Purchase more Gifts, Now!"
	products = list(/obj/item/camera_film = 30,
					/obj/item/storage/photo_album = 5,
					/obj/item/hourglass = 2,
					/obj/item/toy/plush/bubbleplush = 2,
					/obj/item/toy/plush/narplush = 2,
					/obj/item/toy/plush/snakeplushie = 2,
					/obj/item/toy/plush/nukeplushie = 2,
					/obj/item/toy/plush/slimeplushie = 2,
					/obj/item/toy/plush/beeplushie = 2,
					/obj/item/instrument/accordion = 1,
					/obj/item/instrument/eguitar = 1,
					/obj/item/instrument/glockenspiel = 1,
					/obj/item/instrument/harmonica = 1,
					/obj/item/instrument/recorder = 1,
					/obj/item/instrument/saxophone = 1,
					/obj/item/instrument/trombone = 1,
					/obj/item/instrument/trumpet = 1,
					/obj/item/instrument/piano_synth = 1,
					/obj/item/instrument/banjo = 1,
					/obj/item/storage/backpack = 4,
					/obj/item/reagent_containers/syringe = 3,
					/obj/item/reagent_containers/cup/bottle/multiver = 1,
					/obj/item/reagent_containers/applicator/pill/epinephrine = 1,
					/obj/item/reagent_containers/cup/beaker/large = 2,
					/obj/item/flashlight = 3,
					/obj/item/flashlight/flare = 1,
					/obj/item/storage/toolbox/mechanical = 1,
					/obj/item/stack/cable_coil = 4)
	contraband = list(/obj/item/instrument/violin/golden = 1,
					  /obj/item/clothing/gloves/color/fyellow = 1,
					  /obj/item/airlock_painter = 1,
					  /obj/item/multitool = 1)
	refill_canister = /obj/item/vending_refill/gifts
	payment_department = ACCOUNT_SRV
	default_price = PAYCHECK_CREW
	extra_price = PAYCHECK_COMMAND


/obj/item/vending_refill/gifts
	machine_name = "Gift Vendor"
	icon_state = "refill_costume"
