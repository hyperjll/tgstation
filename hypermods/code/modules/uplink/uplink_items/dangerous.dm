/datum/uplink_item/dangerous/throwingknives
	name = "Throwing Knives"
	desc = "Exceptionally lethal throwing knives, they perfectly embed into your foes without much \
			difficulty. Don't rely upon these or your victims will prepare to catch and use these knives."
	item = /obj/item/storage/box/syndie_kit/throwingknives
	cost = 5

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

/datum/uplink_item/dangerous/fisher // Normally only available in a special kit, fuck that, this thing's cool as shit.
	name = "Ansem/SC pistol"
	desc = "A modified variant of the Ansem, spiritual successor to the \
			Makarov, featuring an integral suppressor and push-button \
			trigger on the grip for an underbarrel-mounted disruptor, \
			similar in operation to the standalone SC/FISHER. \
			Chambered in 10mm."
	item = /obj/item/gun/ballistic/automatic/pistol/clandestine/fisher
	cost = 11
	surplus = 20
	//purchasable_from = ~UPLINK_ALL_SYNDIE_OPS // Eh, i'll allow it.

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
	desc = "A single Python Revolver that fires .357 magnum bullets. Loaded with 9 lethal Heartpiercer .357 magnum shots."
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

/datum/uplink_item/dangerous/sniper_rifle
	name = "Anti-Materiel Sniper Rifle"
	desc = "A boltaction anti-materiel rifle, utilizing .50 BMG cartridges. While technically outdated in modern arms markets, it still works exceptionally well as \
			an anti-personnel rifle. It is also able to be suppressed....somehow."
	item = /obj/item/gun/ballistic/rifle/sniper_rifle
	cost = 12
	surplus = 25
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

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

/datum/uplink_item/dangerous/toxinreagentgun
	name = "Toxin Reagent Gun"
	desc = "A wonder of Syndicate engineering, this reagent gun does little damage on impact, but it will inject a compound of many toxic chemicals. \
			It's filled with a 400u concoction specifically designed to incapacitate and likely kill your targets. \
			The gun shoots 40u each shot, and will generate it's toxins slowly thanks to redspace technology. Synthesises syringes automatically."
	item = /obj/item/gun/toxicreagentgun
	cost = 20
	surplus = 10
	purchasable_from = ~UPLINK_SPY // for the best

/datum/uplink_item/dangerous/explosivereagentgun
	name = "Explosive Reagent Gun"
	desc = "Operatives beware: This is perhaps the most evil weapon we've ever concieved. \
			This reagent gun fires piercing syringes filled with a concoction of pyrotechnical chemicals. \
			Those who recieve the chemicals turn into living fireballs, and then explode violently. \
			Can only store one dose and one syringe at a time. Refills both chemicals and syringes automatically."
	item = /obj/item/gun/explosivereagentgun
	surplus = 0
	cost = 40
	cant_discount = TRUE
	purchasable_from = ~UPLINK_SPY // for the best
