//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Special Clearance////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/clearance/bicaridinebottles
	name = "Bicaridine Pill Bottles"
	desc = "Three pill bottles filled with bicaridine pills. Useful in treating brute damage quickly."
	cost = 500
	contains = list(/obj/item/storage/pill_bottle/bicaridine,/obj/item/storage/pill_bottle/bicaridine,/obj/item/storage/pill_bottle/bicaridine)
	crate_name = "bicaridine bottles crate"

/datum/supply_pack/clearance/kelotanebottles
	name = "Kelotane Pill Bottles"
	desc = "Three pill bottles filled with kelotane pills. Useful in treating burn damage quickly."
	cost = 500
	contains = list(/obj/item/storage/pill_bottle/kelotane,/obj/item/storage/pill_bottle/kelotane,/obj/item/storage/pill_bottle/kelotane)
	crate_name = "kelotane bottles crate"

/datum/supply_pack/clearance/antitoxinbottles
	name = "Anti-Toxin Pill Bottles"
	desc = "Three pill bottles filled with anti-toxin pills. Useful in treating toxin damage quickly."
	cost = 500
	contains = list(/obj/item/storage/pill_bottle/antitoxin,/obj/item/storage/pill_bottle/antitoxin,/obj/item/storage/pill_bottle/antitoxin)
	crate_name = "antitoxin bottles crate"

/datum/supply_pack/clearance/dexalinbottles
	name = "Dexalin Pill Bottles"
	desc = "Three pill bottles filled with dexalin pills. Useful in treating oxygen damage quickly."
	cost = 500
	contains = list(/obj/item/storage/pill_bottle/dexalin,/obj/item/storage/pill_bottle/dexalin,/obj/item/storage/pill_bottle/dexalin)
	crate_name = "dexalin bottles crate"

/datum/supply_pack/clearance/tricordrazinebottles
	name = "Tricordrazine Pill Bottles"
	desc = "Three pill bottles filled with tricordrazine pills. Useful in treating most damage quickly."
	cost = 1000
	contains = list(/obj/item/storage/pill_bottle/tricordrazine,/obj/item/storage/pill_bottle/tricordrazine,/obj/item/storage/pill_bottle/tricordrazine)
	crate_name = "tricordrazine bottles crate"


/datum/supply_pack/clearance/raremedipens
	name = "Rare Medicine Medipens"
	desc = "Three rare medipens filled with chemicals capable of curing severe brute, burn or oxygen damage."
	cost = 1000
	contains = list(/obj/item/reagent_containers/autoinjector/medipen/salacid,/obj/item/reagent_containers/autoinjector/medipen/oxandrolone,/obj/item/reagent_containers/autoinjector/medipen/salbutamol)
	crate_name = "rare medipen crate"


/datum/supply_pack/clearance/bluespacerped
	name = "Bluespace RPED"
	desc = "A single bluespace RPED for quick installation of parts. Parts not included."
	cost = 3000
	contains = list(/obj/item/storage/part_replacer/bluespace)
	crate_name = "bluespace rped crate"


/datum/supply_pack/clearance/selfchargecells
	name = "Self-Recharging Power Cells"
	desc = "Three bluespace power cells we've augmented with... less-than-legal technology. We'll sell them to you... discreetly."
	cost = 5000
	contains = list(/obj/item/stock_parts/cell/bluespace/selfcharge/empty,/obj/item/stock_parts/cell/bluespace/selfcharge/empty,/obj/item/stock_parts/cell/bluespace/selfcharge/empty)
	crate_name = "self-charging cells crate"


/datum/supply_pack/clearance/ntuplink
	name = "Nanotrasen Uplink"
	desc = "One of our VERY exclusive uplinks given to high-ranking personnel. We'll sell it to you if you can... persuade us. Comes precharged with 20 WC. Requires Armory Access to open."
	cost = 30000
	access = ACCESS_ARMORY
	contains = list(/obj/item/ntuplink/cargo)
	crate_name = "nt uplink crate"


/datum/supply_pack/clearance/airshoes
	name = "Air Shoes"
	desc = "One pair of highly sought after AIR SHOES. They're equipped with high-end tech capable of propelling the user forward at great speeds or allowing them to hover."
	cost = 20000
	contains = list(/obj/item/clothing/shoes/airshoes)
	crate_name = "air shoes crate"


/datum/supply_pack/clearance/goldflask
	name = "Captain's Flask"
	desc = "A golden flask, it's so pompous it's been branded as 'Captain Only'. Be we all know the captain won't be seeing this, won't we?"
	cost = 4000
	contains = list(/obj/item/reagent_containers/food/drinks/flask/gold)
	crate_name = "gold flask crate"


/datum/supply_pack/clearance/medicalweaponry
	name = "Medical Weaponry"
	desc = "Contains a syringe gun, for long-range reagent distribution."
	cost = 2500
	contains = list(/obj/item/gun/syringe)
	crate_name = "medical weaponry crate"


/datum/supply_pack/clearance/magivend
	name = "MagiVend Machine"
	desc = "A rare vending machines of unknown origin. Probably has magicks within."
	cost = 2500
	contains = list(/obj/machinery/vending/magivend)
	crate_name = "magivend crate"


/datum/supply_pack/clearance/nukiecola
	name = "Robust Nukie Cola Twelve-Pack"
	desc = "A twelve-pack of the incredibly robust: Nukie Cola! Warranty does NOT include over-consumption."
	cost = 5000
	contains = list(/obj/item/reagent_containers/food/drinks/soda_cans/robust_nukie,
					/obj/item/reagent_containers/food/drinks/soda_cans/robust_nukie,
					/obj/item/reagent_containers/food/drinks/soda_cans/robust_nukie,
					/obj/item/reagent_containers/food/drinks/soda_cans/robust_nukie,
					/obj/item/reagent_containers/food/drinks/soda_cans/robust_nukie,
					/obj/item/reagent_containers/food/drinks/soda_cans/robust_nukie,
					/obj/item/reagent_containers/food/drinks/soda_cans/robust_nukie,
					/obj/item/reagent_containers/food/drinks/soda_cans/robust_nukie,
					/obj/item/reagent_containers/food/drinks/soda_cans/robust_nukie,
					/obj/item/reagent_containers/food/drinks/soda_cans/robust_nukie,
					/obj/item/reagent_containers/food/drinks/soda_cans/robust_nukie,
					/obj/item/reagent_containers/food/drinks/soda_cans/robust_nukie)
	crate_name = "robust nukie cola crate"


/datum/supply_pack/clearance/medicalvarietykit
	name = "Medical Variety Kit"
	desc = "A bluespace first-aid-kit containing a wide-variety of medical supplies. Please note that the contents of the first aid kits purchased may differ from each other."
	cost = 500
	contains = list(/obj/item/storage/firstaid/medical_variety_pack)
	crate_name = "medical variety kit crate"


/datum/supply_pack/clearance/syringeresupply
	name = "Box of Variety Syringes"
	desc = "A single box of syringes, containing 4 syringes in total. They come in different forms."
	cost = 300
	contains = list(/obj/item/storage/box/syringes/variety)
	crate_name = "variety syringes crate"


/datum/supply_pack/clearance/beakerresupply
	name = "Box of Variety Beakers"
	desc = "A single box of beakers, containing 6 beakers of different kinds."
	cost = 800
	contains = list(/obj/item/storage/box/beakers/variety)
	crate_name = "variety beakers crate"


/datum/supply_pack/clearance/enchantedgold
	name = "Large Beaker of Enchanted Gold"
	desc = "A single large beaker filled with Enchanted Gold, a highly prized medicinal reagent known for it's ability to quickly support a patients health and maximize their vitality."
	cost = 2500
	contains = list(/obj/item/reagent_containers/glass/beaker/large/enchantedgold)
	crate_name = "enchanted gold crate"


/datum/supply_pack/clearance/explosivegrenades
	name = "Explosive Grenades"
	desc = "Three pyrotechnical chemical grenades filled with gunpowder. We're not going to ask why you'd need these. Requires Armory Access to open."
	cost = 5000
	access = ACCESS_ARMORY
	contains = list(/obj/item/grenade/chem_grenade/pyro/explosive,/obj/item/grenade/chem_grenade/pyro/explosive,/obj/item/grenade/chem_grenade/pyro/explosive)
	crate_name = "explosive grenade crate"


/datum/supply_pack/clearance/cyberneticimplants
	name = "Cybernetic Implants"
	desc = "A box containing 2 random cybernetic implants, for improving work productivity in employees."
	cost = 1000
	contains = list(/obj/item/storage/box/randomcyberneticimplants)
	crate_name = "cybernetic implants crate"


/datum/supply_pack/clearance/beeexpansion
	name = "Bee Expansionism"
	desc = "A crate containing 2 apiaries and 2 queen bees, for both delicious honey and exotic reagent production."
	cost = 2000
	contains = list(/obj/structure/beebox,/obj/structure/beebox,/obj/item/queen_bee/bought,/obj/item/queen_bee/bought)
	crate_name = "bee expansion crate"


/datum/supply_pack/clearance/atmosbot
	name = "Station Stabilizer Bot"
	desc = "A crate containing one Station Stabilizer Bot."
	cost = 100
	contains = list(/mob/living/simple_animal/bot/atmosbot)
	crate_name = "atmosbot crate"

/datum/supply_pack/clearance/cleanbot
	name = "Janitorial Bot"
	desc = "A crate containing one Janitorial Bot."
	cost = 200
	contains = list(/mob/living/simple_animal/bot/cleanbot)
	crate_name = "cleanbot crate"

/datum/supply_pack/clearance/firebot
	name = "Firefighting Bot"
	desc = "A crate containing one Firefighting Bot."
	cost = 200
	contains = list(/mob/living/simple_animal/bot/firebot)
	crate_name = "firebot crate"

/datum/supply_pack/clearance/floorbot
	name = "Floor Replacment Bot"
	desc = "A crate containing one Floor Replacment Bot."
	cost = 300
	contains = list(/mob/living/simple_animal/bot/floorbot)
	crate_name = "floorbot crate"

/datum/supply_pack/clearance/honkbot
	name = "Clown Bot"
	desc = "A crate containing one Clown Bot."
	cost = 250
	contains = list(/mob/living/simple_animal/bot/honkbot)
	crate_name = "honkbot crate"

/datum/supply_pack/clearance/medbot
	name = "Medical Bot"
	desc = "A crate containing one Medical Bot."
	cost = 300
	contains = list(/mob/living/simple_animal/bot/medbot)
	crate_name = "medbot crate"

/datum/supply_pack/clearance/secbot
	name = "Securitron"
	desc = "A crate containing one Securitron."
	cost = 500
	contains = list(/mob/living/simple_animal/bot/secbot)
	crate_name = "securitron crate"


/datum/supply_pack/clearance/incendiaryshells
	name = "Incendiary Shells"
	desc = "15 Incendiary Shells, especially effective against alien lifeforms. Requires Armory Access to open."
	cost = 2000
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/incendiaryshells)
	crate_name = "incendiary shells crate"

/datum/supply_pack/clearance/dartshells
	name = "Dart Shells"
	desc = "15 Dart Shells for biochemical warfare. Requires Armory Access to open."
	cost = 1000
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/dartshells)
	crate_name = "dart shells crate"

/datum/supply_pack/clearance/tasershells
	name = "Taser Slugs"
	desc = "15 Taser Slugs for quickly subdueing targets. Requires Armory Access to open."
	cost = 2500
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/tasershells)
	crate_name = "taser slugs crate"

/datum/supply_pack/clearance/meteorshells
	name = "Meteor Shells"
	desc = "15 Meteor Shells for high-power destruction of any and all targets. Requires Armory Access to open."
	cost = 6500
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/meteorshells)
	crate_name = "meteor shells crate"

/datum/supply_pack/clearance/pulseshells
	name = "Pulse Shells"
	desc = "15 Pulse Shells for those precious few who enjoy the suffering of others. Requires Armory Access to open."
	cost = 8000
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/pulseshells)
	crate_name = "pulse shells crate"

/datum/supply_pack/clearance/frag12shells
	name = "Frag-12 Shells"
	desc = "15 Frag-12 Shells for quick and easy demolition of armored foes. Requires Armory Access to open."
	cost = 6000
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/frag12shells)
	crate_name = "frag 12 shells crate"

/datum/supply_pack/clearance/flechetteshells
	name = "Flechette Shells"
	desc = "15 Flechette Shells for maiming your targets in the event you can't kill em'. Requires Armory Access to open."
	cost = 2000
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/flechetteshells)
	crate_name = "flechette shells crate"

/datum/supply_pack/clearance/rubbershotshells
	name = "Rubbershot Shells"
	desc = "15 Rubbershot Shells for when beanbags just ain't enough. Requires Armory Access to open."
	cost = 1500
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/rubbershotshells)
	crate_name = "rubbershot shells crate"

/datum/supply_pack/clearance/ionshells
	name = "ION Shells"
	desc = "15 ION Shells for shutting down silicon life in an effective manner. Requires Armory Access to open."
	cost = 2500
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/ionshells)
	crate_name = "ion shells crate"

/datum/supply_pack/clearance/lasershells
	name = "Laser Buckshot Shells"
	desc = "15 Laser Buckshot Shells for those who intend to fire past windows to reach their targets. Requires Armory Access to open."
	cost = 1250
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/lasershells)
	crate_name = "laser buckshot crate"

/datum/supply_pack/clearance/uraniumshells
	name = "Uranium Shells"
	desc = "15 Uranium Shells for penetrating armor -- and the person. Requires Armory Access to open."
	cost = 3750
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/uraniumshells)
	crate_name = "uranium shells crate"

/datum/supply_pack/clearance/cryoshotshells
	name = "Cryoshot Shells"
	desc = "15 Cryoshot Shells for commiting warcrimes. Requires Armory Access to open."
	cost = 2500
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/cryoshotshells)
	crate_name = "cryoshot shells crate"

/datum/supply_pack/clearance/breachershells
	name = "Breaching Shells"
	desc = "15 Breaching Shells for busting down walls and airlocks alike. Requires Armory Access to open."
	cost = 1500
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/breachershells)
	crate_name = "breacher shells crate"

/datum/supply_pack/clearance/thundershotshells
	name = "Thundershot Shells"
	desc = "15 Thundershot Shells for mass-harm of incredibly dangerous targets. Requires Armory Access to open."
	cost = 4000
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/thundershotshells)
	crate_name = "thundershot shells crate"

/datum/supply_pack/clearance/hardlightshells
	name = "Hardlight Shells"
	desc = "15 Hardlight Shells for subdueing targets in a non-lethal manner. Requires Armory Access to open."
	cost = 1500
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/hardlightshells)
	crate_name = "hardlight shells crate"

/datum/supply_pack/clearance/ripshells
	name = "RIP Shells"
	desc = "15 RIP Shells for quick elimination of the enemy. Requires Armory Access to open."
	cost = 2000
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/ripshells)
	crate_name = "rip slugs crate"

/datum/supply_pack/clearance/anarchyshells
	name = "Anarchy Shells"
	desc = "15 Anarchy Shells for when aiming isn't the highest priority. Requires Armory Access to open."
	cost = 1000
	access = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/anarchyshells)
	crate_name = "anarchy shells crate"



/**
/datum/supply_pack/clearance/
	name = ""
	desc = ""
	cost =
	contains = list()
	crate_name = " crate"
**/
