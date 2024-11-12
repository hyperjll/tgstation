/** // Preventing this category from being made prevents people from buying via uplink, but not from surplus crates.
/datum/uplink_category/surplusonly
	name = "Surplus Only"
	weight = -99
**/
/datum/uplink_item/surplusonly
	//category = /datum/uplink_category/surplusonly
	surplus = 10
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	cant_discount = TRUE


/datum/uplink_item/surplusonly/chinalake
	name = "China Lake"
	desc = "A beautifully made grenade launcher capable of firing high-end explosive grenades for maximum carnage. \
			Comes loaded with 6 Blast Grenades"
	item = /obj/item/gun/ballistic/chinalake/unrestricted
	cost = 16

/datum/uplink_item/surplusonly/fireaxe
	name = "Fire Axe"
	desc = "A modernized fire axe, capable of destroying windows and airlocks with ease. \
			Also great for hacking people to bits."
	item = /obj/item/fireaxe
	cost = 8
	surplus = 20

/datum/uplink_item/surplusonly/gunpowder
	name = "Gunpowder Barrel"
	desc = "A wooden barrel containing 500 units of gunpowder. If you know, you know."
	item = /obj/structure/fermenting_barrel/gunpowder // 500 units of gunpowder
	cost = 5
	surplus = 20

/datum/uplink_item/surplusonly/flareguncase
	name = "Flare Gun"
	desc = "A case containing a single flare gun, and some spare ammunition."
	item = /obj/item/storage/toolbox/guncase/flaregun
	cost = 5
	surplus = 70

/datum/uplink_item/surplusonly/syndidagger
	name = "Syndicate Dagger"
	desc = "An incredibly rare dagger which deals moderate damage, but it deals triple damage vs. syndicate agents. \
			It doesn't work if used by a regular person."
	item = /obj/item/melee/syndidagger
	cost = 3
	surplus = 50

/datum/uplink_item/surplusonly/orion
	name = "Orion .22 Silenced Pistol"
	desc = "An incredibly rare silenced pistol equipped with an internal ammo synthesizer, fires .22 caseless rounds."
	item = /obj/item/gun/energy/orion
	cost = 8
	surplus = 40

/datum/uplink_item/surplusonly/kestral
	name = "Kestral Revolver Case"
	desc = "An incredibly rare revolver which fires both .357 and .38 rounds without backfiring. \
			Comes with two speedloaders for each ammo type."
	item = /obj/item/storage/toolbox/guncase/kestral
	cost = 13
	surplus = 40

/datum/uplink_item/surplusonly/spes
	name = "SPES-12 Shotgun Case"
	desc = "An expensive imported combat shotgun with a rather... iconic(?) look to it. \
			Comes with a box of buckshot."
	item = /obj/item/storage/toolbox/guncase/spes
	cost = 13
	surplus = 40

/datum/uplink_item/surplusonly/saxitoxinnade
	name = "Saxitoxin Grenade"
	desc = "A smoke grenade containing Saxitoxin, a toxin capable of causing \
			brain damage, burn damage, AND toxin damage simultaneously to those who breathe it."
	item = /obj/item/grenade/chem_grenade/saxitoxin
	cost = 5
	surplus = 50

/datum/uplink_item/surplusonly/bananapeelpouch
	name = "Pouch of Banana Peel Grenades"
	desc = "A pouch containing 5 grenades which when detonated, will spew a pile of banana peels."
	item = /obj/item/ammo_box/nadepouch/bananapeel
	cost = 3
	surplus = 80

/datum/uplink_item/surplusonly/quickhack
	name = "Quickhack"
	desc = "A highly illegal, disposable device that can fake an AI's 'open' signal to a door ten times before self-destructing."
	item = /obj/item/quickhack
	cost = 2 // Like an airlock card, but worse.
	surplus = 40

/datum/uplink_item/surplusonly/plasma_gun
	name = "Plasma Rifle"
	desc = "An advanced bullpup energy rifle equipped with an internal cell charging mechanism. \
			It's identical to a regular laser gun in terms of overall firepower."
	item = /obj/item/gun/energy/plasma_gun
	cost = 11 // Like the antique laser gun, but worse.
	surplus = 30

/datum/uplink_item/surplusonly/breaching
	name = "Breaching Charge"
	desc = "A self-contained explosive breaching charge, useful for destroying walls."
	item = /obj/item/grenade/c4/breaching
	cost = 1 // Like c4, but worse.
	surplus = 100 // Will always be considered when getting a surplus crate.

/datum/uplink_item/surplusonly/hunting_rifle
	name = "Old Hunting Rifle"
	desc = "The Kittiwake from Cormorant Precision Arms, a classic high-powered hunting and police rifle, reliable in almost any environment. Comes with a scope."
	item = /obj/item/gun/ballistic/rifle/hunting_rifle
	cost = 4 // Like the surplus rifle, but better?
	surplus = 30

/datum/uplink_item/surplusonly/beartraps
	name = "Pouch of Bear Traps"
	desc = "A pouch containing five bear traps. Useful at delaying your pursuers."
	item = /obj/item/ammo_box/nadepouch/beartraps
	cost = 6
	surplus = 30

/datum/uplink_item/surplusonly/syndicommand
	name = "Syndicate Command Armor"
	desc = "An out-of-date hardsuit once given to Syndicate Command officers as part of their uniform. \
			This particular design seems a bit... otherworldly?"
	item = /obj/item/clothing/suit/hooded/syndicommand
	cost = 8
	surplus = 20
