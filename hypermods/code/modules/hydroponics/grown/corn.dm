/obj/item/seeds/corn/blackcorn
	name = "black corn seed pack"
	desc = "What doth corn?"
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-blackcorn"
	species = "blackcorn"
	plantname = "Black Corn Stalks"
	product = /obj/item/food/grown/corn/blackcorn
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_vegetables.dmi'
	icon_grow = "corn-grow"
	icon_dead = "corn-dead"
	icon_harvest = "blackcorn-harvest"
	mutatelist = list()
	reagents_add = list(/datum/reagent/gunpowder = 0.02, /datum/reagent/consumable/nutriment/vitamin = 0.02, /datum/reagent/consumable/nutriment = 0.1)

/obj/item/food/grown/corn/blackcorn
	seed = /obj/item/seeds/corn/blackcorn
	name = "ear of black corn"
	desc = "It looks a little... explosive?"
	icon_state = "blackcorn"
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	trash_type = /obj/item/grown/corncob/black
	grind_results = list(/datum/reagent/gunpowder = 0, /datum/reagent/consumable/nutriment/fat/oil/corn = 0)
	tastes = list("gunpowder" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/whiskey

/obj/item/grown/corncob/black
	seed = /obj/item/seeds/corn/blackcorn
	name = "black corn cob"
	desc = "Whomever ate this must be having a really bad day."


/obj/item/seeds/corn/clearcorn
	name = "clear corn seed pack"
	desc = "CORNered again."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "seed-clearcorn"
	species = "clearcorn"
	plantname = "Clear Corn Stalks"
	product = /obj/item/food/grown/corn/clearcorn
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_vegetables.dmi'
	icon_grow = "corn-grow"
	icon_dead = "corn-dead"
	icon_harvest = "clearcorn-harvest"
	mutatelist = list()
	reagents_add = list(/datum/reagent/consumable/ethanol = 0.06, /datum/reagent/consumable/nutriment = 0.04)

/obj/item/food/grown/corn/clearcorn
	seed = /obj/item/seeds/corn/clearcorn
	name = "ear of clear corn"
	desc = "Kernel, i'm trying to sneak around but..."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "clearcorn"
	trash_type = /obj/item/grown/corncob/clear
	grind_results = list(/datum/reagent/consumable/ethanol = 0, /datum/reagent/consumable/nutriment/fat/oil/corn = 0)
	tastes = list("ethanol" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/whiskey

/obj/item/grown/corncob/clear
	seed = /obj/item/seeds/corn/clearcorn
	name = "pepper corn cob"
	desc = "Is it really a cob? You'd never really know."
