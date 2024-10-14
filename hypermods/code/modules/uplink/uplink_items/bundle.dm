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
			three biosignaller implanters, and four informational PDA programs that have had their access requirements removed."
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

/datum/uplink_item/bundles_tc/sniper
	name = "Sniper Bundle"
	desc = "A briefcase containing a sniper rifle, three additional magazines, and a very nice suit. \
			Sponsored by the Gorlex Maradeurs, for all the solars snipers out there!"
	cost = 14
	limited_stock = 1
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	item = /obj/item/storage/briefcase/sniper_traitor
