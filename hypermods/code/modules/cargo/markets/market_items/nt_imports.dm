/datum/market_item/nt_armory
	category = "Armory"
	abstract_path = /datum/market_item/nt_armory
	markets = list(/datum/market/nanotrasen)
	availability_prob = 100

/datum/market_item/nt_security
	category = "Security"
	abstract_path = /datum/market_item/nt_security
	markets = list(/datum/market/nanotrasen)
	availability_prob = 100

/datum/market_item/nt_food
	category = "Culinary"
	abstract_path = /datum/market_item/nt_food
	markets = list(/datum/market/nanotrasen)
	availability_prob = 100

/datum/market_item/nt_medical
	category = "Medical"
	abstract_path = /datum/market_item/nt_medical
	markets = list(/datum/market/nanotrasen)
	availability_prob = 100

/datum/market_item/nt_engine
	category = "Engineering"
	abstract_path = /datum/market_item/nt_engine
	markets = list(/datum/market/nanotrasen)
	availability_prob = 100


/datum/market_item/nt_armory/battle_rifle
	name = "NT BR-38 battle rifle"
	desc = "Nanotrasen's prototype security weapon, found exclusively in the hands of their private security teams. Chambered in .38 pistol rounds."
	item = /obj/item/gun/ballistic/automatic/battle_rifle

	price_min = CARGO_CRATE_VALUE * 30
	price_max = CARGO_CRATE_VALUE * 60
	stock_max = 4

/datum/market_item/nt_armory/battle_rifle_mag
	name = "BR-38 Magazine"
	desc = "An ammunition magazine for the NT BR-38 battle rifle."
	item = /obj/item/ammo_box/magazine/m38

	price_min = CARGO_CRATE_VALUE * 1.2
	price_max = CARGO_CRATE_VALUE * 1.5
	stock_max = 5

/datum/market_item/nt_armory/mk58
	name = "Mk58 Handgun"
	desc = "A nanotrasen-standard handgun often found in the hands of their security-force. Uses .38 special ammunition."
	item = /obj/item/gun/ballistic/automatic/pistol/mk58

	price_min = CARGO_CRATE_VALUE * 8.5
	price_max = CARGO_CRATE_VALUE * 10
	stock_max = 4

/datum/market_item/nt_armory/v38
	name = ".38 Special Magazine"
	desc = "A magazine for a Mk58 Handgun."
	item = /obj/item/ammo_box/magazine/v38

	price_min = CARGO_CRATE_VALUE * 0.95
	price_max = CARGO_CRATE_VALUE * 1.1
	stock_max = 5

/datum/market_item/nt_armory/flamethrower
	name = "Flamethrower"
	desc = "An entire flamethrower. Comes pre-equipped with a tank of flammable plasma."
	item = /obj/item/flamethrower/full/tank

	price_min = CARGO_CRATE_VALUE * 3
	price_max = CARGO_CRATE_VALUE * 5
	stock_max = 3

/datum/market_item/nt_armory/sks
	name = "Sahkno SKS"
	desc = "A revival of the ancient SKS semi-automatic rifle, redesigned to utilize .310 Strilka rounds."
	item = /obj/item/gun/ballistic/rifle/sks

	price_min = CARGO_CRATE_VALUE * 5
	price_max = CARGO_CRATE_VALUE * 10
	stock_max = 3

/datum/market_item/nt_armory/strilka310
	name = "Strilka .310 Surplus"
	desc = "A box containing six whole strips of .310 strilka rounds. Used by the Sahkno SKS."
	item = /obj/item/storage/toolbox/ammobox/strilka310/surplus

	price_min = CARGO_CRATE_VALUE * 1.3
	price_max = CARGO_CRATE_VALUE * 1.5
	stock_max = 5

/datum/market_item/nt_armory/c38revolver
	name = ".38 Revolver"
	desc = "A powerful .38 Revolver."
	item = /obj/item/gun/ballistic/revolver/c38

	price_min = CARGO_CRATE_VALUE * 4
	price_max = CARGO_CRATE_VALUE * 6.4
	stock_max = 3

/datum/market_item/nt_armory/c38speedloader
	name = ".38 Speedloader"
	desc = "A speedloader chambered in lethal .38 rounds."
	item = /obj/item/ammo_box/speedloader/c38

	price_min = CARGO_CRATE_VALUE * 1.1
	price_max = CARGO_CRATE_VALUE * 1.3
	stock_max = 5

/datum/market_item/nt_armory/c38speedloadericeblox
	name = ".38 Speedloader (IceBlox)"
	desc = "A speedloader chambered in lethal .38 rounds. Rounds drastically lower the target's temperature."
	item = /obj/item/ammo_box/speedloader/c38/iceblox

	price_min = CARGO_CRATE_VALUE * 1.2
	price_max = CARGO_CRATE_VALUE * 1.5
	stock_max = 3

/datum/market_item/nt_armory/c38speedloaderhotshot
	name = ".38 Speedloader (HotShot)"
	desc = "A speedloader chambered in lethal .38 rounds. Rounds ignite targets."
	item = /obj/item/ammo_box/speedloader/c38/hotshot

	price_min = CARGO_CRATE_VALUE * 1.2
	price_max = CARGO_CRATE_VALUE * 1.5
	stock_max = 3

/datum/market_item/nt_armory/c38speedloadertrac
	name = ".38 Speedloader (TRAC)"
	desc = "A speedloader chambered in lethal .38 rounds. Rounds implant targets with a temporary tracker."
	item = /obj/item/ammo_box/speedloader/c38/trac

	price_min = CARGO_CRATE_VALUE * 1.2
	price_max = CARGO_CRATE_VALUE * 1.5
	stock_max = 3

/datum/market_item/nt_security/trackimp
	name = "Box of Tracking Implants"
	desc = "A box containing some tracking implants used by security forces everywhere, and a locator to find those being tracked."
	item = /obj/item/storage/box/trackimp

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 1

/datum/market_item/nt_security/chemimp
	name = "Box of Chemical Implants"
	desc = "A box containing some remote chemical implants used by security forces to remotely debilitate, disable, or kill previously detained criminals."
	item = /obj/item/storage/box/chemimp

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 1

/datum/market_item/nt_security/beaconimp
	name = "Box of Beacon Implants"
	desc = "A box containing beacon implants used to allow teleporters to lock-in the location of a subject for quick retrieval."
	item = /obj/item/storage/box/beaconimp

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 1

/datum/market_item/nt_security/exileimp
	name = "Box of Exile Implants"
	desc = "A box containing exil implants used to prevent one's re-entry into a specific sector of space."
	item = /obj/item/storage/box/exileimp

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 1

/datum/market_item/nt_security/assaultbelt
	name = "Assault Belt"
	desc = "A stylish belt for all your tactical gear."
	item = /obj/item/storage/belt/military/assault

	price_min = CARGO_CRATE_VALUE * 3
	price_max = CARGO_CRATE_VALUE * 4
	stock_max = 1

/datum/market_item/nt_engine/insuls
	name = "Insulated Gloves"
	desc = "A pair of insulating gloves, for every inspiring engineer out there."
	item = /obj/item/clothing/gloves/color/yellow

	price_min = CARGO_CRATE_VALUE * 2.5
	price_max = CARGO_CRATE_VALUE * 4
	stock_max = 2

/datum/market_item/nt_engine/inducer
	name = "Inducer"
	desc = "An electrical inducer to recharge certain devices using an internal reserve cell."
	item = /obj/item/inducer/orderable

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 2

/datum/market_item/nt_engine/pipe_dispenser
	name = "Rapid Pipe Dispenser"
	desc = "A device used in the construction of many different pipes and pipe-based systems."
	item = /obj/item/pipe_dispenser

	price_min = CARGO_CRATE_VALUE * 2.5
	price_max = CARGO_CRATE_VALUE * 5
	stock_max = 2

/datum/market_item/nt_engine/rcd
	name = "Rapid Construction Device"
	desc = "A handy-dandy device used to quickly construct and deconstruct a wide-variety of structures."
	item = /obj/item/construction/rcd

	price_min = CARGO_CRATE_VALUE * 5
	price_max = CARGO_CRATE_VALUE * 10
	stock_max = 2

/datum/market_item/nt_food/beerkeg
	name = "Beer Keg"
	desc = "A top-of-the-line keg completely full of beer."
	item = /obj/structure/reagent_dispensers/beerkeg

	price_min = CARGO_CRATE_VALUE * 1.5
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 1

/datum/market_item/nt_food/monkeycubes
	name = "Box of Monkey Cubes"
	desc = "A box containing water-expandable cubes which grow into live monkey's."
	item = /obj/item/storage/box/monkeycubes

	price_min = CARGO_CRATE_VALUE * 0.7
	price_max = CARGO_CRATE_VALUE * 1.2
	stock_max = 2

/datum/market_item/nt_food/cooking_oil
	name = "Vat of Cooking Oil"
	desc = "A large, space-occupying vat of cooking oil for all your culinary needs."
	item = /obj/structure/reagent_dispensers/cooking_oil

	price_min = CARGO_CRATE_VALUE * 5
	price_max = CARGO_CRATE_VALUE * 10
	stock_max = 1

/datum/market_item/nt_food/random_ingredients
	name = "Box of Ingredients"
	desc = "A random selection of ingredients for the aspiring chef."
	item = /obj/item/storage/box/ingredients/random

	price_min = CARGO_CRATE_VALUE * 0.4
	price_max = CARGO_CRATE_VALUE * 0.8
	stock_max = 30

/datum/market_item/nt_food/mothic_rations
	name = "Mothic Rations"
	desc = "A selection of rations provided by the Mothic Nomad Fleet."
	item = /obj/item/storage/box/mothic_rations

	price_min = CARGO_CRATE_VALUE * 1.4
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 3

/datum/market_item/nt_food/mothic_cans_sauces
	name = "Mothic Cans and Sauces"
	desc = "A selection of canned goods and sauces provided by the Mothic Nomad Fleet."
	item = /obj/item/storage/box/mothic_cans_sauces

	price_min = CARGO_CRATE_VALUE * 1.4
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 3

/datum/market_item/nt_food/mothic_goods
	name = "Mothic Goods"
	desc = "A selection of artisan goods provided by the Mothic Nomad Fleet."
	item = /obj/item/storage/box/mothic_goods

	price_min = CARGO_CRATE_VALUE * 1.4
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 3

/datum/market_item/nt_food/tiziran_meats
	name = "Tiziran Meats"
	desc = "A box containing an assortment of fresh-frozen Tiziran meats and fish- the keys to lizard cooking."
	item = /obj/item/storage/box/tiziran_meats

	price_min = CARGO_CRATE_VALUE * 1.4
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 3

/datum/market_item/nt_food/tiziran_cans
	name = "Tiziran Canned Goods"
	desc = "A box containing an assortment of canned Tiziran goods- to be eaten as is, or used in cooking."
	item = /obj/item/storage/box/tiziran_cans

	price_min = CARGO_CRATE_VALUE * 1.4
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 3

/datum/market_item/nt_food/tiziran_goods
	name = "Tiziran Goods"
	desc = "A box containing an assortment of fresh Tiziran goods- perfect for making the foods of the Lizard Empire."
	item = /obj/item/storage/box/tiziran_goods

	price_min = CARGO_CRATE_VALUE * 1.4
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 3

/datum/market_item/nt_security/armorvest
	name = "Armor Vest"
	desc = "A standardized personal-protection armor vest."
	item = /obj/item/clothing/suit/armor/vest

	price_min = CARGO_CRATE_VALUE * 3
	price_max = CARGO_CRATE_VALUE * 4
	stock_max = 3

/datum/market_item/nt_security/helmet
	name = "Helmet"
	desc = "A standardized personal-protection helmet."
	item = /obj/item/clothing/head/helmet/sec

	price_min = CARGO_CRATE_VALUE * 3
	price_max = CARGO_CRATE_VALUE * 4
	stock_max = 3

/datum/market_item/nt_security/sunglasses
	name = "Sunglasses"
	desc = "A single pair of sunglasses, for those looking for more style."
	item = /obj/item/clothing/glasses/sunglasses

	price_min = CARGO_CRATE_VALUE * 3
	price_max = CARGO_CRATE_VALUE * 4
	stock_max = 3

/datum/market_item/nt_security/flashbang
	name = "Flashbang"
	desc = "A single flashbang. It goes boom, but in a non-lethal matter."
	item = /obj/item/grenade/flashbang

	price_min = CARGO_CRATE_VALUE * 0.5
	price_max = CARGO_CRATE_VALUE * 1.1
	stock_max = 6

/datum/market_item/nt_security/teargas_stylish
	name = "Tear Gas Grenade"
	desc = "A grenade containing a tear-gas payload."
	item = /obj/item/grenade/chem_grenade/teargas_stylish

	price_min = CARGO_CRATE_VALUE * 1.2
	price_max = CARGO_CRATE_VALUE * 1.5
	stock_max = 6

/datum/market_item/nt_security/energy_stinger
	name = "Energy Stinger"
	desc = "A grenade which explodes into disabling energy shots."
	item = /obj/item/grenade/energy_stinger

	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 1.5
	stock_max = 6

/datum/market_item/nt_security/stingbang
	name = "Stingbang"
	desc = "A grenade which explodes into non-lethal, disabling shrapnel."
	item = /obj/item/grenade/stingbang

	price_min = CARGO_CRATE_VALUE * 1.1
	price_max = CARGO_CRATE_VALUE * 1.6
	stock_max = 6

/datum/market_item/nt_armory/rubbershot
	name = "Rubbershot Box"
	desc = "A box containing seven rubbershot shells for any shotgun."
	item = /obj/item/storage/box/rubbershot

	price_min = CARGO_CRATE_VALUE * 1.1
	price_max = CARGO_CRATE_VALUE * 1.4
	stock_max = 3

/datum/market_item/nt_armory/paywallpin
	name = "Paywell Firing Pin"
	desc = "A firing pin which allows you to monetize the usage of any firearm."
	item = /obj/item/firing_pin/paywall

	price_min = CARGO_CRATE_VALUE * 0.9
	price_max = CARGO_CRATE_VALUE * 1.3
	stock_max = 2

/datum/market_item/nt_armory/firingpin
	name = "Standard Firing Pin"
	desc = "A single firing pin, required by most firearms."
	item = /obj/item/firing_pin

	price_min = CARGO_CRATE_VALUE * 1.2
	price_max = CARGO_CRATE_VALUE * 1.4
	stock_max = 2

/datum/market_item/nt_armory/pistollaser
	name = "Laser Pistol"
	desc = "A Type 5 Laser Pistol developed by Nanotrasen. Fires lethal lasers."
	item = /obj/item/gun/energy/laser/pistol

	price_min = CARGO_CRATE_VALUE * 4
	price_max = CARGO_CRATE_VALUE * 6
	stock_max = 3

/datum/market_item/nt_food/plant_produce_box
	name = "Plant Produce Package"
	desc = "A box containing a wide-assortment of plant produce. Each purchase may differ."
	item = /obj/item/storage/box/plant_produce_box

	price_min = CARGO_CRATE_VALUE * 0.8
	price_max = CARGO_CRATE_VALUE
	stock_max = 5

/datum/market_item/nt_food/soup_box
	name = "Soup Box"
	desc = "Not to be confused with speeches. Contains 5 whole salad dishes ready for consumption."
	item = /obj/item/storage/box/soup_box

	price_min = CARGO_CRATE_VALUE * 0.9
	price_max = CARGO_CRATE_VALUE * 1.1
	stock_max = 3

/datum/market_item/nt_food/salad_box
	name = "Salad Package"
	desc = "A box containing 5 whole salad dishes. For all the mouths looking to diet."
	item = /obj/item/storage/box/salad_box

	price_min = CARGO_CRATE_VALUE * 0.9
	price_max = CARGO_CRATE_VALUE * 1.1
	stock_max = 3

/datum/market_item/nt_food/dinner_box
	name = "Dinner Package"
	desc = "A box containing 5 whole single-person dinner items."
	item = /obj/item/storage/box/dinner_box

	price_min = CARGO_CRATE_VALUE * 0.9
	price_max = CARGO_CRATE_VALUE * 1.1
	stock_max = 3

/datum/market_item/nt_food/three_course_meal_box
	name = "Three Course Meal Package"
	desc = "A box containing a single three-course meal for any especially hungry patron."
	item = /obj/item/storage/box/three_course_meal_box

	price_min = CARGO_CRATE_VALUE * 1.1
	price_max = CARGO_CRATE_VALUE * 1.2
	stock_max = 3

/datum/market_item/nt_food/beverage_box
	name = "Beverage Package"
	desc = "A box containing 5 whole soft, non-alcoholic beverages for the thirsty."
	item = /obj/item/storage/box/beverage_box

	price_min = CARGO_CRATE_VALUE * 0.9
	price_max = CARGO_CRATE_VALUE * 1.1
	stock_max = 3

/datum/market_item/nt_food/booze_box
	name = "Alcohol Package"
	desc = "A box containing 5 bottles of alcoholic beverages."
	item = /obj/item/storage/box/booze_box

	price_min = CARGO_CRATE_VALUE * 1.1
	price_max = CARGO_CRATE_VALUE * 1.2
	stock_max = 3

/datum/market_item/nt_food/snack_box
	name = "Snack Box"
	desc = "A box with 5 different branded and non-branded snack items."
	item = /obj/item/storage/box/snack_box

	price_min = CARGO_CRATE_VALUE * 0.9
	price_max = CARGO_CRATE_VALUE * 1.1
	stock_max = 3

/datum/market_item/nt_food/lizard_snack_box
	name = "Tiziran Snack Box"
	desc = "A box with 5 different lizard-oriented snack items."
	item = /obj/item/storage/box/lizard_snack_box

	price_min = CARGO_CRATE_VALUE * 0.9
	price_max = CARGO_CRATE_VALUE * 1.1
	stock_max = 3

/datum/market_item/nt_food/donut_box
	name = "Doughnut Package"
	desc = "A box containing 5 whole doughnuts of random variety. Doesn't have any fancy packaging, though."
	item = /obj/item/storage/box/donut_box

	price_min = CARGO_CRATE_VALUE * 0.9
	price_max = CARGO_CRATE_VALUE * 1.1
	stock_max = 3

/datum/market_item/nt_food/jelly_donuts_box
	name = "Jelly Doughnut Package"
	desc = "A box containing 5 whole jelly doughnuts of random variety. Doesn't have any fancy packaging, though."
	item = /obj/item/storage/box/jelly_donuts_box

	price_min = CARGO_CRATE_VALUE * 1.1
	price_max = CARGO_CRATE_VALUE * 1.2
	stock_max = 2

/datum/market_item/nt_food/deluxe_snack_box
	name = "Deluxe Snack Box"
	desc = "A box containing a variety of snacks and beverages, perfect for any movie night."
	item = /obj/item/storage/box/deluxe_snack_box

	price_min = CARGO_CRATE_VALUE * 1.1
	price_max = CARGO_CRATE_VALUE * 1.2
	stock_max = 3

/datum/market_item/nt_medical/medicinal_chem_supplies_box
	name = "Chemical Medicine Box"
	desc = "Some supplies imported directly from DeForest Medical, for practical doctoring."
	item = /obj/item/storage/box/medicinal_chem_supplies_box

	price_min = CARGO_CRATE_VALUE * 0.95
	price_max = CARGO_CRATE_VALUE * 1.05
	stock_max = 10

/datum/market_item/nt_medical/medkit
	name = "Medkit"
	desc = "A medical kit containing a wide-variety of basic medical supplies."
	item = /obj/item/storage/medkit/regular

	stock_min = 1
	stock_max = 5
	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 1.2

/datum/market_item/nt_medical/medkit_brute
	name = "Brute Trauma Treatment Kit"
	desc = "A medical kit containing a selection of items for healing brute-based damage."
	item = /obj/item/storage/medkit/brute

	stock_min = 1
	stock_max = 5
	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 1.25

/datum/market_item/nt_medical/medkit_fire
	name = "Burn Treatment Kit"
	desc = "A medical kit containing a selection of items for healing burn-based damage."
	item = /obj/item/storage/medkit/fire

	stock_min = 1
	stock_max = 5
	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 1.25

/datum/market_item/nt_medical/medkit_toxin
	name = "Toxin Treatment Kit"
	desc = "A medical kit containing a selection of items for reversing the effects of poisoning and radiation."
	item = /obj/item/storage/medkit/toxin

	stock_min = 1
	stock_max = 5
	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 1.15

/datum/market_item/nt_medical/medkit_oxy
	name = "Oxygen Deprivation Treatment Kit"
	desc = "A medical kit containing a selection of items for combatting oxygen deprevation and bloodloss."
	item = /obj/item/storage/medkit/o2

	stock_min = 1
	stock_max = 5
	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 1.1
