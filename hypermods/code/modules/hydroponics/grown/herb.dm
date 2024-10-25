/obj/item/seeds/contusine
	name = "contusine seed pack"
	desc = "These seeds grow into contusine."
	icon = 'hypermods/icons/obj/service/hydroponics/goon/seeds.dmi'
	icon_state = "seed-contusine"
	species = "contusine"
	plantname = "Contusine"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/goon/plants_herb.dmi'
	icon_harvest = "Contusine-harvest"
	icon_grow = "Contusine-G"
	icon_dead = "Contusine-dead"
	product = /obj/item/food/grown/contusine
	maturation = 15
	production = 8
	growthstages = 3
	mutatelist = list(/obj/item/seeds/contusine/shivering, /obj/item/seeds/contusine/quivering)
	reagents_add = list(/datum/reagent/medicine/sal_acid = 0.1)
	rarity = 28
	/// Used to offset the plant sprite so that it appears at proper height in the tray
	plant_icon_offset = 0 // Was 8 but goon sprites are shifted upwards

/obj/item/food/grown/contusine
	seed = /obj/item/seeds/contusine
	name = "contusine leaves"
	desc = "Dry, bitter leaves known for their wound-mending properties."
	icon = 'hypermods/icons/obj/service/hydroponics/goon/items_hydroponics.dmi'
	icon_state = "contusine"
	filling_color = "#ef0a33"
	distill_reagent = null
	bite_consumption_mod = 1
	wine_power = 4


/obj/item/seeds/contusine/shivering
	name = "shivering contusine seed pack"
	desc = "These seeds grow into shivering contusine."
	icon = 'hypermods/icons/obj/service/hydroponics/goon/seeds.dmi'
	icon_state = "seed-contusine-s"
	species = "contusine-s"
	plantname = "Shivering Contusine"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/goon/plants_herb.dmi'
	icon_harvest = "ContusineShivering-harvest"
	icon_grow = "ContusineShivering-G"
	icon_dead = "ContusineShivering-dead"
	product = /obj/item/food/grown/contusine/shivering
	maturation = 15
	production = 10
	growthstages = 3
	mutatelist = list()
	reagents_add = list(/datum/reagent/medicine/sal_acid = 0.1, /datum/reagent/medicine/salbutamol = 0.1)
	rarity = 35
	/// Used to offset the plant sprite so that it appears at proper height in the tray
	plant_icon_offset = 0 // Was 8 but goon sprites are shifted upwards

/obj/item/food/grown/contusine/shivering
	seed = /obj/item/seeds/contusine/shivering
	name = "shivering contusine leaves"
	desc = "Dry, bitter leaves known for their wound-mending properties. The leaves almost appear to be breathing."
	icon = 'hypermods/icons/obj/service/hydroponics/goon/items_hydroponics.dmi'
	icon_state = "contusine-s"
	filling_color = "#ef0a33"
	distill_reagent = null
	bite_consumption_mod = 1
	wine_power = 8

/obj/item/seeds/contusine/quivering
	name = "quivering contusine seed pack"
	desc = "These seeds grow into quivering contusine."
	icon = 'hypermods/icons/obj/service/hydroponics/goon/seeds.dmi'
	icon_state = "seed-contusine-q"
	species = "contusine-q"
	plantname = "Quivering Contusine"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/goon/plants_herb.dmi'
	icon_harvest = "ContusineQuivering-harvest"
	icon_grow = "ContusineQuivering-G"
	icon_dead = "ContusineQuivering-dead"
	product = /obj/item/food/grown/contusine/quivering
	maturation = 15
	production = 10
	growthstages = 3
	mutatelist = list()
	reagents_add = list(/datum/reagent/medicine/sal_acid = 0.1, /datum/reagent/toxin/histamine = 0.2)
	rarity = 35
	/// Used to offset the plant sprite so that it appears at proper height in the tray
	plant_icon_offset = 0 // Was 8 but goon sprites are shifted upwards

/obj/item/food/grown/contusine/quivering
	seed = /obj/item/seeds/contusine/quivering
	name = "quivering contusine leaves"
	desc = "Dry, bitter leaves known for their wound-mending properties. The squirming leaves make your skin crawl."
	icon = 'hypermods/icons/obj/service/hydroponics/goon/items_hydroponics.dmi'
	icon_state = "contusine-q"
	filling_color = "#ef0a33"
	distill_reagent = null
	bite_consumption_mod = 1
	wine_power = 8
