/datum/uplink_item/stealthy_tools/agent_card_ultimate
	name = "Ultimate Agent Identification Card"
	desc = "Agent cards prevent artificial intelligences from tracking the wearer. This one can hold an unlimited amount of additional access, \
			much of which you'll likely steal from other identification cards. In addition, they can be forged to display a new assignment, name and trim. \
			This can be done an unlimited amount of times. Some Syndicate areas and devices can only be accessed \
			with these cards."
	item = /obj/item/card/id/advanced/chameleon/black
	cost = 6

/datum/uplink_item/stealthy_tools/shadowcloak
	name = "Cloaker Belt"
	desc = "A tactical belt that renders the wearer invisible while active. Has a short charge that is refilled in darkness; only charges when in use."
	item = /obj/item/shadowcloak
	cost = 15
	purchasable_from = ~UPLINK_SERIOUS_OPS

/datum/uplink_item/stealthy_tools/nuclearshadowcloak
	name = "Cloaker Belt"
	desc = "A tactical belt that renders the wearer invisible while active. Has a short charge that is refilled in darkness; only charges when in use."
	item = /obj/item/shadowcloak
	cost = 20
	purchasable_from = UPLINK_SERIOUS_OPS

/datum/uplink_item/stealthy_tools/syndireverse
	name = "Bluespace Projectile Weapon Disrupter"
	desc = "Hidden in an ordinary-looking playing card, this device will teleport an opponent's gun to your hand when they fire at you. Just make sure to hold this in your hand!"
	item = /obj/item/syndicateReverseCard
	cost = 4

/datum/uplink_item/stealthy_tools/mousecubes
	name = "Box of Mouse Cubes"
	desc = "A box with twenty four Waffle Co. brand mouse cubes. Deploy near wiring. \
			Caution: Product may rehydrate when exposed to water. Useful for taking out wiring in maintenance without suspicion."
	item = /obj/item/storage/box/monkeycubes/syndicate/mice
	cost = 1

/datum/uplink_item/stealthy_tools/nocturine
	name = "Nocturine Bottle"
	desc = "A bottle containing 30 units of Nocturine, a chemical agent capable of robbing any living organism's conscience from it extremely quickly -- even in small doses."
	item = /obj/item/reagent_containers/cup/bottle/nocturine
	cost = 3
	surplus = 40

/datum/uplink_item/stealthy_tools/bluespace_chameleon_backpack
	name = "Bluespace Chameleon Backpack"
	desc = "A backpack outfitted with both chameleon and bluespace technology. The backpack can match any desired appearance and typically hold more than a duffel bag would."
	item = /obj/item/storage/backpack/bluespacechameleon
	cost = 4
	surplus = 30

/datum/uplink_item/stealthy_tools/syndistache
	name = "Syndicate Moustache"
	desc = "A moustache to prevent people from recognizing you. Be sure to conceal your real identification card or it won't work. \
			The moustache provided is completely fire proof, and has minor protection technology installed to aid you should you be found out. \
			Also allows you to properly use internals, and even has a slot for smoking cigarettes. Comes with an in-built voice changer."
	item = /obj/item/clothing/mask/gas/fakemoustache/syndicate
	cost = 3
	surplus = 50

/datum/uplink_item/stealthy_tools/voice_changer
	name = "Voice Changer"
	desc = "A mask with voice changing capabilities and chameleon technology, it'll change your voice automatically to match the appearance or ID you have. \
			Be sure to conceal your real identity or it won't work. Less blatantly obvious than our fake moustaches."
	item = /obj/item/clothing/mask/chameleon
	cost = 1
	surplus = 50

/datum/uplink_item/stealthy_tools/chameleon_tie
	name = "Chameleon Storage Tie"
	desc = "A tie fitted with our chameleon technology, it also has several pockets within it for additional storage."
	item = /obj/item/storage/chameleonstoragetie
	cost = 2
	surplus = 35

/datum/uplink_item/stealthy_tools/desynchronizer
	name = "Desynchronizer"
	desc = "An experimental device that can temporarily desynchronize the user from spacetime, effectively making them disappear while it's active. \
			Beware that this device can be used for a total of 5 minutes, but the cooldown will always be for as long as it was previously used."
	item = /obj/item/desynchronizer
	cost = 4
	surplus = 20

/datum/uplink_item/stealthy_tools/bluespace_briefcase
	name = "Bluespace Briefcase"
	desc = "One of our secure briefcases, it's been fitted with bluespace technology allowing it to hold even the bulkiest of items \
			in addition to holding far more than it should normally allow. It's also been fitted with lavaproofing, fireproofing, and acidproofing. \
			Take care to not allow security to read it's protection classes tag, or they may not give it back. This briefcase packs a bit more of a punch as usual."
	item = /obj/item/storage/briefcase/secure/bluespace
	cost = 2
	surplus = 30

/datum/uplink_item/stealthy_tools/target_tracker
	name = "Target Tracker"
	desc = "One of Nanotrasen's crew pinpointers smuggled out by our agents and repurposed by our programmers. \
			It's capable of detecting and tracking suit sensors (regardless of the level they're set to) AND tracking implants."
	item = /obj/item/pinpointer/crew/syndicate
	cost = 3
	surplus = 0
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/stealthy_tools/tracking_implants
	name = "Box of Tracking Implants"
	desc = "A box containing SIX of our finest tracking implants, undetectable except through SecHUDs. \
			The implanter included can be used extremely quickly and isn't noticeable by the implantee or on-lookers."
	item = /obj/item/storage/box/syndie_kit/trackingimplants
	cost = 1
	surplus = 0
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/stealthy_tools/thievesgloves
	name = "Thieves Gloves"
	desc = "A pair of insulated combat gloves which are fitted with our chameleon technology. \
			It also has several bluespace pockets within it for additional storage. Comes with a screwdriver, multitool, and a crowbar."
	item = /obj/item/storage/box/syndie_kit/thievesgloves
	cost = 1
	surplus = 20

/datum/uplink_item/stealthy_tools/holodisguiser
	name = "Holographic Disguiser"
	desc = "A peculiar device modeled after extensive research into stabilized green slime extracts. \
			While held, or within your backpack the device will automatically activate, projecting a false appearance AND voice. \
			Excellent for mulligan tactics, pair with a Agent Identification Card and Chameleon Kit for an excellent combo."
	item = /obj/item/holodisguiser
	cost = 4
	surplus = 40

/datum/uplink_item/stealthy_tools/lightbreaker
	name = "Light Breaker"
	desc = "A sonic device concealed as a universal tape recorder. When activated, it emits a screeching sound capable of \
			shattering all light tubes or bulbs near the user, the sound is horribly loud to all nearby, causing all without ear protection to crumble \
			to the ground in pain for a short time. Can be used four times, but can be rewound with a screwdriver at the cost of it's stability. \
			Has no recording capablilities, and won't hold up well to scrutiny by security officers or detectives."
	item = /obj/item/lightbreaker
	cost = 4
	surplus = 30
	purchasable_from = ~UPLINK_SPY
