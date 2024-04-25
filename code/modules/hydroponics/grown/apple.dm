// Apple
/obj/item/seeds/apple
	name = "pack of apple seeds"
	desc = "These seeds grow into apple trees."
	icon_state = "seed-apple"
	species = "apple"
	plantname = "Apple Tree"
	product = /obj/item/food/grown/apple
	lifespan = 55
	endurance = 35
	yield = 5
	growing_icon = 'icons/obj/service/hydroponics/growing_fruits.dmi'
	icon_grow = "apple-grow"
	icon_dead = "apple-dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest, /datum/plant_gene/trait/one_bite)
	mutatelist = list(/obj/item/seeds/apple/gold)
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)

/obj/item/food/grown/apple
	seed = /obj/item/seeds/apple
	name = "apple"
	desc = "It's a little piece of Eden."
	icon_state = "apple"
	foodtypes = FRUIT
	juice_typepath = /datum/reagent/consumable/applejuice
	tastes = list("apple" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/hcider

/obj/item/food/grown/apple/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/appleslice, 5, 20, screentip_verb = "Slice")

// Gold Apple
/obj/item/seeds/apple/gold
	name = "pack of golden apple seeds"
	desc = "These seeds grow into golden apple trees. Good thing there are no firebirds in space."
	icon_state = "seed-goldapple"
	species = "goldapple"
	plantname = "Golden Apple Tree"
	product = /obj/item/food/grown/apple/gold
	maturation = 10
	production = 10
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = null
	reagents_add = list(/datum/reagent/gold = 0.2, /datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	rarity = 40 // Alchemy!

/obj/item/food/grown/apple/gold/make_processable()
	return // You're going to break your knife!

/obj/item/food/grown/apple/gold
	seed = /obj/item/seeds/apple/gold
	name = "golden apple"
	desc = "Emblazoned upon the apple is the word 'Kallisti'."
	icon_state = "goldapple"
	distill_reagent = null
	wine_power = 50

// Insert "Notch Apple" in a later update here -- by hyperjll

///

/obj/item/seeds/apple/gold/notch/enchanted
	name = "pack of enchanted notch apple seeds"
	desc = "These seeds grow into enchanted notch apple trees. The seeds look incredibly fragile."
	icon_state = "seed-goldapple"
	species = "enotchapple"
	plantname = "Enchanted Notch Apple Tree"
	product = /obj/item/food/grown/apple/gold/notch/enchanted
	maturation = 30
	production = 20
	potency = 100
	lifespan = 5
	endurance = 5
	mutatelist = list()
	/**
	growing_icon = 'icons/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "notchapple-grow"
	icon_dead = "apple-dead"
	icon_harvest = "notchapple-harvest"
	**/
	reagents_add = list(/datum/reagent/medicine/enchantedsupergold = 0.5)
	rarity = 100 // MAGICS!

/obj/item/food/grown/apple/gold/notch/enchanted
	seed = /obj/item/seeds/apple/gold/notch/enchanted
	name = "enchanted notch apple"
	desc = "It's wonderful to look at."
	icon_state = "enotchapple"
	filling_color = "#FFD700"
	distill_reagent = null
	bite_consumption_mod = 10
	wine_power = 100
