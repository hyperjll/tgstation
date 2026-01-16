//as of:10/28/2019:
//boxstation: ~153 loot items spawned
//metastation: ~183 loot items spawned
//deltastation: ~165 loot items spawned

//how to balance maint loot spawns:
// 1) Ensure each category has items of approximately the same power level
// 2) Tune weight of each category until average power of a maint loot spawn is acceptable
// 3) Mapping considerations - Loot value should scale with difficulty of acquisition, or an assistaint will run through collecting free gear with no risk

//goal of maint loot:
// 1) Provide random equipment to people who take effort to crawl maint
// 2) Create memorable moments with very rare, crazy items

//Loot tables

GLOBAL_LIST_INIT(trash_loot, list(//junk: useless, very easy to get, or ghetto chemistry items
	list(//trash
		/obj/item/trash/can = 1,
		/obj/item/trash/candy = 1,
		/obj/item/trash/cheesie = 1,
		/obj/item/trash/chips = 1,
		/obj/item/trash/pistachios = 1,
		/obj/item/trash/popcorn = 1,
		/obj/item/trash/raisins = 1,
		/obj/item/trash/sosjerky = 1,
		/obj/item/trash/flare = 1,
		/obj/item/trash/candle = 1,

		/obj/item/c_tube = 1,
		/obj/item/disk/data = 1,
		/obj/item/folder/yellow = 1,
		/obj/item/hand_labeler = 1,
		/obj/item/paper = 1,
		/obj/item/paper/crumpled = 1,
		/obj/item/pen = 1,
		/obj/item/photo/old = 1,
		/obj/item/poster/random_contraband = 1,
		/obj/item/poster/random_official = 1,
		/obj/item/stack/sheet/cardboard = 1,
		/obj/item/storage/box = 1,

		/obj/effect/decal/cleanable/ash = 1,
		/obj/item/camera = 1,
		/obj/item/camera_film = 1,
		/obj/item/cigbutt = 1,
		/obj/item/coin/silver = 1,
		/obj/item/food/urinalcake = 1,
		/obj/item/light/bulb = 1,
		/obj/item/light/tube = 1,
		/obj/item/reagent_containers/cup/glass/drinkingglass = 1,

		/obj/item/airlock_painter = 1,
		/obj/item/airlock_painter/decal = 2,
		/obj/item/clothing/mask/breath = 1,
		/obj/item/rack_parts = 1,
		/obj/item/shard = 1,

		/obj/item/food/breadslice/moldy = 1,

		/obj/item/reagent_containers/applicator/pill/maintenance/achievement = 1,
		/obj/item/toy/eightball = 1,
		) = 8,

	list(//tier 1 stock parts
		/obj/item/stock_parts/capacitor = 1,
		/obj/item/stock_parts/servo = 1,
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/stock_parts/micro_laser = 1,
		/obj/item/stock_parts/scanning_module = 1,
		) = 1,
	))



GLOBAL_LIST_INIT(common_loot, list( //common: basic items
	list(//tools
		/obj/item/analyzer = 1,
		/obj/item/crowbar = 1,
		/obj/item/geiger_counter = 1,
		/obj/item/mop = 1,
		/obj/item/pushbroom = 1,
		/obj/item/reagent_containers/cup/bucket = 1,
		/obj/item/screwdriver = 1,
		/obj/item/t_scanner = 1,
		/obj/item/toy/crayon/spraycan = 1,
		/obj/item/weldingtool = 1,
		/obj/item/wirecutters = 1,
		/obj/item/wrench = 1,
		) = 1,

	list(//equipment
		/obj/effect/spawner/random/clothing/gloves = 1,
		/obj/item/clothing/glasses/meson = 1,
		/obj/item/clothing/glasses/science = 1,
		/obj/item/clothing/gloves/color/black = 1,
		/obj/item/clothing/gloves/color/fyellow = 1,
		/obj/item/clothing/mask/gas = 1,
		/obj/item/clothing/shoes/sneakers/black = 1,
		/obj/item/clothing/suit/hazardvest = 1,
		/obj/item/clothing/suit/toggle/labcoat = 1,
		/obj/item/clothing/under/color/grey = 1,
		/obj/item/radio/headset = 1,
		/obj/item/storage/backpack = 1,
		/obj/item/storage/belt/fannypack = 1,
		/obj/item/storage/wallet/random = 1,
		) = 1,

	list(//construction and crafting
		/obj/item/sign = 1,
		/obj/item/stack/cable_coil = 1,
		/obj/item/stack/rods/twentyfive = 1,
		/obj/item/stack/sheet/iron/twenty = 1,
		/obj/item/stack/sheet/mineral/plasma = 1,
		/obj/item/stock_parts/power_store/cell = 1,
		/obj/effect/spawner/random/engineering/vending_restock = 1,
		//assemblies
		/obj/item/assembly/health = 1,
		/obj/item/assembly/igniter = 1,
		/obj/item/assembly/infra = 1,
		/obj/item/assembly/mousetrap = 1,
		/obj/item/assembly/prox_sensor = 1,
		/obj/item/assembly/signaler = 1,
		/obj/item/assembly/timer = 1,
		/obj/item/stack/package_wrap = 1,
		/obj/item/stack/wrapping_paper = 1,
		/obj/item/bombcore/foam_dart = 1,
		) = 1,

	list(//medical and chemicals
		/obj/item/grenade/chem_grenade/cleaner = 1,
		/obj/item/grenade/chem_grenade/smart_metal_foam = 1,
		/obj/item/lead_pipe = 1,
		/obj/item/reagent_containers/cup/beaker = 1,
		/obj/item/reagent_containers/cup/bottle/random_buffer = 2,
		/obj/item/rag = 1,
		/obj/item/reagent_containers/hypospray/medipen/pumpup = 2,
		/obj/item/reagent_containers/syringe = 1,
		/obj/item/stock_parts/power_store/cell/lead = 1,
		/obj/item/storage/box/matches = 1,
		list(//cigarettes and cigars
			/obj/item/storage/fancy/cigarettes = 20,
			/obj/item/storage/fancy/cigarettes/dromedaryco = 20,
			/obj/item/storage/fancy/cigarettes/cigpack_uplift = 20,
			/obj/item/storage/fancy/cigarettes/cigpack_robust = 20,
			/obj/item/storage/fancy/cigarettes/cigpack_robustgold = 4,
			/obj/item/storage/fancy/cigarettes/cigpack_greytide = 3,
			/obj/item/storage/fancy/cigarettes/cigpack_carp = 2,
			/obj/item/storage/fancy/cigarettes/cigpack_syndicate = 1,
			/obj/item/storage/fancy/cigarettes/cigpack_midori = 2,
			/obj/item/storage/fancy/cigarettes/cigpack_candy = 2,
			/obj/item/storage/fancy/cigarettes/cigpack_shadyjims = 2,
			/obj/item/storage/fancy/cigarettes/cigpack_xeno = 2,
			/obj/item/storage/fancy/cigarettes/cigpack_cannabis = 2,
			/obj/item/storage/fancy/cigarettes/cigpack_mindbreaker = 1,
			/obj/item/storage/fancy/cigarettes/flash_powder = 1,
			/obj/item/storage/fancy/rollingpapers = 3,
			/obj/item/storage/fancy/cigarettes/cigars = 6,
			/obj/item/storage/fancy/cigarettes/cigars/cohiba = 3,
			/obj/item/storage/fancy/cigarettes/cigars/havana = 3,
			) = 1,
		) = 1,

	list(//food
		/obj/effect/spawner/random/food_or_drink/booze = 4,
		/obj/item/reagent_containers/cup/glass/coffee = 12,
		/obj/effect/spawner/random/food_or_drink/snack = 6,
		/obj/effect/spawner/random/food_or_drink/snack/lizard = 5,
		/obj/effect/spawner/random/food_or_drink/donkpockets_single = 8,
		/obj/effect/spawner/random/food_or_drink/condiment = 2,
		/obj/effect/spawner/random/food_or_drink/donuts = 5,
		/obj/item/food/rationpack = 8,
		/obj/effect/spawner/random/food_or_drink/refreshing_beverage = 10,
		) = 1,

	list(//misc
		/obj/item/bodybag = 1,
		/obj/item/extinguisher = 1,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/grenade/foam_dart = 1,
		/obj/item/radio/off = 1,
		/obj/item/stack/spacecash/c10 = 1,
		/obj/item/stack/sticky_tape = 1,
		/obj/item/tank/internals/emergency_oxygen = 1,
		/obj/item/paper/paperslip/fishing_tip = 1,
		/obj/effect/spawner/random/bedsheet = 1,

		//light sources
		/obj/effect/spawner/random/decoration/glowstick = 1,
		/obj/item/clothing/head/utility/hardhat/red = 1,
		/obj/item/flashlight = 1,
		/obj/item/flashlight/flare = 1,
		) = 1,

	list(//better stock parts
		list(//tier 2 stock parts
			/obj/item/stock_parts/capacitor/adv = 1,
			/obj/item/stock_parts/servo/nano = 1,
			/obj/item/stock_parts/matter_bin/adv = 1,
			/obj/item/stock_parts/micro_laser/high = 1,
			/obj/item/stock_parts/scanning_module/adv = 1,
			) = 4,
		list(//subspace stock parts, telecomms
			/obj/item/stock_parts/subspace/ansible = 1,
			/obj/item/stock_parts/subspace/filter = 1,
			/obj/item/stock_parts/subspace/amplifier = 1,
			/obj/item/stock_parts/subspace/treatment = 1,
			/obj/item/stock_parts/subspace/analyzer = 1,
			/obj/item/stock_parts/subspace/crystal = 1,
			/obj/item/stock_parts/subspace/transmitter = 1,
			) = 1,
		) = 1,
	))



GLOBAL_LIST_INIT(uncommon_loot, list(//uncommon: useful items
	list(//tools
		/obj/item/grenade/iedcasing/spawned = 1,
		/obj/item/hatchet = 1,
		/obj/item/melee/baton/security/cattleprod = 1,
		/obj/item/multitool = 1,
		/obj/item/pen/fountain = 1,
		/obj/item/restraints/handcuffs/cable = 1,
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/emergency_bed = 1,
		/obj/item/spear = 1,
		/obj/item/weldingtool/largetank = 1,
		/obj/item/market_uplink/blackmarket = 1,
		/obj/effect/spawner/random/medical/surgery_tool = 1,
		) = 8,

	list(//equipment
		/obj/item/clothing/ears/earmuffs = 1,
		/obj/item/clothing/glasses/hud/diagnostic = 1,
		/obj/item/clothing/glasses/hud/health = 1,
		/obj/item/clothing/glasses/salesman = 1,
		/obj/item/clothing/glasses/nightmare_vision = 1,
		/obj/item/clothing/glasses/welding = 1,
		/obj/item/clothing/gloves/tackler/offbrand = 1,
		/obj/item/clothing/head/helmet/old = 1,
		/obj/item/clothing/head/utility/welding = 1,
		/obj/item/clothing/mask/muzzle = 1,
		/obj/item/clothing/suit/armor/vest/old = 1,
		/obj/item/storage/belt/medical = 1,
		/obj/item/storage/belt/utility = 1,
		/obj/item/pen/screwdriver = 1,
		) = 8,

	list(//rarer equipment
		/obj/item/grenade/chem_grenade/pyro = 2,
		/obj/item/grenade/chem_grenade/cryo = 2,
		/obj/item/grenade/chem_grenade/large = 3,
		/obj/item/grenade/chem_grenade/adv_release = 2,
		/obj/item/dnainjector/densebones = 1,
		/obj/item/dnainjector/thickskin = 1,
		/obj/item/dnainjector/fat = 1,
		/obj/item/dnainjector/ear_cancer = 1,
		/obj/item/dnainjector/lisp = 1,
		/obj/item/dnainjector/void = 1,
		/obj/item/dnainjector/paranoia = 1,
		/obj/item/dnainjector/olfaction = 1,
		/obj/item/dnainjector/gigantism = 1,
		/obj/item/dnainjector/antenna = 1,
		) = 6,

	list(//strange objects
		/obj/item/relic = 5,
		) = 8,

	list(//construction, crafting and misc
		/obj/item/beacon = 1,
		/obj/item/paper/fluff/stations/soap = 1, //recipes count as crafting.
		/obj/item/plaque = 1,
		/obj/item/seeds/kronkus = 3,
		/obj/item/seeds/odious_puffball = 1,
		/obj/item/stack/sheet/mineral/wood/fifty = 1,
		list(//batteries
			/obj/item/stock_parts/power_store/cell/high = 1,
			/obj/item/stock_parts/power_store/battery/high = 1,
			) = 1,
		/obj/item/storage/box/clown = 1,
		/obj/item/storage/box/fireworks = 1,
		/obj/effect/spawner/random/medical/supplies = 1,
		/obj/item/storage/box/shipping = 1,
		/obj/item/storage/box/emergencytank = 1,
		/obj/item/storage/box/coffeepack = 1,
		/obj/item/storage/box/survival = 1, // interesting find, considering it's one of VERY few ways to acquire more space medipens.
		/obj/item/storage/box/medipens = 1,
		/obj/item/storage/box/alchemist_chemistry_kit = 1,
		/obj/item/weaponcrafting/receiver = 1,
		/obj/item/weaponcrafting/stock = 1,
		/obj/item/book/granter/crafting_recipe/death_sandwich = 1,
		/obj/item/book/granter/crafting_recipe/cooking_sweets_101 = 1,
		/obj/item/book/granter/crafting_recipe/fletching = 1,
		/obj/item/survivalcapsule/fishing = 1,
		/obj/item/survivalcapsule/bathroom = 1,
		/obj/item/storage/toolbox/emergency = 1,
		/obj/item/storage/toolbox/electrical = 1,
		/obj/item/storage/toolbox/mechanical = 1,
		/obj/item/stack/sheet/iron/fifty = 1,
		/obj/item/stack/sheet/glass/fifty = 1,
		/obj/item/stack/rods/fifty = 1,
		/obj/item/stack/sheet/rglass/fifty = 1,
		/obj/item/stack/sheet/cloth/ten = 1,
		list(//soap
			/obj/item/soap = 10,
			/obj/item/soap/homemade = 10,
			/obj/item/soap/nanotrasen = 10,
			/obj/item/soap/deluxe = 8,
			) = 1,
		list(//misc
			/obj/item/deployablemine/gas = 1,
			/obj/item/deployablemine/stun = 1,
			/obj/item/stack/sheet/mineral/diamond/five = 1,
			/obj/item/stack/sheet/mineral/uranium/five = 1,
			/obj/item/stack/sheet/mineral/plasma/five = 3,
			/obj/item/stack/sheet/mineral/gold/five = 2,
			/obj/item/stack/sheet/mineral/silver/five = 2,
			/obj/item/stack/sheet/plastic/fifty = 2,
			/obj/item/storage/box/coffeepack/robusta = 3,
			) = 1,
		) = 8,

	list(//machines
		list(//all major machines
			/obj/effect/spawner/random/techstorage/service_all/random_pick = 5,
			/obj/effect/spawner/random/techstorage/rnd_all/random_pick = 3,
			/obj/effect/spawner/random/techstorage/security_all/random_pick = 2,
			/obj/effect/spawner/random/techstorage/engineering_all/random_pick = 3,
			/obj/effect/spawner/random/techstorage/tcomms_all/random_pick = 2,
			/obj/effect/spawner/random/techstorage/medical_all/random_pick = 4,
			/obj/effect/spawner/random/techstorage/ai_all/random_pick = 2,
			/obj/effect/spawner/random/techstorage/command_all/random_pick = 1,
			/obj/effect/spawner/random/techstorage/rnd_secure_all/random_pick = 1,
			) = 20,
		/obj/item/circuitboard/machine/ltsrbt = 1,
		) = 4,

	list(//medical and chemicals
		list(//basic healing items
			/obj/item/stack/medical/gauze = 2,
			/obj/item/stack/medical/mesh = 2,
			/obj/item/stack/medical/suture = 2,
			/obj/item/stack/medical/bandage = 3,
			/obj/item/stack/medical/bone_gel = 1,
			/obj/item/stack/medical/bloodpack = 1,
			) = 4,
		list(//medical chems
			/obj/item/reagent_containers/hypospray/medipen = 4,
			/obj/item/reagent_containers/syringe/convermol = 2,
			/obj/item/reagent_containers/syringe/calomel = 2,
			/obj/item/reagent_containers/syringe/antiviral = 2,
			/obj/item/reagent_containers/syringe/noreact = 1,
			/obj/effect/spawner/random/medical/chem_supplies = 10,
			) = 4,
		list(//drinks
			/obj/item/reagent_containers/cup/glass/bottle/vodka = 1,
			/obj/item/reagent_containers/cup/glass/drinkingglass/filled/nuka_cola = 1,
			/obj/item/reagent_containers/cup/soda_cans/grey_bull = 1,
			) = 4,
		list(//sprayers
			/obj/item/reagent_containers/spray = 1,
			/obj/item/watertank = 1,
			/obj/item/watertank/janitor = 1,
			) = 4,
		list(//other chems
			/obj/item/reagent_containers/cup/jerrycan/oil = 2, //Not the most exciting reagent, but a staple. And you get a cool can for your pyrotechnics.
			/obj/item/reagent_containers/cup/jerrycan/space_cleaner = 2, //If you can't find the janitor, the medbay might also appreciate some readymade cleaner.
			/obj/item/reagent_containers/cup/jerrycan/sus = 1, //what assitant wouldn't like a vibrant jug o' phlog?
			/obj/item/reagent_containers/cup/jerrycan/diethylamine = 1, //Im sure the botanist would appreciate it, but it is also really cool for maintenance science projects.
			) = 2,
		list(//medical equipment
			/obj/item/reagent_containers/hypospray/buyable = 2,
			/obj/item/reagent_containers/hypospray/medipen/lrd = 1,
			) = 1,
		list(//contraband
			/obj/item/reagent_containers/syringe/contraband/opium = 4,
			/obj/item/reagent_containers/syringe/contraband/space_drugs = 2,
			/obj/item/reagent_containers/syringe/contraband/krokodil = 1,
			/obj/item/reagent_containers/syringe/contraband/saturnx = 1,
			/obj/item/reagent_containers/syringe/contraband/morphine = 1,
			/obj/item/reagent_containers/hypospray/medipen/cryogel = 1,
			/obj/item/reagent_containers/cup/bottle/traitor = 1,
			) = 2,
		) = 8,

	list(//food
		list(//Canned Food
			/obj/item/food/canned/peaches/maint = 3, // Maintenance peaches are a GEM.
			/obj/item/food/canned/beans = 1,
			/obj/item/food/canned/tomatoes = 1,
			/obj/item/food/canned/pine_nuts = 1,
			/obj/item/food/canned/envirochow = 1,
			/obj/item/food/canned/squid_ink = 1,
			/obj/item/food/canned/chap = 1,
			) = 6,
		/obj/item/storage/box/gum/happiness = 6,
		/obj/effect/spawner/random/food_or_drink/jelly_donuts = 2,
		list(//Donk Varieties
			/obj/item/storage/box/donkpockets = 1,
			/obj/item/storage/box/donkpockets/donkpocketberry = 1,
			/obj/item/storage/box/donkpockets/donkpockethonk = 1,
			/obj/item/storage/box/donkpockets/donkpocketpizza = 1,
			/obj/item/storage/box/donkpockets/donkpocketspicy = 1,
			/obj/item/storage/box/donkpockets/donkpocketteriyaki = 1,
			) = 6,
		list(//Donk-dinner Varieties
			/obj/item/food/ready_donk = 1,
			/obj/item/food/ready_donk/donkhiladas = 1,
			/obj/item/food/ready_donk/mac_n_cheese = 1,
			/obj/item/food/ready_donk/nachos_grandes = 1,
			/obj/item/food/ready_donk/donkrange_chicken = 1,
			/obj/item/food/ready_donk/salisbury_steak = 1,
			/obj/item/food/ready_donk/country_chicken = 1,
			) = 6,
		/obj/item/food/monkeycube = 5,
		list(//special food items
			/obj/item/storage/fancy/heart_box = 1,
			/obj/item/storage/fancy/nugget_box = 1,
			/obj/item/storage/fancy/pickles_jar = 1,
			) = 2,
		list(//better food items
			/obj/effect/spawner/random/food_or_drink/soup = 1,
			/obj/effect/spawner/random/food_or_drink/salad = 1,
			/obj/effect/spawner/random/food_or_drink/dinner = 1,
			/obj/effect/spawner/random/food_or_drink/three_course_meal = 1,
			/obj/effect/spawner/random/food_or_drink/pizzaparty = 1,
			) = 3,
		list(//RARE food items
			/obj/item/food/spaghetti = 1,
			list(//rare breads
				/obj/item/food/bread/banana = 1,
				/obj/item/food/bread/tofu = 1,
				/obj/item/food/bread/creamcheese = 1,
				/obj/item/food/bread/mimana = 1,
				/obj/item/food/baguette = 1,
				/obj/item/food/garlicbread = 1,
				/obj/item/food/croissant = 1,
				) = 2,
			list(//rare burgers
				/obj/item/food/burger/rat = 10, // The pinnacle of disappointment...
				/obj/item/food/burger/clown = 3,
				/obj/item/food/burger/mime = 3,
				list(//colorful burgers
					/obj/item/food/burger/red = 1,
					/obj/item/food/burger/orange = 1,
					/obj/item/food/burger/yellow = 1,
					/obj/item/food/burger/green = 1,
					/obj/item/food/burger/blue = 1,
					/obj/item/food/burger/purple = 1,
					/obj/item/food/burger/black = 1,
					/obj/item/food/burger/white = 1,
					) = 2,
				/obj/item/food/burger/bigbite = 2,
				/obj/item/food/burger/superbite = 1,
				/obj/item/food/burger/fivealarm = 3,
				/obj/item/food/burger/empoweredburger = 3,
				/obj/item/food/burger/chicken = 4,
				/obj/item/food/burger/cheese = 4,
				/obj/item/food/burger/crazy = 2,
				) = 2,
			list(//rare cake
				/obj/item/food/cake = 1,
				/obj/item/food/cake/carrot = 1,
				/obj/item/food/cake/cheese = 1,
				/obj/item/food/cake/orange = 1,
				/obj/item/food/cake/lime = 1,
				/obj/item/food/cake/lemon = 1,
				/obj/item/food/cake/chocolate = 1,
				/obj/item/food/cake/birthday = 1,
				/obj/item/food/cake/birthday/energy = 1,
				/obj/item/food/cake/apple = 1,
				/obj/item/food/cake/slimecake = 1,
				/obj/item/food/cake/pumpkinspice = 1,
				/obj/item/food/cake/holy_cake = 1,
				/obj/item/food/cake/vanilla_cake = 1,
				/obj/item/food/cake/clown_cake = 1,
				/obj/item/food/cake/fruit = 1,
				/obj/item/food/cake/plum = 1,
				) = 1,
			) = 1,
		) = 8,

	list(//Donk Co. 'Donk Spike' flechette shells, these things show up everywhere in donkpocket boxes
		/obj/item/storage/box/donkpockets/donkpocketshell = 1,
		) = 8,

	list(//computer disks
		/obj/item/disk/computer/maintenance/scanner = 1,
		/obj/item/disk/computer/maintenance/camera = 1,
		/obj/item/disk/computer/maintenance/modsuit_control = 1,
		/obj/item/disk/computer/maintenance/spectre_meter = 1,
		/obj/item/disk/computer/maintenance/arcade = 1,
		/obj/item/disk/design_disk/liberator = 1,
		/obj/item/disk/computer/maintenance/theme = 3,
	) = 4,

	list(//modsuits
		/obj/effect/spawner/random/mod/maint = 3,
		/obj/item/mod/construction/broken_core = 1,
		) = 4,

	list(//music
		/obj/item/instrument/accordion = 5,
		/obj/item/instrument/banjo = 5,
		/obj/item/instrument/bikehorn = 2,
		/obj/item/instrument/eguitar = 5,
		/obj/item/instrument/glockenspiel = 5,
		/obj/item/instrument/guitar = 5,
		/obj/item/instrument/harmonica = 5,
		/obj/item/instrument/musicalmoth = 1,
		/obj/item/instrument/recorder = 5,
		/obj/item/instrument/saxophone = 5,
		/obj/item/instrument/trombone = 5,
		/obj/item/instrument/trumpet = 5,
		/obj/item/instrument/violin = 5,
		/obj/item/instrument/violin/golden = 2,
		) = 4,

	list(//contraband & weapons
		/obj/item/gun/ballistic/flaregun = 10,
		/obj/item/storage/toolbox/guncase/flaregun = 1,
		/obj/effect/spawner/random/contraband = 4,
		/obj/item/reagent_containers/cup/glass/coffee/syndicate = 2,
		) = 3,

	list(//fakeout items, keep this list at low relative weight
		/obj/item/clothing/shoes/jackboots = 1,
		/obj/item/dice/d20 = 1, //To balance out the stealth die of fates in oddities
		) = 1,

	list(//maintenance jerrycan -- like the maint pill but can have up to 4 diff chems.
		/obj/item/reagent_containers/cup/jerrycan/random = 1,
		) = 5,
))



GLOBAL_LIST_INIT(rarity_loot, list(//rare: really good items
	list(//tools
		/obj/item/assembly/flash/memorizer = 1,
		/obj/item/flashlight/flashdark = 1,
		/obj/item/knife/kitchen = 1,
		/obj/item/melee/baton/security/cattleprod/teleprod = 1,
		/obj/item/pen/survival = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/shield/buckler = 1,
		/obj/item/shield/improvised = 1,
		/obj/item/throwing_star = 1,
		/obj/item/weldingtool/hugetank = 1,
		/obj/item/fishing_rod/telescopic/master = 1,
		/obj/item/spess_knife = 1,
		/obj/item/gun/ballistic/automatic/pistol/doorhickey = 1,
		) = 3,

	list(//equipment
		/obj/item/clothing/glasses/hud/security = 1,
		/obj/item/clothing/glasses/sunglasses = 1,
		/obj/item/clothing/gloves/color/black/security = 1,
		/obj/item/clothing/gloves/color/yellow = 1,
		/obj/item/clothing/gloves/tackler/combat = 1,
		/obj/item/clothing/head/helmet/toggleable/justice = 1,
		/obj/item/storage/belt/military/assault = 1,
		/obj/item/storage/belt/security = 1,
		) = 3,

	list(//actual weapons and shit
		/obj/item/gun/ballistic/rifle/boltaction/pipegun/pistol = 2,
		/obj/item/gun/ballistic/automatic/pistol/toy = 3,
		/obj/item/gun/ballistic/bow = 2,
		/obj/item/dnainjector/acid_touch/unstable = 1,
		/obj/item/dnainjector/cryokinesis = 1,
		) = 3,

	list(//paint
		/obj/item/paint/anycolor = 1,
		/obj/item/paint/black = 1,
		/obj/item/paint/blue = 1,
		/obj/item/paint/green = 1,
		/obj/item/paint/paint_remover = 1,
		/obj/item/paint/red = 1,
		/obj/item/paint/violet = 1,
		/obj/item/paint/white = 1,
		/obj/item/paint/yellow = 1,
		) = 3,

	list(//medical and chemicals
		list(//basic healing items
			/obj/item/stack/medical/suture/medicated = 4,
			/obj/item/stack/medical/mesh/advanced = 4,
			/obj/item/reagent_containers/applicator/patch/mender/brute = 1,
			/obj/item/reagent_containers/applicator/patch/mender/burn = 1,
			/obj/item/reagent_containers/applicator/patch/mender/toxin = 1,
			/obj/item/reagent_containers/applicator/patch/mender/oxy = 1,
			) = 4,
		list(//medkits
			/obj/item/storage/box/hug/medical = 2,
			/obj/item/storage/medkit/emergency = 3,
			/obj/item/storage/medkit/regular = 2,
			/obj/item/storage/box/bandages = 3,
			/obj/item/storage/medkit/surgery = 1,
			/obj/item/storage/medkit/fire = 2,
			/obj/item/storage/medkit/toxin = 2,
			/obj/item/storage/medkit/o2 = 2,
			/obj/item/storage/medkit/brute = 2,
			/obj/item/storage/medkit/advanced = 1,
			) = 4,
		list(//rarer medkits
			/obj/item/storage/medkit/expanded/regular = 10,
			/obj/item/storage/medkit/expanded/fire = 3,
			/obj/item/storage/medkit/expanded/toxin = 3,
			/obj/item/storage/medkit/expanded/o2 = 3,
			/obj/item/storage/medkit/expanded/brute = 3,
			/obj/item/storage/medkit/expanded/advanced = 1,
			) = 2,
		list(//medical chems
			/obj/item/reagent_containers/hypospray/medipen/oxandrolone = 2,
			/obj/item/reagent_containers/hypospray/medipen/salacid = 2,
			/obj/item/reagent_containers/hypospray/medipen/penacid = 2,
			/obj/item/reagent_containers/hypospray/medipen/salbutamol = 2,
			/obj/item/reagent_containers/hypospray/medipen/atropine = 1,
			/obj/item/reagent_containers/hypospray/medipen/blood_loss = 2,
			) = 5,
		list(//RARER medical chems
			/obj/item/reagent_containers/cup/galaxy_gas = 1,
			/obj/item/reagent_containers/hypospray/medipen/spacepen = 2,
			/obj/item/auto_pump = 3,
			/obj/item/reagent_containers/cup/bottle/wittel = 1,
			/obj/item/reagent_containers/applicator/patch/mender/all = 1,
			) = 1,
		list(//Contraband medical stuff
			/obj/item/reagent_containers/syringe/contraband/methamphetamine = 3,
			/obj/item/reagent_containers/syringe/contraband/heroin = 3,
			/obj/item/reagent_containers/cup/bottle/mindwipe = 1,
			) = 2,
		) = 3,

	list(//misc
		/obj/item/book/granter/crafting_recipe/dusting/pipegun_prime = 1,
		/obj/item/book/granter/crafting_recipe/trash_cannon = 1,
		/obj/item/book/granter/crafting_recipe/dusting/laser_musket_prime = 1,
		/obj/item/book/granter/sign_language = 1,
		/obj/item/disk/nuclear/fake = 1,
		/obj/item/disk/surgery/advanced_plastic_surgery = 1,
		/obj/item/skillchip/brainwashing = 1,
		/obj/item/skillchip/intj = 1,
		/obj/item/tattoo_kit = 1,
		/obj/item/folder/ancient_paperwork = 1,
		/obj/item/storage/box/randomextract = 1,
		/obj/item/storage/box/randomextractcross = 1,
		/obj/effect/spawner/random/exotic/languagebook = 1,
		/obj/item/implantcase/biosig = 1,
		) = 3,

	list(//contraband
		/obj/item/raw_anomaly_core/random = 1,
		/obj/effect/spawner/random/contraband/grenades = 2,
		/obj/effect/spawner/random/exotic/syndie = 1,
		/obj/item/dnainjector/no_fingerprints = 1,
		/obj/item/storage/box/methdealer = 1,
		/obj/item/storage/box/opiumdealer = 1,
		/obj/item/storage/box/kronkdealer = 1,
		) = 1,

))



GLOBAL_LIST_INIT(oddity_loot, list(//oddity: strange or crazy items
		/obj/effect/rune/teleport = 1,
		/obj/item/clothing/head/helmet/abductor = 1,
		/obj/item/clothing/shoes/jackboots/fast = 1,
		/obj/item/clothing/suit/armor/reactive/table = 1,
		/obj/item/dice/d20/fate/stealth/cursed = 1, //Only rolls 1
		/obj/item/dice/d20/fate/stealth/one_use = 1, //Looks like a d20, keep the d20 in the uncommon pool.
		/obj/item/shadowcloak = 1,
		/obj/item/spear/grey_tide = 1,
		/obj/item/storage/box/donkpockets/donkpocketgondola = 1,
		list(//music
			/obj/item/instrument/saxophone/spectral = 1,
			/obj/item/instrument/trombone/spectral = 1,
			/obj/item/instrument/trumpet/spectral = 1,
			) = 1,
		/obj/item/toy/cards/deck/tarot/haunted = 1,
	))

//Maintenance loot spawner pools
#define maint_trash_weight 4150
#define maint_common_weight 4150
#define maint_uncommon_weight 1500
#define maint_rarity_weight 199
#define maint_oddity_weight 1 //1 out of 10,000 would give metastation (180 spawns) a 2 in 111 chance of spawning an oddity per round, similar to xeno egg
#define maint_holiday_weight 3500 // When holiday loot is enabled, it'll give every loot item a 25% chance of being a holiday item

//Loot pool used by default maintenance loot spawners
GLOBAL_LIST_INIT(maintenance_loot, list(
	GLOB.trash_loot = maint_trash_weight,
	GLOB.common_loot = maint_common_weight,
	GLOB.uncommon_loot = maint_uncommon_weight,
	GLOB.rarity_loot = maint_rarity_weight,
	GLOB.oddity_loot = maint_oddity_weight,
	))

//Loot pool that is copied from maint loot but doesn't get changed due to holidays
GLOBAL_LIST_INIT(dumpster_loot, GLOB.maintenance_loot.Copy())

GLOBAL_LIST_INIT(ratking_trash, list(//Garbage: used by the regal rat mob when spawning garbage.
			/obj/item/cigbutt,
			/obj/item/trash/candy,
			/obj/item/trash/cheesie,
			/obj/item/trash/chips,
			/obj/item/trash/pistachios,
			/obj/item/trash/popcorn,
			/obj/item/trash/raisins,
			/obj/item/trash/sosjerky,
			/obj/item/trash/syndi_cakes,
		))

GLOBAL_LIST_INIT(ratking_coins, list(//Coins: Used by the regal rat mob when spawning coins.
			/obj/item/coin/iron,
			/obj/item/coin/plastic,
			/obj/item/coin/silver,
			/obj/item/coin/titanium,
		))
