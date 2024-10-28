/obj/machinery/vending/emagged/assist
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
		/obj/item/storage/toolbox/mechanical = 2,
		/obj/item/storage/toolbox/electrical = 2,
		/obj/item/weldingtool/experimental = 1,
		/obj/item/stock_parts/power_store/cell/empty = 4,
		/obj/item/stack/sheet/iron/five = 10,
		/obj/item/stack/sheet/glass = 10,
		/obj/item/stack/cable_coil = 3,
		/obj/item/extinguisher/mini = 3,
		/obj/item/hand_labeler = 2,
		/obj/item/rcd_ammo = 3,
		/obj/item/storage/box/beakers/variety = 2,
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


/obj/machinery/vending/emagged/cart
	name = "\improper PTech"
	desc = "Cartridges for PDAs."
	product_slogans = "Carts to go!"
	icon_state = "cart"
	icon_deny = "cart-deny"
	panel_type = "panel6"
	products = list(
		/obj/item/computer_disk/medical = 10,
		/obj/item/computer_disk/engineering = 10,
		/obj/item/computer_disk/security = 10,
		/obj/item/computer_disk/ordnance = 10,
		/obj/item/computer_disk/quartermaster = 10,
		/obj/item/computer_disk/command/captain = 3,
		/obj/item/modular_computer/pda = 10,
		/obj/item/modular_computer/pda/syndicate = 1,
		/obj/item/computer_disk/black_market/trap = 1,
	)
	refill_canister = /obj/item/vending_refill/cart
	default_price = PAYCHECK_COMMAND
	extra_price = PAYCHECK_COMMAND * 2.5
	payment_department = ACCOUNT_SRV
	light_mask = "cart-light-mask"


/obj/machinery/vending/emagged/cigarette
	name = "\improper ShadyCigs Deluxe"
	desc = "If you want to get cancer, might as well do it in style."
	product_slogans = "Space cigs taste good like a cigarette should.;I'd rather toolbox than switch.;Smoke!;Don't believe the reports - smoke today!"
	product_ads = "Probably not bad for you!;Don't believe the scientists!;It's good for you!;Don't quit, buy more!;Smoke!;Nicotine heaven.;Best cigarettes since 2150.;Award-winning cigs."
	icon_state = "cigs"
	panel_type = "panel5"
	products = list(
		/obj/item/storage/fancy/cigarettes = 5,
		/obj/item/storage/fancy/cigarettes/cigpack_candy = 4,
		/obj/item/storage/fancy/cigarettes/cigpack_uplift = 3,
		/obj/item/storage/fancy/cigarettes/cigpack_robust = 3,
		/obj/item/storage/fancy/cigarettes/cigpack_carp = 3,
		/obj/item/storage/fancy/cigarettes/cigpack_midori = 3,
		/obj/item/storage/box/matches = 10,
		/obj/item/lighter/greyscale = 4,
		/obj/item/storage/fancy/rollingpapers = 5,
		/obj/item/storage/fancy/cigarettes/cigpack_syndicate = 1,
	)
	contraband = list(
		/obj/item/vape = 5,
		/obj/item/cigarette/dart = 1,
		/obj/item/storage/fancy/cigarettes/deluxe_cureall_cigarette_pack = 1,
		/obj/item/storage/fancy/cigarettes/deluxe_speedup_cigarette_pack = 1,
	)
	premium = list(
		/obj/item/storage/fancy/cigarettes/cigpack_robustgold = 3,
		/obj/item/storage/box/gum/nicotine = 2,
		/obj/item/lighter = 3,
		/obj/item/storage/fancy/cigarettes/cigars = 1,
		/obj/item/storage/fancy/cigarettes/cigars/havana = 1,
		/obj/item/storage/fancy/cigarettes/cigars/cohiba = 1,
	)

	refill_canister = /obj/item/vending_refill/cigarette
	default_price = PAYCHECK_CREW
	extra_price = PAYCHECK_COMMAND
	payment_department = ACCOUNT_SRV
	light_mask = "cigs-light-mask"


/obj/machinery/vending/emagged/clothing
	name = "ClothesMate"
	desc = "A vending machine for clothing."
	icon_state = "clothes"
	icon_deny = "clothes-deny"
	panel_type = "panel15"
	product_slogans = "Dress for success!;Prepare to look swagalicious!;Look at all this swag!;Why leave style up to fate? Use the ClothesMate!"
	vend_reply = "Thank you for using the ClothesMate!"
	product_categories = list(
		list(
			"name" = "Head",
			"icon" = "hat-cowboy",
			"products" = list(
				/obj/item/clothing/head/wig/natural = 4,
				/obj/item/clothing/head/costume/fancy = 4,
				/obj/item/clothing/head/beanie = 8,
				/obj/item/clothing/head/beret = 10,
				/obj/item/clothing/mask/bandana = 3,
				/obj/item/clothing/mask/bandana/striped = 3,
				/obj/item/clothing/mask/bandana/skull = 3,
				/obj/item/clothing/mask/facescarf = 3,
				/obj/item/clothing/neck/scarf = 6,
				/obj/item/clothing/neck/large_scarf = 6,
				/obj/item/clothing/neck/large_scarf/red = 6,
				/obj/item/clothing/neck/large_scarf/green = 6,
				/obj/item/clothing/neck/large_scarf/blue = 6,
				/obj/item/clothing/neck/infinity_scarf = 6,
				/obj/item/clothing/neck/tie = 6,
				/obj/item/clothing/neck/bowtie = 6,
				/obj/item/clothing/head/rasta = 3,
				/obj/item/clothing/head/chaplain/kippah = 3,
				/obj/item/clothing/head/chaplain/taqiyah/red = 3,
				/obj/item/clothing/head/hats/tophat = 3,
				/obj/item/clothing/head/fedora = 3,
				/obj/item/clothing/head/hats/bowler = 3,
				/obj/item/clothing/head/cowboy/white = 3,
				/obj/item/clothing/head/cowboy/grey = 3,
				/obj/item/clothing/head/costume/sombrero/green = 3,
				/obj/item/clothing/head/costume/nightcap/blue = 3,
				/obj/item/clothing/head/costume/nightcap/red = 3,
			),
		),

		list(
			"name" = "Accessories",
			"icon" = "glasses",
			"products" = list(
				/obj/item/clothing/accessory/pride = 15,
				/obj/item/clothing/accessory/waistcoat = 4,
				/obj/item/clothing/suit/toggle/suspenders = 4,
				/obj/item/clothing/neck/tie/horrible = 3,
				/obj/item/clothing/glasses/regular = 3,
				/obj/item/clothing/glasses/regular/jamjar = 3,
				/obj/item/clothing/glasses/orange = 3,
				/obj/item/clothing/glasses/red = 3,
				/obj/item/clothing/glasses/monocle = 3,
				/obj/item/clothing/gloves/fingerless = 3,
				/obj/item/storage/belt/fannypack = 3,
				/obj/item/storage/belt/fannypack/blue = 3,
				/obj/item/storage/belt/fannypack/red = 3,
				/obj/item/storage/backpack/duffelbag/syndie = 3,
				/obj/item/storage/backpack/syndicate = 3,
			),
		),

		list(
			"name" = "Under",
			"icon" = "shirt",
			"products" = list(
				/obj/item/clothing/under/pants/slacks = 5,
				/obj/item/clothing/under/shorts = 5,
				/obj/item/clothing/under/pants/jeans = 5,
				/obj/item/clothing/under/shorts/jeanshorts = 5,
				/obj/item/clothing/under/costume/buttondown/slacks = 4,
				/obj/item/clothing/under/costume/buttondown/shorts = 4,
				/obj/item/clothing/under/costume/buttondown/skirt = 4,
				/obj/item/clothing/under/dress/sundress = 3,
				/obj/item/clothing/under/dress/tango = 3,
				/obj/item/clothing/under/dress/skirt/plaid = 4,
				/obj/item/clothing/under/dress/skirt/turtleskirt = 4,
				/obj/item/clothing/under/misc/overalls = 3,
				/obj/item/clothing/under/pants/camo = 3,
				/obj/item/clothing/under/pants/track = 3,
				/obj/item/clothing/under/costume/kilt = 3,
				/obj/item/clothing/under/dress/striped = 3,
				/obj/item/clothing/under/dress/sailor = 3,
				/obj/item/clothing/under/dress/eveninggown = 3,
				/obj/item/clothing/under/misc/pj/blue = 3,
				/obj/item/clothing/under/misc/pj/red = 3,
			),
		),

		list(
			"name" = "Suits & Skirts",
			"icon" = "vest",
			"products" = list(
				/obj/item/clothing/suit/toggle/jacket/sweater = 4,
				/obj/item/clothing/suit/jacket/oversized = 4,
				/obj/item/clothing/suit/jacket/fancy = 4,
				/obj/item/clothing/suit/toggle/lawyer/greyscale = 4,
				/obj/item/clothing/suit/hooded/wintercoat/custom = 3,
				/obj/item/clothing/suit/hooded/wintercoat = 3,
				/obj/item/clothing/under/suit/navy = 3,
				/obj/item/clothing/under/suit/black_really = 3,
				/obj/item/clothing/under/suit/burgundy = 3,
				/obj/item/clothing/under/suit/charcoal = 3,
				/obj/item/clothing/under/suit/white = 3,
				/obj/item/clothing/under/costume/buttondown/slacks/service = 4,
				/obj/item/clothing/under/costume/buttondown/skirt/service = 4,
				/obj/item/clothing/suit/jacket/bomber = 3,
				/obj/item/clothing/suit/jacket/puffer/vest = 3,
				/obj/item/clothing/suit/jacket/puffer = 3,
				/obj/item/clothing/suit/jacket/letterman = 3,
				/obj/item/clothing/suit/jacket/letterman_red = 3,
				/obj/item/clothing/suit/costume/hawaiian = 4,
				/obj/item/clothing/suit/costume/poncho = 3,
				/obj/item/clothing/under/dress/skirt = 3,
				/obj/item/clothing/under/suit/white/skirt = 3,
				/obj/item/clothing/under/rank/captain/suit/skirt = 2,
				/obj/item/clothing/under/rank/civilian/head_of_personnel/suit/skirt = 2,
				/obj/item/clothing/under/rank/civilian/purple_bartender = 2,
				/obj/item/clothing/suit/jacket/miljacket = 3,
				/obj/item/clothing/suit/apron/overalls = 3,
				/obj/item/clothing/suit/costume/wellworn_shirt = 2,
				/obj/item/clothing/suit/costume/wellworn_shirt/graphic = 2,
				/obj/item/clothing/suit/costume/wellworn_shirt/graphic/ian = 2,
				/obj/item/clothing/suit/costume/wellworn_shirt/wornout = 2,
				/obj/item/clothing/suit/costume/wellworn_shirt/wornout/graphic = 2,
				/obj/item/clothing/suit/costume/wellworn_shirt/wornout/graphic/ian = 2,
				/obj/item/clothing/suit/costume/wellworn_shirt/messy = 2,
				/obj/item/clothing/suit/costume/wellworn_shirt/messy/graphic = 2,
				/obj/item/clothing/suit/costume/wellworn_shirt/messy/graphic/ian = 2,
			),
		),

		list(
			"name" = "Shoes",
			"icon" = "socks",
			"products" = list(
				/obj/item/clothing/shoes/sneakers/black = 4,
				/obj/item/clothing/shoes/sneakers/white = 4,
				/obj/item/clothing/shoes/sandal = 3,
				/obj/item/clothing/shoes/laceup = 3,
				/obj/item/clothing/shoes/winterboots = 2,
				/obj/item/clothing/shoes/glow = 2,
				/obj/item/clothing/shoes/cowboy = 3,
				/obj/item/clothing/shoes/cowboy/white = 3,
				/obj/item/clothing/shoes/cowboy/black = 3,
			),
		),

		list(
			"name" = "Special",
			"icon" = "star",
			"products" = list(
				/obj/item/clothing/head/costume/football_helmet = 6,
				/obj/item/clothing/under/costume/football_suit = 6,
				/obj/item/clothing/suit/costume/football_armor = 6,

				/obj/item/clothing/suit/mothcoat = 3,
				/obj/item/clothing/suit/mothcoat/winter = 3,
				/obj/item/clothing/head/mothcap = 3,

				/obj/item/clothing/suit/hooded/ethereal_raincoat = 3,
				/obj/item/clothing/under/ethereal_tunic = 3,

				/obj/item/clothing/mask/kitsune = 3,
				/obj/item/clothing/mask/rebellion = 6,
				/obj/item/clothing/suit/costume/wellworn_shirt/graphic/ian = 1,
				/obj/item/clothing/head/costume/hairpin = 2,
				/obj/item/clothing/under/costume/yukata = 2,
				/obj/item/clothing/under/costume/yukata/green = 2,
				/obj/item/clothing/under/costume/yukata/white = 2,
				/obj/item/clothing/under/costume/kimono = 2,
				/obj/item/clothing/under/costume/kimono/red = 2,
				/obj/item/clothing/under/costume/kimono/purple = 2,
				/obj/item/clothing/shoes/sandal/alt = 4,
				/obj/item/clothing/suit/costume/irs = 20,
				/obj/item/clothing/head/costume/irs = 20,
				/obj/item/clothing/head/costume/tmc = 20,
				/obj/item/clothing/head/costume/deckers = 20,
				/obj/item/clothing/head/costume/yuri = 20,
				/obj/item/clothing/head/costume/allies = 20,
				/obj/item/clothing/glasses/osi = 20,
				/obj/item/clothing/glasses/phantom = 20,
				/obj/item/clothing/mask/gas/driscoll = 20,
				/obj/item/clothing/under/costume/yuri = 20,
				/obj/item/clothing/under/costume/dutch = 20,
				/obj/item/clothing/under/costume/osi = 20,
				/obj/item/clothing/under/costume/tmc = 20,
				/obj/item/clothing/suit/costume/deckers = 20,
				/obj/item/clothing/suit/costume/soviet = 20,
				/obj/item/clothing/suit/costume/yuri = 20,
				/obj/item/clothing/suit/costume/tmc = 20,
				/obj/item/clothing/suit/costume/pg = 20,
				/obj/item/clothing/shoes/jackbros = 20,
				/obj/item/clothing/shoes/saints = 20,
			),
		),
	)

	contraband = list(
		/obj/item/clothing/under/syndicate/tacticool = 2,
		/obj/item/clothing/under/syndicate/tacticool/skirt = 2,
		/obj/item/clothing/mask/balaclava = 3,
		/obj/item/clothing/head/costume/ushanka = 3,
		/obj/item/clothing/under/costume/soviet = 3,
		/obj/item/storage/belt/fannypack/black = 2,
		/obj/item/clothing/suit/jacket/letterman_syndie = 3,
		/obj/item/clothing/under/costume/jabroni = 3,
		/obj/item/clothing/under/costume/geisha = 3,
		/obj/item/clothing/under/rank/centcom/officer/replica = 2,
		/obj/item/clothing/under/rank/centcom/officer_skirt/replica = 2,
	)
	premium = list(/obj/item/clothing/under/suit/checkered = 3,
		/obj/item/clothing/head/costume/mailman = 3,
		/obj/item/clothing/under/misc/mailman = 3,
		/obj/item/clothing/suit/jacket/leather = 3,
		/obj/item/clothing/suit/jacket/leather/biker = 3,
		/obj/item/clothing/neck/necklace/dope = 3,
		/obj/item/clothing/suit/jacket/letterman_nanotrasen = 3,
		/obj/item/clothing/under/costume/swagoutfit = 1,
		/obj/item/clothing/shoes/swagshoes = 1,
		/obj/item/instrument/piano_synth/headphones/spacepods = 1,
	)
	refill_canister = /obj/item/vending_refill/clothing
	default_price = PAYCHECK_CREW * 0.7 //Default of
	extra_price = PAYCHECK_COMMAND
	payment_department = NO_FREEBIES
	light_mask = "wardrobe-light-mask"
	light_color = LIGHT_COLOR_ELECTRIC_GREEN


/obj/machinery/vending/emagged/coffee
	name = "\improper Solar's Best Hot Drinks"
	desc = "A vending machine which dispenses hot drinks."
	product_ads = "Have a drink!;Drink up!;It's good for you!;Would you like a hot joe?;I'd kill for some coffee!;The best beans in the galaxy.;Only the finest brew for you.;Mmmm. Nothing like a coffee.;I like coffee, don't you?;Coffee helps you work!;Try some tea.;We hope you like the best!;Try our new chocolate!;Admin conspiracies"
	icon_state = "coffee"
	icon_vend = "coffee-vend"
	panel_type = "panel9"
	products = list(
		/obj/item/reagent_containers/cup/glass/coffee = 6,
		/obj/item/reagent_containers/cup/glass/mug/tea = 6,
		/obj/item/reagent_containers/cup/glass/mug/coco = 3,
		/obj/item/reagent_containers/cup/glass/coffee/syndicate = 2,
		/obj/item/reagent_containers/cup/glass/coffee/nukie = 1,
	)
	premium = list(
		/obj/item/reagent_containers/cup/glass/ice = 12,
	)
	refill_canister = /obj/item/vending_refill/coffee
	default_price = PAYCHECK_LOWER
	extra_price = PAYCHECK_CREW
	payment_department = ACCOUNT_SRV
	light_mask = "coffee-light-mask"
	light_color = COLOR_DARK_MODERATE_ORANGE


/obj/machinery/vending/emagged/cola
	name = "\improper Robust Softdrinks"
	desc = "A softdrink vendor provided by Robust Industries, LLC."
	icon_state = "Cola_Machine"
	panel_type = "panel2"
	product_slogans = "Robust Softdrinks: More robust than a toolbox to the head!"
	product_ads = "Refreshing!;Hope you're thirsty!;Over 1 million drinks sold!;Thirsty? Why not cola?;Please, have a drink!;Drink up!;The best drinks in space."
	products = list(
		/obj/item/reagent_containers/cup/soda_cans/cola = 10,
		/obj/item/reagent_containers/cup/soda_cans/space_mountain_wind = 10,
		/obj/item/reagent_containers/cup/soda_cans/dr_gibb = 10,
		/obj/item/reagent_containers/cup/soda_cans/starkist = 10,
		/obj/item/reagent_containers/cup/soda_cans/space_up = 10,
		/obj/item/reagent_containers/cup/soda_cans/pwr_game = 10,
		/obj/item/reagent_containers/cup/soda_cans/lemon_lime = 10,
		/obj/item/reagent_containers/cup/soda_cans/sol_dry = 10,
		/obj/item/reagent_containers/cup/glass/waterbottle = 10,
		/obj/item/reagent_containers/cup/glass/bottle/mushi_kombucha = 3,
		/obj/item/reagent_containers/cup/soda_cans/volt_energy = 3,
		/obj/item/reagent_containers/cup/soda_cans/hearty_punch = 2,
		/obj/item/reagent_containers/cup/soda_cans/antidote = 3,
		/obj/item/reagent_containers/cup/soda_cans/anti_water = 3,
		/obj/item/reagent_containers/cup/soda_cans/simple_times = 3,
		/obj/item/reagent_containers/cup/soda_cans/chocolate_sips = 3,
		/obj/item/reagent_containers/cup/soda_cans/honey_med = 3,
	)
	contraband = list(
		/obj/item/reagent_containers/cup/soda_cans/thirteenloko = 6,
		/obj/item/reagent_containers/cup/soda_cans/shamblers = 6,
		/obj/item/reagent_containers/cup/soda_cans/wellcheers = 6,
		/obj/item/reagent_containers/cup/soda_cans/robust_nukie = 1,
		/obj/item/reagent_containers/cup/soda_cans/fireworks = 1,
		/obj/item/reagent_containers/cup/soda_cans/aged_soda = 2,
		/obj/item/reagent_containers/cup/soda_cans/space_walker = 2,
		/obj/item/reagent_containers/cup/soda_cans/nano_pop = 1,
		/obj/item/reagent_containers/cup/soda_cans/ice_e = 2,
		/obj/item/reagent_containers/cup/soda_cans/unstable_vortex = 2,
		/obj/item/reagent_containers/cup/soda_cans/clown_juice = 1,
		/obj/item/reagent_containers/cup/soda_cans/nocturnal = 1,
	)
	premium = list(
		/obj/item/reagent_containers/cup/glass/drinkingglass/filled/nuka_cola = 1,
		/obj/item/reagent_containers/cup/soda_cans/air = 1,
		/obj/item/reagent_containers/cup/soda_cans/monkey_energy = 1,
		/obj/item/reagent_containers/cup/soda_cans/grey_bull = 1,
		/obj/item/reagent_containers/cup/glass/bottle/rootbeer = 1,
		/obj/item/reagent_containers/cup/soda_cans/mystery = 5,
		/obj/item/reagent_containers/cup/soda_cans/changelingsting = 2,
		/obj/item/reagent_containers/cup/soda_cans/devilskiss = 2,
		/obj/item/reagent_containers/cup/soda_cans/turbo = 2,
		/obj/item/reagent_containers/cup/soda_cans/fireball = 2,
		/obj/item/reagent_containers/cup/soda_cans/mutate_fizz = 3,
		/obj/item/reagent_containers/cup/soda_cans/gold_soda = 3,
		/obj/item/reagent_containers/cup/soda_cans/sleepy_time = 3,
	)
	refill_canister = /obj/item/vending_refill/cola
	default_price = PAYCHECK_CREW * 0.7
	extra_price = PAYCHECK_CREW
	payment_department = ACCOUNT_SRV

	var/static/list/spiking_booze = list(
		// Your "common" spiking booze
		/datum/reagent/consumable/ethanol/vodka = 5,
		/datum/reagent/consumable/ethanol/beer = 5,
		/datum/reagent/consumable/ethanol/whiskey = 5,
		/datum/reagent/consumable/ethanol/gin = 5,
		/datum/reagent/consumable/ethanol/rum = 5,
		// A bit rarer, can be dangerous if you take too much
		/datum/reagent/consumable/ethanol/thirteenloko = 3,
		/datum/reagent/consumable/ethanol/absinthe = 3,
		/datum/reagent/consumable/ethanol/hooch = 3,
		/datum/reagent/consumable/ethanol/moonshine = 3,
		// Gets funky here
		/datum/reagent/consumable/ethanol/beepsky_smash = 1,
		/datum/reagent/consumable/ethanol/gargle_blaster = 1,
		/datum/reagent/consumable/ethanol/neurotoxin = 1,
		)

/obj/machinery/vending/emagged/cola/on_dispense(obj/item/vended_item)
	// 35% chance that your drink will be safe, as safe pure acid and sugar that these drinks probably are can be
	if(!onstation || !HAS_TRAIT(SSstation, STATION_TRAIT_SPIKED_DRINKS) || !prob(65))
		return
	// Don't fill booze with more booze
	if (isnull(vended_item.reagents) || vended_item.reagents.has_reagent(/datum/reagent/consumable/ethanol, check_subtypes = TRUE))
		return
	var/removed_volume = vended_item.reagents.remove_all(rand(5, vended_item.reagents.maximum_volume * 0.5))
	if (!removed_volume)
		return
	// Don't want bubbling sodas when we add some rum to cola
	ADD_TRAIT(vended_item, TRAIT_SILENT_REACTIONS, VENDING_MACHINE_TRAIT)
	vended_item.reagents.add_reagent(pick_weight(spiking_booze), removed_volume)
	vended_item.reagents.handle_reactions()
	REMOVE_TRAIT(vended_item, TRAIT_SILENT_REACTIONS, VENDING_MACHINE_TRAIT)

/obj/machinery/vending/emagged/cola/blue
	icon_state = "Cola_Machine"
	light_mask = "cola-light-mask"
	light_color = COLOR_MODERATE_BLUE

/obj/machinery/vending/emagged/cola/black
	icon_state = "cola_black"
	light_mask = "cola-light-mask"

/obj/machinery/vending/emagged/cola/red
	icon_state = "red_cola"
	name = "\improper Space Cola Vendor"
	desc = "It vends cola, in space."
	product_slogans = "Cola in space!"
	light_mask = "red_cola-light-mask"
	light_color = COLOR_DARK_RED

/obj/machinery/vending/emagged/cola/space_up
	icon_state = "space_up"
	name = "\improper Space-up! Vendor"
	desc = "Indulge in an explosion of flavor."
	product_slogans = "Space-up! Like a hull breach in your mouth."
	light_mask = "space_up-light-mask"
	light_color = COLOR_DARK_MODERATE_LIME_GREEN

/obj/machinery/vending/emagged/cola/starkist
	icon_state = "starkist"
	name = "\improper Star-kist Vendor"
	desc = "The taste of a star in liquid form."
	product_slogans = "Drink the stars! Star-kist!"
	panel_type = "panel7"
	light_mask = "starkist-light-mask"
	light_color = COLOR_LIGHT_ORANGE

/obj/machinery/vending/emagged/cola/sodie
	icon_state = "soda"
	panel_type = "panel7"
	light_mask = "soda-light-mask"
	light_color = COLOR_WHITE

/obj/machinery/vending/emagged/cola/pwr_game
	icon_state = "pwr_game"
	name = "\improper Pwr Game Vendor"
	desc = "You want it, we got it. Brought to you in partnership with Vlad's Salads."
	product_slogans = "The POWER that gamers crave! PWR GAME!"
	light_mask = "pwr_game-light-mask"
	light_color = COLOR_STRONG_VIOLET

/obj/machinery/vending/emagged/cola/shamblers
	name = "\improper Shambler's Vendor"
	desc = "~Shake me up some of that Shambler's Juice!~"
	icon_state = "shamblers_juice"
	products = list(
		/obj/item/reagent_containers/cup/soda_cans/cola = 10,
		/obj/item/reagent_containers/cup/soda_cans/space_mountain_wind = 10,
		/obj/item/reagent_containers/cup/soda_cans/dr_gibb = 10,
		/obj/item/reagent_containers/cup/soda_cans/starkist = 10,
		/obj/item/reagent_containers/cup/soda_cans/space_up = 10,
		/obj/item/reagent_containers/cup/soda_cans/pwr_game = 10,
		/obj/item/reagent_containers/cup/soda_cans/lemon_lime = 10,
		/obj/item/reagent_containers/cup/soda_cans/sol_dry = 10,
		/obj/item/reagent_containers/cup/soda_cans/shamblers = 10,
		/obj/item/reagent_containers/cup/soda_cans/wellcheers = 5,
		)
	product_slogans = "~Shake me up some of that Shambler's Juice!~"
	product_ads = "Refreshing!;Thirsty for DNA? Satiate your craving!;Over 1 trillion souls drank!;Made with real DNA!;The hivemind demands your thirst!;Drink up!;Absorb your thirst."
	light_mask = "shamblers-light-mask"
	light_color = COLOR_MOSTLY_PURE_PINK

/obj/machinery/vending/emagged/cola/shamblers/Initialize(mapload)
	. = ..()
	set_active_language(get_random_spoken_language())

/obj/machinery/vending/emagged/cola/shamblers/speak(message)
	. = ..()
	set_active_language(get_random_spoken_language())


/obj/machinery/vending/emagged/cytopro
	name = "\improper CytoPro"
	desc = "For all your cytology needs!"
	product_slogans = "Cloning? Don't be ridiculous.;Don't be uncultured, get some cells growing!;Who needs farms when we got vats?"
	product_ads = "Grow your own little creatures!;Biology, at your fingertips!"
	icon_state = "cytopro"
	icon_deny = "cytopro-deny"
	panel_type = "panel2"
	light_mask = "cytopro-light-mask"
	products = list(
		/obj/item/storage/bag/xeno = 5,
		/obj/item/reagent_containers/condiment/protein = 10,
		/obj/item/storage/box/swab = 3,
		/obj/item/storage/box/petridish = 3,
		/obj/item/storage/box/monkeycubes = 3,
		/obj/item/biopsy_tool = 3,
		/obj/item/clothing/under/rank/rnd/scientist = 5,
		/obj/item/clothing/suit/toggle/labcoat/science = 5,
		/obj/item/clothing/suit/bio_suit/scientist = 3,
		/obj/item/clothing/head/bio_hood/scientist = 3,
		/obj/item/reagent_containers/dropper = 5,
		/obj/item/reagent_containers/syringe = 5,
		/obj/item/petri_dish/random = 6,
		/obj/item/storage/box/randomextract = 3,
	)
	contraband = list(
		/obj/item/knife/kitchen = 3,
	)
	refill_canister = /obj/item/vending_refill/cytopro
	default_price = PAYCHECK_CREW * 1
	extra_price = PAYCHECK_COMMAND * 0.5
	payment_department = ACCOUNT_SCI


/obj/machinery/vending/emagged/engineering
	name = "\improper Robco Tool Maker"
	desc = "Everything you need for do-it-yourself station repair."
	icon_state = "engi"
	icon_deny = "engi-deny"
	panel_type = "panel10"
	products = list(
		/obj/item/clothing/under/rank/engineering/chief_engineer = 4,
		/obj/item/clothing/under/rank/engineering/engineer = 4,
		/obj/item/clothing/shoes/sneakers/orange = 4,
		/obj/item/clothing/head/utility/hardhat = 4,
		/obj/item/storage/belt/utility = 4,
		/obj/item/clothing/glasses/meson/engine = 4,
		/obj/item/clothing/gloves/color/yellow = 4,
		/obj/item/screwdriver = 12,
		/obj/item/crowbar = 12,
		/obj/item/wirecutters = 12,
		/obj/item/multitool = 12,
		/obj/item/wrench = 12,
		/obj/item/t_scanner = 12,
		/obj/item/stock_parts/power_store/cell/super = 8,
		/obj/item/stock_parts/power_store/battery/super = 8,
		/obj/item/weldingtool = 8,
		/obj/item/clothing/head/utility/welding = 8,
		/obj/item/light/tube/syndirig = 10,
		/obj/item/light/bulb/syndirig = 10,
		/obj/item/reagent_containers/syringe/plasma = 5,
		/obj/item/clothing/suit/utility/fire = 4,
		/obj/item/stock_parts/power_store/cell/bluespace/syndirig = 2,
		/obj/item/stock_parts/scanning_module/adv = 5,
		/obj/item/stock_parts/micro_laser/high = 5,
		/obj/item/stock_parts/matter_bin/adv = 5,
		/obj/item/stock_parts/servo/nano = 5,
		)
	refill_canister = /obj/item/vending_refill/engineering
	default_price = PAYCHECK_CREW
	extra_price = PAYCHECK_COMMAND * 1.5
	payment_department = ACCOUNT_ENG
	light_mask = "engi-light-mask"


/obj/machinery/vending/emagged/medical
	name = "\improper NanoMed Plus"
	desc = "Medical drug dispenser."
	icon_state = "med"
	icon_deny = "med-deny"
	panel_type = "panel11"
	product_ads = "Go save some lives!;The best stuff for your medbay.;Only the finest tools.;Natural chemicals!;This stuff saves lives.;Don't you want some?;Ping!"
	products = list(
		/obj/item/stack/medical/gauze = 8,
		/obj/item/reagent_containers/syringe = 12,
		/obj/item/reagent_containers/dropper = 3,
		/obj/item/healthanalyzer = 4,
		/obj/item/wrench/medical = 1,
		/obj/item/stack/sticky_tape/surgical = 3,
		/obj/item/healthanalyzer/simple = 4,
		/obj/item/stack/medical/ointment = 2,
		/obj/item/stack/medical/suture = 2,
		/obj/item/stack/medical/bone_gel = 4,
		/obj/item/cane/crutch = 2,
		/obj/item/cane/white = 2,
		/obj/item/clothing/glasses/eyepatch/medical = 2,
		/obj/item/storage/box/bandages = 2,
		/obj/item/reagent_containers/hypospray/medipen/blood_loss = 5,
		/obj/item/storage/pill_bottle/inaprovaline = 3,
	)
	contraband = list(
		/obj/item/storage/box/gum/happiness = 3,
		/obj/item/storage/box/hug/medical = 1,
		/obj/item/stack/medical/suture/medicated = 3,
		/obj/item/stack/medical/mesh/advanced = 3,
		/obj/item/storage/pill_bottle/tricordrazine = 3,
		/obj/item/reagent_containers/hypospray/medipen/formaldehyde = 5,
		/obj/item/reagent_containers/cup/bottle/toxin = 3,
		/obj/item/storage/medkit/deluxe_medical_variety_pack = 1,
	)
	premium = list(
		/obj/item/reagent_containers/hypospray/medipen = 3,
		/obj/item/storage/belt/medical = 3,
		/obj/item/sensor_device = 2,
		/obj/item/pinpointer/crew = 2,
		/obj/item/storage/medkit/medical_variety_pack = 2,
		/obj/item/storage/medkit/expanded/brute = 1,
		/obj/item/storage/medkit/expanded/fire = 1,
		/obj/item/storage/medkit/expanded/toxin = 1,
		/obj/item/storage/medkit/expanded/o2 = 1,
		/obj/item/storage/medkit/expanded/advanced = 1,
		/obj/item/shears = 1,
		/obj/item/storage/organbox = 1,
		/obj/item/reagent_containers/hypospray/medipen/ekit = 3,
		/obj/item/reagent_containers/cup/beaker/cryoxadone = 4,
		/obj/item/reagent_containers/medigel/synthflesh = 2,
	)
	refill_canister = /obj/item/vending_refill/medical
	default_price = PAYCHECK_CREW
	extra_price = PAYCHECK_COMMAND
	payment_department = ACCOUNT_MED
	light_mask = "med-light-mask"

//Created out of a necessity to get these dumb chems out of the medical tools vendor.
/obj/machinery/vending/emagged/drugs
	name = "\improper NanoDrug Plus"
	desc = "Medical drugs dispenser."
	icon_state = "drug"
	icon_deny = "drug-deny"
	panel_type = "panel11"
	product_ads = "Go save some lives!;The best stuff for your medbay.;Only the finest tools.;Natural chemicals!;This stuff saves lives.;Don't you want some?;Ping!"
	products = list(
		/obj/item/reagent_containers/pill/patch/libital = 5,
		/obj/item/reagent_containers/pill/patch/aiuri = 5,
		/obj/item/reagent_containers/syringe/convermol = 2,
		/obj/item/reagent_containers/pill/insulin = 5,
		/obj/item/reagent_containers/cup/bottle/multiver = 2,
		/obj/item/reagent_containers/cup/bottle/syriniver = 2,
		/obj/item/reagent_containers/cup/bottle/calomel = 2,
		/obj/item/reagent_containers/cup/bottle/epinephrine = 3,
		/obj/item/reagent_containers/cup/bottle/morphine = 4,
		/obj/item/reagent_containers/cup/bottle/potass_iodide = 1,
		/obj/item/reagent_containers/cup/bottle/salglu_solution = 3,
		/obj/item/reagent_containers/cup/bottle/toxin = 3,
		/obj/item/reagent_containers/cup/bottle/oculine = 3,
		/obj/item/reagent_containers/cup/bottle/inacusiate = 3,
		/obj/item/storage/pill_bottle/mannitol = 5,
		/obj/item/reagent_containers/syringe/antiviral = 6,
		/obj/item/reagent_containers/medigel/libital = 2,
		/obj/item/reagent_containers/medigel/aiuri = 2,
		/obj/item/reagent_containers/medigel/sterilizine = 1,
	)
	contraband = list(
		/obj/item/reagent_containers/pill/tox = 3,
		/obj/item/reagent_containers/pill/morphine = 4,
		/obj/item/reagent_containers/pill/multiver = 6,
	)
	premium = list(
		/obj/item/reagent_containers/medigel/synthflesh = 5,
		/obj/item/storage/pill_bottle/psicodine = 2,
		/obj/item/storage/pill_bottle/sansufentanyl = 1,
		/obj/item/storage/pill_bottle/bicaridine = 3,
		/obj/item/storage/pill_bottle/kelotane = 3,
		/obj/item/storage/pill_bottle/antitoxin = 3,
		/obj/item/storage/pill_bottle/dexalin = 3,
		/obj/item/storage/pill_bottle/coagulant = 2,
		/obj/item/storage/pill_bottle/psicodine = 2,
		/obj/item/reagent_containers/hypospray/medipen/arithrazine = 4,
		/obj/item/reagent_containers/hypospray/medipen/hyronalin = 4,
		/obj/item/reagent_containers/hypospray/medipen/bicaridine = 4,
		/obj/item/reagent_containers/hypospray/medipen/dermaline = 4,
		/obj/item/reagent_containers/hypospray/medipen/salacid = 2,
		/obj/item/reagent_containers/hypospray/medipen/oxandrolone = 2,
		/obj/item/reagent_containers/hypospray/medipen/penacid = 3,
		/obj/item/reagent_containers/hypospray/medipen/salbutamol = 2,
		/obj/item/reagent_containers/hypospray/medipen/blood_loss = 2,
	)
	default_price = 50
	extra_price = 100
	payment_department = ACCOUNT_MED
	refill_canister = /obj/item/vending_refill/drugs


/obj/machinery/vending/emagged/wallmed
	name = "\improper NanoMed"
	desc = "Wall-mounted Medical Equipment dispenser."
	icon_state = "wallmed"
	icon_deny = "wallmed-deny"
	panel_type = "wallmed-panel"
	density = FALSE
	products = list(
		/obj/item/reagent_containers/syringe = 3,
		/obj/item/reagent_containers/pill/patch/libital = 5,
		/obj/item/reagent_containers/pill/patch/aiuri = 5,
		/obj/item/reagent_containers/pill/multiver = 2,
		/obj/item/reagent_containers/pill/antiviral = 3,
		/obj/item/reagent_containers/medigel/libital = 2,
		/obj/item/reagent_containers/medigel/aiuri = 2,
		/obj/item/reagent_containers/medigel/sterilizine = 1,
		/obj/item/healthanalyzer/simple = 2,
		/obj/item/stack/medical/bone_gel = 2,
		/obj/item/storage/box/bandages = 1,
		/obj/item/stack/medical/gauze = 3,
		/obj/item/reagent_containers/pill/iron = 5,
		/obj/item/reagent_containers/cup/bottle/salglu_solution = 2,
		/obj/item/reagent_containers/cup/bottle/oculine = 1,
		/obj/item/reagent_containers/cup/bottle/inacusiate = 1,
	)
	contraband = list(
		/obj/item/reagent_containers/pill/tox = 2,
		/obj/item/reagent_containers/pill/morphine = 2,
		/obj/item/storage/box/gum/happiness = 1,
		/obj/item/reagent_containers/hypospray/medipen/ekit = 1,
		/obj/item/reagent_containers/hypospray/medipen/formaldehyde = 1,
		/obj/item/reagent_containers/hypospray/medipen/blood_loss = 1,
	)
	premium = list(
		/obj/item/reagent_containers/medigel/synthflesh = 1,
		/obj/item/reagent_containers/pill/bicaridine = 5,
		/obj/item/reagent_containers/pill/kelotane = 5,
		/obj/item/reagent_containers/pill/antitoxin = 5,
		/obj/item/reagent_containers/pill/dexalin = 5,
		/obj/item/reagent_containers/pill/inaprovaline = 5,
		/obj/item/reagent_containers/pill/coagulant = 5,
	)
	refill_canister = /obj/item/vending_refill/wallmed
	default_price = PAYCHECK_COMMAND //Double the medical price due to being meant for public consumption, not player specfic
	extra_price = PAYCHECK_COMMAND * 1.5
	payment_department = ACCOUNT_MED
	tiltable = FALSE
	light_mask = "wallmed-light-mask"

/obj/machinery/vending/emagged/wallhypo
	name = "\improper HypoMed"
	desc = "Wall-mounted Hypospray Equipment dispenser."
	icon = 'hypermods/icons/obj/machines/vending.dmi'
	icon_state = "wallhypo"
	icon_deny = "wallhypo-deny"
	tiltable = FALSE
	density = FALSE
	products = list(/obj/item/reagent_containers/hypospray/buyable = 5,
					/obj/item/reagent_containers/cup/bottle/libital = 2,
					/obj/item/reagent_containers/cup/bottle/aiuri = 2,
					/obj/item/reagent_containers/cup/bottle/multiver = 2,
					/obj/item/reagent_containers/cup/bottle/syriniver = 2,
					/obj/item/reagent_containers/cup/bottle/convermol = 2,
					/obj/item/reagent_containers/cup/bottle/epinephrine = 2,
					/obj/item/reagent_containers/cup/bottle/coagulant = 2,
					/obj/item/reagent_containers/cup/bottle/omnizine = 1)
	premium = list(/obj/item/reagent_containers/cup/bottle/sal_acid = 2,
					/obj/item/reagent_containers/cup/bottle/oxandrolone = 2,
					/obj/item/reagent_containers/cup/bottle/calomel = 2,
					/obj/item/reagent_containers/cup/bottle/salbutamol = 2,
					/obj/item/reagent_containers/cup/bottle/lavaland = 1)
	default_price = 50
	extra_price = 50
	resistance_flags = FIRE_PROOF
	refill_canister = /obj/item/vending_refill/wallhypo
	payment_department = ACCOUNT_MED


/obj/machinery/vending/emagged/modularpc
	name = "\improper Deluxe Silicate Selections"
	desc = "All the parts you need to build your own custom pc."
	icon_state = "modularpc"
	icon_deny = "modularpc-deny"
	panel_type = "panel21"
	light_mask = "modular-light-mask"
	product_ads = "Get your gamer gear!;The best GPUs for all of your space-crypto needs!;The most robust cooling!;The finest RGB in space!"
	vend_reply = "Game on!"
	products = list(
		/obj/item/computer_disk = 8,
		/obj/item/modular_computer/laptop = 4,
		/obj/item/modular_computer/pda = 4,
		/obj/item/computer_disk/black_market = 1,
		/obj/item/computer_disk/maintenance/scanner = 1,
		/obj/item/computer_disk/maintenance/spectre_meter = 1,
	)
	premium = list(
		/obj/item/pai_card = 2,
	)
	refill_canister = /obj/item/vending_refill/modularpc
	default_price = PAYCHECK_CREW
	extra_price = PAYCHECK_COMMAND
	payment_department = ACCOUNT_SCI


/obj/machinery/vending/emagged/hydronutrients
	name = "\improper NutriMax"
	desc = "A plant nutrients vendor."
	product_slogans = "Aren't you glad you don't have to fertilize the natural way?;Now with 50% less stink!;Plants are people too!"
	product_ads = "We like plants!;Don't you want some?;The greenest thumbs ever.;We like big plants.;Soft soil..."
	icon_state = "nutri"
	icon_deny = "nutri-deny"
	panel_type = "panel2"
	light_mask = "nutri-light-mask"
	products = list(
		/obj/item/cultivator = 3,
		/obj/item/plant_analyzer = 4,
		/obj/item/reagent_containers/cup/bottle/nutrient/ez = 30,
		/obj/item/reagent_containers/cup/bottle/nutrient/l4z = 20,
		/obj/item/reagent_containers/cup/bottle/nutrient/rh = 10,
		/obj/item/reagent_containers/spray/pestspray = 20,
		/obj/item/reagent_containers/syringe = 5,
		/obj/item/secateurs = 3,
		/obj/item/shovel/spade = 3,
		/obj/item/storage/bag/plants = 5,
		/obj/item/reagent_containers/cup/bottle/ammonia = 10,
		/obj/item/reagent_containers/cup/bottle/diethylamine = 10,
		/obj/item/reagent_containers/cup/bottle/saltpetre = 10,
	)
	premium = list(
		/obj/item/gun/energy/floragun = 2,
		/obj/item/geneshears = 2,
	)
	contraband = list(
		/obj/item/magicbook/gardening = 1,
	)
	refill_canister = /obj/item/vending_refill/hydronutrients
	default_price = PAYCHECK_CREW * 0.8
	extra_price = PAYCHECK_COMMAND * 0.8
	payment_department = ACCOUNT_SRV


/obj/machinery/vending/emagged/plasmaresearch
	name = "\improper Bombuddy 3000"
	desc = "All the fine parts you need in one vending machine!"
	products = list(
		/obj/item/assembly/igniter = 6,
		/obj/item/assembly/prox_sensor = 6,
		/obj/item/assembly/signaler = 6,
		/obj/item/assembly/timer = 6,
		/obj/item/clothing/head/bio_hood = 6,
		/obj/item/clothing/suit/bio_suit = 6,
		/obj/item/clothing/under/rank/rnd/scientist = 6,
		/obj/item/transfer_valve = 6,
		/obj/item/clothing/suit/utility/bomb_suit = 2,
		/obj/item/clothing/head/utility/bomb_hood = 2,
	)
	contraband = list(/obj/item/assembly/health = 3)
	default_price = PAYCHECK_CREW
	extra_price = PAYCHECK_CREW
	payment_department = ACCOUNT_SCI


/obj/machinery/vending/emagged/robotics
	name = "\improper Robotech Deluxe"
	desc = "All the tools you need to create your own robot army."
	icon_state = "robotics"
	icon_deny = "robotics-deny"
	panel_type = "panel14"
	light_mask = "robotics-light-mask"
	products = list(
		/obj/item/clothing/suit/toggle/labcoat = 4,
		/obj/item/clothing/under/rank/rnd/roboticist = 4,
		/obj/item/stack/cable_coil = 4,
		/obj/item/assembly/flash/handheld = 4,
		/obj/item/stock_parts/power_store/cell/super = 12,
		/obj/item/assembly/prox_sensor = 3,
		/obj/item/assembly/signaler = 3,
		/obj/item/healthanalyzer = 3,
		/obj/item/scalpel = 2,
		/obj/item/hemostat = 2,
		/obj/item/retractor = 2,
		/obj/item/circular_saw = 2,
		/obj/item/bonesetter = 2,
		/obj/item/surgical_drapes = 2,
		/obj/item/cautery = 2,
		/obj/item/tank/internals/anesthetic = 2,
		/obj/item/clothing/mask/breath/medical = 5,
		/obj/item/screwdriver = 5,
		/obj/item/crowbar = 5,
		/obj/item/stack/sheet/iron = 50,
		/obj/item/stack/sheet/glass = 50,
		/obj/item/mmi/syndie = 1,
	)
	premium = list(
		/obj/item/grenade/chem_grenade/smart_metal_foam = 5,
		/obj/item/extinguisher = 5,
		/obj/item/stack/sheet/plasteel/twenty = 5,
	)
	contraband = list(
		/obj/item/grenade/clusterbuster/metalfoam = 1,
		/obj/item/borg_restart_board = 1,
	)
	refill_canister = /obj/item/vending_refill/robotics
	default_price = PAYCHECK_COMMAND
	payment_department = ACCOUNT_SCI


/obj/machinery/vending/emagged/security
	name = "\improper SecTech"
	desc = "A security equipment vendor."
	product_ads = "Crack communist skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Tase them, bro.;Why not have a donut?"
	icon_state = "sec"
	icon_deny = "sec-deny"
	panel_type = "panel6"
	light_mask = "sec-light-mask"
	products = list(
		/obj/item/food/donut/plain = 12,
		/obj/item/restraints/handcuffs = 8,
		/obj/item/restraints/handcuffs/cable/zipties = 10,
		/obj/item/assembly/flash/handheld = 5,
		/obj/item/grenade/flashbang = 4,
		/obj/item/flashlight/seclite = 4,
		/obj/item/restraints/legcuffs/bola/energy = 7,
		/obj/item/clothing/gloves/tackler = 5,
		/obj/item/grenade/stingbang = 5,
		/obj/item/watertank/pepperspray = 2,
		/obj/item/storage/belt/holster/energy = 4,
		/obj/item/holosign_creator/security = 2,
		/obj/item/storage/box/evidence = 6,
	)
	contraband = list(
		/obj/item/ammo_box/magazine/v38/ap = 1,
		/obj/item/ammo_box/magazine/v38/frost = 1,
		/obj/item/ammo_box/magazine/v38/talon = 1,
		/obj/item/ammo_box/magazine/v38/bluespace = 1,
		/obj/item/clothing/glasses/sunglasses = 2,
		/obj/item/storage/fancy/donut_box = 2,
		/obj/item/pinpointer/crew = 2,
		/mob/living/simple_animal/bot/secbot = 3,
		/obj/item/antag_spawner/nanotrasen/securityborg = 2,
	)
	premium = list(
		/obj/item/gun/ballistic/automatic/pistol/mk58/no_mag = 2,
		/obj/item/ammo_box/magazine/v38 = 2,
		/obj/item/ammo_box/magazine/v38/rubber = 2,
		/obj/item/grenade/concussive = 2,
		/obj/item/storage/medkit/regular = 2,
		/obj/item/storage/pill_bottle/tricordrazine = 2,
	)
	refill_canister = /obj/item/vending_refill/security
	default_price = PAYCHECK_CREW
	extra_price = PAYCHECK_COMMAND * 1.5
	payment_department = ACCOUNT_SEC


/obj/machinery/vending/emagged/snack
	name = "\improper Getmore Chocolate Corp"
	desc = "A snack machine courtesy of the Getmore Chocolate Corporation, based out of Mars."
	product_slogans = "Try our new nougat bar!;Twice the calories for half the price!"
	product_ads = "The healthiest!;Award-winning chocolate bars!;Mmm! So good!;Oh my god it's so juicy!;Have a snack.;Snacks are good for you!;Have some more Getmore!;Best quality snacks straight from mars.;We love chocolate!;Try our new jerky!"
	icon_state = "snack"
	panel_type = "panel2"
	light_mask = "snack-light-mask"
	products = list(
		/obj/item/food/spacetwinkie = 6,
		/obj/item/food/cheesiehonkers = 6,
		/obj/item/food/candy = 6,
		/obj/item/food/chips = 6,
		/obj/item/food/chips/shrimp = 6,
		/obj/item/food/sosjerky = 6,
		/obj/item/food/cornchips/random = 6,
		/obj/item/food/sosjerky = 6,
		/obj/item/food/no_raisin = 6,
		/obj/item/food/peanuts = 6,
		/obj/item/food/peanuts/random = 3,
		/obj/item/food/cnds = 6,
		/obj/item/food/cnds/random = 3,
		/obj/item/food/semki = 6,
		/obj/item/reagent_containers/cup/glass/dry_ramen = 3,
		/obj/item/storage/box/gum = 3,
		/obj/item/food/energybar = 6,
		/obj/item/food/hot_shots = 6,
		/obj/item/food/sticko = 6,
		/obj/item/food/sticko/random = 3,
		/obj/item/food/shok_roks = 6,
		/obj/item/food/shok_roks/random = 3,
		/obj/item/food/rubyrockcandy = 1,
		/obj/item/food/sapphirerockcandy = 1,
		/obj/item/food/emeraldrockcandy = 1,
		/obj/item/food/topazrockcandy = 1,
	)
	contraband = list(
		/obj/item/food/syndicake/super = 2,
		/obj/item/food/peanuts/ban_appeal = 3,
		/obj/item/food/candy/bronx = 1,
		/obj/item/storage/fancy/donut_box/deadly = 1,
		/obj/item/food/pizza/vegetable/poisoned = 1,
	)
	premium = list(
		/obj/item/food/spacers_sidekick = 3,
		/obj/item/food/pistachios = 3,
		/obj/item/food/swirl_lollipop = 3,
		/obj/item/food/pie/cream/bluespace = 1,
		/obj/item/food/magicrockcandy = 1,
	)
	refill_canister = /obj/item/vending_refill/snack
	req_access = list(ACCESS_KITCHEN)
	default_price = PAYCHECK_CREW * 0.6
	extra_price = PAYCHECK_CREW
	payment_department = ACCOUNT_SRV

/obj/machinery/vending/emagged/snack/blue
	icon_state = "snackblue"

/obj/machinery/vending/emagged/snack/orange
	icon_state = "snackorange"

/obj/machinery/vending/emagged/snack/green
	icon_state = "snackgreen"

/obj/machinery/vending/emagged/snack/teal
	icon_state = "snackteal"


/obj/machinery/vending/emagged/sovietsoda
	name = "\improper BODA"
	desc = "Old sweet water vending machine."
	icon_state = "sovietsoda"
	panel_type = "panel8"
	light_mask = "soviet-light-mask"
	product_ads = "For Tsar and Country.;Have you fulfilled your nutrition quota today?;Very nice!;We are simple people, for this is all we eat.;If there is a person, there is a problem. If there is no person, then there is no problem."
	products = list(
		/obj/item/reagent_containers/cup/glass/drinkingglass/filled/soda = 30,
	)
	contraband = list(
		/obj/item/reagent_containers/cup/glass/drinkingglass/filled/cola = 20,
	)
	resistance_flags = FIRE_PROOF
	refill_canister = /obj/item/vending_refill/sovietsoda
	default_price = 1
	extra_price = PAYCHECK_CREW //One credit for every state of FREEDOM
	payment_department = NO_FREEBIES
	light_color = COLOR_PALE_ORANGE


/obj/machinery/vending/emagged/sustenance
	name = "\improper Sustenance Vendor"
	desc = "A vending machine which vends food, as required by section 47-C of the NT's Prisoner Ethical Treatment Agreement."
	product_slogans = "Enjoy your meal.;Enough calories to support strenuous labor."
	product_ads = "Sufficiently healthy.;Efficiently produced tofu!;Mmm! So good!;Have a meal.;You need food to live!;Even prisoners deserve their daily bread!;Have some more candy corn!;Try our new ice cups!"
	light_mask = "snack-light-mask"
	icon_state = "sustenance"
	panel_type = "panel2"
	products = list(
		/obj/item/food/tofu/prison = 24,
		/obj/item/food/breadslice/moldy = 15,
		/obj/item/reagent_containers/cup/glass/ice/prison = 12,
		/obj/item/food/candy_corn/prison = 6,
		/obj/item/kitchen/spoon/plastic = 6,
		/obj/item/tank/internals/emergency_oxygen = 6,
		/obj/item/clothing/mask/breath = 6,
		/obj/item/storage/box/syndie_kit/space = 2,
	)
	contraband = list(
		/obj/item/knife = 6,
		/obj/item/kitchen/spoon = 6,
		/obj/item/reagent_containers/cup/glass/coffee = 12,
		/obj/item/reagent_containers/syringe/bluespace/miracle = 2,
	)

	refill_canister = /obj/item/vending_refill/sustenance
	default_price = PAYCHECK_LOWER
	extra_price = PAYCHECK_LOWER * 0.6
	payment_department = NO_FREEBIES

/obj/machinery/vending/emagged/sustenance/labor_camp
	name = "\improper Labor Camp Sustenance Vendor"
	desc = "A vending machine which vends food, as required by section 47-C of the NT's Prisoner Ethical Treatment Agreement. \
			This one, however, processes labor points for its products if the user is incarcerated."
	icon_state = "sustenance_labor"
	all_products_free = FALSE
	displayed_currency_icon = "digging"
	displayed_currency_name = " LP"

/obj/machinery/vending/emagged/tool
	name = "\improper YouTool"
	desc = "Tools for tools."
	icon_state = "tool"
	icon_deny = "tool-deny"
	panel_type = "panel11"
	light_mask = "tool-light-mask"
	products = list(
		/obj/item/stack/cable_coil = 10,
		/obj/item/crowbar = 5,
		/obj/item/weldingtool = 3,
		/obj/item/wirecutters = 5,
		/obj/item/wrench = 5,
		/obj/item/analyzer = 5,
		/obj/item/t_scanner = 5,
		/obj/item/screwdriver = 5,
		/obj/item/flashlight/glowstick = 3,
		/obj/item/flashlight/glowstick/red = 3,
		/obj/item/flashlight = 5,
		/obj/item/clothing/ears/earmuffs = 1,
	)
	contraband = list(
		/obj/item/clothing/gloves/color/yellow = 2,
		/obj/item/clothing/gloves/tinkerer = 2,
		/obj/item/construction/rld/mini = 1,
	)
	premium = list(
		/obj/item/storage/belt/utility = 2,
		/obj/item/screwdriver/power = 1,
		/obj/item/crowbar/power = 1,
		/obj/item/wrench/bolter = 1,
		/obj/item/weldingtool/experimental = 1,
		/obj/item/construction/rcd/loaded = 1,
		/obj/item/multitool = 2,
		/obj/item/weldingtool/hugetank = 2,
		/obj/item/clothing/head/utility/welding = 2,
		/obj/item/clothing/gloves/color/fyellow = 2,
		/obj/item/storage/part_replacer/bluespace/tier3 = 1,
	)
	refill_canister = /obj/item/vending_refill/youtool
	default_price = PAYCHECK_CREW
	extra_price = PAYCHECK_COMMAND * 1.5
	payment_department = ACCOUNT_ENG

/// WARDROBES BELOW

/obj/machinery/vending/emagged/wardrobe/sec_wardrobe
	name = "\improper SecDrobe"
	desc = "A vending machine for security and security-related clothing!"
	icon_state = "secdrobe"
	product_ads = "Beat perps in style!;It's red so you can't see the blood!;You have the right to be fashionable!;Now you can be the fashion police you always wanted to be!"
	vend_reply = "Thank you for using the SecDrobe!"
	products = list(
		/obj/item/clothing/head/beret/sec = 3,
		/obj/item/clothing/head/soft/sec = 3,
		/obj/item/clothing/mask/bandana/striped/security = 3,
		/obj/item/clothing/under/rank/security/officer = 3,
		/obj/item/clothing/under/rank/security/officer/skirt = 3,
		/obj/item/clothing/under/rank/security/officer/grey = 3,
		/obj/item/clothing/under/pants/slacks = 3,
		/obj/item/clothing/under/rank/security/officer/blueshirt = 3,
		/obj/item/clothing/gloves/color/black/security/blu = 3,
		/obj/item/clothing/suit/armor/vest/secjacket = 3,
		/obj/item/clothing/suit/hooded/wintercoat/security = 3,
		/obj/item/clothing/suit/armor/vest = 3,
		/obj/item/clothing/gloves/color/black/security = 3,
		/obj/item/clothing/shoes/jackboots/sec = 3,
		/obj/item/storage/backpack/security = 3,
		/obj/item/storage/backpack/satchel/sec = 3,
		/obj/item/storage/backpack/duffelbag/sec = 3,
		/obj/item/storage/backpack/messenger/sec = 3,
	)
	premium = list(
		/obj/item/clothing/under/rank/security/officer/formal = 3,
		/obj/item/clothing/suit/jacket/officer/blue = 3,
		/obj/item/clothing/head/beret/sec/navyofficer = 3,
		/obj/item/clothing/glasses/hud/security = 2,
		/obj/item/clothing/glasses/hud/security/prescription = 2,
	)
	contraband = list(
		/obj/item/organ/internal/cyberimp/brain/anti_stun = 1,
		/obj/item/clothing/glasses/hud/security/night = 1,
		/obj/item/clothing/glasses/hud/security/night/prescription = 1,
	)
	refill_canister = /obj/item/vending_refill/wardrobe/sec_wardrobe
	payment_department = ACCOUNT_SEC
	light_color = COLOR_MOSTLY_PURE_RED

/obj/machinery/vending/emagged/wardrobe/medi_wardrobe
	name = "\improper MediDrobe"
	desc = "A vending machine rumoured to be capable of dispensing clothing for medical personnel."
	icon_state = "medidrobe"
	product_ads = "Make those blood stains look fashionable!!"
	vend_reply = "Thank you for using the MediDrobe!"
	products = list(
		/obj/item/clothing/accessory/pocketprotector = 4,
		/obj/item/clothing/head/costume/nursehat = 4,
		/obj/item/clothing/head/beret/medical = 4,
		/obj/item/clothing/head/utility/surgerycap = 4,
		/obj/item/clothing/head/utility/surgerycap/purple = 4,
		/obj/item/clothing/head/utility/surgerycap/green = 4,
		/obj/item/clothing/head/beret/medical/paramedic = 4,
		/obj/item/clothing/head/soft/paramedic = 4,
		/obj/item/clothing/head/utility/head_mirror = 4,
		/obj/item/clothing/mask/bandana/striped/medical = 4,
		/obj/item/clothing/mask/surgical = 4,
		/obj/item/clothing/under/rank/medical/doctor = 4,
		/obj/item/clothing/under/rank/medical/doctor/skirt = 4,
		/obj/item/clothing/under/rank/medical/scrubs/blue = 4,
		/obj/item/clothing/under/rank/medical/scrubs/green = 4,
		/obj/item/clothing/under/rank/medical/scrubs/purple = 4,
		/obj/item/clothing/under/rank/medical/paramedic = 4,
		/obj/item/clothing/under/rank/medical/paramedic/skirt = 4,
		/obj/item/clothing/suit/toggle/labcoat = 4,
		/obj/item/clothing/suit/toggle/labcoat/paramedic = 4,
		/obj/item/clothing/suit/apron/surgical = 4,
		/obj/item/clothing/suit/hooded/wintercoat/medical = 4,
		/obj/item/clothing/suit/hooded/wintercoat/medical/paramedic = 4,
		/obj/item/clothing/shoes/sneakers/white = 4,
		/obj/item/clothing/shoes/sneakers/blue = 4,
		/obj/item/clothing/gloves/latex/nitrile = 4,
		/obj/item/clothing/gloves/latex = 4,
		/obj/item/storage/backpack/duffelbag/med = 4,
		/obj/item/storage/backpack/medic = 4,
		/obj/item/storage/backpack/satchel/med = 4,
		/obj/item/storage/backpack/messenger/med = 4,
		/obj/item/radio/headset/headset_med = 4,
		/obj/item/clothing/glasses/hud/health = 5,
		/obj/item/clothing/glasses/hud/health/prescription = 5,
	)
	contraband = list(
		/obj/item/grenade/chem_grenade/large = 5,
		/obj/item/organ/internal/cyberimp/chest/nutriment = 1,
		/obj/item/organ/internal/cyberimp/mouth/breathing_tube = 1,
		/obj/item/organ/internal/cyberimp/arm/surgery = 1,
		/obj/item/implantcase/tracking = 2,
		/obj/item/reagent_containers/hypospray/medipen/resurrector = 1,
	)
	refill_canister = /obj/item/vending_refill/wardrobe/medi_wardrobe
	payment_department = ACCOUNT_MED

/obj/machinery/vending/emagged/wardrobe/science_wardrobe
	name = "SciDrobe"
	desc = "A simple vending machine suitable to dispense well tailored science clothing. Endorsed by Space Cubans."
	icon_state = "scidrobe"
	product_ads = "Longing for the smell of plasma burnt flesh? Buy your science clothing now!;Made with 10% Auxetics, so you don't have to worry about losing your arm!"
	vend_reply = "Thank you for using the SciDrobe!"
	products = list(
		/obj/item/clothing/accessory/pocketprotector = 3,
		/obj/item/clothing/head/beret/science = 3,
		/obj/item/clothing/mask/gas = 3,
		/obj/item/clothing/mask/bandana/striped/science = 3,
		/obj/item/clothing/under/rank/rnd/scientist = 3,
		/obj/item/clothing/under/rank/rnd/scientist/skirt = 3,
		/obj/item/clothing/suit/toggle/labcoat/science = 3,
		/obj/item/clothing/suit/hooded/wintercoat/science = 3,
		/obj/item/clothing/gloves/latex = 3,
		/obj/item/clothing/shoes/sneakers/white = 3,
		/obj/item/storage/backpack/science = 3,
		/obj/item/storage/backpack/satchel/science = 3,
		/obj/item/storage/backpack/duffelbag/science = 3,
		/obj/item/storage/backpack/messenger/science = 3,
		/obj/item/radio/headset/headset_sci = 3,
		/obj/item/clothing/glasses/science = 1,
		/obj/item/clothing/glasses/science/prescription = 1,
	)
	contraband = list(
		/obj/item/gun/energy/gravity_gun = 1,
		/obj/item/grenade/antigravity = 1,
		/obj/item/stack/ore/bluespace_crystal/artificial = 30,
	)
	refill_canister = /obj/item/vending_refill/wardrobe/science_wardrobe
	payment_department = ACCOUNT_SCI

/obj/machinery/vending/emagged/wardrobe/hydro_wardrobe
	name = "Hydrobe"
	desc = "A machine with a catchy name. It dispenses botany related clothing and gear."
	icon_state = "hydrobe"
	product_ads = "Do you love soil? Then buy our clothes!;Get outfits to match your green thumb here!"
	vend_reply = "Thank you for using the Hydrobe!"
	products = list(
		/obj/item/clothing/accessory/armband/hydro = 3,
		/obj/item/clothing/mask/bandana/striped/botany = 3,
		/obj/item/clothing/under/rank/civilian/hydroponics = 3,
		/obj/item/clothing/under/rank/civilian/hydroponics/skirt = 3,
		/obj/item/clothing/suit/apron = 3,
		/obj/item/clothing/suit/apron/overalls = 3,
		/obj/item/clothing/suit/apron/waders = 3,
		/obj/item/clothing/suit/hooded/wintercoat/hydro = 3,
		/obj/item/storage/backpack/botany = 3,
		/obj/item/storage/backpack/satchel/hyd = 3,
		/obj/item/storage/backpack/duffelbag/hydroponics = 3,
		/obj/item/storage/backpack/messenger/hyd = 3,
		/obj/item/radio/headset/headset_srv = 3,
		/obj/item/clothing/glasses/science = 1,
		/obj/item/clothing/glasses/science/prescription = 1,
	)
	contraband = list(
		/obj/item/reagent_containers/syringe/mutatepod = 1,
		/obj/item/stack/sheet/cloth = 20,
		/obj/item/stack/sheet/cotton/durathread = 10,
		/obj/item/stack/sheet/leather = 10,
	)
	refill_canister = /obj/item/vending_refill/wardrobe/hydro_wardrobe
	payment_department = ACCOUNT_SRV
	light_color = LIGHT_COLOR_ELECTRIC_GREEN

/obj/machinery/vending/emagged/wardrobe/curator_wardrobe
	name = "CuraDrobe"
	desc = "A lowstock vendor only capable of vending clothing for curators and librarians."
	icon_state = "curadrobe"
	product_ads = "Glasses for your eyes and literature for your soul, Curadrobe has it all!; Impress & enthrall your library guests with Curadrobe's extended line of pens!"
	vend_reply = "Thank you for using the CuraDrobe!"
	products = list(
		/obj/item/clothing/accessory/pocketprotector = 2,
		/obj/item/pen = 4,
		/obj/item/pen/red = 2,
		/obj/item/pen/blue = 2,
		/obj/item/pen/fourcolor = 1,
		/obj/item/pen/fountain = 2,
		/obj/item/clothing/glasses/regular = 2,
		/obj/item/clothing/glasses/regular/jamjar = 1,
		/obj/item/clothing/under/rank/civilian/curator = 1,
		/obj/item/clothing/under/rank/civilian/curator/skirt = 1,
		/obj/item/clothing/under/rank/captain/suit = 1,
		/obj/item/clothing/under/rank/captain/suit/skirt = 1,
		/obj/item/clothing/under/rank/civilian/head_of_personnel/suit = 1,
		/obj/item/clothing/under/rank/civilian/head_of_personnel/suit/skirt = 1,
		/obj/item/clothing/suit/toggle/lawyer/greyscale = 1,
		/obj/item/storage/backpack/satchel/explorer = 1,
		/obj/item/storage/backpack/messenger/explorer = 1,
		/obj/item/storage/bag/books = 1,
		/obj/item/radio/headset/headset_srvent = 2,
	)
	premium = list(/obj/item/storage/box/randomjunk = 5)
	contraband = list(
		/obj/item/storage/box/archerypackage = 1,
		/obj/item/pen/cybersun = 1,
	)
	refill_canister = /obj/item/vending_refill/wardrobe/curator_wardrobe
	payment_department = ACCOUNT_SRV

/obj/machinery/vending/emagged/wardrobe/coroner_wardrobe
	name = "MortiDrobe"
	desc = "A favorite among nihilists."
	icon_state = "coroner_drobe"
	product_ads = "Any day above ground is a good one!;My day starts when yours ends!;And they call this a dying business!;See you when you're dead!"
	vend_reply = "Don't forget your \"Buy one get one free\" burial deal!"
	products = list(
		/obj/item/clothing/head/utility/surgerycap/black = 1,
		/obj/item/clothing/mask/surgical = 1,
		/obj/item/clothing/suit/apron/surgical = 1,
		/obj/item/clothing/suit/hooded/wintercoat/medical/coroner = 1,
		/obj/item/clothing/suit/toggle/labcoat/coroner = 1,
		/obj/item/clothing/under/rank/medical/coroner = 1,
		/obj/item/clothing/under/rank/medical/coroner/skirt = 1,
		/obj/item/clothing/under/rank/medical/scrubs/coroner = 1,
		/obj/item/clothing/shoes/sneakers/black = 1,
		/obj/item/clothing/gloves/latex/coroner = 1,
		/obj/item/cautery/cruel = 1,
		/obj/item/hemostat/cruel = 1,
		/obj/item/retractor/cruel = 1,
		/obj/item/scalpel/cruel = 1,
		/obj/item/storage/backpack/coroner = 1,
		/obj/item/storage/backpack/duffelbag/coroner = 1,
		/obj/item/storage/backpack/messenger/coroner = 1,
		/obj/item/storage/backpack/satchel/coroner = 1,
		/obj/item/storage/box/bodybags = 3,
		/obj/item/radio/headset/headset_srvmed = 2,
		/obj/item/toy/crayon/white = 2,
	)
	contraband = list(
		/obj/item/knife/ritual = 1,
		/obj/item/scythe = 1,
		/obj/item/storage/fancy/pickles_jar = 1,
		/obj/item/table_clock = 1,
		/obj/item/implanter = 1,
		/obj/item/implantcase = 1,
		/obj/item/bodybag/bluespace = 1,
		/obj/item/organ/internal/cyberimp/chest/reviver = 1,
	)
	premium = list(
		/obj/item/autopsy_scanner = 1,
		/obj/item/storage/medkit/coroner = 1,
		/obj/item/healthanalyzer = 1
	)
	refill_canister = /obj/item/vending_refill/wardrobe/coroner_wardrobe
	payment_department = ACCOUNT_MED

/obj/machinery/vending/emagged/wardrobe/bar_wardrobe
	name = "BarDrobe"
	desc = "A stylish vendor to dispense the most stylish bar clothing!"
	icon_state = "bardrobe"
	product_ads = "Guaranteed to prevent stains from spilled drinks!"
	vend_reply = "Thank you for using the BarDrobe!"
	products = list(
		/obj/item/clothing/glasses/sunglasses/reagent = 1,
		/obj/item/clothing/accessory/waistcoat = 2,
		/obj/item/clothing/head/hats/tophat = 2,
		/obj/item/clothing/head/soft/black = 2,
		/obj/item/clothing/neck/petcollar = 1,
		/obj/item/clothing/neck/bowtie = 2,
		/obj/item/clothing/under/costume/buttondown/slacks/service = 2,
		/obj/item/clothing/under/costume/buttondown/skirt/service = 2,
		/obj/item/clothing/under/rank/civilian/purple_bartender = 2,
		/obj/item/clothing/suit/toggle/lawyer/greyscale = 1,
		/obj/item/clothing/suit/armor/vest/alt = 1,
		/obj/item/clothing/shoes/sneakers/black = 2,
		/obj/item/storage/belt/bandolier = 1,
		/obj/item/storage/bag/money = 2,
		/obj/item/storage/dice/hazard = 1,
		/obj/item/storage/box/beanbag = 1,
		/obj/item/circuitboard/machine/dish_drive = 1,
		/obj/item/reagent_containers/cup/rag = 2,
		/obj/item/radio/headset/headset_srv = 2,
	)
	premium = list(
		/obj/item/storage/box/dishdrive = 1,
		/obj/item/vending_refill/cola = 1,
		/obj/item/vending_refill/coffee = 1,
	)
	contraband = list(
		/obj/item/ammo_casing/shotgun/buckshot = 10,
		/obj/item/ammo_casing/shotgun/dart = 5,
		/obj/item/ammo_casing/shotgun/incendiary = 5,
		/obj/item/ammo_casing/shotgun/stunslug = 2,
		/obj/item/gun/ballistic/shotgun/automatic/combat/kammerer = 1,
	)
	refill_canister = /obj/item/vending_refill/wardrobe/bar_wardrobe
	payment_department = ACCOUNT_MED
	extra_price = PAYCHECK_COMMAND

/obj/machinery/vending/emagged/wardrobe/law_wardrobe
	name = "LawDrobe"
	desc = "Objection! This wardrobe dispenses the rule of law... and lawyer clothing."
	icon_state = "lawdrobe"
	product_ads = "OBJECTION! Get the rule of law for yourself!"
	vend_reply = "Thank you for using the LawDrobe!"
	products = list(
		/obj/item/clothing/accessory/lawyers_badge = 2,
		/obj/item/clothing/neck/tie = 3,
		/obj/item/clothing/under/rank/civilian/lawyer/bluesuit = 1,
		/obj/item/clothing/under/rank/civilian/lawyer/bluesuit/skirt = 1,
		/obj/item/clothing/suit/toggle/lawyer = 1,
		/obj/item/clothing/under/rank/civilian/lawyer/purpsuit = 1,
		/obj/item/clothing/under/rank/civilian/lawyer/purpsuit/skirt = 1,
		/obj/item/clothing/suit/toggle/lawyer/purple = 1,
		/obj/item/clothing/under/costume/buttondown/slacks/service = 1,
		/obj/item/clothing/under/costume/buttondown/skirt/service = 1,
		/obj/item/clothing/suit/toggle/lawyer/black = 1,
		/obj/item/clothing/suit/toggle/lawyer/greyscale = 1,
		/obj/item/clothing/under/suit/black = 1,
		/obj/item/clothing/under/suit/black/skirt = 1,
		/obj/item/clothing/under/rank/civilian/lawyer/beige = 1,
		/obj/item/clothing/under/rank/civilian/lawyer/beige/skirt = 1,
		/obj/item/clothing/under/suit/black_really = 1,
		/obj/item/clothing/under/suit/black_really/skirt = 1,
		/obj/item/clothing/under/rank/civilian/lawyer/blue = 1,
		/obj/item/clothing/under/rank/civilian/lawyer/blue/skirt = 1,
		/obj/item/clothing/under/rank/civilian/lawyer/red = 1,
		/obj/item/clothing/under/rank/civilian/lawyer/red/skirt = 1,
		/obj/item/clothing/under/rank/civilian/lawyer/black = 1,
		/obj/item/clothing/under/rank/civilian/lawyer/black/skirt = 1,
		/obj/item/clothing/shoes/laceup = 2,
		/obj/item/radio/headset/headset_srv = 2,
		/obj/item/storage/box/evidence = 2,
		/obj/item/fish_feed = 1,
	)
	premium = list(
		/obj/item/clothing/glasses/hud/security = 2,
		/obj/item/clothing/glasses/hud/security/prescription = 2,
	)
	contraband = list(
		/obj/item/pinpointer/crew/omni = 1,
		/obj/item/pen/cybersun = 1,
		/obj/item/detective_scanner = 1, // I'ma do a pheonix wright
	)
	refill_canister = /obj/item/vending_refill/wardrobe/law_wardrobe
	extra_price = PAYCHECK_COMMAND * 0.8
	payment_department = ACCOUNT_SRV

/obj/machinery/vending/emagged/wardrobe/chap_wardrobe
	name = "DeusVend"
	desc = "God wills your purchase."
	icon_state = "chapdrobe"
	product_ads = "Are you being bothered by cultists or pesky revenants? Then come and dress like the holy man!;Clothes for men of the cloth!"
	vend_reply = "Thank you for using the DeusVend!"
	products = list(
		/obj/item/choice_beacon/holy = 1,
		/obj/item/clothing/accessory/pocketprotector/cosmetology = 1,
		/obj/item/clothing/under/rank/civilian/chaplain = 1,
		/obj/item/clothing/under/rank/civilian/chaplain/skirt = 2,
		/obj/item/clothing/shoes/sneakers/black = 1,
		/obj/item/clothing/suit/chaplainsuit/nun = 1,
		/obj/item/clothing/head/chaplain/nun_hood = 1,
		/obj/item/clothing/suit/chaplainsuit/holidaypriest = 1,
		/obj/item/clothing/suit/hooded/chaplainsuit/monkhabit = 1,
		/obj/item/clothing/head/chaplain/kippah = 3,
		/obj/item/clothing/suit/chaplainsuit/whiterobe = 1,
		/obj/item/clothing/head/chaplain/taqiyah/white = 1,
		/obj/item/clothing/head/chaplain/taqiyah/red = 3,
		/obj/item/clothing/suit/chaplainsuit/monkrobeeast = 1,
		/obj/item/clothing/head/rasta = 1,
		/obj/item/clothing/suit/chaplainsuit/shrinehand = 1,
		/obj/item/storage/backpack/cultpack = 1,
		/obj/item/storage/fancy/candle_box = 2,
		/obj/item/radio/headset/headset_srv = 2,
		/obj/item/clothing/suit/chaplainsuit/habit = 1,
		/obj/item/clothing/head/chaplain/habit_veil = 1,
		/obj/item/antag_spawner/nanotrasen/cerberus = 1,
	)
	contraband = list(
		/obj/item/toy/plush/ratplush = 1,
		/obj/item/toy/plush/narplush = 1,
		/obj/item/clothing/head/chaplain/medievaljewhat = 3,
		/obj/item/clothing/head/chaplain/clownmitre = 1,
		/obj/item/clothing/suit/chaplainsuit/clownpriest = 1,
		/obj/item/gun/ballistic/automatic/pistol/mk58 = 1, // A gun with... a full magazine?
	)
	premium = list(
		/obj/item/clothing/head/chaplain/bishopmitre = 1,
		/obj/item/clothing/suit/chaplainsuit/bishoprobe = 1,
	)
	refill_canister = /obj/item/vending_refill/wardrobe/chap_wardrobe
	payment_department = ACCOUNT_SRV

/obj/machinery/vending/emagged/wardrobe/chem_wardrobe
	name = "ChemDrobe"
	desc = "A vending machine for dispensing chemistry related clothing."
	icon_state = "chemdrobe"
	product_ads = "Our clothes are 0.5% more resistant to acid spills! Get yours now!"
	vend_reply = "Thank you for using the ChemDrobe!"
	products = list(
		/obj/item/clothing/head/beret/medical = 2,
		/obj/item/clothing/under/rank/medical/chemist = 2,
		/obj/item/clothing/under/rank/medical/chemist/skirt = 2,
		/obj/item/clothing/suit/toggle/labcoat/chemist = 2,
		/obj/item/clothing/suit/hooded/wintercoat/medical/chemistry = 2,
		/obj/item/clothing/gloves/latex = 2,
		/obj/item/clothing/shoes/sneakers/white = 2,
		/obj/item/storage/backpack/chemistry = 2,
		/obj/item/storage/backpack/satchel/chem = 2,
		/obj/item/storage/backpack/duffelbag/chemistry = 2,
		/obj/item/storage/backpack/messenger/chem = 2,
		/obj/item/storage/bag/chemistry = 2,
		/obj/item/ph_booklet = 3,
		/obj/item/radio/headset/headset_med = 2,
		/obj/item/clothing/glasses/science = 2,
		/obj/item/clothing/glasses/science/prescription = 2,
	)
	premium = list(
		/obj/item/ph_meter = 4,
		/obj/item/reagent_containers/spray/syndicate = 2,
		/obj/item/grenade/chem_grenade/large = 10,
		/obj/item/grenade/chem_grenade/cryo = 5,
		/obj/item/grenade/chem_grenade/pyro = 5,
		/obj/item/grenade/chem_grenade/adv_release = 5,
		/obj/item/flatpack/autolathe = 1,
		/obj/item/stack/sticky_tape/pointy/super = 1,
		/obj/item/stack/sticky_tape/pointy = 2,
		/obj/item/stack/sticky_tape/super = 1,
		/obj/item/stack/sticky_tape = 2,
	)
	refill_canister = /obj/item/vending_refill/wardrobe/chem_wardrobe
	extra_price = PAYCHECK_COMMAND * 0.8
	payment_department = ACCOUNT_MED

/obj/machinery/vending/emagged/wardrobe/gene_wardrobe
	name = "GeneDrobe"
	desc = "A machine for dispensing clothing related to genetics."
	icon_state = "genedrobe"
	product_ads = "Perfect for the mad scientist in you!"
	vend_reply = "Thank you for using the GeneDrobe!"
	products = list(
		/obj/item/clothing/under/rank/rnd/geneticist = 2,
		/obj/item/clothing/under/rank/rnd/geneticist/skirt = 2,
		/obj/item/clothing/suit/toggle/labcoat/genetics = 2,
		/obj/item/clothing/suit/hooded/wintercoat/science/genetics = 2,
		/obj/item/clothing/gloves/latex = 2,
		/obj/item/clothing/shoes/sneakers/white = 2,
		/obj/item/storage/backpack/genetics = 2,
		/obj/item/storage/backpack/satchel/gen = 2,
		/obj/item/storage/backpack/duffelbag/genetics = 2,
		/obj/item/storage/backpack/messenger/gen = 2,
		/obj/item/radio/headset/headset_sci = 2,
		/obj/item/clothing/glasses/science = 1,
		/obj/item/clothing/glasses/science/prescription = 1,
		/obj/item/clothing/glasses/hud/health = 1,
		/obj/item/clothing/glasses/hud/health/prescription = 1,
		/obj/item/toy/plush/carpplushie/dehy_carp = 4,
	)
	refill_canister = /obj/item/vending_refill/wardrobe/gene_wardrobe
	payment_department = ACCOUNT_SCI

/obj/machinery/vending/emagged/wardrobe/viro_wardrobe
	name = "ViroDrobe"
	desc = "An unsterilized machine for dispending virology related clothing."
	icon_state = "virodrobe"
	product_ads = " Viruses getting you down? Then upgrade to sterilized clothing today!"
	vend_reply = "Thank you for using the ViroDrobe"
	products = list(
		/obj/item/clothing/mask/surgical = 2,
		/obj/item/clothing/under/rank/medical/virologist = 2,
		/obj/item/clothing/under/rank/medical/virologist/skirt = 2,
		/obj/item/clothing/head/beret/medical = 2,
		/obj/item/clothing/shoes/sneakers/white = 2,
		/obj/item/clothing/suit/toggle/labcoat/virologist = 2,
		/obj/item/clothing/suit/hooded/wintercoat/medical/viro = 2,
		/obj/item/clothing/gloves/latex = 2,
		/obj/item/storage/backpack/virology = 2,
		/obj/item/storage/backpack/satchel/vir = 2,
		/obj/item/storage/backpack/duffelbag/virology = 2,
		/obj/item/storage/backpack/messenger/vir = 2,
		/obj/item/radio/headset/headset_med = 2,
		/obj/item/clothing/glasses/science = 1,
		/obj/item/clothing/glasses/science/prescription = 1,
		/obj/item/clothing/glasses/hud/health = 1,
		/obj/item/clothing/glasses/hud/health/prescription = 1,
		/obj/item/gun/syringe = 1,
		/obj/item/reagent_containers/hypospray/medipen/manifoldinjector = 1,
	)
	contraband = list(/obj/item/gun/syringe/rapidsyringe = 1,)
	refill_canister = /obj/item/vending_refill/wardrobe/viro_wardrobe
	payment_department = ACCOUNT_MED

/obj/machinery/vending/emagged/wardrobe/det_wardrobe
	name = "\improper DetDrobe"
	desc = "A machine for all your detective needs, as long as you need clothes."
	icon_state = "detdrobe"
	product_ads = "Apply your brilliant deductive methods in style!"
	vend_reply = "Thank you for using the DetDrobe!"
	products = list(
		/obj/item/clothing/head/fedora/det_hat = 2,
		/obj/item/clothing/under/rank/security/detective = 2,
		/obj/item/clothing/under/rank/security/detective/skirt = 2,
		/obj/item/clothing/suit/jacket/det_suit = 2,
		/obj/item/clothing/suit/jacket/det_suit/brown = 2,
		/obj/item/clothing/shoes/sneakers/brown = 2,
		/obj/item/clothing/gloves/latex = 2,
		/obj/item/clothing/gloves/color/black = 2,
		/obj/item/clothing/accessory/waistcoat = 2,
		/obj/item/clothing/under/rank/security/detective/noir = 2,
		/obj/item/clothing/under/rank/security/detective/noir/skirt = 2,
		/obj/item/clothing/shoes/laceup = 2,
		/obj/item/clothing/head/fedora = 2,
		/obj/item/clothing/suit/jacket/det_suit/dark = 1,
		/obj/item/clothing/suit/jacket/det_suit/noir = 1,
		/obj/item/clothing/neck/tie/disco = 1,
		/obj/item/clothing/under/rank/security/detective/disco = 1,
		/obj/item/clothing/suit/jacket/det_suit/disco = 1,
		/obj/item/clothing/shoes/discoshoes = 1,
		/obj/item/clothing/glasses/regular/kim = 1,
		/obj/item/clothing/under/rank/security/detective/kim = 1,
		/obj/item/clothing/suit/jacket/det_suit/kim = 1,
		/obj/item/clothing/gloves/kim = 1,
		/obj/item/clothing/shoes/kim = 1,
		/obj/item/reagent_containers/cup/glass/flask/det = 2,
		/obj/item/storage/fancy/cigarettes = 5,
		/obj/item/storage/fancy/cigarettes/cigpack_candy = 5,
		/obj/item/gun/ballistic/revolver/c38 = 1,
	)
	premium = list(
		/obj/item/clothing/head/flatcap = 1,
		/obj/item/ammo_box/c38/match/bouncy = 1,
		/obj/item/ammo_casing/c38 = 4,
		/obj/item/ammo_casing/c38/match = 4,
	)
	contraband = list(
		/obj/item/ammo_casing/a357 = 1,
		/obj/item/ammo_box/c38/trac = 1,
		/obj/item/ammo_casing/c38/dumdum = 1,
		/obj/item/ammo_casing/c38/hotshot = 1,
		/obj/item/ammo_casing/c38/iceblox = 1,
	)
	refill_canister = /obj/item/vending_refill/wardrobe/det_wardrobe
	extra_price = PAYCHECK_COMMAND * 1.75
	payment_department = ACCOUNT_SEC

/obj/machinery/vending/emagged/wardrobe/cent_wardrobe
	name = "\improper CentDrobe"
	desc = "A one-of-a-kind vending machine for all your centcom aesthetic needs!"
	icon_state = "centdrobe"
	product_ads = "Show those ERTs who's the most stylish in the briefing room!"
	vend_reply = "Thank you for using the CentDrobe!"
	products = list(
		/obj/item/clothing/glasses/sunglasses = 3,
		/obj/item/clothing/head/hats/centcom_cap = 3,
		/obj/item/clothing/head/hats/centhat = 3,
		/obj/item/clothing/head/hats/intern = 3,
		/obj/item/clothing/under/rank/centcom/commander = 3,
		/obj/item/clothing/under/rank/centcom/centcom_skirt = 3,
		/obj/item/clothing/under/rank/centcom/intern = 3,
		/obj/item/clothing/under/rank/centcom/official = 3,
		/obj/item/clothing/under/rank/centcom/officer = 3,
		/obj/item/clothing/under/rank/centcom/officer_skirt = 3,
		/obj/item/clothing/suit/armor/centcom_formal = 3,
		/obj/item/clothing/suit/space/officer = 3,
		/obj/item/clothing/suit/hooded/wintercoat/centcom = 3,
		/obj/item/clothing/shoes/laceup = 3,
		/obj/item/clothing/shoes/jackboots = 3,
		/obj/item/clothing/gloves/combat = 3,
		/obj/item/mod/control/pre_equipped/corporate = 1,
	)
	refill_canister = /obj/item/vending_refill/wardrobe/cent_wardrobe

/obj/machinery/vending/emagged/chemical
	name = "\improper NanoChemicals"
	desc = "It's a chemical dispensery with bottled chemicals. It's since gone out of style in favor of the typical chem dispenser."
	icon = 'hypermods/icons/obj/machines/vending.dmi'
	icon_state = "chemicals"
	icon_deny = "chemicals-deny"
	panel_type = "panel11"
	product_ads = "Fancy yourself a chemist?;Bubbles and froths!;Mix and match!;Natural chemicals!;Not recommended for children.;Don't you want some?;Ping!"
	products = list(
		/obj/item/reagent_containers/cup/bottle/aluminium = 50,
		/obj/item/reagent_containers/cup/bottle/bromine = 50,
		/obj/item/reagent_containers/cup/bottle/carbon = 50,
		/obj/item/reagent_containers/cup/bottle/chlorine = 50,
		/obj/item/reagent_containers/cup/bottle/copper = 50,
		/obj/item/reagent_containers/cup/bottle/ethanol = 50,
		/obj/item/reagent_containers/cup/bottle/fluorine = 50,
		/obj/item/reagent_containers/cup/bottle/hydrogen = 50,
		/obj/item/reagent_containers/cup/bottle/iodine = 50,
		/obj/item/reagent_containers/cup/bottle/iron = 50,
		/obj/item/reagent_containers/cup/bottle/lithium = 50,
		/obj/item/reagent_containers/cup/bottle/mercury = 50,
		/obj/item/reagent_containers/cup/bottle/nitrogen = 50,
		/obj/item/reagent_containers/cup/bottle/oxygen = 50,
		/obj/item/reagent_containers/cup/bottle/phosphorus = 50,
		/obj/item/reagent_containers/cup/bottle/potassium = 50,
		/obj/item/reagent_containers/cup/bottle/radium = 50,
		/obj/item/reagent_containers/cup/bottle/silicon = 50,
		/obj/item/reagent_containers/cup/bottle/sodium = 50,
		/obj/item/reagent_containers/cup/bottle/stable_plasma = 50,
		/obj/item/reagent_containers/cup/bottle/sugar = 50,
		/obj/item/reagent_containers/cup/bottle/sulfur = 50,
		/obj/item/reagent_containers/cup/bottle/sacid = 50,
		/obj/item/reagent_containers/cup/bottle/water = 50,
		/obj/item/reagent_containers/cup/bottle/welding_fuel = 50,
	)
	premium = list(
		/obj/item/stack/sheet/plastic = 10,
		/obj/item/reagent_containers/cup/bottle/formaldehyde = 5,
		/obj/item/reagent_containers/cup/bottle/plasma = 20,
		/obj/item/reagent_containers/cup/bottle/silver = 20,
		/obj/item/reagent_containers/cup/bottle/gold = 20,
		/obj/item/reagent_containers/cup/bottle/uranium = 20,
		/obj/item/reagent_containers/cup/bottle/acidic_buffer = 20,
		/obj/item/reagent_containers/cup/bottle/basic_buffer = 20,
	)
	default_price = 10
	extra_price = 100
	payment_department = ACCOUNT_MED
