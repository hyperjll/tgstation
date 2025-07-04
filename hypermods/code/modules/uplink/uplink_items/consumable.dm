/datum/uplink_category/consumable
	name = "Consumables"
	weight = 8

/datum/uplink_item/consumable
	category = /datum/uplink_category/consumable
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND


/datum/uplink_item/consumable/manifold_autoinjector
	name = "Hereditary Manifold Sickness Injector"
	desc = "An autoinjector for a permanent, incurable disease that'll slowly destroy it's victim. \
			The disease can only be suppressed via experimental medication."
	item = /obj/item/reagent_containers/hypospray/medipen/manifoldinjector
	cost = 5
	surplus = 25
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/consumable/stimpack
	name = "Stimpack"
	desc = "Stimpacks, the tool of many great heroes, make you nearly immune to stuns and knockdowns for about \
			5 minutes after injection. Additionally, it grants a 40% increase to grounded movement speed and \
			slight healing while injured but not in critical state."
	item = /obj/item/reagent_containers/hypospray/medipen/stimulants
	cost = 3
	surplus = 90
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND


/datum/uplink_item/consumable/experistimpack
	name = "Experimental Stimpack"
	desc = "One of our (in-development) Syndicate Stimpacks, they make you nearly immune to stuns and knockdowns for about 5 minutes after injection. \
			Additionally, it grants a 80% increase to grounded movement speed and 10% resistance to incoming brute and burn damage. Slowly heals brute and burn damage. \
			These drugs are POTENT and will slowly poison the host in addition to putting strain upon the heart. Refrain from using any more than 2 at a time."
	item = /obj/item/reagent_containers/hypospray/medipen/experistimulants
	cost = 5
	surplus = 50
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/consumable/donkcostimpack
	name = "Donk Co. Stimpack"
	desc = "A certified Donk Co.(tm) Stimpack! Can be used up to SIX times to provide 160% increased movement speed, healing, \
			greater stun resistance, temporary blood restoration, quick oxyloss healing, and temperature stabilization. \
			Each dose only lasts around 10 seconds but the effects are POTENT. Side-effects may occur if more than one dose is used."
	item = /obj/item/reagent_containers/hypospray/medipen/donkcostim
	cost = 5
	surplus = 40
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/consumable/hyperzinepack
	name = "Hyperzine Injector"
	desc = "A stimulant injector, containing 30u of hyperzine: enough chems to keep you running fast \
			and resistant to stuns for 30 seconds. Unlike other stimulants, this chemical mix \
			greatly increases the metabolism of the user, resulting in weight loss and rapid regeneration."
	item = /obj/item/reagent_containers/hypospray/medipen/hyperzine
	cost = 4
	surplus = 40
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/consumable/juggernaut
	name = "Juggernaut Stimpack"
	desc = "The famous syndicate juggernaut stimpack, modeled after the even-more-famous regular stimpack, will nullify \
			all pain within the user and reduce incoming brute and burn damage by 20% while slowing healing those damage types."
	item = /obj/item/reagent_containers/hypospray/medipen/juggernaut
	cost = 8
	surplus = 65
	purchasable_from = UPLINK_SERIOUS_OPS
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

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
	uplink_item_flags = null

/datum/uplink_item/consumable/coffeeplus
	name = "Waffle Co. Coffee"
	desc = "An inconspicuous cup of coffee with some of Waffle Co.'s finest brewed coffee. \
			Drinking the contents within will temporarily grant an extra 20% movement speed, \
			minor regeneration, and near immunity to drowsiness and exhaustion. \
			The brew even clears your bloodstream of various tranquilizing chemicals and \
			helps keep you warm! The perfect drink for your morning breakfast!"
	item = /obj/item/reagent_containers/cup/glass/coffee/plus
	cost = 4
	surplus = 15

/datum/uplink_item/consumable/mysteryfizz
	name = "Mystery Fizz Six-Pack"
	desc = "A six-pack of Fizzfazz's trademark 'mystery' soda! \
			We've heard these soda's can often contain some seriously powerful reagents. \
			Are you feeling lucky?"
	item = /obj/item/storage/cans/sixmystery
	cost = 2

/datum/uplink_item/consumable/syndiecigs
	name = "Syndicate Smokes"
	desc = "Strong flavor, dense smoke, infused with omnizine. Perfect for on-the-go healing."
	item = /obj/item/storage/fancy/cigarettes/cigpack_syndicate
	cost = 1
	uplink_item_flags = SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/consumable/syndiecigsvarietypack
	name = "Syndicate Variety Cigarettes"
	desc = "Four different cigarette packs that resemble your regular nanotrasen approved brands. \
			Each packet of cigarettes contains one of the following: Salicylic Acid, Oxandrolone, Salbutamol, and Pentetic Acid."
	item = /obj/item/storage/medkit/syndiecigsvarietypack
	cost = 2
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

/datum/uplink_item/consumable/saturnx
	name = "Stable Saturn-X Autoinjector"
	desc = "An autoinjector containing a stabilized Saturn-X compound. \
			Causes the user to become invisible for a limited time, clothes will NOT become invisible. \
			A single dose is estimated to last over 3 minutes."
	item = /obj/item/reagent_containers/hypospray/medipen/invisibility/stable
	cost = 1 // Really situational, cuz you gotta drop naked to make use of this.

/datum/uplink_item/consumable/pumpupplus
	name = "Pump-Up Plus Autoinjector"
	desc = "An autoinjector containing an improved version of 'Pump-Up' a cheap adrenaline-based street drug. \
			While under it's effects, you'll be rendered completely immune to Knockdowns and recieved increased stamina regeneration. \
			A single dose is estimated to last 5 minutes."
	item = /obj/item/reagent_containers/hypospray/medipen/pumpupplus
	cost = 2

/**
/datum/uplink_item/consumable/syndicryo
	name = "Cryogelidia Pills"
	desc = "A single bottle of pills containing Cryogelidia, a chemical which freezes you in a protective block of ice. \
			The block of ice will turn off and on as the chemical continues metabolizing. \
			Best used to stall for time or as a defense mechanism, as this renders escape from pursuers hopeless. \
			Each pill also contains some healing chemicals to help buy time."
	item = /obj/item/storage/pill_bottle/syndicryo
	cost = 3
**/

/datum/uplink_item/consumable/syndicryo
	name = "Cryogelidia Medipen"
	desc = "A single medipen containing Cryogelidia, a chemical which freezes you in a protective block of ice. \
			Best used to stall for time or as a defense mechanism, as this renders escape from pursuers hopeless. \
			Also contains some healing chemicals to help buy time."
	item = /obj/item/reagent_containers/hypospray/medipen/syndicryogel
	cost = 2

/datum/uplink_item/consumable/eigenstasium
	name = "Eigenstasium Bottle"
	desc = "A single bottle of Eigenstasium, a unique chemical capable of locking your position within space and teleporting you back \
			to where you first drank it. Be mindful that you leave behind an image of yourself when you first drink it, \
			letting everyone know where you'll inevitably teleport back too. You may drink more to increase the time you have \
			before teleporting back."
	item = /obj/item/reagent_containers/cup/glass/bottle/eigenstasium
	cost = 4

/datum/uplink_item/consumable/shrink
	name = "Shrink Serum"
	desc = "A single six-use medipen using an older design. \
			Those under the effects of the serum will slowly shrink via molecular compression. \
			Not only will you be harder to hit, but you'll be small enough to move past most people without bumping into them. \
			Due to molecular compression and the user's tiny size, you'll be far more vulnerable under the influence of this drug. \
			The effects may be extended with additional usage with no side effects."
	item = /obj/item/reagent_containers/hypospray/medipen/shrink
	cost = 8
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/consumable/final_fortuna
	name = "Final Fortuna"
	desc = "A highly illegal cocktail of drugs designed to keep you alive for up to a minute, however once it leaves your system it causes massive brain damage. \
			Often used as a last resort. Limited one per agent."
	item = /obj/item/reagent_containers/hypospray/medipen/final_fortuna
	cost = 5
	purchasable_from = UPLINK_TRAITORS
	limited_stock = 1
	uplink_item_flags = SYNDIE_ILLEGAL_TECH | SYNDIE_ITEM_SEC_FULTONABLE | SYNDIE_TRIPS_CONTRABAND
