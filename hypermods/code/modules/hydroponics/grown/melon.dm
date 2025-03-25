/obj/item/seeds/watermelon/rainbow
	name = "rainbowmelon seed pack"
	desc = "These seeds grow into rainbowmelon plants."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-rainbowmelon"
	species = "rainbowmelon"
	plantname = "Rainbow Melon Vines"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_fruits.dmi'
	icon_grow = "rainbowmelon-grow" // Uses one growth icons set for all the subtypes
	icon_dead = "rainbowmelon-dead"
	icon_harvest = "rainbowmelon-harvest"
	product = /obj/item/food/grown/rainbowmelon
	genes = list()
	mutatelist = null
	reagents_add = list(/datum/reagent/consumable/melonium = 0.2, /datum/reagent/consumable/nutriment = 0.1)

/// Barrel melon Fruit
/obj/item/food/grown/rainbowmelon
	seed = /obj/item/seeds/watermelon/rainbow
	name = "rainbowmelon"
	desc = "The ultimate melon."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "rainbow_watermelon"
	//inhand_icon_state = "rainbowmelon"
	distill_reagent = /datum/reagent/medicine/antihol
