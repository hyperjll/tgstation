/datum/uplink_category/armor
	name = "Armor"
	weight = 9

/datum/uplink_item/armor
	category = /datum/uplink_category/armor
	surplus = 0


/datum/uplink_item/armor/webvest
	name = "Web Vest"
	desc = "A bulletproof vest, it's been fitted with additional webbing and armor plates for additional protection. Unfortunately, it'll likely blow your cover."
	item = /obj/item/clothing/suit/armor/webvest
	cost = 5
	surplus = 30
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/armor/webhelmet
	name = "Web Helmet"
	desc = "A sturdy helmet, often provided to armed forces across the galaxy. It's been fitted with additional webbing and armor plates for additional protection. Unfortunately, it'll likely blow your cover."
	item = /obj/item/clothing/head/helmet/webhelmet
	cost = 5
	surplus = 35
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/armor/armoredchameleon
	name = "Armored Jumpsuit"
	desc = "A jumpsuit we've outfitted with a kevlar mesh and our chameleon technology. Perfect for maximizing protection and stealth."
	item = /obj/item/clothing/under/chameleon/armored
	cost = 4
	surplus = 40
	uplink_item_flags = null

/datum/uplink_item/armor/energyshield
	name = "Energy Shield"
	desc = "An incredibly useful personal shield projector, capable of reflecting energy projectiles and defending \
			against other attacks. Pair with an Energy Sword for a killer combination."
	item = /obj/item/shield/energy
	cost = 8
	surplus = 20
	progression_minimum = 20 MINUTES
	//uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND // The energy shield is used by ERT also, so...

/datum/uplink_item/armor/armoredtie
	name = "Armored Tie"
	desc = "A tie we've fitted with a kevlar mesh and our chameleon technology. It provides a small amount of protection against all types of damage."
	item = /obj/item/clothing/neck/chameleon/armored
	cost = 2
	surplus = 25
	uplink_item_flags = null

/datum/uplink_item/armor/armoredgloves
	name = "Armored Gloves"
	desc = "A pair of gloves we've fitted with the toughest durathread we could fabricate AND our chameleon technology. It provides a small amount of protection against all types of damage. \
			Gloves are insulated and won't restrict your dexterity when using certain equipment."
	item = /obj/item/clothing/gloves/chameleon/armored
	cost = 2
	surplus = 25
	uplink_item_flags = null

/datum/uplink_item/armor/gunbootsdisabler
	name = "Disabler Shoes"
	desc = "A highly experimental pair of 'gunboots' developed by (and later discontinued) Cybersun Industries in an attempt to incorporate turrets within footwear. \
			These shoes will randomly fire disabler beams to weaken or incapacitate nearby entities while you walk with them on. \
			Development was discontinued after frustration within the R&D team grew too high as the boots were more often-than-not a detriment \
			to security and assault teams alike. Could still prove useful if you're solo, however."
	item = /obj/item/clothing/shoes/gunboots/disabler
	cost = 9
	surplus = 0
	progression_minimum = 20 MINUTES
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/armor/reactiveteleportsyndicate
	name = "Augmented Teleportation Vest"
	desc = "Thanks to our agents who've stolen NT's Reactive Teleport Armor, we've reverse-engineered the technology for ourselves. \
			The vest works similiarly to the original, but it's been augmented to teleport more often, and provide more protection outright."
	item = /obj/item/clothing/suit/armor/reactive/syndicate/teleport
	cost = 12
	surplus = 10
	progression_minimum = 30 MINUTES
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/armor/reactiveincendiarysyndicate
	name = "Augmented Incendiary Vest"
	desc = "This vest has been augmented with flame jets, and will set everyone nearby on fire if triggered all the while you'll be drenched with water to prevent self-harm. \
			This vest however, has a significantly longer cooldown than most other augmented or reactive armors. It also provides a bit of protection to the wearer."
	item = /obj/item/clothing/suit/armor/reactive/syndicate/fire
	cost = 12
	surplus = 5
	progression_minimum = 30 MINUTES
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/armor/reactivestealthsyndicate
	name = "Augmented Stealth Vest"
	desc = "This vest has most of the same properties as NT's Reactive Stealth Armor. But we've outfitted it with some armor plating. \
			Additionally, this vest can activated twice as often."
	item = /obj/item/clothing/suit/armor/reactive/syndicate/stealth
	cost = 12
	surplus = 10
	progression_minimum = 30 MINUTES
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/armor/reactiveteslasyndicate
	name = "Augmented Telsa Vest"
	desc = "This vest has most of the same properties as NT's Reactive Telsa Armor. But we've outfitted it with some armor plating. \
			Additionally, this vest will provide more powerful shocks over twice the normal range."
	item = /obj/item/clothing/suit/armor/reactive/syndicate/tesla
	cost = 12
	surplus = 10
	progression_minimum = 30 MINUTES
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/armor/reactiverepulsesyndicate
	name = "Augmented Repulse Vest"
	desc = "This vest has most of the same properties as NT's Reactive Repulse Armor. But we've outfitted it with some armor plating. \
			Additionally, this vest will provide more protection than our other augmented armors and can repulse every 4 seconds."
	item = /obj/item/clothing/suit/armor/reactive/syndicate/repulse
	cost = 12
	surplus = 10
	progression_minimum = 30 MINUTES
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/armor/reactivetablesyndicate
	name = "Augmented Tabletop Vest"
	desc = "This vest has most of the same properties as NT's Reactive Table Armor. But we've outfitted it with some armor plating. \
			Additionally, this vest won't hinder it's owner as much, and can be activated every 7 seconds. Also comes with even more armor plating."
	item = /obj/item/clothing/suit/armor/reactive/syndicate/table
	cost = 12
	surplus = 10
	progression_minimum = 30 MINUTES
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/armor/reactivehallucinatingsyndicate
	name = "Augmented Hallucination Vest"
	desc = "This vest has most of the same properties as NT's Reactive Hallucination Armor. But we've outfitted it with some armor plating. \
			Additionally, this vest will provide more protection than our other augmented armors and can be activated every 4 seconds."
	item = /obj/item/clothing/suit/armor/reactive/syndicate/hallucinating
	cost = 12
	surplus = 10
	progression_minimum = 30 MINUTES
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/armor/reactiveradiationsyndicate
	name = "Augmented Radioactive Vest"
	desc = "This vest has most of the same properties as NT's Reactive Radioactive Armor. But we've outfitted it with some armor plating. \
			Additionally, this vest outputs radiation in a slightly larger radius and the output has been increased by 10x. Comes with free radiation protection."
	item = /obj/item/clothing/suit/armor/reactive/syndicate/radiation
	cost = 12
	surplus = 10
	progression_minimum = 30 MINUTES
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/armor/reactivebioscramblingsyndicate
	name = "Augmented Bioscrambling Vest"
	desc = "This vest has most of the same properties as NT's Reactive Bioscrambling Armor. But we've outfitted it with some armor plating. \
			The range of this vest's effects are doubled."
	item = /obj/item/clothing/suit/armor/reactive/syndicate/bioscrambling
	cost = 12
	surplus = 10
	progression_minimum = 30 MINUTES
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/armor/reactivebarricadesyndicate
	name = "Augmented Barricade Vest"
	desc = "This vest has most of the same properties as NT's Reactive Barricade Armor. But we've outfitted it with some armor plating. \
			Additionally, this vest will provide more protection than our other augmented armors and can be activated twice as often."
	item = /obj/item/clothing/suit/armor/reactive/syndicate/barricade
	cost = 12
	surplus = 10
	progression_minimum = 30 MINUTES
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/armor/reactiveectoplasmsyndicate
	name = "Augmented Ectoplasm Vest"
	desc = "This vest has most of the same properties as NT's Reactive Ectoplasm Armor. But we've outfitted it with some armor plating. \
			It's special effects can activate twice as often, have increased range and last longer."
	item = /obj/item/clothing/suit/armor/reactive/syndicate/ectoplasm
	cost = 12
	surplus = 10
	progression_minimum = 30 MINUTES
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/armor/dermal_harden
	name = "Dermal Hardening Cigarettes"
	desc = "This packet of cigarettes is loaded with nanites specifically programmed to grant the smoker increased resistance to all forms of damage. \
			Additionally, the cigarettes stabilize the smokers temperature and provide slight healing over time. \
			A single cigarette will take roughly 4 minutes to smoke. A single purchase can grant up to roughly 24 minutes of protection. Doesn't come with a lighter."
	item = /obj/item/storage/fancy/cigarettes/dermal_harden
	cost = 5
	surplus = 15

/datum/uplink_item/armor/raid
	name = "Syndicate Raid MODsuit"
	desc = "A syndicate MODsuit specifically designed to not inhibit the wearer's mobility at the cost of it's space faring capabilities. \
			Capable of sustaining heavy damage with minimal slowdown. Please contact 1900 Donk Co. for any complaints."
	item = /obj/item/mod/control/pre_equipped/raid
	progression_minimum = 20 MINUTES
	cost = 12
	surplus = 20
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/armor/suicide_vest
	name = "Suicide Vest"
	desc = "A bulletproof vest outfitted with explosives. When worn, it cannot be taken off. \
			It still provides a decent amount of protection and has a large explosion radius. \
			A favorite among those who'd like to die a glorious death."
	item = /obj/item/clothing/suit/armor/suicide
	cost = 13
	surplus = 0
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND
