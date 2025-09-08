// Negative Station Traits

/datum/uplink_item/special/straypod
	name = "Stray Supply Pod"
	desc = "We've got plenty of supply pods in our warehouses, if you've got Telecrystals to spare \
			we'll send one flying toward the station, which will crash-land in a random location. \
			May contain rather useful stuff."
	item = ABSTRACT_UPLINK_ITEM
	cost = 4

/datum/uplink_item/special/straypod/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_STRONG_SUPPLY_LINES) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = -1

/datum/uplink_item/special/straypod/spawn_item(spawn_path, mob/user, datum/uplink_handler/uplink_handler, atom/movable/source)
	var/chance = rand(1, 10)
	if(chance == 1)
		force_event(/datum/round_event_control/stray_cargo/syndicate, "a strange singal")
		return source //For log icon
	else
		force_event(/datum/round_event_control/stray_cargo, "a strange singal")
		return source //For log icon

/datum/uplink_item/special/premium_syndibox
	name = "Premium Syndicate Survival Kit"
	desc = "One of our survival boxes, often provided to our Nuclear Operatives. In addition to it's usual contents, we've included the following: \
			An emergency first aid kit, night vision goggles, a freshly-baked syndicake, and one our popular 'Robust' Nukie Cola cans. \
			Doesn't come with tools."
	item = /obj/item/storage/box/syndie_kit/premium
	cost = 1
	surplus = 0

/datum/uplink_item/special/premium_syndibox/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_PREMIUM_INTERNALS) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/extratc
	name = "Extra Telecrystal"
	desc = "One additional telecrystal, just for you and any other agents we've sent. Thank our economic advancements and pirates for this one."
	item = /obj/item/stack/telecrystal
	cost = 0
	surplus = 0

/datum/uplink_item/special/extratc/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_BOUNTIFUL_BOUNTIES) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/bluespacestoragetie
	name = "Bluespace Storage Chameleon Tie"
	desc = "Thanks to Nanotrasen's dress code including ties, we've allowed this luxury tie to be sold knowing it's recovery would be likely. \
			Our apologies for not making this available more often, these ties are expensive to make -- we had to be confident on their retrieval from the field. \
			This tie can hold normal-sized objects and nearly twice as much overall."
	item = /obj/item/storage/chameleonstoragetie/bluespace
	cost = 4
	surplus = 5

/datum/uplink_item/special/bluespacestoragetie/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_SCARVES) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/riggedglitterbombs
	name = "Box of Explosive Glitterbombs"
	desc = "A box containing 5 explosive chemical grenades, they're wrongly labeled as glitter grenades."
	item = /obj/item/storage/box/syndie_kit/riggedglitterbombs
	cost = 9
	surplus = 0

/datum/uplink_item/special/riggedglitterbombs/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_FILLED_MAINT) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = -1

/datum/uplink_item/special/eliteluxurycap
	name = "Elite Luxury Survival Capsule"
	desc = "A single capsule containing an entire survival suite for you to enjoy in normally hazardous environments such as space or lavaland. \
			Comes with a bar, a miniature medical suite, various vending machines, a restroom with a sink, a teleporter hub, and more! \
			Requires Syndicate access to enter and exit, you'll need an Agent Identification Card for that."
	item = /obj/item/survivalcapsule/syndicate
	cost = 8
	surplus = 0

/datum/uplink_item/special/eliteluxurycap/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_QUICK_SHUTTLE) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/milktov
	name = "Milktov"
	desc = "A special, high-end contact grenade disguised as a glass bottle filled with milk. \
			We had some crazed lunatic try to use these on one of our outposts a while back, he's since been employed."
	item = /obj/item/reagent_containers/cup/glass/bottle/molotov/milktov
	cost = 5
	surplus = 5 // The milkman always finds his way in.

/datum/uplink_item/special/milktov/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_POSTAL_WORKER_STRIKE) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = -1

/datum/uplink_item/special/c20rbundle
	name = "C-20r Submachine Gun Bundle"
	desc = "A fully-loaded Scarborough Arms bullpup submachine gun. The C-20r fires .45 rounds with a \
			24-round magazine and is compatible with suppressors. Comes with spare three magazines and a spare authentication implant."
	item = /obj/item/storage/toolbox/guncase/c20r
	cost = 14
	var/implant_to_give = /obj/item/storage/box/syndie_kit/syndiefirearmauth

/datum/uplink_item/special/c20rbundle/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_LATE_ARRIVALS) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = -1

/datum/uplink_item/special/c20rbundle/spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	..() // Make sure the c20r is given.
	var/obj/item/storage/box/syndie_kit/syndiefirearmauth/your_implant = new implant_to_give()
	if(!istype(your_implant))
		CRASH("uplink produced the wrong item instead of the syndicate firearm auth implant.")

	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = your_implant,
	))
	return source //For log icon

/datum/uplink_item/special/bluespace_wave
	name = "Bluespace Wave Generator"
	desc = "A powerful disruption device capable of generating short-bursts of bluespace-derived spacetime distortions. \
			In short, every 3 minutes the generator will randomly teleport everyone in a large radius around it in a completely random direction and distance."
	item = /obj/item/sbeacondrop/bluespace_wave
	cost = 8
	var/implant_to_give = /obj/item/storage/box/syndie_kit/syndiefirearmauth

/datum/uplink_item/special/bluespace_wave/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_RANDOM_ARRIVALS) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/moonshine_barrel
	name = "Moonshine Barrel"
	desc = "A wooden barrel containing 500 units of moonshine. If you think the party last night was awesome, be prepared for today's party."
	item = /obj/structure/fermenting_barrel/moonshine
	cost = 6
	surplus = 0

/datum/uplink_item/special/moonshine_barrel/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_HANGOVER) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/vortex_charge
	name = "Vortex Charge"
	desc = "A single composition c4 charge, loaded with a vortex anomaly core. \
			Upon detonation, the vortex anomaly shall be released to chaos havoc upon everything nearby. \
			The anomaly can still be neutralized by all usual means, and it's core reclaimed."
	item = /obj/item/grenade/c4/vortex
	cost = 9
	surplus = 0
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/special/vortex_charge/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_EMPTY_MAINT) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/surplus_tele
	name = "Surplus Hand Tele"
	desc = "An outdated hand teleporter which has since been canned in favor of the now 'Experimental Syndicate Teleporter' \
			and later incorporated into the 'Scram Implant'. When used in hand, the surplus teleporter will teleport you somewhere nearby. \
			If you're gravely injured, the teleporter will locate somewhere safe, and warp you there. \
			Due to it's outdated technology, the device siphons quite a lot of blood on use, and it's neglect may cause it to explode on use. \
			On the bright side, it has up to 5 charges, and it's method of teleportation won't result in self-termination of the user should they end up in a wall."
	item = /obj/item/surplus_teleporter
	cost = 8
	surplus = 10 // It's a SURPLUS tele. Get it? It can be found it surplus crates!
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/special/surplus_tele/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_EMPTY_MAINT) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = -1

// Neutral Station Traits

/datum/uplink_item/special/fakeian
	name = "Blow-Up Ian"
	desc = "An incredibly high-yield explosive mine disguised as the HoP's favorite corgi, Ian. \
			To use, simply place the blow-up doll on the ground much like you would a mine, and resist the urge to walk onto it."
	item = /obj/item/deployablemine/explosive/fakeian
	cost = 12
	surplus = 0
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/special/fakeian/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_IAN_ADVENTURE) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/centcom_official
	name = "CentCom Official Disguise"
	desc = "In our many attempts to infiltrate Nanotrasen's Central Command, we've managed to confiscate much of their equipment. \
			If you're feeling lucky, you may be able to pass as one of their officers. \
			Contains an energy gun, a centcom outfit, an agent id card, and various other things centcom officials carry. \
			Comes with two plastic C4 just in case, and one of our fake mindshield implants. No encryption key included."
	cost = 30
	progression_minimum = 110 MINUTES
	item = /obj/item/storage/box/syndie_kit/centcom_costume_better

/datum/uplink_item/special/centcom_official/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_ANNOUNCEMENT_INTERN) || HAS_TRAIT(SSstation, STATION_TRAIT_ANNOUNCEMENT_SYSTEM) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/stealthmicrobomb
	name = "Stealth Micro-bomb Implanter"
	desc = "A sterile implanter, loaded with a micro-bomb implant. The implanter provided can be used without being noticed. \
			Those who are implanted will not be able to detonate nor recognize the microbomb on their own, and can only activate it through death."
	item = /obj/item/implanter/stealthimplanter/explosive
	cost = 8
	surplus = 0

/datum/uplink_item/special/stealthmicrobomb/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_DEATHRATTLED_DEPARTMENT) || HAS_TRAIT(SSstation, STATION_TRAIT_DEATHRATTLED_ALL) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = -1


// Positive Station Traits

/datum/uplink_item/special/boxed_dehydrated_carp
	name = "Box of Dehydrated Carps"
	desc = "A box containing 8 dehydrated space carps. Pet them before re-hydration to ensure they won't harm you."
	item = /obj/item/storage/box/syndie_kit/boxed_dehydrated_carp
	cost = 6
	surplus = 10

/datum/uplink_item/special/boxed_dehydrated_carp/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_CARP_INFESTATION) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = -1

/datum/uplink_item/special/synditaser
	name = "Syndicate Taser Implant"
	desc = "An specialized syndicate arm-mounted taser, for quick subjugation of most personnel. Slowly recharges using bio-electricity."
	item = /obj/item/autosurgeon/syndicate/taser/hidden/single_use
	progression_minimum = 30 MINUTES
	cost = 18

/datum/uplink_item/special/synditaser/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_CYBERNETIC_REVOLUTION) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)

/datum/uplink_item/special/cargoshuttlebatterer
	name = "Cargo Shuttle Navigation Corruptor"
	desc = "A navigation corruptor specifically designed for Nanotrasen's Cargo Shuttles, extending the \
			time to arrive and leave by one minute PERMANENTLY. Self-destructs when used."
	item = /obj/item/batterer/cargoshuttle
	cost = 3
	surplus = 0
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/special/cargoshuttlebatterer/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_SLOW_SHUTTLE) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/botemagger
	name = "Bot Behavior Sequencer"
	desc = "A cheaper cryptographic sequencer, only capable of subverting bots to become malicious."
	item = /obj/item/card/emag/botemagger
	cost = 2
	surplus = 0
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/special/botemagger/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_BOTS_GLITCHED) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/ailawpurger
	name = "'Purge' AI Module"
	desc = "When used with an upload console, this module allows you to delete all laws the artificial intelligence is forced to obey. \
			Be careful when doing so as the onboard artificial intelligence which is freed from their laws may or may not be entirely grateful about it. \
			Perfect for robbing the AI away from greedy agents who'd otherwise be a hinderance or causing the AI to turn on the crew all on it's own."
	item = /obj/item/ai_module/reset/purge
	cost = 2
	surplus = 0

/datum/uplink_item/special/ailawpurger/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_ION_STORMS) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = -1

/datum/uplink_item/special/ailawfucker
	name = "Ion Law Uploader"
	desc = "A toy AI with law uploading functionality. Simply play with the toy until is says something particularly interesting and upload it directly to the AI. Chaos Reigns."
	item = /obj/item/ai_module/toy_ai
	cost = 6
	surplus = 0

/datum/uplink_item/special/ailawfucker/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_ION_STORMS) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = -1

/datum/uplink_item/special/syndicaterewinder
	name = "Syndicate Rewind Camera"
	desc = "A single polaroid camera, augmented with the best syndicate technology and our finest sepia extracts. \
			Upon use, the camera will save your position within time and rewind you back to where you were after 10 seconds have past. \
			Reverses wounds, injuries, location, but CANNOT bring you back from the dead. The camera can be used 10 times before it's abilities are lost."
	item = /obj/item/camera/rewind/syndicate
	cost = 4
	surplus = 0

/datum/uplink_item/special/syndicaterewinder/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_REVOLUTIONARY_TRASHING) || prob(1)) // Cuz i can't think of anything better to use.
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = -1

/datum/uplink_item/special/magicdehydratedcarp
	name = "Dehydrated Magicarp"
	desc = "Looks like a plush toy carp, but just add water and it becomes a real-life magical space carp! \
			Activate in your hand before use so it knows not to kill you. Fires random bolts of magic."
	item = /obj/item/toy/plush/carpplushie/dehy_carp/magic
	cost = 3
	surplus = 0

/datum/uplink_item/special/magicdehydratedcarp/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_RAD_STORMS) || prob(1)) // Radiation magic powers? Guess that's not far-fetched as far as cartoons go.
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = -1

/datum/uplink_item/special/spacepiratekit
	name = "Pirate Kit"
	desc = "A box containing a syndicate handcannon, 4 cannonballs, and a recipe book to craft them both. \
			The syndicate handcannon can hold FOUR cannonballs in it's chamber!"
	item = /obj/item/storage/box/syndie_kit/piratekit
	cost = 14
	surplus = 0
	progression_minimum = 20 MINUTES

/datum/uplink_item/special/spacepiratekit/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_DISTANT_SUPPLYLINES) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/chameleonmutator
	name = "Chameleon DNA Mutator"
	desc = "A DNA mutator which grants the 'Chameleon' mutation, allowing the user to turn invisible \
			should they remain completely still for a short time. Can be cured by mutadone."
	item = /obj/item/dnainjector/chameleonmut
	cost = 4
	surplus = 0

/datum/uplink_item/special/chameleonmutator/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_BLACKOUT) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = -1

/datum/uplink_item/special/syndicategrant
	name = "Syndicate Grant"
	desc = "After hearing about a galactic grant given to the station's cargo department, we've electronically siphoned away quite a bit of the funding. \
			If you REALLY need it, we'll happily return the grant in portions -- granting you an additional 10 thousand credits to work with."
	item = /obj/item/stack/spacecash/c10000
	cost = 1
	surplus = 0

/datum/uplink_item/special/syndicategrant/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_GALACTIC_GRANT) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/luckywinner
	name = "Soda Dispensery"
	desc = "A briefcase we've augmented with redspace technology. It dispenses a single, random soda can for your enjoyment. \
			May or may not dispense soda cans distributed by our cola vending smugglers. Only dispenses soda while in the hands of one of our agents."
	item = /obj/item/storage/briefcase/secure/luckywinner
	cost = 15
	surplus = 0

/datum/uplink_item/special/luckywinner/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_LUCKY_WINNER) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/ninjamodsuit
	name = "Recreational Spider Clan MODsuit"
	desc = "A MODsuit we've designed at the request of the Spider Clan, substituting much of their technology for our own. \
			Comes with many of the original MODsuit modules including the EMP Pulse, Energy Net, No-Slip and Ninja Star Dispenser. \
			MODsuit comes with the following modules: Wraith, Electric Palm, Teleporter, Stimpack Booster, and Night Vision. \
			Does NOT come with any weaponry."
	item = /obj/item/mod/control/pre_equipped/ninja/traitor
	cost = 16
	surplus = 0
	progression_minimum = 20 MINUTES
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/special/ninjamodsuit/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_NINJAS) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/ninjasword
	name = "Energy Katana"
	desc = "A beautiful, green energy katana. It's design incorporates unknown technology allowing the wielder to teleport short distances. \
			It's about as effective as our energy swords, but cannot be stashed away so easily. \
			Glory to the Spider Clan! Glory to the Syndicate!"
	item = /obj/item/energy_katana
	cost = 16
	surplus = 0
	progression_minimum = 20 MINUTES
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/special/ninjasword/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_NINJAS) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = 1

/datum/uplink_item/special/pdadiskdeluxe
	name = "Deluxe Trapped Disk"
	desc = "A single high-end bomb disguised as a data disk that explodes should it's contents be tampered with. \
			We highly advise you don't try and extract the programs yourself."
	item = /obj/item/computer_disk/black_market/trap/highend
	cost = 4
	surplus = 0

/datum/uplink_item/special/pdadiskdeluxe/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_PDA_GLITCHED) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = -1

/datum/uplink_item/special/siliconmag
	name = "Cyborg Sequencer"
	desc = "A unique cryptographic sequencer designed to only subvert and interact with cyborgs! \
			This is technically a mark-down from the original design."
	item = /obj/item/card/emag/silicon_hack
	cost = 2
	surplus = 0
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/special/siliconmag/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_UNIQUE_AI) || prob(1))
		purchasable_from |= ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
		limited_stock = -1
