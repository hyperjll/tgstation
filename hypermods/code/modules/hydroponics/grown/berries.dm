/obj/item/seeds/lanternfruit/oilbulb
	name = "oil bulb seed pack"
	desc = "These seeds grow into oil bulbs."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-oilbulb"
	species = "oilbulb"
	plantname = "Oil Bulbs"
	product = /obj/item/food/grown/oilbulb
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_fruits.dmi'
	icon_grow = "oilbulb-grow"
	icon_dead = "oilbulb-dead"
	icon_harvest = "oilbulb-harvest"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = null
	reagents_add = list(/datum/reagent/fuel/oil = 0.1, /datum/reagent/napalm = 0.03, /datum/reagent/phlogiston = 0.02)
	graft_gene = /datum/plant_gene/trait/glow/yellow

/obj/item/food/grown/oilbulb
	seed = /obj/item/seeds/lanternfruit/oilbulb
	name = "oil bulb"
	desc = "A transparent fruit with a handle-shaped stem. It's got a strange, black liquid within it."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "oilbulb"
	foodtypes = FRUIT
	tastes = list("oil slick worlds" = 1, "industrial" = 1, "robot fuel" = 1)
