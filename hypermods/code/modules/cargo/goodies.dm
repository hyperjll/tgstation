/datum/supply_pack/goody/bicaridinebottles
	name = "Bicaridine Pill Bottles"
	desc = "Three pill bottles filled with bicaridine pills. Useful in treating brute damage quickly."
	cost = PAYCHECK_CREW * 10
	contains = list(/obj/item/storage/pill_bottle/bicaridine,/obj/item/storage/pill_bottle/bicaridine,/obj/item/storage/pill_bottle/bicaridine)

/datum/supply_pack/goody/kelotanebottles
	name = "Kelotane Pill Bottles"
	desc = "Three pill bottles filled with kelotane pills. Useful in treating burn damage quickly."
	cost = PAYCHECK_CREW * 10
	contains = list(/obj/item/storage/pill_bottle/kelotane,/obj/item/storage/pill_bottle/kelotane,/obj/item/storage/pill_bottle/kelotane)

/datum/supply_pack/goody/antitoxinbottles
	name = "Anti-Toxin Pill Bottles"
	desc = "Three pill bottles filled with anti-toxin pills. Useful in treating toxin damage quickly."
	cost = PAYCHECK_CREW * 10
	contains = list(/obj/item/storage/pill_bottle/antitoxin,/obj/item/storage/pill_bottle/antitoxin,/obj/item/storage/pill_bottle/antitoxin)

/datum/supply_pack/goody/dexalinbottles
	name = "Dexalin Pill Bottles"
	desc = "Three pill bottles filled with dexalin pills. Useful in treating oxygen damage quickly."
	cost = PAYCHECK_CREW * 10
	contains = list(/obj/item/storage/pill_bottle/dexalin,/obj/item/storage/pill_bottle/dexalin,/obj/item/storage/pill_bottle/dexalin)

/datum/supply_pack/goody/tricordrazinebottles
	name = "Tricordrazine Pill Bottles"
	desc = "Three pill bottles filled with tricordrazine pills. Useful in treating most damage quickly."
	cost = PAYCHECK_CREW * 20
	contains = list(/obj/item/storage/pill_bottle/tricordrazine,/obj/item/storage/pill_bottle/tricordrazine,/obj/item/storage/pill_bottle/tricordrazine)


/datum/supply_pack/goody/raremedipens
	name = "Rare Medicine Medipens"
	desc = "Three rare medipens filled with chemicals capable of curing severe brute, burn or oxygen damage."
	cost = PAYCHECK_CREW * 20
	contains = list(/obj/item/reagent_containers/hypospray/medipen/salacid,/obj/item/reagent_containers/hypospray/medipen/oxandrolone,/obj/item/reagent_containers/hypospray/medipen/salbutamol)


/datum/supply_pack/goody/bluespacerped
	name = "Bluespace RPED"
	desc = "A single bluespace RPED for quick installation of parts. Parts not included."
	cost = PAYCHECK_CREW * 60
	contains = list(/obj/item/storage/part_replacer/bluespace)

/**
/datum/supply_pack/goody/selfchargecells
	name = "Self-Recharging Power Cells"
	desc = "Three bluespace power cells we've augmented with... less-than-legal technology. We'll sell them to you... discreetly."
	cost = PAYCHECK_COMMAND * 50
	contains = list(/obj/item/stock_parts/cell/bluespace/selfcharge/empty,/obj/item/stock_parts/cell/bluespace/selfcharge/empty,/obj/item/stock_parts/cell/bluespace/selfcharge/empty)
**/

/datum/supply_pack/goody/ntuplink
	name = "Nanotrasen Uplink"
	desc = "One of our VERY exclusive uplinks given to high-ranking personnel. We'll sell it to you if you can... persuade us. Comes precharged with 20 WC. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 300
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/ntuplink)


/datum/supply_pack/goody/airshoes
	name = "Air Shoes"
	desc = "One pair of highly sought after AIR SHOES. They're equipped with high-end tech capable of propelling the user forward at great speeds or allowing them to hover."
	cost = PAYCHECK_COMMAND * 200
	contains = list(/obj/item/clothing/shoes/bhop/airshoes)

/**
/datum/supply_pack/goody/goldflask
	name = "Captain's Flask"
	desc = "A golden flask, it's so pompous it's been branded as 'Captain Only'. Be we all know the captain won't be seeing this, won't we?"
	cost = 4000
	contains = list(/obj/item/reagent_containers/food/drinks/flask/gold)
**/

/datum/supply_pack/goody/medicalweaponry
	name = "Medical Weaponry"
	desc = "Contains a syringe gun, for long-range reagent distribution."
	cost = PAYCHECK_COMMAND * 10
	contains = list(/obj/item/gun/syringe)


/datum/supply_pack/goody/magivend
	name = "MagiVend Machine"
	desc = "A rare vending machines of unknown origin. Probably has magicks within."
	cost = PAYCHECK_COMMAND * 25
	contains = list(/obj/machinery/vending/magivend)


/datum/supply_pack/goody/nukiecola
	name = "Robust Nukie Cola Twelve-Pack"
	desc = "A twelve-pack of the incredibly robust: Nukie Cola! Warranty does NOT include over-consumption."
	cost = PAYCHECK_COMMAND * 50
	contains = list(/obj/item/reagent_containers/cup/soda_cans/robust_nukie,
					/obj/item/reagent_containers/cup/soda_cans/robust_nukie,
					/obj/item/reagent_containers/cup/soda_cans/robust_nukie,
					/obj/item/reagent_containers/cup/soda_cans/robust_nukie,
					/obj/item/reagent_containers/cup/soda_cans/robust_nukie,
					/obj/item/reagent_containers/cup/soda_cans/robust_nukie,
					/obj/item/reagent_containers/cup/soda_cans/robust_nukie,
					/obj/item/reagent_containers/cup/soda_cans/robust_nukie,
					/obj/item/reagent_containers/cup/soda_cans/robust_nukie,
					/obj/item/reagent_containers/cup/soda_cans/robust_nukie,
					/obj/item/reagent_containers/cup/soda_cans/robust_nukie,
					/obj/item/reagent_containers/cup/soda_cans/robust_nukie)


/datum/supply_pack/goody/medicalvarietykit
	name = "Medical Variety Kit"
	desc = "A bluespace first-aid-kit containing a wide-variety of medical supplies. Please note that the contents of the first aid kits purchased may differ from each other."
	cost = PAYCHECK_CREW * 10
	contains = list(/obj/item/storage/medkit/medical_variety_pack)


/datum/supply_pack/goody/syringeresupply
	name = "Box of Variety Syringes"
	desc = "A single box of syringes, containing 4 syringes in total. They come in different forms."
	cost = PAYCHECK_CREW * 6
	contains = list(/obj/item/storage/box/syringes/variety)


/datum/supply_pack/goody/beakerresupply
	name = "Box of Variety Beakers"
	desc = "A single box of beakers, containing 6 beakers of different kinds."
	cost = PAYCHECK_CREW * 14
	contains = list(/obj/item/storage/box/beakers/variety)


/datum/supply_pack/goody/enchantedgold
	name = "Large Beaker of Enchanted Gold"
	desc = "A single large beaker filled with Enchanted Gold, a highly prized medicinal reagent known for it's ability to quickly support a patients health and maximize their vitality."
	cost = PAYCHECK_COMMAND * 25
	contains = list(/obj/item/reagent_containers/cup/beaker/large/enchantedgold)


/datum/supply_pack/goody/explosivegrenades
	name = "Explosive Grenades"
	desc = "Three pyrotechnical chemical grenades filled with gunpowder. We're not going to ask why you'd need these. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 50
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/grenade/chem_grenade/pyro/explosive,/obj/item/grenade/chem_grenade/pyro/explosive,/obj/item/grenade/chem_grenade/pyro/explosive)


/datum/supply_pack/goody/cyberneticimplants
	name = "Cybernetic Implants"
	desc = "A box containing 2 random cybernetic implants, for improving work productivity in employees."
	cost = PAYCHECK_CREW * 20
	contains = list(/obj/item/storage/box/randomcyberneticimplants)


/datum/supply_pack/goody/beeexpansion
	name = "Bee Expansionism"
	desc = "A crate containing 2 apiaries and 2 queen bees, for both delicious honey and exotic reagent production."
	cost = PAYCHECK_CREW * 40
	contains = list(/obj/structure/beebox,/obj/structure/beebox,/obj/item/queen_bee/bought,/obj/item/queen_bee/bought)


/datum/supply_pack/goody/cleanbot
	name = "Janitorial Bot"
	desc = "A crate containing one Janitorial Bot."
	cost = PAYCHECK_COMMAND * 2
	contains = list(/mob/living/basic/bot/cleanbot)

/datum/supply_pack/goody/firebot
	name = "Firefighting Bot"
	desc = "A crate containing one Firefighting Bot."
	cost = PAYCHECK_COMMAND * 2
	contains = list(/mob/living/simple_animal/bot/firebot)

/datum/supply_pack/goody/floorbot
	name = "Floor Replacment Bot"
	desc = "A crate containing one Floor Replacment Bot."
	cost = PAYCHECK_COMMAND * 3
	contains = list(/mob/living/simple_animal/bot/floorbot)

/datum/supply_pack/goody/honkbot
	name = "Clown Bot"
	desc = "A crate containing one Clown Bot."
	cost = PAYCHECK_COMMAND * 2.5
	contains = list(/mob/living/basic/bot/honkbot)

/datum/supply_pack/goody/medbot
	name = "Medical Bot"
	desc = "A crate containing one Medical Bot."
	cost = PAYCHECK_COMMAND * 3
	contains = list(/mob/living/basic/bot/medbot)

/datum/supply_pack/goody/secbot
	name = "Securitron"
	desc = "A crate containing one Securitron."
	cost = PAYCHECK_COMMAND * 5
	contains = list(/mob/living/simple_animal/bot/secbot)

/datum/supply_pack/goody/hygienebot
	name = "Hygiene Bot"
	desc = "A crate containing one Hygiene Bot."
	cost = PAYCHECK_COMMAND * 2.5
	contains = list(/mob/living/basic/bot/hygienebot)


/datum/supply_pack/goody/incendiaryshells
	name = "Incendiary Shells"
	desc = "15 Incendiary Shells, especially effective against alien lifeforms. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 20
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/incendiaryshells)

/datum/supply_pack/goody/dartshells
	name = "Dart Shells"
	desc = "15 Dart Shells for biochemical warfare. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 10
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/dartshells)

/datum/supply_pack/goody/tasershells
	name = "Taser Slugs"
	desc = "15 Taser Slugs for quickly subdueing targets. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 25
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/tasershells)

/datum/supply_pack/goody/meteorshells
	name = "Meteor Shells"
	desc = "15 Meteor Shells for high-power destruction of any and all targets. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 65
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/meteorshells)

/datum/supply_pack/goody/pulseshells
	name = "Pulse Shells"
	desc = "15 Pulse Shells for those precious few who enjoy the suffering of others. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 80
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/pulseshells)

/datum/supply_pack/goody/frag12shells
	name = "Frag-12 Shells"
	desc = "15 Frag-12 Shells for quick and easy demolition of armored foes. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 60
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/frag12shells)

/datum/supply_pack/goody/flechetteshells
	name = "Flechette Shells"
	desc = "15 Flechette Shells for maiming your targets in the event you can't kill em'. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 20
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/flechetteshells)

/datum/supply_pack/goody/rubbershotshells
	name = "Rubbershot Shells"
	desc = "15 Rubbershot Shells for when beanbags just ain't enough. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 15
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/rubbershotshells)

/datum/supply_pack/goody/ionshells
	name = "ION Shells"
	desc = "15 ION Shells for shutting down silicon life in an effective manner. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 25
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/ionshells)

/datum/supply_pack/goody/lasershells
	name = "Laser Buckshot Shells"
	desc = "15 Laser Buckshot Shells for those who intend to fire past windows to reach their targets. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 12.5
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/lasershells)

/datum/supply_pack/goody/uraniumshells
	name = "Uranium Shells"
	desc = "15 Uranium Shells for penetrating armor -- and the person. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 37.5
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/uraniumshells)

/datum/supply_pack/goody/cryoshotshells
	name = "Cryoshot Shells"
	desc = "15 Cryoshot Shells for commiting warcrimes. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 25
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/cryoshotshells)

/datum/supply_pack/goody/breachershells
	name = "Breaching Shells"
	desc = "15 Breaching Shells for busting down walls and airlocks alike. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 15
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/breachershells)

/datum/supply_pack/goody/thundershotshells
	name = "Thundershot Shells"
	desc = "15 Thundershot Shells for mass-harm of incredibly dangerous targets. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 40
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/thundershotshells)

/datum/supply_pack/goody/hardlightshells
	name = "Hardlight Shells"
	desc = "15 Hardlight Shells for subdueing targets in a non-lethal manner. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 15
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/hardlightshells)

/datum/supply_pack/goody/ripshells
	name = "RIP Shells"
	desc = "15 RIP Shells for quick elimination of the enemy. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 20
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/ripshells)

/datum/supply_pack/goody/anarchyshells
	name = "Anarchy Shells"
	desc = "15 Anarchy Shells for when aiming isn't the highest priority. Requires Armory Access to open."
	cost = PAYCHECK_COMMAND * 10
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/anarchyshells)


/datum/supply_pack/goody/enchantedgold
	name = "Large Beaker of Enchanted Gold"
	desc = "A single large beaker filled with Enchanted Gold, a highly prized medicinal reagent known for it's ability to quickly support a patients health and maximize their vitality."
	cost = PAYCHECK_COMMAND * 25
	contains = list(/obj/item/reagent_containers/cup/beaker/large/enchantedgold)


/datum/supply_pack/goody/securityborg
	name = "Nanotrasen Security Cyborg Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate assistance from silicon-based lifeforms, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/securityborg)

/datum/supply_pack/goody/clownborg
	name = "Nanotrasen Clown Cyborg Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate assistance from silicon-based lifeforms, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 40
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/clownborg)

/datum/supply_pack/goody/engiborg
	name = "Nanotrasen Engineering Cyborg Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate assistance from silicon-based lifeforms, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 80
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/engiborg)

/datum/supply_pack/goody/medicalborg
	name = "Nanotrasen Medical Cyborg Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate assistance from silicon-based lifeforms, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 80
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/medicalborg)

/datum/supply_pack/goody/janitorborg
	name = "Nanotrasen Janitor Cyborg Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate assistance from silicon-based lifeforms, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 60
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/janitorborg)

/datum/supply_pack/goody/minerborg
	name = "Nanotrasen Miner Cyborg Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate assistance from silicon-based lifeforms, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 80
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/minerborg)

/datum/supply_pack/goody/peaceborg
	name = "Nanotrasen Peacekeeper Cyborg Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate assistance from silicon-based lifeforms, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 70
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/peaceborg)

/datum/supply_pack/goody/serviceborg
	name = "Nanotrasen Service Cyborg Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate assistance from silicon-based lifeforms, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 50
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/serviceborg)


/datum/supply_pack/goody/assistant
	name = "Nanotrasen Assistant Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 80
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/assistant)

/datum/supply_pack/goody/scientist
	name = "Nanotrasen Scientist Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/scientist)

/datum/supply_pack/goody/bartender
	name = "Nanotrasen Bartender Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/bartender)

/datum/supply_pack/goody/botanist
	name = "Nanotrasen Botanist Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/botanist)

/datum/supply_pack/goody/cargo_tech
	name = "Nanotrasen Cargo Technician Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/cargo_tech)

/datum/supply_pack/goody/chemist
	name = "Nanotrasen Chemist Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/chemist)

/datum/supply_pack/goody/clown
	name = "Nanotrasen Clown Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/clown)

/datum/supply_pack/goody/cook
	name = "Nanotrasen Cook Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/cook)

/datum/supply_pack/goody/coroner
	name = "Nanotrasen Coroner Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/coroner)

/datum/supply_pack/goody/curator
	name = "Nanotrasen Curator Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/curator)

/datum/supply_pack/goody/detective
	name = "Nanotrasen Detective Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 150
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/detective)

/datum/supply_pack/goody/geneticist
	name = "Nanotrasen Geneticist Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/geneticist)

/datum/supply_pack/goody/janitor
	name = "Nanotrasen Janitor Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/janitor)

/datum/supply_pack/goody/lawyer
	name = "Nanotrasen Lawyer Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/lawyer)

/datum/supply_pack/goody/medical_doctor
	name = "Nanotrasen Medical Doctor Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/medical_doctor)

/datum/supply_pack/goody/mime
	name = "Nanotrasen Mime Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/mime)

/datum/supply_pack/goody/paramedic
	name = "Nanotrasen Paramedic Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/paramedic)

/datum/supply_pack/goody/psychologist
	name = "Nanotrasen Psychologist Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/psychologist)

/datum/supply_pack/goody/roboticist
	name = "Nanotrasen Roboticist Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/roboticist)

/datum/supply_pack/goody/security_officer
	name = "Nanotrasen Security Officer Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 150
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/security_officer)

/datum/supply_pack/goody/shaft_miner
	name = "Nanotrasen Shaft Miner Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/shaft_miner)

/datum/supply_pack/goody/station_engineer
	name = "Nanotrasen Station Engineer Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/station_engineer)

/datum/supply_pack/goody/warden
	name = "Nanotrasen Warden Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 150
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/warden)

/datum/supply_pack/goody/chaplain
	name = "Nanotrasen Chaplain Beacon"
	desc = "A given often given to high-ranking nanotrasen personnel to request immediate staffing of a particular type, often used in emergencies or at the behest of low-morale crew."
	cost = PAYCHECK_COMMAND * 100
	access_view = ACCESS_HOP
	contains = list(/obj/item/antag_spawner/nanotrasen/chaplain)
