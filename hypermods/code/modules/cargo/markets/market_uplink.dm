/obj/item/market_uplink/curator
	name = "\improper Premium Bookstore Uplink"
	desc = "An unique uplink often found within the possession of a curator. It's connected to most major library resources around the galaxy."
	icon = 'hypermods/icons/obj/devices/remote.dmi'
	icon_state = "cuplink"
	//The original black market uplink
	accessible_markets = list(/datum/market/curator)
	custom_premium_price = PAYCHECK_CREW * 2.5
