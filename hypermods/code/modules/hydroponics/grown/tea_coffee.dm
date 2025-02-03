/obj/item/seeds/coffee/mocha
	name = "coffee mocha seed pack"
	desc = "These seeds grow into coffee mocha bushes."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-coffeem"
	species = "coffeem"
	plantname = "Coffee Mocha Bush"
	product = /obj/item/food/grown/coffee/mocha
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing.dmi'
	icon_grow = "coffeem-grow"
	icon_dead = "coffee-dead"
	icon_harvest = "coffeem-harvest"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = list()
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.02, /datum/reagent/toxin/coffeepowder = 0.1, /datum/reagent/consumable/creamer = 0.1)

/obj/item/food/grown/coffee/mocha
	seed = /obj/item/seeds/coffee/mocha
	name = "coffee mocha beans"
	desc = "Dry them out to make some sweet, delicious mocha coffee."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "coffee_mocha"
