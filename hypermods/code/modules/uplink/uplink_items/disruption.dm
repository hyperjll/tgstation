/datum/uplink_category/disruption
	name = "Disruption"
	weight = 16

/datum/uplink_item/disruption
	category = /datum/uplink_category/disruption


/datum/uplink_item/disruption/emp
	name = "EMP Grenades and Implanter Kit"
	desc = "A box that contains five EMP grenades and an EMP implant with three uses. Useful to disrupt communications, \
			security's energy weapons and silicon lifeforms when you're in a tight spot."
	item = /obj/item/storage/box/syndie_kit/emp
	cost = 2

/datum/uplink_item/disruption/emp/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_CYBERNETIC_REVOLUTION))
		cost *= 3

/datum/uplink_item/disruption/syndicate_bomb/emp
	name = "Syndicate EMP Bomb"
	desc = "A variation of the syndicate bomb designed to produce a large EMP effect."
	item = /obj/item/sbeacondrop/emp
	cost = 7

/datum/uplink_item/disruption/syndicate_bomb/emp/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_CYBERNETIC_REVOLUTION))
		cost *= 2

/datum/uplink_item/disruption/suspiciousphone
	name = "Protocol CRAB-17 Phone"
	desc = "The Protocol CRAB-17 Phone, a phone borrowed from an unknown third party, it can be used to crash the space market, funneling the losses of the crew to your bank account.\
	The crew can move their funds to a new banking site though, unless they HODL, in which case they deserve it."
	item = /obj/item/suspiciousphone
	restricted = TRUE
	cost = 7
	limited_stock = 1

/datum/uplink_item/disruption/hacked_module
	name = "Hacked AI Law Upload Module"
	desc = "When used with an upload console, this module allows you to upload priority laws to an artificial intelligence. \
			Be careful with wording, as artificial intelligences may look for loopholes to exploit."
	progression_minimum = 30 MINUTES
	item = /obj/item/ai_module/syndicate
	cost = 4

/datum/uplink_item/disruption/powersink
	name = "Power Sink"
	desc = "When screwed to wiring attached to a power grid and activated, this large device lights up and places excessive \
			load on the grid, causing a station-wide blackout. The sink is large and cannot be stored in most \
			traditional bags and boxes. Caution: Will explode if the powernet contains sufficient amounts of energy."
	progression_minimum = 20 MINUTES
	item = /obj/item/powersink
	cost = 11


/datum/uplink_item/disruption/decoybomb
	name = "Decoy Syndicate Bomb"
	desc = "A syndicate bomb loaded with an incredibly small explosive payload. \
			Particularly good at keeping the security team busy or for distracting a department."
	item = /obj/item/sbeacondrop/decoybomb
	cost = 4

/datum/uplink_item/disruption/dimensionalbomb
	name = "Dimensional Syndicate Bomb"
	desc = "The Dimensional Syndicate bomb is a fearsome device capable of massive re-decoration. It has an adjustable timer, \
		with a minimum of %MIN_BOMB_TIMER seconds, and can be bolted to the floor with a wrench to prevent \
		movement. The bomb is bulky and cannot be moved; upon ordering this item, a smaller beacon will be \
		transported to you that will teleport the actual bomb to it upon activation. Note that this bomb can \
		be defused, and some crew may attempt to do so. \
		The bomb core can be pried out and manually detonated with other explosives."
	item = /obj/item/sbeacondrop/dimensionalbomb
	progression_minimum = 20 MINUTES
	cost = 9

/datum/uplink_item/disruption/dimensionalbomb/New()
	. = ..()
	desc = replacetext(desc, "%MIN_BOMB_TIMER", SYNDIEBOMB_MIN_TIMER_SECONDS)

/datum/uplink_item/disruption/paywallpins
	name = "Paywall Firing Pins"
	desc = "A box of non-removable paywall firing pins! They can be used to charge money for any firearm's usage. \
			To use, use in hand to select a payment method, then link a card with a bank account for any transactions to send money toward. \
			Some may call this evil, we call it capitalism... it's basically the same thing."
	item = /obj/item/storage/box/firingpins/paywall/noremove
	cost = 3
