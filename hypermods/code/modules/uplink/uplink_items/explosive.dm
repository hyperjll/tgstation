/datum/uplink_item/explosives/grenadepenguin
	name = "Grenade Penguin"
	desc = "A grenade that takes the form of an aggressive penguin that explodes upon death. \
			The Penguin ignores nuclear operatives, but cannot recognize undercover agents. \
			The grenade has a small, but lethal blast range. Best used with an escape route in mind."
	item = /obj/item/sbeacondrop/grenadepenguin
	progression_minimum = 20 MINUTES
	cost = 4
	surplus = 15

/datum/uplink_item/explosives/diseasegrenade
	name = "Diseased Grenade"
	desc = "A chemical foam grenade loaded with a payload capable of causing mass-plagues. \
			Those who touch the foam will develop a random advanced disease. Wear protection before use."
	item = /obj/item/grenade/chem_grenade/randomdisease
	progression_minimum = 10 MINUTES
	cost = 2
	surplus = 10

/datum/uplink_item/explosives/explosivepen
	name = "Explosive Pen"
	desc = "A normal black pen, it's been filled with explosives. Has a 5 second timer, and is completely silent when being armed. \
			The explosion is TINY but extremely powerful."
	item = /obj/item/storage/box/itempack/bombpen
	cost = 1
	surplus = 60
	progression_minimum = 10 MINUTES
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/explosives/molotovs
	name = "Box of Molotovs"
	desc = "A box containing 8 homemade molotovs with each one containing a different flammable reagent. \
			Often useful for area denial. Comes with a lighter."
	item = /obj/item/storage/box/syndie_kit/molotovs
	cost = 1
	surplus = 30

/datum/uplink_item/explosives/grenadierbelt
	name = "Grenadier Belt"
	desc = "A belt fully equipped with a plethora of dangerous explosive devices for mass-destruction and mayhem."
	item = /obj/item/storage/belt/grenade/full
	surplus = 1
	cost = 20
	progression_minimum = 30 MINUTES
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/explosives/bioterrorfoam
	name = "Bioterror Foam Grenade"
	desc = "A powerful chemical foam grenade which creates a deadly torrent of foam that will mute, blind, confuse, \
			mutate, and irritate carbon lifeforms. Specially brewed by Tiger Cooperative chemical weapons specialists \
			using additional spore toxin. Ensure suit is sealed before use."
	item = /obj/item/grenade/chem_grenade/bioterrorfoam
	cost = 4
	surplus = 35
	progression_minimum = 10 MINUTES

/datum/uplink_item/explosives/saxitoxinnade
	name = "Saxitoxin Grenade"
	desc = "A smoke grenade containing Saxitoxin, a toxin capable of causing \
			brain damage, burn damage, AND toxin damage simultaneously to those who breathe it."
	item = /obj/item/grenade/chem_grenade/saxitoxin
	cost = 5
	surplus = 40
	purchasable_from = UPLINK_SERIOUS_OPS

/datum/uplink_item/explosives/shrapnelgrenademega
	name = "FRAGmentation Grenade"
	desc = "A singular FRAGmentation Grenade. Anything adjacent when it explodes will likely get shredded to atoms. VERY Likely to kill anyone nearby. Has no additional explosive power."
	item = /obj/item/grenade/frag/mega
	cost = 3
	surplus = 40
	progression_minimum = 30 MINUTES
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/explosives/banananade
	name = "Banana Grenade"
	desc = "A singular Banana Grenade. Temporarily blinds those nearby without eye protection, and shoots banana peels everywhere nearby. \
			Useful for gaining distance from would-be pursuers."
	item = /obj/item/grenade/spawnergrenade/bananapeel
	cost = 1
	surplus = 0
	purchasable_from = ~(UPLINK_SPY | UPLINK_SERIOUS_OPS)

/datum/uplink_item/explosives/rotfragnade
	name = "ROTFrag Grenade"
	desc = "A singular ROTFrag Grenade. After priming, shake rapidly in hand to increase it's shrapnel potential, then throw."
	item = /obj/item/grenade/primer
	cost = 3
	surplus = 20
	progression_minimum = 25 MINUTES
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/explosives/spesscarp
	name = "Space Carp Grenade"
	desc = "A grenade that when detonated, will release 5 space carps into the immediate vicinity. No hydration required!"
	item = /obj/item/grenade/spawnergrenade/spesscarp
	cost = 6
	surplus = 10
	progression_minimum = 5 MINUTES

/datum/uplink_item/explosives/flashbangs
	name = "Flashbangs"
	desc = "A pouch containing approximately 5 Flashbangs. Causes temporary blindness and deafness in those nearby who are unprotected. \
			Capable of leaving many station personnel in your kind, and of-so-loving hands."
	item = /obj/item/ammo_box/nadepouch/flashbang
	cost = 2
	surplus = 50

/datum/uplink_item/explosives/firecrackers
	name = "Firecrackers"
	desc = "A pouch containing approximately 10 Firecrackers. Not super powerful, but are great for area denial. \
			Doesn't come with a lighter."
	item = /obj/item/ammo_box/nadepouch/firecracker
	cost = 2
	surplus = 30

/datum/uplink_item/explosives/stingbangs
	name = "Stingbangs"
	desc = "A pouch containing approximately 5 Stingbangs. Useful for subdueing unarmored targets, or those who'd normally be resistant to flashbangs."
	item = /obj/item/ammo_box/nadepouch/stingbang
	cost = 4
	surplus = 40

/datum/uplink_item/explosives/mirages
	name = "Mirage Grenades"
	desc = "A pouch containing approximately 5 Mirage Grenades. After exploding, these mirage grenades will temporarily project your form where they were thrown. \
			Useful for confusing people or throwing idiotic security personnel off your trail."
	item = /obj/item/ammo_box/nadepouch/mirage
	cost = 3
	surplus = 30

/datum/uplink_item/explosives/shrapnelgrenades
	name = "Fragmentation Grenades"
	desc = "A pouch containing approximately 5 Fragmentation Grenades. Anything adjacent when it explodes will be heavily damaged. Likely to kill anyone nearby."
	item = /obj/item/ammo_box/nadepouch/frag
	cost = 7
	surplus = 40
	progression_minimum = 10 MINUTES
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/explosives/gluongrenades
	name = "Gluon Grenades"
	desc = "A pouch containing approximately 5 Gluon Grenades, an advanced grenade that releases a harmful stream of gluons inducing radiation in those nearby. \
			These gluon streams will also make victims feel exhausted, and induce shivering. This extreme coldness will also likely wet any nearby floors."
	item = /obj/item/ammo_box/nadepouch/gluon
	cost = 4
	surplus = 25
	progression_minimum = 10 MINUTES

/datum/uplink_item/explosives/concussgrenades
	name = "Concussion Grenades"
	desc = "A pouch containing approximately 5 Concussion Grenades. These grenades repulse everything around them away with extremely strong force. \
			Leaves both organic and silicon lifeforms stunned for an extended period of time."
	item = /obj/item/ammo_box/nadepouch/concussion
	cost = 5
	surplus = 40
	purchasable_from = UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/explosives/incengrenades
	name = "Incendiary Grenades"
	desc = "A pouch containing approximately 5 Incendiary Grenades. These grenades are capable of flooding rooms with fire quickly and can be difficult to extinguish."
	item = /obj/item/ammo_box/nadepouch/incendiary
	cost = 4
	surplus = 30
	purchasable_from = ~UPLINK_CLOWN_OPS
	progression_minimum = 10 MINUTES

/datum/uplink_item/explosives/sonicgrenades
	name = "Sonic Grenades"
	desc = "A pouch containing approximately 5 Sonic Grenades. These grenades are capable of incapacitating both carbon-based and silicon-based lifeforms. \
			The extremely loud screeching sound emitted will damage the ears and temporarily stun and confuse all nearby. Ear-protection won't protect you or them."
	item = /obj/item/ammo_box/nadepouch/sonic
	cost = 6
	surplus = 20

/datum/uplink_item/explosives/antigravity
	name = "Anti-Gravity Grenades"
	desc = "A pouch containing 6 whole Anti-Gravity Grenades, when detonated they will release a payload capable of distorting the fabric of space-time, causing the 20-tile area nearby to be unfit for gravity stabilization for the next 60 seconds. \
			The anti-gravity effect can be blocked by obstacles and barely makes it past airlocks, most effective in open areas."
	item = /obj/item/ammo_box/nadepouch/antigrav
	cost = 2
	surplus = 40

/datum/uplink_item/explosives/radbombs
	name = "Radiation Bombs"
	desc = "A pouch containing approximately 5 Radiation Grenades. For when you just want to watch the world burn slowly. \
			Causes a smoke cloud which irradiates targets within it and invokes random mutations."
	item = /obj/item/ammo_box/nadepouch/rads
	cost = 4
	surplus = 30
	purchasable_from = ~UPLINK_CLOWN_OPS
	progression_minimum = 10 MINUTES

/datum/uplink_item/explosives/acidfoamnades
	name = "Highly-Acidic Grenades"
	desc = "A pouch containing approximately 5 Highly-Acidic Foam Grenades. Especially effective against security officers who are now donning security modsuits."
	item = /obj/item/ammo_box/nadepouch/highacidfoam
	cost = 5
	surplus = 30
	purchasable_from = ~UPLINK_CLOWN_OPS
	progression_minimum = 15 MINUTES

/datum/uplink_item/explosives/eyebreakersmoke
	name = "Eyebreaker Smokebombs"
	desc = "A pouch containing 5 chemical grenades, housing smoke laced with a unique reagent known for destroying the eyes of those it's exposed too."
	item = /obj/item/ammo_box/nadepouch/eyebreak
	cost = 4
	surplus = 40
	progression_minimum = 10 MINUTES

/datum/uplink_item/explosives/supermatternades
	name = "Supermatter Grenades"
	desc = "A pouch containing 5 specialized gravitational grenades, has a 3 second timer before anything happens. \
			The grenade will suck in nearby objects and people for a short time before exploding. \
			The explosion itself is relatively weak but still destructive."
	item = /obj/item/ammo_box/nadepouch/sm
	cost = 7
	surplus = 35
	purchasable_from = ~UPLINK_CLOWN_OPS
	progression_minimum = 20 MINUTES

/datum/uplink_item/explosives/whiteholenades
	name = "Whitehole Grenades"
	desc = "A pouch containing 5 specialized gravitational grenades, has a 3 second timer before anything happens. \
			The grenade will occasionally repulse anything and anyone nearby away from it before violently exploding. \
			Due to the grenades' effects, this explosive will fling itself around making it difficult to dispose of and use precisely. \
			The explosion is quite major, but can be used reasonably if you don't intend to harm anyone."
	item = /obj/item/ammo_box/nadepouch/wh
	cost = 7
	surplus = 35
	purchasable_from = ~UPLINK_CLOWN_OPS
	progression_minimum = 20 MINUTES

/datum/uplink_item/explosives/hellgrenades
	name = "Hellfoam Grenades"
	desc = "A pouch containing approximately 5 Hellfoam Grenades. Perfect for clearing large areas of both station AND personnel."
	item = /obj/item/ammo_box/nadepouch/clf3
	limited_stock = 1
	cost = 10
	surplus = 6
	purchasable_from = ~(UPLINK_CLOWN_OPS | UPLINK_SPY)
	progression_minimum = 20 MINUTES

/datum/uplink_item/explosives/clusterclf3
	name = "The Hell-Bomb Cluster"
	desc = "A cluster bomb containing more clf3 foam than you can imagine, with just one of these you'll turn a massive area of the station into lava. Be sure to give a heads-up to your fellow operatives to seek shelter before using this."
	item = /obj/item/grenade/clusterbuster/clf3
	cost = 20
	surplus = 3
	purchasable_from = UPLINK_SERIOUS_OPS

/datum/uplink_item/explosives/clusterminibombs
	name = "Syndicate Minibomb Cluster"
	desc = "A cluster bomb containing more minibombs than you can poke a stick at. Leaves a massive hole whenever it's used, and will likely leave everyone caught in the fray gibbed or helpless."
	item = /obj/item/grenade/clusterbuster/syndieminibomb
	cost = 15
	surplus = 3
	purchasable_from = UPLINK_SERIOUS_OPS

/datum/uplink_item/explosives/clusterspesscarp
	name = "Space Carp Army"
	desc = "A cluster bomb containing an over-abundance of space carp payloads. Throw and run to ensure your army doesn't turn against you."
	item = /obj/item/grenade/clusterbuster/spawner_spesscarp
	cost = 15
	surplus = 3
	purchasable_from = UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/explosives/clusteremp
	name = "EMP Clusterbomb"
	desc = "A cluster bomb containing more emp grenades than is frankly necessary. Leading to a massive emp black-out of most electrical equipment."
	item = /obj/item/grenade/clusterbuster/emp
	cost = 10
	surplus = 3
	purchasable_from = UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/explosives/clustermanhacks
	name = "Vicserator Clusterbomb"
	desc = "A cluster bomb packed to the brim with vicserator delivery grenades. The moment you prime this thing you'll know: This is gonna be a night to remember."
	item = /obj/item/grenade/clusterbuster/spawner_manhacks
	cost = 20
	surplus = 3
	purchasable_from = UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/explosives/clusteracid
	name = "Acidic Clusterbomb"
	desc = "A cluster bomb containing far more acid grenades than any sane person would think is okay. Perfect for leaving groups of armored opponents helpless or dead, and for leaving a large area dangerous to walk over."
	item = /obj/item/grenade/clusterbuster/facid
	cost = 8
	surplus = 3
	purchasable_from = UPLINK_SERIOUS_OPS

/datum/uplink_item/explosives/clusterfire
	name = "Inferno Clusterbomb"
	desc = "A cluster bomb containing a frankly absurd amount of incendiary equipment. Will likely leave the area and the next flooded with fire."
	item = /obj/item/grenade/clusterbuster/inferno
	cost = 10
	surplus = 3
	purchasable_from = UPLINK_SERIOUS_OPS

/datum/uplink_item/explosives/clustersmoke
	name = "Smoke Clusterbomb"
	desc = "A cluster bomb containing an abundance of smoke bombs. For when you want to clear a room or escape it."
	item = /obj/item/grenade/clusterbuster/smoke
	cost = 1
	surplus = 15

/datum/uplink_item/explosives/clustermetalfoam
	name = "Metal Foam Clusterbomb"
	desc = "A cluster bomb containing an abundance of metal foam grenades. Perfect for causing a massive disturbance."
	item = /obj/item/grenade/clusterbuster/metalfoam
	cost = 2
	surplus = 10
	progression_minimum = 10 MINUTES
