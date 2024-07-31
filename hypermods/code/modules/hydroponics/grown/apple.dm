/obj/item/seeds/apple/gold/notch
	name = "notch apple seed pack"
	desc = "These seeds grow into notch apple trees. Something very wonderful was occured within them, granting them healing properties."
	icon_state = "seed-goldapple"
	species = "notchapple"
	plantname = "Notch Apple Tree"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_fruits.dmi'
	icon_harvest = "notchapple-harvest"
	icon_grow = "notchapple-grow"
	icon_dead = "notchapple-dead"
	product = /obj/item/food/grown/apple/gold/notch
	maturation = 15
	production = 15
	mutatelist = list()
	reagents_add = list(/datum/reagent/gold = 0.4, /datum/reagent/consumable/nutriment = 0.1, /datum/reagent/medicine/enchantedgold = 0.1)
	rarity = 80 // Alchemy!

/obj/item/food/grown/apple/gold/notch
	seed = /obj/item/seeds/apple/gold/notch
	name = "notch apple"
	desc = "It's strangely blocky in texture."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "notchapple"
	filling_color = "#FFD700"
	distill_reagent = null
	bite_consumption_mod = 10
	wine_power = 80

/obj/item/seeds/apple/gold/notch/enchanted
	name = "enchanted notch apple seed pack"
	desc = "These seeds grow into enchanted notch apple trees. The seeds look incredibly fragile."
	icon_state = "seed-goldapple"
	species = "enotchapple"
	plantname = "Enchanted Notch Apple Tree"
	product = /obj/item/food/grown/apple/gold/notch/enchanted
	maturation = 30
	production = 20
	potency = 100
	lifespan = 0 // Instantly starts to die
	endurance = 1 // 1 HP, better have diethlyamine and enduro-grow ready/
	mutatelist = list()
	icon_harvest = "enotchapple-harvest"
	icon_grow = "notchapple-grow"
	icon_dead = "notchapple-dead"
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
