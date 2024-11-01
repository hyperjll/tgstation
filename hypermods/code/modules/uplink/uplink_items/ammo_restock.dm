/datum/uplink_category/ammo_restock
	name = "Ammunition Restock"
	weight = 20

/datum/uplink_item/ammo_restock
	category = /datum/uplink_category/ammo_restock
	surplus = 40


/datum/uplink_item/ammo_restock/toydarts
	name = "Box of Riot Darts"
	desc = "A box of 40 Donksoft riot darts, for reloading any compatible foam dart magazine. Don't forget to share!"
	item = /obj/item/ammo_box/foambox/riot
	cost = 2
	surplus = 0
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND
	purchasable_from = ~UPLINK_SERIOUS_OPS

/datum/uplink_item/ammo_restock/ammo9mmbox
	name = "Box of 9mm Rounds"
	desc = "An ammo box filled with 9mm rounds, used for restocking 9mm magazines. Contains 30 10mm bullets."
	item = /obj/item/ammo_box/c9mm
	cost = 2
	surplus = 0
	purchasable_from = ~UPLINK_CLOWN_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo9mmboxmega
	name = "Mega Box of 9mm Rounds"
	desc = "An ammo box filled with 9mm rounds, used for restocking 9mm magazines. Contains 60 10mm bullets."
	item = /obj/item/ammo_box/c9mm/sixty
	cost = 4
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo10mmbox
	name = "Box of 10mm Rounds"
	desc = "An ammo box filled with 10mm rounds, used for restocking 10mm magazines. Contains 20 10mm bullets."
	item = /obj/item/ammo_box/c10mm
	cost = 1
	surplus = 0
	purchasable_from = ~UPLINK_CLOWN_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo10mmboxcaseless
	name = "Box of 10mm Caseless Rounds"
	desc = "An ammo box filled with 10mm Caseless rounds, used for restocking 10mm magazines. Contains 20 10mm Caseless bullets."
	item = /obj/item/ammo_box/c10mm/cs
	cost = 2
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo10mmboxtranq
	name = "Box of 10mm Soporific Rounds"
	desc = "An ammo box filled with 10mm Soporific rounds, used for restocking 10mm magazines. Contains 20 10mm Soporific bullets."
	item = /obj/item/ammo_box/c10mm/sp
	cost = 2
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo10mmboxap
	name = "Box of 10mm AP Rounds"
	desc = "An ammo box filled with 10mm AP rounds, used for restocking 10mm magazines. Contains 20 10mm AP bullets."
	item = /obj/item/ammo_box/c10mm/ap
	cost = 3
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo10mmboxhp
	name = "Box of 10mm HP Rounds"
	desc = "An ammo box filled with 10mm HP rounds, used for restocking 10mm magazines. Contains 20 10mm HP bullets."
	item = /obj/item/ammo_box/c10mm/hp
	cost = 2
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo10mmboxincendiary
	name = "Box of 10mm Incendiary Rounds"
	desc = "An ammo box filled with 10mm Incendiary rounds, used for restocking 10mm magazines. Contains 20 10mm Incendiary bullets."
	item = /obj/item/ammo_box/c10mm/inc
	cost = 2
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo10mmboxemp
	name = "Box of 10mm EMP Rounds"
	desc = "An ammo box filled with 10mm EMP rounds, used for restocking 10mm magazines. Contains 20 10mm EMP bullets."
	item = /obj/item/ammo_box/c10mm/emp
	cost = 2
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo10mmboxmega
	name = "Mega Box of 10mm Rounds"
	desc = "An ammo box filled with 10mm rounds, used for restocking 10mm magazines. Contains 50 10mm bullets."
	item = /obj/item/ammo_box/c10mm/fifty
	cost = 3
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo357box
	name = "Box of .357 Rounds"
	desc = "An ammo box filled with .357 rounds, used for restocking .357 speedloaders. Contains 20 .357 rounds."
	item = /obj/item/ammo_box/a357/no_direct
	cost = 8
	surplus = 0
	purchasable_from = ~UPLINK_CLOWN_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo357boxironfeather
	name = "Box of Ironfeather .357 Rounds"
	desc = "An ammo box filled with .357 Ironfeather rounds, used for restocking .357 speedloaders. Contains 20 .357 Ironfeather rounds. \
			These rounds contain six pellets which are less damaging than buckshot but mildly better over range."
	item = /obj/item/ammo_box/a357/no_direct/ironfeather
	cost = 8
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo357boxnutcracker
	name = "Box of Nutcracker .357 Rounds"
	desc = "An ammo box filled with .357 Nutcracker rounds, used for restocking .357 speedloaders. Contains 20 .357 Nutcracker rounds."
	item = /obj/item/ammo_box/a357/no_direct/nutcracker
	cost = 8
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo357boxmetalshock
	name = "Box of Metalshock .357 Rounds"
	desc = "An ammo box filled with .357 Metalshock rounds, used for restocking .357 speedloaders. Contains 20 .357 Metalshock rounds."
	item = /obj/item/ammo_box/a357/no_direct/metalshock
	cost = 8
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo357boxheartpiercer
	name = "Box of Heartpiercer .357 Rounds"
	desc = "An ammo box filled with .357 Heartpiercer rounds, used for restocking .357 speedloaders. Contains 20 .357 Heartpiercer rounds."
	item = /obj/item/ammo_box/a357/no_direct/heartpiercer
	cost = 8
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo357boxwallstake
	name = "Box of Wallstake .357 Rounds"
	desc = "An ammo box filled with .357 Wallstake rounds, used for restocking .357 speedloaders. Contains 20 .357 Wallstake rounds."
	item = /obj/item/ammo_box/a357/no_direct/wallstake
	cost = 8
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo45box
	name = "Box of .45 Rounds"
	desc = "An ammo box filled with .45 rounds, used for restocking .45 magazines. Contains 30 .45 bullets."
	item = /obj/item/ammo_box/c45/thirty
	cost = 2
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo45boxcs
	name = "Box of .45 Caseless Rounds"
	desc = "An ammo box filled with .45 Caseless rounds, used for restocking .45 magazines. Contains 30 .45 Caseless bullets."
	item = /obj/item/ammo_box/c45/thirty/cs
	cost = 2
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo45boxsp
	name = "Box of .45 Soporific Rounds"
	desc = "An ammo box filled with .45 Soporific rounds, used for restocking .45 magazines. Contains 30 .45 Soporific bullets."
	item = /obj/item/ammo_box/c45/thirty/sp
	cost = 2
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo45boxap
	name = "Box of .45 Armor Piercing Rounds"
	desc = "An ammo box filled with .45 Armor Piercing rounds, used for restocking .45 magazines. Contains 30 .45 Armor Piercing bullets."
	item = /obj/item/ammo_box/c45/thirty/ap
	cost = 3
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo45boxhp
	name = "Box of .45 Hollow Point Rounds"
	desc = "An ammo box filled with .45 Hollow Point rounds, used for restocking .45 magazines. Contains 30 .45 Hollow Point bullets."
	item = /obj/item/ammo_box/c45/thirty/hp
	cost = 2
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo45boxinc
	name = "Box of .45 Incendiary Rounds"
	desc = "An ammo box filled with .45 Incendiary rounds, used for restocking .45 magazines. Contains 30 .45 Incendiary bullets."
	item = /obj/item/ammo_box/c45/thirty/inc
	cost = 2
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo45boxemp
	name = "Box of .45 EMP Rounds"
	desc = "An ammo box filled with .45 EMP rounds, used for restocking .45 magazines. Contains 30 .45 EMP bullets."
	item = /obj/item/ammo_box/c45/thirty/emp
	cost = 2
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo45boxvenom
	name = "Box of .45 Venom Rounds"
	desc = "An ammo box filled with .45 Venom rounds, used for restocking .45 magazines. Contains 30 .45 Venom bullets."
	item = /obj/item/ammo_box/c45/thirty/venom
	cost = 2
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo45boxmega
	name = "Mega Box of .45 Rounds"
	desc = "An ammo box filled with .45 rounds, used for restocking .45 magazines. Contains 50 .45 bullets."
	item = /obj/item/ammo_box/c45/fifty
	cost = 3
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo50box
	name = "Box of .50 AE Rounds"
	desc = "An ammo box filled with .50 AE rounds, used for restocking .50 AE magazines. Contains 20 .50 AE bullets."
	item = /obj/item/ammo_box/m50
	cost = 6
	surplus = 0
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo50boxmega
	name = "Mega Box of .50 AE Rounds"
	desc = "An ammo box filled with .50 AE rounds, used for restocking .50 AE magazines. Contains 50 .50 AE bullets."
	item = /obj/item/ammo_box/m50/fifty
	cost = 8
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo712box
	name = "Box of 7.12x82mm Rounds"
	desc = "An ammo box filled with 7.12x82mm rounds, used for restocking 7.12x82mm magazines. Contains 50 7.12x82mm bullets."
	item = /obj/item/ammo_box/n712x82
	cost = 5
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ammo712boxmega
	name = "Mega Box of 7.12x82mm Rounds"
	desc = "An ammo box filled with 7.12x82mm rounds, used for restocking 7.12x82mm magazines. Contains 100 7.12x82mm bullets."
	item = /obj/item/ammo_box/n712x82/hundred
	cost = 9
	surplus = 0
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/mysteryshells
	name = "Mystery Shells Box"
	desc = "A box containing 14 shells for a shotgun of unknown variety, are you feeling lucky? Shells of all kinds are included, including the more expensive ones."
	item = /obj/item/storage/box/mysteryshells/syndi
	cost = 2
	purchasable_from = ~UPLINK_CLOWN_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/lethalshells
	name = "Lethal Shells Box"
	desc = "A box containing 14 lethal shells for a shotgun."
	item = /obj/item/storage/box/lethalshot/syndi
	cost = 2
	purchasable_from = ~UPLINK_CLOWN_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/dartshells
	name = "Dart Shells Box"
	desc = "A box containing 14 dart shells for a shotgun, you'll have to inject the shells with your own chemicals though."
	item = /obj/item/storage/box/dartshells/syndi
	cost = 1
	purchasable_from = ~UPLINK_CLOWN_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/incendiaryshells
	name = "Incendiary Shells Box"
	desc = "A box containing 14 incendiary shells for a shotgun."
	item = /obj/item/storage/box/incendiaryshells/syndi
	cost = 1
	purchasable_from = ~UPLINK_CLOWN_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/dragonshells
	name = "Dragon's Breath Shells Box"
	desc = "A box containing 14 dragon's breath shells for a shotgun. Each one fires a spread of incendiary pellets that light anyone caught in a blaze of glory."
	item = /obj/item/storage/box/dragonshells/syndi
	cost = 3
	purchasable_from = ~UPLINK_CLOWN_OPS
	cant_discount = TRUE
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/syndieshotshells
	name = "Syndicate Buckshot Shells Box"
	desc = "A box containing 14 syndicate-made shells for a shotgun, these particular shells are more effective than nanotrasen-made shells."
	item = /obj/item/storage/box/syndieshotshells/syndi
	cost = 3
	purchasable_from = ~UPLINK_CLOWN_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/syndieslugshells
	name = "Syndicate Slugs Box"
	desc = "A box containing 14 syndicate-made slugs for a shotgun, these particular slugs are more effective than nanotrasen-made shells."
	item = /obj/item/storage/box/syndieslugshells/syndi
	cost = 3
	purchasable_from = ~UPLINK_CLOWN_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/tasershells
	name = "Taser Slugs Box"
	desc = "A box containing 14 taser slugs for a shotgun, effective in incapacitating single targets quickly."
	item = /obj/item/storage/box/tasershells/syndi
	cost = 3
	cant_discount = TRUE
	progression_minimum = 20 MINUTES
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/meteorshells
	name = "Meteor Slugs Box"
	desc = "A box containing 14 meteor slugs for a shotgun, they deal less damage than normal slugs but the shots always paralyze the target through sheer blunt force."
	item = /obj/item/storage/box/meteorshells/syndi
	cost = 3
	cant_discount = TRUE
	progression_minimum = 40 MINUTES
	purchasable_from = ~UPLINK_CLOWN_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/pulseshells
	name = "Pulse Shells Box"
	desc = "A box containing 14 pulse shells for a shotgun, extremely effective against all targets and often leave behind fire to ignite foes."
	item = /obj/item/storage/box/pulseshells/syndi
	cost = 6
	purchasable_from = ~UPLINK_CLOWN_OPS
	cant_discount = TRUE
	progression_minimum = 50 MINUTES
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/frag12shells
	name = "Frag 12 Shells Box"
	desc = "A box containing 14 frag-12 shells for a shotgun, each one causes a small explosion."
	item = /obj/item/storage/box/frag12shells/syndi
	cost = 5
	purchasable_from = ~UPLINK_CLOWN_OPS
	cant_discount = TRUE
	progression_minimum = 30 MINUTES
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/flechetteshells
	name = "Flechette Shells Box"
	desc = "A box containing 14 flechette shells for a shotgun, they're slightly better than normal buckshot with a tighter spread and armor penetration."
	item = /obj/item/storage/box/flechetteshells/syndi
	cost = 3
	purchasable_from = ~UPLINK_CLOWN_OPS
	cant_discount = TRUE
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/rubbershotshells
	name = "Rubbershot Shells Box"
	desc = "A box containing 14 rubbershot shells for a shotgun, they're useful in subdueing multiple targets in a less-lethal manner."
	item = /obj/item/storage/box/rubbershotshells/syndi
	cost = 2
	cant_discount = TRUE
	progression_minimum = 5 MINUTES
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ionshells
	name = "ION Shells Box"
	desc = "A box containing 14 ion shells for a shotgun, each shot induces a tiny emp, perfect against silicon-based lifeforms."
	item = /obj/item/storage/box/ionshells/syndi
	cost = 2
	purchasable_from = ~UPLINK_CLOWN_OPS
	cant_discount = TRUE
	progression_minimum = 5 MINUTES
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/lasershells
	name = "Laser Buckshot Shells Box"
	desc = "A box containing 14 laser buckshot shells for a shotgun, fires lethal lasers instead of pellets."
	item = /obj/item/storage/box/lasershells/syndi
	cost = 2
	purchasable_from = ~UPLINK_CLOWN_OPS
	cant_discount = TRUE
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/uraniumshells
	name = "Uranium Shells Box"
	desc = "A box containing 14 uranium shells for a shotgun, they all have high damage and armor penetration. Pellets penetrate targets and continue flying."
	item = /obj/item/storage/box/uraniumshells/syndi
	cost = 4
	purchasable_from = ~UPLINK_CLOWN_OPS
	cant_discount = TRUE
	progression_minimum = 20 MINUTES
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/cryoshotshells
	name = "Cryoshot Shells Box"
	desc = "A box containing 14 cryoshot shells for a shotgun, they deal little damage but drastically reduce the target's body temperature."
	item = /obj/item/storage/box/cryoshotshells/syndi
	cost = 3
	purchasable_from = ~UPLINK_CLOWN_OPS
	cant_discount = TRUE
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/bioterrorshells
	name = "Bioterror Shells Box"
	desc = "A box containing 14 bioterror dart shells for a shotgun, we've filled them with 6 units of five different toxins for destroying pesky personnel."
	item = /obj/item/storage/box/bioterrorshells/syndi
	cost = 6
	purchasable_from = ~UPLINK_CLOWN_OPS
	cant_discount = TRUE
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/** Only fits into breaching shotguns, may want to make a new version of the ammo.
/datum/uplink_item/ammo_restock/breachershells
	name = "Breacher Shells Box"
	desc = "A box containing 14 breacher shells for a shotgun, exceptional at destroying airlocks and windows. Not effective against actual enemies."
	item = /obj/item/storage/box/breachershells/syndi
	cost = 2
	purchasable_from = ~UPLINK_CLOWN_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND
**/

/datum/uplink_item/ammo_restock/thundershotshells
	name = "Thundershot Shells Box"
	desc = "A box containing 14 thundershot shells for a shotgun, fires 3 pellets but does little damage. Pellets will shock everyone nearby -- including you."
	item = /obj/item/storage/box/thundershotshells/syndi
	cost = 3
	purchasable_from = ~UPLINK_CLOWN_OPS
	cant_discount = TRUE
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/hardlightshells
	name = "Hardlight Shells Box"
	desc = "A box containing 14 hardlight shells for a shotgun, they only tire your foes, draining their stamina. Otherwise they're basically energy buckshot."
	item = /obj/item/storage/box/hardlightshells/syndi
	cost = 1
	cant_discount = TRUE
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/ripshells
	name = "RIP Shells Box"
	desc = "A box containing 14 rip shells for a shotgun, fires two slugs at once, dealing twice the damage. They're super-ineffective against any armor, aim for the legs."
	item = /obj/item/storage/box/ripshells/syndi
	cost = 4
	purchasable_from = ~UPLINK_CLOWN_OPS
	cant_discount = TRUE
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/anarchyshells
	name = "Anarchy Shells Box"
	desc = "A box containing 14 anarchy shells for a shotgun, fires 3 pellets that bounce off walls, they deal little damage outright though."
	item = /obj/item/storage/box/anarchyshells/syndi
	cost = 1
	cant_discount = TRUE
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/clownshellsclownop
	name = "Fake Shotgun Shells Box"
	desc = "A box containing 14 fake shells for a shotgun, for when you love wasting your telecrystals on harmless pranks."
	item = /obj/item/storage/box/clownshells/syndi
	cost = 0
	limited_stock = 5
	purchasable_from = UPLINK_CLOWN_OPS
	cant_discount = TRUE
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/clownshells
	name = "Fake Shotgun Shells Box"
	desc = "A box containing 14 fake shells for a shotgun, for when you love wasting security's time. Have this one on us, sponsored by the folks on Clown-p55."
	item = /obj/item/storage/box/clownshells/syndi
	cost = 0
	limited_stock = 1
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	cant_discount = TRUE
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/bioterrorammo
	name = "Bioterror Chemical Package"
	desc = "An box containing most of the chemicals we'd normally provide in a chemical kit, but we've added condensed capsaicin and have elected to increased the amounts of each chemical to 100 units."
	item = /obj/item/storage/box/syndie_kit/bioterrorammo
	cost = 10
	surplus = 0
	purchasable_from = UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo_restock/bioterrorammodeluxe
	name = "Deluxe Bioterror Chemical Package"
	desc = "An box containing most of the chemicals we'd normally provide in a chemical kit, but we've added nearly every toxin known to us and have elected to increased the amounts of each chemical to 100 units. Additionally, we added a few non-toxins to spice things up."
	item = /obj/item/storage/box/syndie_kit/bioterrorammodeluxe
	cost = 20
	surplus = 0
	purchasable_from = UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND
