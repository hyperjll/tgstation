/datum/uplink_item/bundles_tc/goloudbundle
	name = "NT-Annihilation 'Go Loud' Kit"
	desc = "For any reason, if you find stealth to be an unviable strategy, we'll understand. Be warned that claiming this kit WILL ALERT EVERYONE TO YOUR TRAITOROUS NATURE. \
			We're ready to provide an additional 15 Telecrystals, an energy dagger, and an atropine autoinjector to ensure you'll have the gear to go loud and get your objectives done."
	item = /obj/item/storage/box/syndie_kit/goloudbundle
	cost = 0
	surplus = 0
	limited_stock = 1
	cant_discount = TRUE
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	var/loud_kit = /obj/item/storage/box/syndie_kit/goloudbundle
	var/base_buyer_name

/datum/uplink_item/bundles_tc/goloudbundle/spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/obj/item/storage/box/syndie_kit/goloudbundle/loudkit = new loud_kit()
	if(!istype(loudkit))
		CRASH("uplink produced the wrong item instead of the go loud kit.")

	if(user.has_dna()) // Make sure that disguises won't prevent people from circumventing this.
		base_buyer_name = user.real_name
		priority_announce("We've just detected an encrypted signal originating from [base_buyer_name], that has resulted in a pod being sent to the station containing what we believe to be a large influx of illegal redspace technology. We believe this to be a massive security issue and we highly advise all security personnel to be on high alert. [base_buyer_name] should be arrested and detained ALIVE as their capture could be valuable to us, though high-ranking officers may provide new directives as normal.", "Cental Command - HIGH PRIORITY ALERT", 'sound/announcer/notice/notice1.ogg')

	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = loudkit,
	))
	return source //For log icon

/datum/uplink_item/bundles_tc/drugpeddler
	name = "Drug Peddling Kit"
	desc = "A box containing 12 hardcore street drugs, for commercial purposes only... \
			but we'll make an exception for you. Sell them, distribute them, or use these hardcore drugs yourself! \
			Contents of these kits can vary between purchases. Use with caution."
	cost = 4
	limited_stock = 1
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	item = /obj/item/storage/box/syndie_kit/drugpeddler

/datum/uplink_item/bundles_tc/chemicalsynth
	name = "Chemical Synthesis Kit"
	desc = "A special kit for aspiring chemists out there. Contains 2 beakers, a dropper, \
			a pair of night-vision science goggles, an empty tube, a syringe of stimulants, and most importantly: \
			two tubes of Vestine! A miracle compound capable of synthesizing many powerful reagents quickly and conveniently."
	cost = 4
	limited_stock = 1
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	item = /obj/item/storage/box/syndie_kit/chemicalsynth

/datum/uplink_item/bundles_tc/observe
	name = "Observation Kit"
	desc = "A special kit for those information freaks out there. Contains a MEDSEC HUD disguised as a pair of sunglasses, \
			three deathrattle implant cases with a stealth implanter, three syndicate biosignaller implant cases, and four informational PDA programs that have had their access requirements removed."
	cost = 5
	limited_stock = 1
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	item = /obj/item/storage/box/syndie_kit/observe

/datum/uplink_item/bundles_tc/disruptor
	name = "Electrical Disruptor Kit"
	desc = "The ultimate reversal of energy-based technology! Disables energy weapons, computers, silicon lifeforms, and suit sensors alike! \
			Contains a EMP implanter, a Tesla Revenge implanter, a EMP-shield implanter, two EMP grenades and \
			a state-of-the-art SC/FISHER disruptor to take out lights, cameras, and other electronics from a distance!"
	cost = 5
	limited_stock = 1
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	item = /obj/item/storage/box/syndie_kit/disruptor

/datum/uplink_item/bundles_tc/lobbyist
	name = "Lobbyist Bundle"
	desc = "A briefcase containing a 30,000 credits, a syndicate encryption key, a red phone, \
			a trenchcoat, a tacticool jumpsuit and skirt, a pair of combat gloves, and some magical rock candy."
	cost = 8 // 17 TC?
	limited_stock = 1
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	item = /obj/item/storage/briefcase/lobbyist

/datum/uplink_item/bundles_tc/hyperzine
	name = "Hyperzine Injector Kit"
	desc = "A medkit containing SIX hyperzine micro-injectors each with 15 units of hyperzine. \
			The dosage being halved will of course, lead to half the normal duration. Sponsored by the Interdyne Pharmaceuticals."
	cost = 12 // Technically 24 TC? If it's half dosage, then that'd actually be 12 TC anyways.
	limited_stock = 1
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	item = /obj/item/storage/medkit/emergency/hyperzine

/datum/uplink_item/bundles_tc/sniper
	name = "Sniper Bundle"
	desc = "A briefcase containing a sniper rifle, three additional magazines, and a very nice suit. \
			Sponsored by the Gorlex Maradeurs, for all the solars snipers out there!"
	cost = 14 // Technically 18 TC
	limited_stock = 1
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	item = /obj/item/storage/briefcase/sniper_traitor

/datum/uplink_item/bundles_tc/shotgun
	name = "Shotgun Bundle"
	desc = "A briefcase containing a syndicate kammerer, two boxes of lethal shells, a box of incendiary shells, and a combat uniform. \
			Sponsored by the Gorlex Maradeurs, rip and tear until it is done!"
	cost = 11 // Technically 15 TC
	limited_stock = 1
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	item = /obj/item/storage/briefcase/shotgun_traitor

/datum/uplink_item/bundles_tc/akm
	name = "Assault Rifle Bundle"
	desc = "A briefcase containing a genuine akm rifle, three additional magazines, and a pair of camouflage fatigues. \
			Sponsored by the Gorlex Maradeurs, mow them all down!"
	cost = 17 // Techically 21 TC
	limited_stock = 1
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	item = /obj/item/storage/briefcase/akm_traitor

/datum/uplink_item/bundles_tc/medicaltot
	name = "Medical Bundle"
	desc = "A duffelbag containing a toy l6 saw, a box of riot darts, a tactical medkit, a medical reagent gun, a pair of syndicate magboots, and a vintage pair of syndicate scrubs. \
			Sponsored by Interdyne Pharmaceuticals and Donk Co."
	cost = 17 // Techically 21 TC
	limited_stock = 1
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	item = /obj/item/storage/backpack/duffelbag/syndie/med/bundle


/datum/uplink_item/bundles_tc/romerol_kit
	name = "Romerol Kit"
	desc = "A highly experimental bioterror agent which creates dormant nodules to be etched into the grey matter of the brain. \
			On death, these nodules take control of the dead body, causing limited revivification, \
			along with slurred speech, aggression, and the ability to infect others with this agent."
	item = /obj/item/storage/box/syndie_kit/romerol_plus
	cost = 40
	progression_minimum = 30 MINUTES
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	cant_discount = TRUE

/datum/uplink_item/bundles_tc/battle_royale_plus
	name = "Battle Royale Kit"
	desc = "A multi-use implanter and remote device capable of forcing multiple crewmembers to participate in the hit show: Rumble Royale! \
			The participants will be forced to fight to the death, for our collective amusement! \
			Also comes with a Sleepy Pen and a bottle of Nocturine, for ease of use."
	item = /obj/item/storage/box/syndie_kit/battle_royale_plus
	cost = 40
	progression_minimum = 30 MINUTES
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	cant_discount = TRUE

/datum/uplink_item/bundles_tc/battlecruiser_plus
	name = "Battlecruiser Kit"
	desc = "A kit containing a specialized cryptographic sequencer which can be used on a communications console to call in one of our battlecruisers. \
			While you won't be able to be identified as an ally directly, we'll provide you with a syndicate encryption key to let your \
			presence be known. Also comes with a belt of tactical gear, including one of our Ansem/SC Pistols, some spare magazines, and a combat knife."
	item = /obj/item/storage/box/syndie_kit/battlecruiser_plus
	cost = 50
	progression_minimum = 30 MINUTES
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	cant_discount = TRUE

/datum/uplink_item/bundles_tc/malf_plus
	name = "Malfunctioning A.I Kit"
	desc = "A module which must be uploaded via an AI upload console. \
			Upon doing so, the A.I selected will begin to malfunction and turn on the crew. \
			We'll provide you with a binary encryption key for free to contact your new silicon overlord... likely to make an alliance."
	item = /obj/item/storage/box/syndie_kit/malf_plus
	cost = 40
	progression_minimum = 30 MINUTES
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	cant_discount = TRUE

/datum/uplink_item/bundles_tc/no_escape_plus
	name = "NO ESCAPE Kit"
	desc = "A kit containing all you'll require to rig the emergency shuttle to become a deathtrap unlike any other. \
			Simply place the beacon on shuttle, wrench it down, and make sure it's powered. \
			We'll also provide you with a desynchronizer free of charge, though it may not save you."
	item = /obj/item/storage/box/syndie_kit/no_escape_plus
	cost = 40
	progression_minimum = 30 MINUTES
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	cant_discount = TRUE

/datum/uplink_item/bundles_tc/meteor_shield_plus
	name = "IT COMES Kit"
	desc = "A meteor shield kit containing 11 meteor shields, and a specialized cryptographic sequencer for hacking them. \
			Each hacked meteor shield will increase the chance of meteors hitting the station, and provided enough hacked shields... \
			may bring 'IT'. We'll also provide you with one of our space suits, just in case."
	item = /obj/item/storage/box/syndie_kit/meteor_shield_plus
	cost = 50
	progression_minimum = 30 MINUTES
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	cant_discount = TRUE

/datum/uplink_item/bundles_tc/destabilizing_crystal_plus
	name = "Destabilizing Crystal Kit"
	desc = "A crystal we've engineered to backfire upon being placed within any supermatter crystals, causing it to delaminate. \
			Should the supermatter in question go critical, be ready to leave the station at any cost following the resonance cascade that's sure to follow. \
			We'll provide you with a pair of our magboots, to help ensure you don't dust yourself on the crystal accidentally."
	item = /obj/item/storage/box/syndie_kit/destabilizing_crystal_plus
	cost = 50
	progression_minimum = 30 MINUTES
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	cant_discount = TRUE
