/obj/item/seeds/chili/rainbow
	name = "rainbow chili seed pack"
	desc = "These seeds grow into rainbow chili plants."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-rainbowchili"
	species = "rainbowchili"
	plantname = "Rainbow Chili Plants"
	product = /obj/item/food/grown/chili/rainbow
	lifespan = 20
	maturation = 5
	production = 5
	yield = 4
	potency = 20
	instability = 30
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_vegetables.dmi'
	icon_grow = "rainbowchili-grow" // Uses one growth icons set for all the subtypes
	icon_dead = "rainbowchili-dead" // Same for the dead icon
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = list()
	reagents_add = list(/datum/reagent/consumable/rainbow_chili = 0.1, /datum/reagent/consumable/nutriment/vitamin = 0.02, /datum/reagent/consumable/nutriment = 0.02)

/obj/item/food/grown/chili/rainbow
	seed = /obj/item/seeds/chili/rainbow
	name = "rainbow chili"
	desc = "It's... it's... whispering sweet nothings to me..."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "rainbow_chilipepper"
