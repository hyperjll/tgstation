/datum/uplink_item/badass/mythril
	name = "Mythril"
	desc = "A single bar of Mythril. From what little we've been able to study of it, this material has inheretly mystical properties. \
			Items manufactured from Mythril adopt mystical attributes, though few know how to manufacture with it and fewer how to acquire it. \
			For those wondering, we've long since exhausted what means we can use to study this material, and will be selling off our surplus."
	item = /obj/item/stack/sheet/mineral/mythril/five
	cost = 2
	surplus = 0
	purchasable_from = UPLINK_TRAITORS

/datum/uplink_item/badass/ltsrbt
	name = "Black Market LTSRBT"
	desc = "Need a faster and better way of transporting your illegal goods from and to the \
		station? Fear not, the Long-To-Short-Range-Bluespace-Transceiver (LTSRBT for short) \
		is here to help. Requires a multitool to unpack and a black market uplink to function. doesn't come with either."
	item = /obj/item/flatpack/ltsrbt
	cost = 2
	surplus = 0
	purchasable_from = UPLINK_TRAITORS

/datum/uplink_item/badass/blackmarket
	name = "Black Market Uplink"
	desc = "An illegal black market uplink. Allows you to spend credits on various equipment instead of telecrystals. \
			Items purchased are provided by less reputable sellers, but can contain useful equipment not provided here. \
			Pairs well with a Black Market LTSRBT to avoid hassle in acquiring your goods."
	item = /obj/item/market_uplink/blackmarket
	cost = 1
	surplus = 0
	purchasable_from = UPLINK_TRAITORS
