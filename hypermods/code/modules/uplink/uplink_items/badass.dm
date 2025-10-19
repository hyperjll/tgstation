/datum/uplink_item/badass/duffelbag
	name = "Suspicious Duffel Bag"
	desc = "A large duffel bag for holding extra tactical supplies. It contains an oiled plastitanium zipper for maximum speed tactical zipping, \
			and is better balanced on your back than an average duffelbag. Can hold two bulky items!"
	item = /obj/item/storage/backpack/duffelbag/syndie
	cost = 2
	surplus = 50


/datum/uplink_item/badass/costumes/mime
	name = "Mime Costume"
	desc = "..."
	item = /obj/item/storage/backpack/duffelbag/syndie/mime
	purchasable_from = (UPLINK_SPY | UPLINK_ALL_SYNDIE_OPS)
	progression_minimum = 70 MINUTES

/datum/uplink_item/badass/mythril
	name = "Mythril"
	desc = "A single bar of Mythril. From what little we've been able to study of it, this material has inheretly mystical properties. \
			Items manufactured from Mythril adopt mystical attributes, though few know how to manufacture with it and fewer how to acquire it. \
			For those wondering, we've long since exhausted what means we can use to study this material, and will be selling off our surplus."
	item = /obj/item/stack/sheet/mineral/mythril/five
	cost = 2
	surplus = 0
	purchasable_from = ~(UPLINK_SPY | UPLINK_ALL_SYNDIE_OPS)
	cant_discount = TRUE

/datum/uplink_item/badass/ltsrbt
	name = "Black Market LTSRBT"
	desc = "Need a faster and better way of transporting your illegal goods from and to the \
		station? Fear not, the Long-To-Short-Range-Bluespace-Transceiver (LTSRBT for short) \
		is here to help. Requires a multitool to unpack and a black market uplink to function. doesn't come with either."
	item = /obj/item/flatpack/ltsrbt
	cost = 2
	surplus = 0
	purchasable_from = ~(UPLINK_SPY | UPLINK_ALL_SYNDIE_OPS)
	cant_discount = TRUE

/datum/uplink_item/badass/blackmarket
	name = "Black Market Uplink"
	desc = "An illegal black market uplink. Allows you to spend credits on various equipment instead of telecrystals. \
			Items purchased are provided by less reputable sellers, but can contain useful equipment not provided here. \
			Pairs well with a Black Market LTSRBT to avoid hassle in acquiring your goods."
	item = /obj/item/market_uplink/blackmarket
	cost = 1
	surplus = 0
	purchasable_from = ~(UPLINK_SPY | UPLINK_ALL_SYNDIE_OPS)
	cant_discount = TRUE

/datum/uplink_item/badass/construction_bundle
	name = "Construction Bundle"
	desc = "This bluespace box contains 100 sheets of steel, glass, and plasteel for all of your construction needs."
	item = /obj/item/storage/box/syndie_kit/construction_bundle
	cost = 4
	surplus = 5
	purchasable_from = ~(UPLINK_SPY | UPLINK_ALL_SYNDIE_OPS)
	cant_discount = TRUE

/datum/uplink_item/badass/syndie_inducer_bundle
	name = "Syndicate Electrical Inducer Bundle"
	desc = "A box containing a syndicate-brand inducer, and 3 extra hyper power cells. This inducer charges things exceptionally quickly and packs a punch when used like a club. Use in emergencies."
	item = /obj/item/storage/box/syndie_kit/syndie_inducer_bundle
	cost = 1
	surplus = 0
	purchasable_from = ~(UPLINK_SPY | UPLINK_ALL_SYNDIE_OPS)
	cant_discount = TRUE

/datum/uplink_item/badass/syndisnacks
	name = "Syndicate Snack Box"
	desc = "Contains 1 Robust Nukie Cola and 1 Syndi-cake. The motto is as follows: 'Glory to the Syndicate'. \
			(Also contains 4 random food items and something to wash it all down.)"
	item = /obj/item/storage/box/syndie_kit/synditoykit
	cost = 2
	surplus = 0
	cant_discount = TRUE
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/badass/spai
	name = "Syndicate pAI"
	desc = "A blood-red personal AI device. The perfect companion for when you're on the run. \
			Can access many unique modules to grant the user additional utility. \
			Comes with a syndicate encryption key pre-installed. Usefulness not guaranteed."
	item = /obj/item/pai_card/syndicate
	cost = 1
	surplus = 0
	cant_discount = TRUE
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/badass/whetstone
	name = "Syndicate Whetstone"
	desc = "A blood-red whetstone used for sharpening objects for satisfactory murder. \
			Can be used to make ANY item you find both sharp and a decent weapon. \
			Can be used up to six times, but it can only improve items so much. \
			Don't expect it to work on energy weapons like the energy sword."
	item = /obj/item/sharpener/syndicate
	cost = 4
	surplus = 0
	cant_discount = TRUE
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/badass/operativeclothes
	name = "Operative Clothes"
	desc = "A cool black and tan jumpsuit/jumpskirt used by syndicate operatives. Provides no statistical \
			advantages over a normal jumpsuit/jumpskirt. Does not have integrated vitals or coordinate sensors."
	item = /obj/item/storage/box/syndie_kit/operativeclothes
	cost = 1
	surplus = 0
	cant_discount = TRUE
	purchasable_from = ~(UPLINK_SPY | UPLINK_ALL_SYNDIE_OPS)

/datum/uplink_item/badass/syndibackpack
	name = "Syndicate Backpack"
	desc = "A syndicate branded backpack capable of storing nearly as many goods as a duffelbag would. \
			The backpack itself is made of fire-proof and acid-proof materials. Hides contraband."
	item = /obj/item/storage/backpack/syndicate
	cost = 2
	surplus = 0
	cant_discount = TRUE
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/badass/binoculars
	name = "Binoculars"
	desc = "A pair of binoculars. We're not super sure why you'd want a pair of these, but we've gotta dump our surplus somewhere, right?"
	item = /obj/item/binoculars
	cost = 1
	surplus = 0
	cant_discount = TRUE
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/badass/costumes/centcom_official_mod
	name = "CentCom Official MODsuit"
	desc = "A highly prized and often under-utilized MODsuit directly smuggled out from Nanotrasen's Central Command. \
			Equipped with some useful modules including a Shock Absorber, Jetpack, DNA Lock, and a genuine Bluespace Storage Module. \
			Trying to decieve the station into believing you're a member of Nanotrasen's Central Command is NOT recommended. \
			Most crew including command staff aren't stupid enough to fall for it, and will instead try to apprehend you. \
			But, in the event you can pull it off... well, let's just say we'll be watching intently upon every purchase. \
			Includes a syndicate frequency but not a centcom frequency. No firearms included."
	purchasable_from = ALL
	cost = 8
	surplus = 1 // For that RARE opportunity
	progression_minimum = 110 MINUTES
	item = /obj/item/mod/control/pre_equipped/corporate/traitor

/datum/uplink_item/badass/galaxy_gas
	name = "Galaxy Gas"
	desc = "A canister containing a potent concoction of drugs in gaseous form capable of providing a decent stim at the cost of extensive brain damage. \
			If you in any way use this, we REALLY hope you know what you're doing and aren't just being 'hip with the kids'."
	item = /obj/item/reagent_containers/cup/galaxy_gas
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	cost = 3
	surplus = 1 // real low chance
	limited_stock = 1

/datum/uplink_item/badass/eyesnatcher
	name = "Eye-Snatcher"
	desc = "An illegal device capable of forcefully removing someone's eyes. It's recommended you subdue your target before attempting to use this."
	item = /obj/item/eyesnatcher
	cost = 1
	surplus = 0
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/badass/costumes/syndicate_maid
	name = "'Tactical' Maid Set"
	desc = "Get yourself a replica of the legendary 'Maid Syndicate Agents' outfit. \
			It does not come with the skill and grace of the former legendary agents."
	purchasable_from = ALL
	progression_minimum = 110 MINUTES
	cost = 2
	item = /obj/item/storage/box/syndie_kit/maid_kit
