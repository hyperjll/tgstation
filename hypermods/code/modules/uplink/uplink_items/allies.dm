/datum/uplink_item/reinforcements/support_sat
	name = "Syndicate Satellite"
	desc = "A single-use transponder used to contact our local syndicate support satellite. \
			After contacting, our satellite should send over a package with everything you'll need to reach it. \
			Amenities include: A bar, a medical bay, enough syndicate gear for a small team, and enough room for any construction projects. \
			Our local satellite agent will attempt to assist you in your endeavors, but cannot leave the satellite for security concerns. \
			A perfect staging area to meet-up with and cooperate alongside other syndicate agents. Do NOT lose or wipe the quantum card provided."
	item = /obj/item/syndicate_beacon
	cost = 10
	limited_stock = 1
	cant_discount = TRUE
	refundable = TRUE
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/support_sat/purchase(mob/user, datum/uplink_handler/uplink_handler, atom/movable/source)
	. = ..()
	for(var/uplink_items in subtypesof(/datum/uplink_item/reinforcements/support_sat_listing))
		var/datum/uplink_item/uplink_item = new uplink_items
		uplink_handler.extra_purchasable += uplink_item

/datum/uplink_item/reinforcements/support_sat_listing
	restricted = TRUE
	cant_discount = TRUE
	category = /datum/uplink_category/reinforcements
	purchasable_from = NONE //they will be added to extra_purchasable

/datum/uplink_item/reinforcements/support_sat_listing/support_sat_chemlab_key
	name = "Satellite Chemical Lab Access Card"
	desc = "An access card to utilize our state-of-the-art chemical lab onboard the syndicate satellite. \
			Create groundbreaking chemical agents, cook up, sell the best of drugs, and make chemical factories today!"
	item = /obj/item/keycard/syndicate_chem/satellite
	cost = 8
	limited_stock = 1
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/support_sat_listing/support_sat_kitchen_key
	name = "Satellite Culinary Lab Access Card"
	desc = "An access card to gain early entry into our premium, high-end kitchen onboard the satellite. \
			An excellent purchase if you're in dire need of pigging out, or desire to out-bake the entirety of the Spinward Sector!"
	item = /obj/item/keycard/syndicate_fridge/satellite
	cost = 4
	limited_stock = 1
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/support_sat_listing/sat_auth
	name = "Satellite Authorization Implant"
	desc = "A single, sterile implanter with an authentication implant required by the on-site turrets to determine who's an invader and who isn't. \
			Purchasing this implanter will allow you to bring other agents, allies, or captives onto the satellite without trouble."
	item = /obj/item/implanter/sat_authorization
	cost = 4
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND


/datum/uplink_item/reinforcements/syndipal
	name = "Syndicate Support Beacon"
	desc = "A single-use beacon which allows us to send over a support agent to your location to assist you. \
			The support agent comes equipped with some chameleon clothing, a syndicate toolbox, an agent id, \
			a voice mask, some syndicate smokes, and a survival knife for self-defense."
	item = /obj/item/antag_spawner/loadout/syndipal
	cost = 4
	limited_stock = 1
	refundable = TRUE
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS // This is necessary cuz it defaults to nukeop only.
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/totborg
	name = "Cyborg Support Beacon"
	desc = "A single-use beacon which allows us to send over a hacked cyborg to your location to assist you. \
			The support cyborg will have had it's hidden modules unlocked before-hand. \
			Just in case, it's had our own custom set of laws installed to ensure it's compliance."
	item = /obj/item/antag_spawner/loadout/syndiborg
	cost = 6
	limited_stock = 1
	refundable = TRUE
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND


/datum/uplink_item/reinforcements/spai
	name = "Syndicate pAI"
	desc = "A blood-red personal AI device. The perfect companion for when you're on the run. \
			Can access many unique modules to grant the user additional utility. \
			Comes with a syndicate encryption key pre-installed. Usefulness not guaranteed."
	item = /obj/item/pai_card/syndicate
	cost = 1
	surplus = 0
	cant_discount = TRUE
	purchasable_from = ALL
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/dehy_carp
	name = "Dehydrated Space Carp"
	desc = "Looks like a plush toy carp, but just add water and it becomes a real-life space carp! Activate in \
			your hand before use so it knows not to kill you."
	item = /obj/item/toy/plush/carpplushie/dehy_carp
	cost = 1
	purchasable_from = ALL
	uplink_item_flags = SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/guardian
	name = "Holoparasites"
	desc = "Though capable of near sorcerous feats via use of hardlight holograms and nanomachines, they require an \
			organic host as a home base and source of fuel. Holoparasites come in various types and share damage with their host."
	progression_minimum = 30 MINUTES
	item = /obj/item/guardian_creator/tech
	cost = 18
	surplus = 0
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	restricted = TRUE
	refundable = TRUE
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/guardian/nukies // holoparasite ops when?
	name = "Holoparasites"
	desc = "Though capable of near sorcerous feats via use of hardlight holograms and nanomachines, they require an \
			organic host as a home base and source of fuel. Holoparasites come in various types and share damage with their host."
	item = /obj/item/guardian_creator/tech
	cost = 40
	surplus = 0
	purchasable_from = UPLINK_ALL_SYNDIE_OPS
	cant_discount = TRUE
	restricted = TRUE
	refundable = TRUE
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/hypnotic_flash
	name = "Hypnotic Flash"
	desc = "A modified flash able to hypnotize targets. If the target is not in a mentally vulnerable state, it will only confuse and pacify them temporarily."
	item = /obj/item/assembly/flash/hypnotic
	cost = 7
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/hypnotic_grenade
	name = "Hypnotic Grenade"
	desc = "A modified flashbang grenade able to hypnotize targets. The sound portion of the flashbang causes hallucinations, and will allow the flash to induce a hypnotic trance to viewers."
	item = /obj/item/grenade/hypnotic
	cost = 12
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/potion
	name = "Syndicate Sentience Potion"
	item = /obj/item/slimepotion/sentience/nuclear
	desc = "A potion recovered at great risk by undercover Syndicate operatives and then subsequently modified with Syndicate technology. \
		Using it will make any animal sentient, and bound to serve you, as well as implanting an internal radio for communication and an internal ID card for opening doors."
	cost = 2
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	restricted = TRUE
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND


/datum/uplink_item/reinforcements/megadehydratedcarp
	name = "Dehydrated Megacarp"
	desc = "Looks like a plush toy carp, but just add water and it becomes a real-life mega space carp! Activate in \
			your hand before use so it knows not to kill you."
	item = /obj/item/toy/plush/carpplushie/dehy_carp/mega
	cost = 2
	surplus = 10
	purchasable_from = ALL
	uplink_item_flags = SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/spongecapsules
	name = "Syndicate Sponge Capsules"
	desc = "After extensive research into monkey cubes and gold slime extracts, the xenobiologists at the Tiger Coop managed to combine them \
			into one all-in-one package. Simply place a capsule where you need your monster party and spray with water. Each capsule will \
			bring forth 2 random beasts to maul random bystanders. Comes with SIX sponge capsules. Monsters may or may not attack you."
	item = /obj/item/storage/box/spongecapsules
	cost = 7
	surplus = 10
	purchasable_from = ~UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/cyborgrescue
	name = "Rescue Cyborg Module"
	desc = "An illegal module which grants a cyborg of choice fulton equipment. \
			Very useful for quick escapes for both you and your silicon companion. \
			Will also hack their software to reveal hidden modules. Does NOT enslave cyborgs."
	item = /obj/item/borg/upgrade/illegalrescue
	cost = 6
	surplus = 10
	progression_minimum = 15 MINUTES
	purchasable_from = ~UPLINK_CLOWN_OPS
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/cyborgweapons
	name = "Weapon Cyborg Module"
	desc = "An illegal module capable of granting a cyborg a Viper pistol with the necessary hardware \
			needed to print more ammunition on the fly. Also grants the cyborg of choice an energy dagger \
			and hacks their software to reveal hidden modules. Exceptionally effective for mass murder. Does NOT enslave cyborgs."
	item = /obj/item/borg/upgrade/illegalweapons
	cost = 10
	surplus = 0
	progression_minimum = 30 MINUTES
	purchasable_from = ~UPLINK_CLOWN_OPS
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/cyborgmartyr
	name = "Martyr Cyborg Module"
	desc = "Reveals a high-yielding explosive which was installed into the cyborg upon it's creation. \
			This allows a cyborg to self-destruct with greater power and possibly take out other people for good. \
			Will also hack their software to reveal hidden modules. Does NOT enslave cyborgs."
	item = /obj/item/borg/upgrade/martyr
	cost = 4
	surplus = 10
	progression_minimum = 20 MINUTES
	purchasable_from = ~UPLINK_CLOWN_OPS
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/betterselfrepair
	name = "Superior Self-Repair Module"
	desc = "A typical self-repair module for cyborgs. It's been enhanced with syndicate technology to improve it's repair rate. \
			This repair module has been estimated to be at least 3x as effective over nanotrasen models."
	item = /obj/item/borg/upgrade/selfrepair/illegal
	cost = 2
	surplus = 0
	progression_minimum = 20 MINUTES
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/reinforcements/imp_induction
	name = "Operative Induction Implant"
	desc = "A special implant available to our agents in case one of our nuclear operative teams are coming in hot. \
			While we provide our operatives with a better version that comes with gear, meeting up during a raid usually isn't \
			possible in most scenarios. So we'll provide one here to increase the chances of agent recovery and operative success. \
			CAN ONLY BE PURCHASED SHOULD A NUCLEAR OPERATIVE TEAM DECLARE WAR."
	item = /obj/item/storage/box/syndie_kit/imp_induction
	cost = 4 // Cost reduction because we aren't providing extra gear.
	surplus = 0
	limited_stock = 1
	cant_discount = TRUE
	progression_minimum = 20 MINUTES // About the time nukies arrive, if you manage to get secondary objectives done for it early, then fine?
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY) // Only available when a nukie team declares war.
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/reinforcements/imp_induction/can_be_bought(datum/uplink_handler/uplink_handler)
	if(!uplink_handler.warops)
		return FALSE
	return ..()

/datum/uplink_item/reinforcements/neutered_borer_egg
	name = "Neutered Borer Egg"
	desc = "A borer egg specifically bred to aid operatives. \
			It will obey every command and protect whatever operative they first see when hatched. \
			Unfortunately due to extreme radiation exposure, they cannot reproduce. \
			It was put into a cage for easy tranportation"
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)
	item = /obj/item/neutered_borer_spawner
	cost = 20
	surplus = 40
	progression_minimum = 30 MINUTES
	refundable = TRUE
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND
