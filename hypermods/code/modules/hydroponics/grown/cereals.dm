/obj/item/seeds/wheat/rice/ricin
	name = "ricin rice seed pack"
	desc = "These may, or may not, grow into ricin rice."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-ricinrice"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing.dmi'
	icon_grow = "ricinrice-grow" // Uses one growth icons set for all the subtypes
	icon_dead = "ricinrice-dead"
	species = "ricinrice"
	plantname = "Ricin Rice Stalks"
	instability = 1
	product = /obj/item/food/grown/rice/ricin
	mutatelist = null
	growthstages = 3
	mutatelist = list()
	reagents_add = list(/datum/reagent/toxin/ricin = 0.01, /datum/reagent/consumable/nutriment = 0.04)

/obj/item/food/grown/rice/ricin
	seed = /obj/item/seeds/wheat/rice/ricin
	name = "ricin rice"
	desc = "Known for containing trace amounts of a nigh-untraceable lethal poison suspected to have been used to kill many important people in the past."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "ricin_rice"
	grind_results = list(/datum/reagent/consumable/rice = 0)
	tastes = list("rice with a hint of death" = 1)
