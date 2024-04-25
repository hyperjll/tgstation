/datum/uplink_category/stealthy
	name = "Stealthy Weapons"
	weight = 12

/datum/uplink_item/stealthy_weapons
	category = /datum/uplink_category/stealthy


/datum/uplink_item/stealthy_weapons/dart_pistol
	name = "Dart Pistol"
	desc = "A miniaturized version of a normal syringe gun. It is very quiet when fired and can fit into any \
			space a small item can."
	item = /obj/item/gun/syringe/syndicate
	cost = 4
	surplus = 50
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/stealthy_weapons/dehy_carp
	name = "Dehydrated Space Carp"
	desc = "Looks like a plush toy carp, but just add water and it becomes a real-life space carp! Activate in \
			your hand before use so it knows not to kill you."
	item = /obj/item/toy/plush/carpplushie/dehy_carp
	cost = 1

/datum/uplink_item/stealthy_weapons/edagger
	name = "Energy Dagger"
	desc = "A dagger made of energy that looks and functions as a pen when off."
	item = /obj/item/pen/edagger
	cost = 2

/datum/uplink_item/stealthy_weapons/traitor_chem_bottle
	name = "Poison Kit"
	desc = "An assortment of deadly chemicals packed into a compact box. Comes with a syringe for more precise application."
	item = /obj/item/storage/box/syndie_kit/chemical
	cost = 6
	surplus = 50

/datum/uplink_item/stealthy_weapons/suppressor
	name = "Suppressor"
	desc = "This suppressor will silence the shots of the weapon it is attached to for increased stealth and superior ambushing capability. It is compatible with many small ballistic guns including the Makarov, Stechkin APS and C-20r, but not revolvers or energy guns."
	item = /obj/item/suppressor
	cost = 3
	surplus = 10
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/stealthy_weapons/holster
	name = "Syndicate Holster"
	desc = "A useful little device that allows for inconspicuous carrying of guns using chameleon technology. It also allows for badass gun-spinning."
	item = /obj/item/storage/belt/holster/chameleon
	cost = 1

/datum/uplink_item/stealthy_weapons/sleepy_pen
	name = "Sleepy Pen"
	desc = "A syringe disguised as a functional pen, filled with a potent mix of drugs, including a \
			strong anesthetic and a chemical that prevents the target from speaking. \
			The pen holds one dose of the mixture, and can be refilled with any chemicals. Note that before the target \
			falls asleep, they will be able to move and act."
	item = /obj/item/pen/sleepy
	cost = 4
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)


/datum/uplink_item/stealthy_weapons/origami_kit
	name = "Boxed Origami Kit"
	desc = "This box contains a guide on how to craft masterful works of origami, allowing you to transform normal pieces of paper into \
			perfectly aerodynamic (and potentially lethal) paper airplanes."
	item = /obj/item/storage/box/syndie_kit/origami_bundle
	cost = 4
	surplus = 0
	purchasable_from = ~UPLINK_NUKE_OPS //clown ops intentionally left in, because that seems like some s-tier shenanigans.


/datum/uplink_item/stealthy_weapons/martialarts
	name = "Martial Arts Scroll"
	desc = "This scroll contains the secrets of an ancient martial arts technique. You will master unarmed combat \
			and gain the ability to swat bullets from the air, but you will also refuse to use dishonorable ranged weaponry."
	item = /obj/item/book/granter/martial/carp
	progression_minimum = 30 MINUTES
	cost = 17
	surplus = 0
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/stealthy_weapons/crossbow
	name = "Miniature Energy Crossbow"
	desc = "A short bow mounted across a tiller in miniature. \
	Small enough to fit into a pocket or slip into a bag unnoticed. \
	It will synthesize and fire bolts tipped with a debilitating \
	toxin that will damage and disorient targets, causing them to \
	slur as if inebriated. It can produce an infinite number \
	of bolts, but takes time to automatically recharge after each shot."
	item = /obj/item/gun/energy/recharge/ebow
	cost = 10
	surplus = 50
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/stealthy_weapons/contrabaton
	name = "Contractor Baton"
	desc = "A compact, specialised baton assigned to Syndicate contractors. Applies light electrical shocks to targets. \
	These shocks are capable of affecting the inner circuitry of most robots as well, applying a short stun. \
	Has the added benefit of affecting the vocal cords of your victim, causing them to slur as if inebriated."
	item = /obj/item/melee/baton/telescopic/contractor_baton
	cost = 7
	surplus = 50
	limited_stock = 1
	purchasable_from = UPLINK_TRAITORS | UPLINK_SPY

/datum/uplink_item/stealthy_weapons/combatglovesplus
	name = "Combat Gloves Plus"
	desc = "A pair of gloves that are fireproof and shock resistant, however unlike the regular Combat Gloves this one uses nanotechnology \
			to grant the wearer knowledge over Krav Maga. Not as inconspicuous as you may think. To ensure your stealth, wear before use only."
	item = /obj/item/clothing/gloves/krav_maga/combatglovesplus
	cost = 5
	surplus = 0

/datum/uplink_item/stealthy_weapons/cobra
	name = "Cobra"
	desc = "A single Cobra pistol that fires .45 bullets. Loaded with 9 lethal shots. Nearly silent when firing. \
			Comes loaded with caseless ammo."
	item = /obj/item/gun/ballistic/automatic/pistol/cobra/caseless
	progression_minimum = 5 MINUTES
	cost = 7
	surplus = 30
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/stealthy_weapons/derringer
	name = "Derringer Pistol"
	desc = "A concealable double-chamber pistol loaded with individual .357 rounds. Fits in boots."
	item = /obj/item/gun/ballistic/revolver/derringer
	cost = 3
	surplus = 50

/datum/uplink_item/stealthy_weapons/donkbat
	name = "Donk Baseball Bat"
	desc = "A weighted solid plastic baseball bat, perfect for knocking the wind out of people. Has a very distinct noise."
	item = /obj/item/melee/baton/donkbat
	cost = 4
	surplus = 30

/datum/uplink_item/stealthy_weapons/cybersun_pen
	name = "Cybersun Pen"
	desc = "A seemingly normal black pen, it does a moderate amount of damage on hit, and nearly twice as much if thrown."
	item = /obj/item/pen/cybersun/disguised
	cost = 1
	surplus = 40

/datum/uplink_item/stealthy_weapons/mindbatterer
	name = "Mind Batterer"
	desc = "A device with twin attennas. When activated it acts like a mental flashbang to everyone nearby except the user. \
			Has a 75% chance to work, and can only be used three times before being burnt out."
	item = /obj/item/batterer
	cost = 4
	surplus = 30
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS) // Would easily fuck over your fellow operatives or make taking down high priority targets too easy.

/datum/uplink_item/stealthy_weapons/bladegloves
	name = "Bladed Gloves"
	desc = "Professionally made bladed gloves, they allow you to deal 8-12 damage per punch while wearing them. \
			The gloves prevent you from using ANY disarms or grabs."
	item = /obj/item/clothing/gloves/knifeboxing
	cost = 2
	surplus = 20

/datum/uplink_item/stealthy_weapons/riggedboxing
	name = "Rigged Boxing Gloves"
	desc = "Blue boxing gloves fitted with brass-knuckles within the fabric. The equipment deals \
			10-20 stamina damage per punch, but you may still disarm and grab the opponent unlike the Bladed Gloves we're selling you."
	item = /obj/item/clothing/gloves/boxing/blue/rigged
	cost = 2
	surplus = 20

/datum/uplink_item/stealthy_weapons/shotguncane
	name = "Shotgun Cane"
	desc = "A cane that also functions as a shotgun. Performs especially well if you're blind. Comes loaded with 4 beanbag shells."
	item = /obj/item/gun/ballistic/shotgun/cane
	cost = 6
	surplus = 20

/datum/uplink_item/stealthy_weapons/radlights
	name = "Radioactive Lights"
	desc = "A box disguised as a replacement lights package, containing 6 light tubes and 6 light bulbs. \
			Light tubes and bulbs contained within are hazardous to life and will erratically pulse with radiation. \
			When properly installed into any light sources, the light tubes/bulbs within will burst with radiation when broken."
	item = /obj/item/storage/box/lights/mixed/radiation
	progression_minimum = 20 MINUTES
	cost = 4
	surplus = 15

/datum/uplink_item/stealthy_weapons/door_charge
	name = "Explosive Airlock Charge"
	desc = "A small, easily concealable device. It can be applied to an open airlock panel, booby-trapping it. \
			The next person to open that airlock will trigger an explosion, knocking them down and destroying \
			the airlock maintenance panel."
	item = /obj/item/doorCharge
	cost = 2
	surplus = 10
	purchasable_from = ~UPLINK_NUKE_OPS

/datum/uplink_item/stealthy_weapons/knifevenom
	name = "Reagent Knife (Venom)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Venom. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. An excellent backup for agents all around."
	item = /obj/item/knife/combat/survival/chemical/venom
	cost = 3
	surplus = 35
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/stealthy_weapons/knifelexorin
	name = "Reagent Knife (Lexorin)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Lexorin. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. Excellent in taking down opponents without self-respiration."
	item = /obj/item/knife/combat/survival/chemical/lexorin
	cost = 6
	surplus = 35
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/stealthy_weapons/knifeamanitin
	name = "Reagent Knife (Amanitin)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Amanitin. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. Excellent for ensuring the target stays down for the count -- even after being rescued."
	item = /obj/item/knife/combat/survival/chemical/amanitin
	cost = 4
	surplus = 35
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/stealthy_weapons/knifestaminatoxin
	name = "Reagent Knife (Tirizene)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Tirizene. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. Excellent for quick take-downs."
	item = /obj/item/knife/combat/survival/chemical/staminatoxin
	cost = 2
	surplus = 35
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/stealthy_weapons/knifecurare
	name = "Reagent Knife (Curare)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Curare. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. Extremely effective against all non-silicon targets."
	item = /obj/item/knife/combat/survival/chemical/curare
	cost = 6
	surplus = 35
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/stealthy_weapons/knifeinitropidril
	name = "Reagent Knife (Initropidril)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Initropidril. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. Often wins your fights for you -- if you're lucky."
	item = /obj/item/knife/combat/survival/chemical/initropidril
	cost = 8
	surplus = 35
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/stealthy_weapons/knifepancuronium
	name = "Reagent Knife (Pancuronium)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Pancuronium. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. A decent stun and poison combo."
	item = /obj/item/knife/combat/survival/chemical/pancuronium
	cost = 6
	surplus = 35
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/stealthy_weapons/knifeheparin
	name = "Reagent Knife (Heparin)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Heparin. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. Excellent in bleeding victims out."
	item = /obj/item/knife/combat/survival/chemical/heparin
	cost = 2
	surplus = 35
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/stealthy_weapons/syndispraycan
	name = "Syndicate Hellcan"
	desc = "A normal spraycan that's been filled with CLF3 and Plasma, perfect for close-range incendiary shenanigans. Only has 10 uses."
	item = /obj/item/toy/crayon/spraycan/syndicate
	progression_minimum = 15 MINUTES
	cost = 1
	surplus = 10

/datum/uplink_item/stealthy_weapons/megadehydratedcarp
	name = "Dehydrated Megacarp"
	desc = "Looks like a plush toy carp, but just add water and it becomes a real-life mega space carp! Activate in \
			your hand before use so it knows not to kill you."
	item = /obj/item/toy/plush/carpplushie/dehy_carp/mega
	cost = 2
	surplus = 10

/datum/uplink_item/stealthy_weapons/diseasegrenade
	name = "Diseased Grenade"
	desc = "A chemical foam grenade loaded with a payload capable of causing mass-plagues. \
			Those who touch the foam will develop a random advanced disease. Wear protection before use."
	item = /obj/item/grenade/chem_grenade/randomdisease
	progression_minimum = 10 MINUTES
	cost = 2
	surplus = 10

/datum/uplink_item/stealthy_weapons/sleepybaton
	name = "Incapacitation Baton"
	desc = "A baton once given to Syndicate Contractors. It has since been decommissioned for a more effective model. \
			The baton does NOT stun victims, but will inject knock-out drugs that will put victims to sleep after roughly 4 seconds. \
			Has no anti-silicon measures unlike the newly manufactured version. The baton takes a longer time to recharge."
	item = /obj/item/melee/baton/telescopic/sleep_baton
	cost = 4
	surplus = 10
	limited_stock = 1
	purchasable_from = (UPLINK_TRAITORS | UPLINK_SPY | UPLINK_CLOWN_OPS)
