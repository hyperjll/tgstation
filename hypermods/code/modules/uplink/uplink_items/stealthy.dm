/datum/uplink_item/stealthy_weapons/augmenteddisabler
	name = "Energy Pistol"
	desc = "An energy pistol we've designed to look identical to that of a NT-brand disabler. It's capable of firing both lethal and disabling shots. \
			Recharges automatically."
	item = /obj/item/gun/energy/disabler/syndicate
	cost = 7
	surplus = 25
	purchasable_from = ~UPLINK_CLOWN_OPS

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

/datum/uplink_item/stealthy_weapons/hypo_pen
	name = "Hypo Pen"
	desc = "One of our state-of-the-art hypo pens, capable of injecting up to 15 units of reagents at a time. \
			The injectee often won't realize they've been injected thanks to the hypopen's numbing needle. \
			Doesn't come with any reagents."
	item = /obj/item/storage/box/itempack/hypopen
	cost = 7
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/stealthy_weapons/mindbatterer
	name = "Mind Batterer"
	desc = "A device with twin attennas. When activated it acts like a mental flashbang to everyone nearby except the user. \
			Has a 75% chance to work, and can only be used three times before being burnt out."
	item = /obj/item/mindbatterer
	cost = 4
	surplus = 30
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS // Would easily fuck over your fellow operatives or make taking down high priority targets too easy.

/datum/uplink_item/stealthy_weapons/mindswitch
	name = "Mindswitch"
	desc = "A three-use switch which exploits Nanotrasen's mindshield implants, causing the brain \
			to shut itself off for an extended period of time and causing significant brain damage."
	item = /obj/item/mindbatterer/mindshield
	cost = 8
	surplus = 30
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS // Would easily make taking down high priority targets too easy.

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

/datum/uplink_item/stealthy_weapons/syndispraycan
	name = "Syndicate Hellcan"
	desc = "A normal spraycan that's been filled with CLF3 and Plasma, perfect for close-range incendiary shenanigans. Only has 10 uses."
	item = /obj/item/toy/crayon/spraycan/syndicate
	progression_minimum = 15 MINUTES
	cost = 1
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
	purchasable_from = ~UPLINK_SERIOUS_OPS
