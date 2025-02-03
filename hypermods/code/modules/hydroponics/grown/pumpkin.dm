/obj/item/seeds/pumpkin/spiced
	name = "spiced pumpkin seed pack"
	desc = "These seeds grow into spiced pumpkin vines."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-spicedpumpkin"
	species = "spicedpumpkin"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_fruits.dmi'
	icon_grow = "pumpkin-grow"
	icon_dead = "pumpkin-dead"
	icon_harvest = "spicedpumpkin-harvest"
	plantname = "Spiced Pumpkin Vines"
	product = /obj/item/food/grown/pumpkin/spiced
	mutatelist = null
	reagents_add = list(/datum/reagent/consumable/pumpkin_latte = 0.1, /datum/reagent/consumable/nutriment = 0.2)

/obj/item/food/grown/pumpkin/spiced
	seed = /obj/item/seeds/pumpkin/spiced
	name = "spiced pumpkin"
	desc = "The pumpkin's got game now. It doesn't look like you can carve it into a hat without the spices spilling."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "spiced_pumpkin"
	carved_type = /obj/item/clothing/head/utility/hardhat/pumpkinhead // I'm lazy, so not right now.
