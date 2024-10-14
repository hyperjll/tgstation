/datum/uplink_category/explosive_tools
	name = "Explosive Gadgets"
	weight = 19

/datum/uplink_item/explosive_tools
	category = /datum/uplink_category/explosive_tools


/datum/uplink_item/explosive_tools/c4
	name = "Composition C-4"
	desc = "C-4 is plastic explosive of the common variety Composition C. You can use it to breach walls, sabotage equipment, or connect \
			an assembly to it in order to alter the way it detonates. It can be attached to almost all objects and has a modifiable timer with a \
			minimum setting of 10 seconds."
	item = /obj/item/grenade/c4
	cost = 1

/datum/uplink_item/explosive_tools/c4bag
	name = "Bag of C-4 explosives"
	desc = "Because sometimes quantity is quality. Contains 10 C-4 plastic explosives."
	item = /obj/item/storage/backpack/duffelbag/syndie/c4
	cost = 8 //20% discount!
	cant_discount = TRUE

/datum/uplink_item/explosive_tools/x4bag
	name = "Bag of X-4 explosives"
	desc = "Contains 3 X-4 shaped plastic explosives. Similar to C4, but with a stronger blast that is directional instead of circular. \
			X-4 can be placed on a solid surface, such as a wall or window, and it will blast through the wall, injuring anything on the opposite side, while being safer to the user. \
			For when you want a controlled explosion that leaves a wider, deeper, hole."
	progression_minimum = 20 MINUTES
	item = /obj/item/storage/backpack/duffelbag/syndie/x4
	cost = 4
	cant_discount = TRUE

/datum/uplink_item/explosive_tools/soap_clusterbang
	name = "Slipocalypse Clusterbang"
	desc = "A traditional clusterbang grenade with a payload consisting entirely of Syndicate soap. Useful in any scenario!"
	item = /obj/item/grenade/clusterbuster/soap
	cost = 3

/datum/uplink_item/explosive_tools/detomatix
	name = "Detomatix disk"
	desc = "When inserted into a tablet, this cartridge gives you four opportunities to \
			detonate tablets of crewmembers who have their message feature enabled. \
			The concussive effect from the explosion will knock the recipient out for a short period, and deafen them for longer."
	item = /obj/item/computer_disk/virus/detomatix
	cost = 6
	restricted = TRUE

/datum/uplink_item/explosive_tools/pizza_bomb
	name = "Pizza Bomb"
	desc = "A pizza box with a bomb cunningly attached to the lid. The timer needs to be set by opening the box; afterwards, \
			opening the box again will trigger the detonation after the timer has elapsed. Comes with free pizza, for you or your target!"
	progression_minimum = 15 MINUTES
	item = /obj/item/pizzabox/bomb
	cost = 6
	surplus = 8

/datum/uplink_item/explosive_tools/syndicate_bomb
	name = "Syndicate Bomb"
	desc = "The Syndicate bomb is a fearsome device capable of massive destruction. It has an adjustable timer, \
		with a minimum of %MIN_BOMB_TIMER seconds, and can be bolted to the floor with a wrench to prevent \
		movement. The bomb is bulky and cannot be moved; upon ordering this item, a smaller beacon will be \
		transported to you that will teleport the actual bomb to it upon activation. Note that this bomb can \
		be defused, and some crew may attempt to do so. \
		The bomb core can be pried out and manually detonated with other explosives."
	progression_minimum = 30 MINUTES
	item = /obj/item/sbeacondrop/bomb
	cost = 11

/datum/uplink_item/explosive_tools/syndicate_bomb/New()
	. = ..()
	desc = replacetext(desc, "%MIN_BOMB_TIMER", SYNDIEBOMB_MIN_TIMER_SECONDS)


/datum/uplink_item/explosive_tools/collarbombs
	name = "Collar Bombs"
	desc = "A box containing 5 collar bombs, which must be directly attached to the victims' neck. \
			After recieving an appropriate signal, the collar bomb explodes resulting in decapitation \
			after a short delay. Comes with 6 remote signallers for ease of use."
	item = /obj/item/storage/box/syndie_kit/collarbombs
	cost = 4

/datum/uplink_item/explosive_tools/trap_disks
	name = "Box of Syndicate Trapped Disks"
	desc = "Five bombs disguised as data disks that triggers a minute after inserting into any modular computers. \
			Can come with some useful programs, if you're fast enough to download them and then throw the disk away."
	item = /obj/item/storage/box/syndie_kit/trappeddisks
	progression_minimum = 15 MINUTES
	cost = 7
	surplus = 10

/datum/uplink_item/explosive_tools/wheelchair
	name = "Explosive Wheelchair"
	desc = "A wheelchair with a high yield bomb strapped to it... why would anyone ever want this? \
			Doesn't come with the bell required to set off the explosive payload."
	item = /obj/item/wheelchair/explosive
	cost = 6
	surplus = 0
	limited_stock = 1

/datum/uplink_item/explosive_tools/trickcigs
	name = "Trick Cigarettes"
	desc = "A normal cigarette packet containing 6 explosive cigarettes. They explode violently after they've been lit and put out. \
			Explosions are powerful enough to cause hull breaches, and cigarettes are lit for only 60 seconds before exploding. \
			Only contains 5 units of nicotine each."
	item = /obj/item/storage/fancy/cigarettes/trick_cigs
	cost = 2
	surplus = 40
	progression_minimum = 5 MINUTES

/datum/uplink_item/explosive_tools/bombchameleon
	name = "Chameleon Bomb"
	desc = "An explosive device fitted with our chameleon technology, when used on an object, the bomb will disguise itself as that object. \
			To arm, remove the bomb from your hands, disguised or not, the bomb will arm itself and will detonate upon being picked up. \
			The explosive isn't super powerful, but can seriously harm those who pick it up and leave them incapacitated temporarily."
	item = /obj/item/device/chameleon/bomb
	cost = 2
	surplus = 50
	progression_minimum = 10 MINUTES

/datum/uplink_item/explosive_tools/door_charge
	name = "Explosive Airlock Charge"
	desc = "A small, easily concealable device. It can be applied to an open airlock panel, booby-trapping it. \
			The next person to open that airlock will trigger an explosion, knocking them down and destroying \
			the airlock maintenance panel."
	item = /obj/item/doorCharge
	cost = 2
	surplus = 10
	purchasable_from = ~UPLINK_SERIOUS_OPS

/datum/uplink_item/explosive_tools/explosivemines
	name = "Box of Explosive Mines"
	desc = "A box containing approximately 5 Explosive landmines which can be planted on any tile. These mines can easily kill and gib those who step on them as well as destroying all of their stuff."
	item = /obj/item/storage/box/syndie_kit/explosivemines
	cost = 6
	surplus = 10
	purchasable_from = ~UPLINK_CLOWN_OPS
	progression_minimum = 20 MINUTES

/datum/uplink_item/explosive_tools/stunmines
	name = "Box of Stun Mines"
	desc = "A box containing approximately 5 Stun landmines which can be planted on any tile. These mines will stun targets who walk over them."
	item = /obj/item/storage/box/syndie_kit/stunmine
	cost = 3
	surplus = 50

/datum/uplink_item/explosive_tools/heavymines
	name = "Box of Sledgehammer Stun Mines"
	desc = "A box containing approximately 5 Sledgehammer Stun landmines which can be planted on any tile. These mines take a while to plant, but leave a target helpless and disarmed for a long period of time."
	item = /obj/item/storage/box/syndie_kit/heavymine
	cost = 4
	surplus = 50

/datum/uplink_item/explosive_tools/plasmafiremines
	name = "Box of Plasma Mines"
	desc = "A box containing approximately 5 Plasma landmines which can be planted on any tile. When stepped on, these mines eject highly toxic plasma gas and ignite it, causing a major fire hazard."
	item = /obj/item/storage/box/syndie_kit/plasmafiremine
	cost = 5
	surplus = 40
	purchasable_from = ~UPLINK_CLOWN_OPS
	progression_minimum = 20 MINUTES

/datum/uplink_item/explosive_tools/sleepymines
	name = "Box of Sleepy Gas Mines"
	desc = "A box containing approximately 5 Nitrous Oxide gas landmines which can be planted on any tile. When triggered, the mine releases a large amount of N20 Gas."
	item = /obj/item/storage/box/syndie_kit/sleepymine
	cost = 4
	surplus = 45
	progression_minimum = 20 MINUTES
