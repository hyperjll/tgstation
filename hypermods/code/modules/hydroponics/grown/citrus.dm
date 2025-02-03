/obj/item/seeds/orange/blood
	name = "blood orange seed pack"
	desc = "Sour, iron-tasting and unappealing."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-bloodorange"
	species = "bloodorange"
	plantname = "Blood Orange Tree"
	product = /obj/item/food/grown/citrus/orange/blood
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_fruits.dmi'
	icon_grow = "lime-grow"
	icon_dead = "lime-dead"
	icon_harvest = "bloodorange-harvest"
	mutatelist = list()
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.02, /datum/reagent/iron = 0.02, /datum/reagent/blood = 0.1)

/obj/item/food/grown/citrus/orange/blood
	seed = /obj/item/seeds/orange/blood
	name = "blood orange"
	desc = "It's a tangy redish-orange fruit. It's innards look rather... fleshy?"
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "blood_orange"


/obj/item/seeds/orange/clockwork
	name = "clockwork orange seed pack"
	desc = "A faint ticking can be heard within them."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-clockworkorange"
	species = "clockworkorange"
	plantname = "Clockwork Orange Tree"
	product = /obj/item/food/grown/citrus/orange/clockwork
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_fruits.dmi'
	icon_grow = "lime-grow"
	icon_dead = "lime-dead"
	icon_harvest = "clockworkorange-harvest"
	mutatelist = list()
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.05, /datum/reagent/consumable/clockwork_orange = 0.01)

/obj/item/food/grown/citrus/orange/clockwork
	seed = /obj/item/seeds/orange/clockwork
	name = "clockwork orange"
	desc = "Looking at the organic clock upon it makes you woozy."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "clockwork_orange"
