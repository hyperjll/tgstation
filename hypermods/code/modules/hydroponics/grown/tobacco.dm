/obj/item/seeds/twobacco
	name = "twobacco seed pack"
	desc = "These seeds grow into twobacco plants."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-twobacco"
	species = "twobacco"
	plantname = "Twobacco Plant"
	product = /obj/item/food/grown/twobacco
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing.dmi'
	icon_grow = "twobacco-grow"
	icon_dead = "tobacco-dead"
	icon_harvest = "twobacco-harvest"
	mutatelist = list()
	reagents_add = list(/datum/reagent/drug/nicotine = 0.06, /datum/reagent/drug/nicotwaine = 0.01, /datum/reagent/consumable/nutriment = 0.03)

/obj/item/food/grown/twobacco
	seed = /obj/item/seeds/twobacco
	name = "twobacco leaves"
	desc = "Not meant for the financially responsible."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "twobacco_leaves"
