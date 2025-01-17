/obj/item/market_uplink/curator
	name = "\improper Premium Bookstore Uplink"
	desc = "An unique uplink often found within the possession of a curator. It's connected to most major library resources around the galaxy."
	icon = 'hypermods/icons/obj/devices/remote.dmi'
	icon_state = "cuplink"
	accessible_markets = list(/datum/market/curator)
	custom_premium_price = PAYCHECK_CREW * 2.5

/obj/item/market_uplink/clown
	name = "\improper Clown Planet Uplink"
	desc = "An unique uplink connected straight to a coalition of various 'clown planets'. How these find their way into the hands of clowns across the galaxy is unknown."
	icon = 'hypermods/icons/obj/devices/voice.dmi'
	icon_state = "radio"
	accessible_markets = list(/datum/market/clown)
	custom_premium_price = PAYCHECK_CREW * 2.5
	// To-do emagging this makes it a syndie uplink
