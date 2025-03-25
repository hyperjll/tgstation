/obj/item/seeds/carrot/gold
	name = "golden carrot seed pack"
	desc = "These seeds grow into special golden carrots. Known for their healing properties."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-goldcarrot"
	species = "goldcarrot"
	plantname = "Golden Carrots"
	product = /obj/item/food/grown/carrot/gold
	maturation = 10
	production = 1
	yield = 5
	growthstages = 3
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_vegetables.dmi'
	mutatelist = list()
	reagents_add = list(/datum/reagent/medicine/oculine = 0.3, /datum/reagent/consumable/nutriment = 0.08, /datum/reagent/medicine/enchantedgold = 0.05)

/obj/item/food/grown/carrot/gold
	seed = /obj/item/seeds/carrot/gold
	name = "golden carrot"
	desc = "It's REALLY good for the eyes!"
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "goldencarrot"
	filling_color = "#FFA500"
	bite_consumption_mod = 2
	foodtypes = VEGETABLES
	wine_power = 30
