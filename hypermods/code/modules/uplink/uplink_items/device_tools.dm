/datum/uplink_item/device_tools/encryptionkey
	name = "Syndicate Encryption Keys"
	desc = "Two keys that, when inserted into a radio headset, allows you to listen to all station department channels \
			as well as talk on an encrypted Syndicate channel with other agents that have the same key. In addition, this key also protects \
			your headset from radio jammers. Give one to a friend!"
	item = /obj/item/storage/box/syndie_kit/syndiekeys
	cost = 2
	surplus = 75
	restricted = TRUE

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

/datum/uplink_item/device_tools/belt_bluecham
	name = "Bluespace Chameleon Belt"
	desc = "A robust belt fitted with chameleon technology that is capable of holding all manner of tactical equipment, and can even hold the bulkiest items!"
	item = /obj/item/storage/belt/chameleon/bluespace
	cost = 3

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

/datum/uplink_item/device_tools/firingpin_traitor
	name = "Syndicate Firing Pins"
	desc = "A box containing some of our signature firing pins. They require a firearm authentication implant if you intend to privatize your firearms. \
			These firing pins cannot be removed after installation. You could practically render all guns on the station useless with enough of these."
	item = /obj/item/storage/box/firingpins/traitor_noremove
	cost = 2
	surplus = 0

/datum/uplink_item/device_tools/firingpin_traitor_dna
	name = "Syndicate DNA Firing Pins"
	desc = "A box containing some of our experimental DNA firing pins. After installation, use the firearm to link your DNA to it. \
			These firing pins cannot be removed after installation. Perfect if you intend to private other syndicate agents from using your firearms."
	item = /obj/item/storage/box/firingpins/dna_noremove
	cost = 3
	surplus = 0

/datum/uplink_item/device_tools/potion
	name = "Syndicate Sentience Potion"
	item = /obj/item/slimepotion/slime/sentience/nuclear
	desc = "A potion recovered at great risk by undercover Syndicate operatives and then subsequently modified with Syndicate technology. \
		Using it will make any animal sentient, and bound to serve you, as well as implanting an internal radio for communication and an internal ID card for opening doors."
	cost = 2
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	restricted = TRUE
