/datum/uplink_category/disruption
	name = "Disruption"
	weight = 16

/datum/uplink_item/disruption
	category = /datum/uplink_category/disruption


/datum/uplink_item/disruption/emp
	name = "EMP Grenades"
	desc = "A box that contains five EMP grenades. Useful to disrupt communications, \
			security's energy weapons and silicon lifeforms when you're in a tight spot."
	item = /obj/item/storage/box/emps
	cost = 1

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

/datum/uplink_item/disruption/tram_remote
	name = "Tram Remote Control"
	desc = "When linked to a tram's on board computer systems, this device allows the user to manipulate the controls remotely. \
		Includes direction toggle and a rapid mode to bypass door safety checks and crossing signals. \
		Perfect for running someone over in the name of a tram malfunction!"
	item = /obj/item/assembly/control/transport/remote
	cost = 2

/datum/uplink_item/disruption/suspiciousphone
	name = "Protocol CRAB-17 Phone"
	desc = "The Protocol CRAB-17 Phone, a phone borrowed from an unknown third party, it can be used to crash the space market, funneling the losses of the crew to your bank account.\
	The crew can move their funds to a new banking site though, unless they HODL, in which case they deserve it."
	item = /obj/item/suspiciousphone
	restricted = TRUE
	cost = 7
	limited_stock = 1
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

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
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND


/datum/uplink_item/disruption/mousecubes
	name = "Box of Mouse Cubes"
	desc = "A box with twenty four Waffle Co. brand mouse cubes. Deploy near wiring. \
			Caution: Product may rehydrate when exposed to water. Useful for taking out wiring in maintenance without suspicion."
	item = /obj/item/storage/box/monkeycubes/syndicate/mice
	cost = 1

/datum/uplink_item/disruption/syndicubes
	name = "Box of Syndicate Cubes"
	desc = "A box containing 5 simple lifeform producing cubes, when water is applied, human-like lifeforms will spring forth and will attack everyone nearby. \
			Syndicates produced have limited intelligence and may not be able to identify undercover agents. They are armed however."
	item = /obj/item/storage/box/monkeycubes/syndicate/syndis
	cost = 5
	surplus = 10
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)

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

/datum/uplink_item/disruption/missilephone
	name = "Missile Phone"
	desc = "A box containing two items: A coordinates disk and a missile phone. Use the disk upon a communications console \
			to download the station's coordinates, then insert the disk into the phone. \
			When you're ready to launch the missiles, simply activate the phone with the disk inserted! \
			Beware: Missiles are numerous and will impact random areas, including areas you may want to use later, \
			such as the Medbay, Supermatter Engine, etc."
	item = /obj/item/storage/box/syndie_kit/missilephone
	restricted = TRUE
	cost = 9 // Highly destructive, but not everyone can easily access a communications console.
	limited_stock = 1
	progression_minimum = 30 MINUTES

/datum/uplink_item/disruption/semiautoturret
	name = "Disposable Semi-Auto Turret"
	desc = "A beacon that summons a disposable semi-auto ballistic turret to your location. \
			The turret, while weak on it's own, can make for a decent distraction to cause chaos. \
			The turret won't shoot it's deployer, nor anyone clearly affiliated with the Syndicate."
	item = /obj/item/sbeacondrop/semiautoturret
	cost = 4
	surplus = 20
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/disruption/emp_mine
	name = "EMP Mine"
	desc = "A single electro-magnetic blast mine designed to disrupt electronics upon both the victim and in a large radius around it. \
			Harmlessly self-destructs after activation. Comes with camouflage that activates upon being placed."
	item = /obj/item/deployablemine/emp
	cost = 2

/datum/uplink_item/disruption/emp_mine/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_CYBERNETIC_REVOLUTION))
		cost *= 3
