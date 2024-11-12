/datum/uplink_category/melee
	name = "Melee Weapons"
	weight = 25

/datum/uplink_item/melee
	category = /datum/uplink_category/melee
	uplink_item_flags = SYNDIE_ILLEGAL_TECH


/datum/uplink_item/melee/sword
	name = "Energy Sword"
	desc = "The energy sword is an edged weapon with a blade of pure energy. The sword is small enough to be \
			pocketed when inactive. Activating it produces a loud, distinctive noise."
	progression_minimum = 20 MINUTES
	item = /obj/item/melee/energy/sword/saber
	cost = 6
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/melee/powerfist
	name = "Power Fist"
	desc = "The power-fist is a metal gauntlet with a built-in piston-ram powered by an external gas supply.\
			Upon hitting a target, the piston-ram will extend forward to make contact for some serious damage. \
			Using a wrench on the piston valve will allow you to tweak the amount of gas used per punch to \
			deal extra damage and hit targets further. Use a screwdriver to take out any attached tanks."
	progression_minimum = 20 MINUTES
	item = /obj/item/melee/powerfist
	cost = 6
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/melee/rapid
	name = "Gloves of the North Star"
	desc = "These gloves let the user punch people very fast. Does not improve weapon attack speed or the meaty fists of a hulk."
	progression_minimum = 20 MINUTES
	item = /obj/item/clothing/gloves/rapid
	cost = 8

/datum/uplink_item/melee/doublesword
	name = "Double-Bladed Energy Sword"
	desc = "The double-bladed energy sword does slightly more damage than a standard energy sword and will deflect \
			energy projectiles it blocks, but requires two hands to wield. It also struggles to protect you from tackles."
	progression_minimum = 30 MINUTES
	item = /obj/item/dualsaber
	cost = 13
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS //nukies get their own version

/datum/uplink_item/melee/doublesword/get_discount_value(discount_type)
	switch(discount_type)
		if(TRAITOR_DISCOUNT_BIG)
			return 0.5
		if(TRAITOR_DISCOUNT_AVERAGE)
			return 0.35
		else
			return 0.2


/datum/uplink_item/melee/backstab
	name = "Backstabbing Switchblade"
	desc = "This switchblade has a unique shape that makes it especially lethal when lodged in someone's backside. \
			Still does a moderate amount of damage when applied from the front."
	item = /obj/item/switchblade/backstab
	cost = 4

/datum/uplink_item/melee/beesword
	name = "The Stinger"
	desc = "A sword provided to high-ranking staff of the Bee Liberation Front and often seen as it's 'pride and joy'. \
			The sword has a 20% chance to block attacks, has high armor penetration and applies 6 units of Histamine on hit. \
			Small enough to fit within a backpack."
	item = /obj/item/melee/beelibsword
	progression_minimum = 15 MINUTES
	surplus = 30
	cost = 7

/datum/uplink_item/melee/trident
	name = "Electrified Trident"
	desc = "A trident rumored to have been recovered from the city of atlantis. \
			It deals moderate damage, and twice as much if thrown. Targets attacked by \
			this weapon will have teslium manifested within their blood, leading to electrical shocks."
	item = /obj/item/trident/electrified
	progression_minimum = 25 MINUTES
	surplus = 20
	cost = 9

/datum/uplink_item/melee/bostaff
	name = "Bo Staff"
	desc = "A wielded wooden staff that can be used to incapacitate opponents if you dont intent to harm them. This often results in knocking your targets unconscious for a brief period of time."
	item = /obj/item/melee/bostaff
	cost = 8

/datum/uplink_item/melee/katana
	name = "Katana"
	desc = "A brilliantly made katana capable of major damage against pretty much anyone. Has high damage, blocking ability, and inflicts wounds easily. \
			Doesn't do anything special other than kill, for when you just want to get the job done. Not easily concealable."
	item = /obj/item/katana
	progression_minimum = 25 MINUTES
	surplus = 25
	cost = 10

/datum/uplink_item/melee/vxtvulhammer
	name = "Vxtvul Hammer"
	desc = "A relic sledgehammer with charge packs wired to two blast pads on its head. \
			While wielded in two hands, the user can charge a massive blow that will shatter construction, \
			hurl bodies, and demolish mechs. Not easily concealable."
	item = /obj/item/melee/vxtvulhammer
	progression_minimum = 30 MINUTES
	surplus = 25
	cost = 12

/datum/uplink_item/melee/espear
	name = "Energy Spear"
	desc = "A spear fashioned from iron and titanium, it incorporates hardlight technology to form the pointy-end. \
			Turns on when wielded, and makes no noise when doing so. More effective against all targets than our energy swords and possesses high armor-piercing. \
			Deals nearby double it's damage when thrown and our hardlight technology will ensure the spear remains embedded. \
			Not easily concealable. Has high durability but will eventually break."
	item = /obj/item/spear/energy/red
	progression_minimum = 30 MINUTES
	surplus = 20
	cost = 10

/datum/uplink_item/melee/echainsaw
	name = "Energy Chainsaw"
	desc = "A 'Champions-of-Evil' branded chainsaw utilizing hardlight technology for it's countless razor-like blades. \
			Excellent for demolishing structures and ripping (and tearing) your foes apart! \
			Deals significantly high damage, though it's difficult to conceal and lumber around. \
			Excellent when used with one of our Anti-Drop implants."
	item = /obj/item/chainsaw/energy
	progression_minimum = 30 MINUTES
	surplus = 0
	cost = 15

/datum/uplink_item/melee/fireyaxe
	name = "Fire-y Axe"
	desc = "A classic fire axe that's been augmented with advanced atmospheric incendiary technology. \
			In addition to being a fireaxe, it'll light your victims ablaze with every hit."
	item = /obj/item/fireaxe/firey
	progression_minimum = 30 MINUTES
	cost = 10
	surplus = 25
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/melee/energy_fire_axe
	name = "Energy Fire Axe"
	desc = "A terrifying axe with a blade of pure energy, able to tear down structures with ease. \
			Easier to store than a standard fire axe while inactive. Has high blocking ability and armor penetration while active."
	item = /obj/item/fireaxe/energy
	progression_minimum = 30 MINUTES
	cost = 14
	surplus = 0
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/melee/knifevenom
	name = "Reagent Knife (Venom)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Venom. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. An excellent backup for agents all around."
	item = /obj/item/knife/combat/survival/chemical/venom
	cost = 3
	surplus = 35
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/melee/knifelexorin
	name = "Reagent Knife (Lexorin)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Lexorin. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. Excellent in taking down opponents without self-respiration."
	item = /obj/item/knife/combat/survival/chemical/lexorin
	cost = 6
	surplus = 35
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/melee/knifeamanitin
	name = "Reagent Knife (Amanitin)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Amanitin. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. Excellent for ensuring the target stays down for the count -- even after being rescued."
	item = /obj/item/knife/combat/survival/chemical/amanitin
	cost = 4
	surplus = 35
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/melee/knifestaminatoxin
	name = "Reagent Knife (Tirizene)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Tirizene. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. Excellent for quick take-downs."
	item = /obj/item/knife/combat/survival/chemical/staminatoxin
	cost = 2
	surplus = 35
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/melee/knifecurare
	name = "Reagent Knife (Curare)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Curare. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. Extremely effective against all non-silicon targets."
	item = /obj/item/knife/combat/survival/chemical/curare
	cost = 6
	surplus = 35
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/melee/knifeinitropidril
	name = "Reagent Knife (Initropidril)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Initropidril. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. Often wins your fights for you -- if you're lucky."
	item = /obj/item/knife/combat/survival/chemical/initropidril
	cost = 8
	surplus = 35
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/melee/knifepancuronium
	name = "Reagent Knife (Pancuronium)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Pancuronium. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. A decent stun and poison combo."
	item = /obj/item/knife/combat/survival/chemical/pancuronium
	cost = 6
	surplus = 35
	purchasable_from = ~UPLINK_SPY

/datum/uplink_item/melee/knifeheparin
	name = "Reagent Knife (Heparin)"
	desc = "A seemingly normal survival knife equipped with one of our redspace generators, it produces an endless supply of Heparin. \
			The chemicals within are immediately applied to the target's bloodstream when attacking. Excellent in bleeding victims out."
	item = /obj/item/knife/combat/survival/chemical/heparin
	cost = 2
	surplus = 35
	purchasable_from = ~UPLINK_SPY
