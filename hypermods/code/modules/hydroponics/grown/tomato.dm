/obj/item/seeds/tomato/seething
	name = "seething tomato seed pack"
	desc = "These seeds grow into incendiary tomato plants."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-seethingtomato"
	species = "seethingtomato"
	plantname = "Seething Tomato Plants"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_fruits.dmi'
	icon_grow = "seethingtomato-grow" // Uses one growth icons set for all the subtypes
	icon_dead = "seethingtomato-dead"
	product = /obj/item/food/grown/tomato/seething
	mutatelist = null
	reagents_add = list(/datum/reagent/clf3 = 0.1)

/obj/item/food/grown/tomato/seething
	seed = /obj/item/seeds/tomato/seething
	name = "seething tomato"
	desc = "I'm the bomb and i'm about to... uh... line?"
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "seething_tomato"
	grind_results = list(/datum/reagent/clf3 = 0)
