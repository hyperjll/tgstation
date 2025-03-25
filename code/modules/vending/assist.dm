/obj/machinery/vending/assist
	name = "\improper Part-Mart"
	desc = "All the finest of miscellaneous electronics one could ever need! Not responsible for any injuries caused by reckless misuse of parts."
	icon_state = "parts"
	icon_deny = "parts-deny"
	panel_type = "panel10"
	products = list(
		/obj/item/assembly/igniter = 3,
		/obj/item/assembly/prox_sensor = 5,
		/obj/item/assembly/signaler = 4,
		/obj/item/computer_disk/ordnance = 4,
		/obj/item/stock_parts/capacitor = 3,
		/obj/item/stock_parts/servo = 3,
		/obj/item/stock_parts/matter_bin = 3,
		/obj/item/stock_parts/micro_laser = 3,
		/obj/item/stock_parts/scanning_module = 3,
		/obj/item/wirecutters = 1,
		/obj/item/screwdriver = 1,
		/obj/item/weldingtool/mini = 1,
		/obj/item/stock_parts/power_store/cell/empty = 4,
		/obj/item/stack/sheet/iron/five = 10,
		/obj/item/stack/sheet/glass = 10,
		/obj/item/stack/cable_coil = 3,
		/obj/item/extinguisher/mini = 3,
		/obj/item/hand_labeler = 2,
		/obj/item/rcd_ammo = 3,
		/obj/item/reagent_containers/cup/beaker/large = 2,
		/obj/item/reagent_containers/cup/bucket = 1,
		/obj/item/radio/off = 5,
		/obj/item/flashlight = 5,
	)
	contraband = list(
		/obj/item/assembly/health = 10,
		/obj/item/assembly/timer = 10,
		/obj/item/assembly/voice = 10,
		/obj/item/stock_parts/power_store/cell/high = 1,
		/obj/item/stock_parts/power_store/battery/high = 1,
		/obj/item/market_uplink/blackmarket = 1,
		/obj/item/ammo_casing/shotgun/beanbag = 10,
		/obj/item/clothing/gloves/color/fyellow = 4,
	)
	premium = list(
		/obj/item/assembly/igniter/condenser = 2,
		/obj/item/circuitboard/machine/vendor = 3,
		/obj/item/universal_scanner = 3,
		/obj/item/vending_refill/custom = 3,
		/obj/item/assembly/infra = 1,
		/obj/item/analyzer = 1,
		/obj/item/electronics/airlock = 5,
		/obj/item/multitool = 1,
	)

	refill_canister = /obj/item/vending_refill/assist
	product_ads = "Only the finest!;Have some tools.;The most robust equipment.;The finest gear in space!"
	default_price = PAYCHECK_CREW * 0.7 //Default of 35.
	extra_price = PAYCHECK_CREW
	payment_department = NO_FREEBIES
	light_mask = "parts-light-mask"

	emagvendorreplace = TRUE
	replacewith = /obj/machinery/vending/emagged/assist

/obj/item/vending_refill/assist
	machine_name = "Part-Mart"
	icon_state = "refill_parts"
