/datum/uplink_category/device_tools
	name = "Misc. Gadgets"
	weight = 8

/datum/uplink_item/device_tools
	category = /datum/uplink_category/device_tools


/datum/uplink_item/device_tools/encryptionkey
	name = "Syndicate Encryption Keys"
	desc = "Two keys that, when inserted into a radio headset, allows you to listen to all station department channels \
			as well as talk on an encrypted Syndicate channel with other agents that have the same key. In addition, this key also protects \
			your headset from radio jammers. Give one to a friend!"
	item = /obj/item/storage/box/syndie_kit/syndiekeys
	cost = 2
	surplus = 75
	restricted = TRUE

/datum/uplink_item/device_tools/airshoes
	name = "Air Shoes"
	desc = "Popular in underground racing rings, these shoes come with built-in jets, allowing the user to reach high speeds in short bursts. \
			Users should keep in mind that despite being superior to Jump Shoes, these will not protect you from high-speed impacts."
	item = /obj/item/clothing/shoes/bhop/airshoes
	cost = 4
	surplus = 35

/datum/uplink_item/device_tools/toolboxdeluxe
	name = "Deluxe Syndicate Toolbox"
	desc = "A syndicate toolbox that comes stocked with ultra-fast syndicate tools. Be careful, as \
			these tools are more obviously marked and will be easily spotted by anyone observant. \
			Comes with a hand drill and experimental welding tool instead of the usual tools we provide."
	item = /obj/item/storage/toolbox/syndicate/deluxe
	cost = 2

/datum/uplink_item/device_tools/tactical_gloves
	name = "Tactical Fingerless Gloves"
	desc = "A pair of simple insulated gloves without fingertips that greatly assist in carrying bodies, \
			cuffing people, holding dangerous plants, construction, wound-tending, shooting, and even allow \
			you to use sign language over telecommunications!"
	item = /obj/item/clothing/gloves/fingerless/bigboss
	cost = 2

/datum/uplink_item/device_tools/syndie_bodybag
	name = "Syndicate Prisoner Transport Bag"
	desc = "An alteration of Nanotrasen's environmental protection bag which has been used in several high-profile kidnappings. \
			Designed to keep a victim unconscious, alive, and secured until they are transported to a required location."
	item = /obj/item/bodybag/environmental/prisoner/syndicate
	cost = 2

/datum/uplink_item/device_tools/magboots
	name = "Advanced Blood-Red Magboots"
	desc = "A pair of magnetic boots with a Syndicate paintjob that assist with freer movement in space or on-station \
			especially during gravitational generator failures. These reverse-engineered prototypes of Nanotrasen's \
			'Advanced Magboots' won't slow you down in simulated-gravity environments much like the standard issue variety. \
			Additionally, these magboots may invert gravity upon the wearer, allowing for jetpack usage."
	item = /obj/item/clothing/shoes/magboots/syndie/advanced
	cost = 6

/datum/uplink_item/device_tools/mdrive
	name = "Mirage Drive"
	desc = "An experimental device created as a byproduct of research into faster than light travel. Utilizing magnetic coils, the mirage drive is able to generate \
			kinetic energy and use it in a way that moves the user to their destination at a speed comparable to teleportation, so long as an unobstructed path between the \
			user and the target exists. Can also be used to deliver rapid-fire attacks onto targets you pass through."
	item = /obj/item/mdrive
	cost = 12

/datum/uplink_item/device_tools/angelcoolboy
	name = "Angelic Potion"
	desc = "After many failed attempts, the syndicate has reverse engineered an angel potion smuggled off of the lava planet V-227. \
			Those who drink the contents of the bottle provided will immediately sprout wings capable of sustained flight. Wings may vary in appearance."
	cost = 2
	surplus = 10
	item = /obj/item/reagent_containers/cup/bottle/potion/flight

/datum/uplink_item/device_tools/jetpack
	name = "Smuggled Jetpack"
	desc = "A blue jetpack smuggled from NT's suppliers. It's been pre-filled with oxygen."
	item = /obj/item/tank/jetpack/oxygen
	cost = 2
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)

/datum/uplink_item/device_tools/advlaunchcamerasetup
	name = "Launchpad & Camera Setup Bundle"
	desc = "A box utilizing bluespace technology, it contains everything you'd require to setup a launchpad and advanced camera monitor. \
			Thank our smugglers in advance. Does not come with any power setup. If you'd prefer a mobile setup, try our briefcase launchpad."
	item = /obj/item/storage/box/syndie_kit/launchpadcamerabundle
	cost = 8
	surplus = 15

/datum/uplink_item/device_tools/portalgun
	name = "Bluespace Wormhole Projector"
	desc = "A projector that emits high density quantum-coupled bluespace beams capable of ripping holes within the fabric of space-time. \
			Shoot once for a blue portal, and alt-fire for a orange portal. Entities may pass through one portal to emerge from the other. \
			Portals will collapse and disappear eventually on their own, and portals may be created through windows."
	item = /obj/item/gun/energy/wormhole_projector/core_inserted
	cost = 5
	surplus = 18

/datum/uplink_item/device_tools/spininverters
	name = "Quantum Spin Inverters"
	desc = "An experimental device that is able to swap the locations of two entities by switching their particles' spin values. Must be linked to another device to function."
	item = /obj/item/storage/box/syndie_kit/spininverters
	cost = 2
	surplus = 20

/datum/uplink_item/device_tools/belt_bluecham
	name = "Bluespace Chameleon Belt"
	desc = "A robust belt fitted with chameleon technology that is capable of holding all manner of tactical equipment, and can even hold the bulkiest items!"
	item = /obj/item/storage/belt/chameleon/bluespace
	cost = 3

/datum/uplink_item/device_tools/syndicubes
	name = "Box of Syndicate Cubes"
	desc = "A box containing 5 simple lifeform producing cubes, when water is applied, human-like lifeforms will spring forth and will attack everyone nearby. \
			Syndicates produced have limited intelligence and may not be able to identify undercover agents. They are armed however."
	item = /obj/item/storage/box/monkeycubes/syndicate/syndis
	cost = 5
	surplus = 10
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)

/datum/uplink_item/device_tools/spongecapsules
	name = "Syndicate Sponge Capsules"
	desc = "After extensive research into monkey cubes and gold slime extracts, the xenobiologists at the Tiger Coop managed to combine them \
			into one all-in-one package. Simply place a capsule where you need your monster party and spray with water. Each capsule will \
			bring forth 2 random beasts to maul random bystanders. Comes with SIX sponge capsules. Monsters may or may not attack you."
	item = /obj/item/storage/box/spongecapsules
	cost = 7
	surplus = 10
	purchasable_from = ~UPLINK_SERIOUS_OPS

/datum/uplink_item/device_tools/dangerous_bone_gel
	name = "Reverse Bone Gel"
	desc = "A single bottle of bone gel, we've specifically modified it to do the exact OPPOSITE of it's intended purpose. Refrain from using on yourself. \
			The reverse bone gel will apply itself all over the victims body regardless of where it's applied, and only has enough for one use."
	item = /obj/item/bone_gel_dangerous
	cost = 3
	surplus = 10

/datum/uplink_item/device_tools/mrfreezesprayer
	name = "Frost Oil Chemical Sprayer"
	desc = "One of our bioterror chemical sprayers, rather than spewing lethal chemicals, it generates and shoots frost oil. \
			Frost oil leaves behind frozen tiles which cause slips, this cannot be prevented by no-slip shoes or magboots. \
			Best used as an escape tool rather than being used to gain an advantage over an opponent."
	item = /obj/item/reagent_containers/spray/chemsprayer/freeze
	cost = 5
	surplus = 10

/datum/uplink_item/device_tools/syndicate_fulton
	name = "Syndicate Fulton Package"
	desc = "A box containing two fulton packs that can be used anywhere, and two beacons for those fultons. \
			The fulton packs can be used anywhere, and the beacons can only be discovered via our packs. \
			Beacons are completely invisible. Comes with a manual to make more."
	item = /obj/item/storage/box/syndie_kit/syndifulton
	cost = 6
	surplus = 30

/datum/uplink_item/device_tools/universal_key
	name = "Universal Encryption Key"
	desc = "A syndicate encryption key given superior subspace technology by an unknown party. \
			Insert this encryption key into a headset to both hear and speak over all departmental channels. \
			Also grants access to our secure syndicate channel and even Nanotrasen's private channels. \
			Does NOT translate binary."
	item = /obj/item/encryptionkey/universal
	cost = 3
	surplus = 0

/datum/uplink_item/device_tools/extraarm
	name = "Additional Arm"
	desc = "An additional arm, automatically added to your body upon purchase, allows you to use more items at once"
	item = /obj/item/bodypart/arm/left //doesn't actually spawn an arm, but it needs an object to show up in the menu :^)
	cost = 5
	surplus = 0
	limited_stock = 2 // It's probably best to not break the UI any further.
	purchasable_from = ~(UPLINK_SERIOUS_OPS | UPLINK_SPY)
	 // It's just another arm.

/datum/uplink_item/device_tools/extraarm/spawn_item(spawn_item, mob/user)
	var/limbs = user.held_items.len
	user.change_number_of_hands(limbs+1)
	to_chat(user, "You feel more dexterous")

/datum/uplink_item/device_tools/syndieomnitool
	name = "Syndicate Holotool"
	desc = "Thanks to our agents for procuring NT's Experimental Holotool, we've been able to replicate the design for ourselves. \
			This holotool can be switched between all forms of basic tools, and starts with a scarlet color which can be changed."
	item = /obj/item/holotool/syndicate
	cost = 4
	surplus = 40

/datum/uplink_item/device_tools/syndieomnigoggles
	name = "Syndicate Omni-Goggles"
	desc = "A pair of goggles augmented with chameleon technology and every single HUD-tech known to us. \
			Allows you to see Medical Statuses, IDs, Reagent Info, Diagnostic Info, and the general layout of the area around you. \
			Does NOT protect from flashes, but corrects near-sighted-ness."
	item = /obj/item/clothing/glasses/universal
	cost = 4
	surplus = 20

/datum/uplink_item/device_tools/cyborgrescue
	name = "Rescue Cyborg Module"
	desc = "An illegal module which grants a cyborg of choice fulton equipment. \
			Very useful for quick escapes for both you and your silicon companion. \
			Will also hack their software to reveal hidden modules. Does NOT enslave cyborgs."
	item = /obj/item/borg/upgrade/illegalrescue
	cost = 10
	surplus = 10
	progression_minimum = 15 MINUTES
	purchasable_from = ~UPLINK_CLOWN_OPS
