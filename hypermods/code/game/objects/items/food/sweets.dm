/obj/item/food/chocolatebar/bicarodyne
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 2,
		/datum/reagent/bicarodyne = 30,
	)
	preserved_food = TRUE // dropping it and having it decay would suck.
	max_volume = 36 // lets not overdo it.
	bite_consumption = 36 // no minimizing this shit.

/obj/item/food/chocolatebar/bicarodyne/grind_results()
	return list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/sugar = 2, /datum/reagent/consumable/coco = 2)
