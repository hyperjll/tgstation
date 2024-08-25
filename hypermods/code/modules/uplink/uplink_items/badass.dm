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

/datum/uplink_item/badass/operativeclothes
	name = "Operative Clothes"
	desc = "A cool black and tan jumpsuit/jumpskirt used by syndicate operatives. Provides no statistical \
			advantages over a normal jumpsuit/jumpskirt. Does not have integrated vitals or coordinate sensors."
	item = /obj/item/storage/backpack/duffelbag/syndie/operativeclothes
	cost = 1
	surplus = 0
	cant_discount = TRUE
	purchasable_from = ~(UPLINK_SPY | UPLINK_ALL_SYNDIE_OPS)

/datum/uplink_item/badass/syndibackpack
	name = "Syndicate Backpack"
	desc = "A syndicate branded backpack capable of storing nearly as many goods as a duffelbag would. \
			The backpack itself is made a fire-proof and acid-proof materials. Hides contraband."
	item = /obj/item/storage/backpack/syndicate
	cost = 2
	surplus = 0
	cant_discount = TRUE
	purchasable_from = ~UPLINK_SPY
