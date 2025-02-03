/obj/item/seeds/greenbean/jellybean
	name = "jelly bean seed pack"
	desc = "These seeds grow into jelly bean plants."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-jellybean"
	species = "jellybean"
	plantname = "Jelly Bean Plants"
	product = /obj/item/food/grown/jellybean
	instability = 0
	maturation = 6
	production = 5
	potency = 10
	growthstages = 4
	icon_dead = "jellybean-dead"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_fruits.dmi'
	mutatelist = list()
	genes = list(/datum/plant_gene/trait/never_mutate, /datum/plant_gene/trait/repeated_harvest)
	reagents_add = list(/datum/reagent/consumable/vhfcs = 0.1)

/obj/item/seeds/greenbean/jellybean/Initialize(mapload)
	. = ..()
	add_random_reagents(1, 1)

/obj/item/food/grown/jellybean
	seed = /obj/item/seeds/greenbean/jellybean
	name = "jelly beans"
	desc = "A simple, fun snack for the whole family! What will you get?"
	gender = PLURAL
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "jellybean"
	foodtypes = FRUIT
	tastes = list("luck" = 1)

/obj/item/food/grown/jellybean/Initialize(mapload)
	. = ..()
	update_appearance() // You don't wanna know how much time it took for me to figure out i needed to add this for the overlay to work.

/obj/item/food/grown/jellybean/update_overlays()
	. = ..()
	var/mutable_appearance/bean_overlay = mutable_appearance(icon, "jellybean_greyscale")
	bean_overlay.color = mix_color_from_reagents(reagents.reagent_list)
	. += bean_overlay
