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
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "enotchapple"
	filling_color = "#FFD700"
	distill_reagent = null
	bite_consumption_mod = 10
	wine_power = 100
