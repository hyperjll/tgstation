/datum/uplink_category/consumable
	name = "Consumables"
	weight = 8

/datum/uplink_item/consumable
	category = /datum/uplink_category/consumable


/datum/uplink_item/consumable/manifold_autoinjector
	name = "Hereditary Manifold Sickness Injector"
	desc = "An autoinjector for a permanent, incurable disease that'll slowly destroy it's victim. \
			The disease can only be suppressed via experimental medication."
	item = /obj/item/reagent_containers/hypospray/medipen/manifoldinjector
	cost = 5
	surplus = 25

/datum/uplink_item/consumable/stimpack
	name = "Stimpack"
	desc = "Stimpacks, the tool of many great heroes, make you nearly immune to stuns and knockdowns for about \
			5 minutes after injection. Additionally, it grants a 40% increase to grounded movement speed and \
			slight healing while injured but not in critical state."
	item = /obj/item/reagent_containers/hypospray/medipen/stimulants
	cost = 3
	surplus = 90
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND


/datum/uplink_item/consumable/experistimpack
	name = "Experimental Stimpack"
	desc = "One of our (in-development) Syndicate Stimpacks, they make you nearly immune to stuns and knockdowns for about 5 minutes after injection. \
			Additionally, it grants a 80% increase to grounded movement speed and 10% resistance to incoming brute and burn damage. Slowly heals brute and burn damage. \
			These drugs are POTENT and will slowly poison the host in addition to putting strain upon the heart. Refrain from using any more than 2 at a time."
	item = /obj/item/reagent_containers/hypospray/medipen/experistimulants
	cost = 5
	surplus = 50
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/consumable/donkcostimpack
	name = "Donk Co. Stimpack"
	desc = "A certified Donk Co.(tm) Stimpack! Can be used up to SIX times to provide 160% increased movement speed, healing, \
			greater stun resistance, temporary blood restoration, quick oxyloss healing, and temperature stabilization. \
			Each dose only lasts around 10 seconds but the effects are POTENT. Side-effects may occur if more than one dose is used."
	item = /obj/item/reagent_containers/hypospray/medipen/donkcostim
	cost = 5
	surplus = 40
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/consumable/hyperzinepack
	name = "Hyperzine Injector"
	desc = "A stimulant injector, containing 30u of hyperzine: enough chems to keep you running fast \
			and resistant to stuns for 30 seconds. Unlike other stimulants, this chemical mix \
			greatly increases the metabolism of the user, resulting in weight loss and rapid regeneration."
	item = /obj/item/reagent_containers/hypospray/medipen/hyperzine
	cost = 4
	surplus = 40
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/consumable/juggernaut
	name = "Juggernaut Stimpack"
	desc = "The famous syndicate juggernaut stimpack, modeled after the even-more-famous regular stimpack, will nullify \
			all pain within the user and reduce incoming brute and burn damage by 20% while slowing healing those damage types."
	item = /obj/item/reagent_containers/hypospray/medipen/juggernaut
	cost = 8
	surplus = 65
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/consumable/stimulant_kit
	name = "Stimpack kit"
	desc = "A box containing 5 random stimpacks, can include some stimpacks not normally available for sale."
	item = /obj/item/storage/box/syndie_kit/stimulant_kit
	cost = 15
	surplus = 30
	limited_stock = 1
	cant_discount = TRUE
	progression_minimum = 20 MINUTES

/datum/uplink_item/consumable/enchantedgoldenapple
	name = "Enchanted Golden Apple"
	desc = "An extremely potent magical apple, rumored to have originated from another universe. It grants the one who eats it incredible regeneration, increased health, extreme resistance to fire, and resistance against all damage for 4 minutes."
	item = /obj/item/food/grown/apple/gold/notch/enchanted
	cost = 10
	surplus = 5

/datum/uplink_item/consumable/magicrockcandy
	name = "Magical Rock Candy"
	desc = "An almost mythical treat well-known across the spinward sector for it's indescribable, almost magical taste. \
			After eaten, it provides long-term healing, energy, vitality, and even boosts the consumers natural defenses while it metabolizes."
	item = /obj/item/food/magicrockcandy
	cost = 5
	surplus = 5

/datum/uplink_item/consumable/syndiecigs
	name = "Syndicate Smokes"
	desc = "Strong flavor, dense smoke, infused with omnizine."
	item = /obj/item/storage/fancy/cigarettes/cigpack_syndicate
	cost = 2
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/consumable/syndiecigsvarietypack
	name = "Syndicate Variety Cigarettes"
	desc = "Four different cigarette packs that resemble your regular nanotrasen approved brands. \
			Each packet of cigarettes contains one of the following: Salicylic Acid, Oxandrolone, Salbutamol, and Pentetic Acid."
	item = /obj/item/storage/medkit/syndiecigsvarietypack
	cost = 3
	surplus = 50
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/consumable/syndiecigsvarietypackdeluxe
	name = "Syndicate Variety Cigarettes Deluxe Edition"
	desc = "Contains 9 cigarette packs that give up on stealth for increased benefits, but you get atleast 1 decent pack for healing brute, burn, toxins, and aspyxiation. \
			Additionally, we've included several other packs of cigarettes with varying useful chemicals. Also includes a lighter."
	item = /obj/item/storage/medkit/syndiecigsvarietypackdeluxe
	cost = 6
	surplus = 30
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
