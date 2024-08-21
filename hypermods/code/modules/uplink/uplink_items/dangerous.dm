//All bundles and telecrystals
/datum/uplink_category/dangerous
	name = "Conspicuous Weapons"
	weight = 13

/datum/uplink_item/dangerous
	category = /datum/uplink_category/dangerous
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND


/datum/uplink_item/dangerous/backstab
	name = "Backstabbing Switchblade"
	desc = "This switchblade has a unique shape that makes it especially lethal when lodged in someone's backside. \
			Still does a moderate amount of damage when applied from the front."
	item = /obj/item/switchblade/backstab
	cost = 4

/datum/uplink_item/dangerous/beesword
	name = "The Stinger"
	desc = "A sword provided to high-ranking staff of the Bee Liberation Front and often seen as it's 'pride and joy'. \
			The sword has a 20% chance to block attacks, has high armor penetration and applies 6 units of Histamine on hit. \
			Small enough to fit within a backpack."
	item = /obj/item/melee/beelibsword
	progression_minimum = 15 MINUTES
	surplus = 30
	cost = 7

/datum/uplink_item/dangerous/trident
	name = "Electrified Trident"
	desc = "A trident rumored to have been recovered from the city of atlantis. \
			It deals moderate damage, and twice as much if thrown. Targets attacked by \
			this weapon will have teslium manifested within their blood, leading to electrical shocks."
	item = /obj/item/trident/electrified
	progression_minimum = 25 MINUTES
	surplus = 20
	cost = 9

/datum/uplink_item/dangerous/bostaff
	name = "Bo Staff"
	desc = "A wielded wooden staff that can be used to incapacitate opponents if you dont intent to harm them. This often results in knocking your targets unconscious for a brief period of time."
	item = /obj/item/melee/bostaff
	cost = 8

/datum/uplink_item/dangerous/katana
	name = "Katana"
	desc = "A brilliantly made katana capable of major damage against pretty much anyone. Has high damage, blocking ability, and inflicts wounds easily. \
			Doesn't do anything special other than kill, for when you just want to get the job done. Not easily concealable."
	item = /obj/item/katana
	progression_minimum = 25 MINUTES
	surplus = 25
	cost = 10

/datum/uplink_item/dangerous/vxtvulhammer
	name = "Vxtvul Hammer"
	desc = "A relic sledgehammer with charge packs wired to two blast pads on its head. \
			While wielded in two hands, the user can charge a massive blow that will shatter construction, \
			hurl bodies, and demolish mechs. Not easily concealable."
	item = /obj/item/melee/vxtvulhammer
	progression_minimum = 30 MINUTES
	surplus = 25
	cost = 12

/datum/uplink_item/dangerous/espear
	name = "Energy Spear"
	desc = "A spear fashioned from iron and titanium, it incorporates hardlight technology to form the pointy-end. \
			Turns on when wielded, and makes no noise when doing so. More effective against all targets than our energy swords and possesses high armor-piercing. \
			Deals nearby double it's damage when thrown and our hardlight technology will ensure the spear remains embedded. \
			Not easily concealable. Has high durability but will eventually break."
	item = /obj/item/spear/energy/red
	progression_minimum = 30 MINUTES
	surplus = 20
	cost = 10

/datum/uplink_item/dangerous/echainsaw
	name = "Energy Chainsaw"
	desc = "A 'Champions-of-Evil' branded chainsaw utilizing hardlight technology for it's countless razor-like blades. \
			Excellent for demolishing structures and ripping (and tearing) your foes apart! \
			Deals significantly high damage, though it's difficult to conceal and lumber around. \
			Excellent when used with one of our Anti-Drop implants."
	item = /obj/item/chainsaw/energy
	progression_minimum = 30 MINUTES
	surplus = 0
	cost = 15

/datum/uplink_item/dangerous/m1911pistol
	name = "M1911"
	desc = "A single M1911 Pistol that fires .45 bullets. Loaded with 9 lethal shots."
	item = /obj/item/gun/ballistic/automatic/pistol/m1911
	cost = 6
	surplus = 45
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/dangerous/viper
	name = "Viper"
	desc = "A single Viper Pistol that fires 10mm bullets. Loaded with 9 lethal shots. \
			This pistol fires quickly and is fully-automatic."
	item = /obj/item/gun/ballistic/automatic/pistol/viper
	cost = 8
	surplus = 50
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/dangerous/normalrevolver
	name = ".357 Revolver"
	desc = "A modernized, .357 revolver. Grown straight from our gatfruit farms. Fires 7 brutal rounds of .357 magnum. \
			Less obvious than our upgraded revolvers, for plausible deniability."
	item = /obj/item/gun/ballistic/revolver
	cost = 9
	surplus = 70
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/dangerous/python
	name = "Python"
	desc = "A single Python Revolver that fires .357 magnum bullets. Loaded with 9 lethal .357 magnum shots."
	item = /obj/item/gun/ballistic/revolver/python
	cost = 11
	surplus = 50
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/dangerous/deagle
	name = "Desert Eagle"
	desc = "A high-power Desert Eagle that fires .50 AE bullets. Loaded with 8 highly lethal shots. \
			Additional ammunition can be purchased under the ammunition tab."
	item = /obj/item/gun/ballistic/automatic/pistol/deagle
	cost = 10
	surplus = 45
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/dangerous/fireyaxe
	name = "Fire-y Axe"
	desc = "A classic fire axe that's been augmented with advanced atmospheric incendiary technology. \
			In addition to being a fireaxe, it'll light your victims ablaze with every hit."
	item = /obj/item/fireaxe/firey
	progression_minimum = 30 MINUTES
	cost = 10
	surplus = 25
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/dangerous/energy_fire_axe
	name = "Energy Fire Axe"
	desc = "A terrifying axe with a blade of pure energy, able to tear down structures with ease. \
			Easier to store than a standard fire axe while inactive. Has high blocking ability and armor penetration while active."
	item = /obj/item/fireaxe/energy
	progression_minimum = 30 MINUTES
	cost = 14
	surplus = 0
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/dangerous/syndikammerer
	name = "Syndicate Kammerer"
	desc = "A shotgun that doesn't need to have it's pump racked to switch to the next shell, can have 8 shells loaded at any time. \
			It'll be loaded with lethal shells upon purchase."
	item = /obj/item/gun/ballistic/shotgun/automatic/combat/kammerer/syndicate
	cost = 9
	surplus = 35
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/dangerous/boltactionrifle
	name = "Bolt-Action Rifle"
	desc = "A shoddy bolt action rifle, it has 5 lethal 7.62 rounds loaded. It's handling is rather obnoxious and should only be used if you're on a budget."
	item = /obj/item/gun/ballistic/rifle
	cost = 3
	surplus = 60
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/dangerous/watergun
	name = "Extended Capacity Hyper-Soaker"
	desc = "A simple yet effective way of applying chemicals to a target's skin. \
			Comes with a high-power nozzle and larger tank. You'll have to provide your own chemicals, though."
	item = /obj/item/gun/water/syndicate
	cost = 3
	surplus = 10

/datum/uplink_item/dangerous/tommygun
	name = "Tommy Gun"
	desc = "A functional tommy gun loaded with 50 .45 bullets. It's very much a 'spray-and-pray' kind-of weapon. \
			Fully automatic. Not easily concealable."
	item = /obj/item/gun/ballistic/automatic/tommygun
	progression_minimum = 25 MINUTES
	cost = 15
	surplus = 25
	purchasable_from = UPLINK_SERIOUS_OPS

/datum/uplink_item/dangerous/akm
	name = "AKM Assault Rifle"
	desc = "A functional AKM Assault Rifle loaded with 30 7.12x82mm bullets. It's exceptional in combat and often reliable in taking down all kinds of opposition. \
			Always fires in a three-round burst. High spread."
	item = /obj/item/gun/ballistic/automatic/akm
	progression_minimum = 20 MINUTES
	cost = 13
	surplus = 20
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/dangerous/flamethrower_bundle
	name = "Flamethrower"
	desc = "A box utilizing bluespace technology, it contains all of the equipment usually found within an incendiary weapons crate. \
			Contains exactly: One flamethrower, three plasma tanks, three incendiary chemical grenades."
	item = /obj/item/storage/box/syndie_kit/flamethrower_bundle
	cost = 8
	surplus = 35
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/dangerous/augmenteddisabler
	name = "Energy Pistol"
	desc = "An energy pistol we've designed to look identical to that of a NT-brand disabler. It's capable of firing both lethal and disabling shots. \
			Recharges automatically."
	item = /obj/item/gun/energy/disabler/syndicate
	cost = 7
	surplus = 25
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/dangerous/infernopistol
	name = "Inferno Pistol"
	desc = "A modified handcannon with a metamorphic reserve of decommissioned weaponized nanites. \
			Shoots shards of molten nanites that cause cold targets to explode. \
			This version has been modified to recharge automatically."
	item = /obj/item/gun/energy/laser/thermal/inferno/syndicate
	cost = 7
	surplus = 30
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/dangerous/cyrogenicpistol
	name = "Cryogenic Pistol"
	desc = "A modified handcannon with a metamorphic reserve of decommissioned weaponized nanites. \
			Shoots shards of freezing nanites that deal extra damage to hot targets, and will knock them prone. \
			This version has been modified to recharge automatically."
	item = /obj/item/gun/energy/laser/thermal/cryo/syndicate
	cost = 7
	surplus = 30
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/dangerous/chemsprayer
	name = "Chemical Sprayer"
	desc = "A chemical sprayer? More like a chemical cannon, this 'sprayer' shoots 30 units to 50 units of it's contents forward for up to 5 meters ahead. \
			The sprayer comes loaded with 100u's of: Sodium Thiopental, Coniine, Venom, Condensed Capsaicin, Initropidril, and Polonium. \
			The sprayer slowly generates it's chemicals using redspace technology."
	item = /obj/item/reagent_containers/spray/chemsprayer/syndicate
	surplus = 20
	cost = 16

/datum/uplink_item/dangerous/syndielaserrifle
	name = "Syndicate Energy Rifle"
	desc = "A laser rifle originally manufactured by Nanotrasen, we've augmented the rifle to recharge automatically. \
			Can still be recharged normally. Only fires lethal shots."
	item = /obj/item/gun/energy/syndicatelaserrifle
	surplus = 10
	cost = 14
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/dangerous/demolecularisor
	name = "Biological Demolecularisor"
	desc = "A gun that discharges high amounts of controlled radiation to slowly break a target into component elements. Deals small amounts of toxin damage per shot and may irradiate targets. Recharges automatically but very slowly."
	item = /obj/item/gun/energy/decloner/syndicate
	surplus = 8
	cost = 10
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/dangerous/mindflayer
	name = "Mind Flayer"
	desc = "A weapon originally created by a alien species shrouded in mystery. It fires energy shots that severely damage the target's nervous system and wreck havok upon the target's brain. \
			Also causes oxygen deprivation in the target. Recharges automatically but very slowly."
	item = /obj/item/gun/energy/mindflayer/syndicate
	surplus = 5
	cost = 19
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/dangerous/gravitygun
	name = "Bluespace-Gravitational Manipulator"
	desc = "An experimental, multi-mode device that fires bolts of Zero-Point Energy, causing local distortions in gravity. \
			Has a very slow firerate, and three methods of gravity manipulation including Repulse, Attract, and Chaos."
	item = /obj/item/gun/energy/gravity_gun/withcore
	surplus = 10
	cost = 2

/datum/uplink_item/dangerous/harpoongun
	name = "Ballistic Harpoon Gun"
	desc = "A weapon favored by carp hunters, and infamously used by agents of the Animal Rights Consortium against human aggressors. \
			This speargun fires devastating harpoons which deal high amounts of damage and causes quite a lot of bleeding in the target. \
			Comes loaded with one harpoon. Ammunition can be purchased in bulk under the ammunition tab."
	item = /obj/item/gun/ballistic/rifle/boltaction/harpoon
	surplus = 15
	cost = 14
