/datum/uplink_category/device_tools
	name = "Misc. Gadgets"
	weight = 15

/datum/uplink_item/device_tools
	category = /datum/uplink_category/device_tools

/datum/uplink_item/device_tools/soap
	name = "Syndicate Soap"
	desc = "A sinister-looking surfactant used to clean blood stains to hide murders and prevent DNA analysis. \
			You can also drop it underfoot to slip people."
	item = /obj/item/soap/syndie
	cost = 1
	surplus = 50
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/device_tools/syndietome
	name = "Syndicate Tome"
	desc = "Using rare artifacts acquired at great cost, the Syndicate has reverse engineered \
			the seemingly magical books of a certain cult. Though lacking the esoteric abilities \
			of the originals, these inferior copies are still quite useful, being able to provide \
			both weal and woe on the battlefield, even if they do occasionally bite off a finger."
	item = /obj/item/book/bible/syndicate
	cost = 5

/datum/uplink_item/device_tools/tram_remote
	name = "Tram Remote Control"
	desc = "When linked to a tram's on board computer systems, this device allows the user to manipulate the controls remotely. \
		Includes direction toggle and a rapid mode to bypass door safety checks and crossing signals. \
		Perfect for running someone over in the name of a tram malfunction!"
	item = /obj/item/assembly/control/transport/remote
	cost = 2

/datum/uplink_item/device_tools/thermal
	name = "Thermal Imaging Glasses"
	desc = "These goggles can be turned to resemble common eyewear found throughout the station. \
			They allow you to see organisms through walls by capturing the upper portion of the infrared light spectrum, \
			emitted as heat and light by objects. Hotter objects, such as warm bodies, cybernetic organisms \
			and artificial intelligence cores emit more of this light than cooler objects like walls and airlocks."
	item = /obj/item/clothing/glasses/thermal/syndi
	cost = 4

/datum/uplink_item/device_tools/camera_app
	name = "SyndEye Program"
	desc = "A data disk containing a unique PC app that allows you to watch cameras and track crewmembers."
	item = /obj/item/computer_disk/syndicate/camera_app
	cost = 1
	surplus = 90
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/device_tools/military_belt
	name = "Chest Rig"
	desc = "A robust seven-slot set of webbing that is capable of holding all manner of tactical equipment."
	item = /obj/item/storage/belt/military
	cost = 1

/datum/uplink_item/device_tools/doorjack
	name = "Airlock Authentication Override Card"
	desc = "A specialized cryptographic sequencer specifically designed to override station airlock access codes. \
			After hacking a certain number of airlocks, the device will require some time to recharge."
	item = /obj/item/card/emag/doorjack
	cost = 3

/datum/uplink_item/device_tools/toolbox
	name = "Full Syndicate Toolbox"
	desc = "The Syndicate toolbox is a suspicious black and red. It comes loaded with a full tool set including a \
			multitool and combat gloves that are resistant to shocks and heat."
	item = /obj/item/storage/toolbox/syndicate
	cost = 1
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/device_tools/rad_laser
	name = "Radioactive Microlaser"
	desc = "A radioactive microlaser disguised as a standard Nanotrasen health analyzer. When used, it emits a \
			powerful burst of radiation, which, after a short delay, can incapacitate all but the most protected \
			of humanoids. It has two settings: intensity, which controls the power of the radiation, \
			and wavelength, which controls the delay before the effect kicks in."
	item = /obj/item/healthanalyzer/rad_laser
	cost = 3
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/device_tools/binary
	name = "Binary Translator Key"
	desc = "A key that, when inserted into a radio headset, allows you to listen to and talk with silicon-based lifeforms, \
			such as AI units and cyborgs, over their private binary channel. Caution should \
			be taken while doing this, as unless they are allied with you, they are programmed to report such intrusions."
	item = /obj/item/encryptionkey/binary
	cost = 5
	surplus = 75
	restricted = TRUE

/datum/uplink_item/device_tools/emag
	name = "Cryptographic Sequencer"
	desc = "The cryptographic sequencer, electromagnetic card, or emag, is a small card that unlocks hidden functions \
			in electronic devices, subverts intended functions, and easily breaks security mechanisms. Cannot be used to open airlocks."
	item = /obj/item/card/emag
	cost = 4

/datum/uplink_item/device_tools/super_pointy_tape
	name = "Super Pointy Tape"
	desc = "An all-purpose super pointy tape roll. The tape is built with hundreds of tiny metal needles, the roll comes with in 5 pieces. When added to items the \
			item that was taped will embed when thrown at people. Taping people's mouthes with it will hurt them if pulled off by someone else."
	item = /obj/item/stack/sticky_tape/pointy/super
	cost = 1

/datum/uplink_item/device_tools/singularity_beacon
	name = "Power Beacon"
	desc = "When screwed to wiring attached to an electric grid and activated, this large device pulls any \
			active gravitational singularities or tesla balls towards it. This will not work when the engine is still \
			in containment. Because of its size, it cannot be carried. Ordering this \
			sends you a small beacon that will teleport the larger beacon to your location upon activation."
	progression_minimum = 30 MINUTES
	item = /obj/item/sbeacondrop
	cost = 10
	surplus = 0 // not while there isnt one on any station
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/device_tools/syndicate_contacts
	name = "Polarized Contact Lenses"
	desc = "High tech contact lenses that bind directly with the surface of your eyes to give them immunity to flashes and \
			bright lights. Effective, affordable, and nigh undetectable."
	item = /obj/item/syndicate_contacts
	cost = 3

/datum/uplink_item/device_tools/syndicate_climbing_hook
	name = "Syndicate Climbing Hook"
	desc = "High-tech rope, a refined hook structure, the peak of climbing technology. Only useful for climbing up holes, provided the operation site has any."
	item = /obj/item/climbing_hook/syndicate
	cost = 1
