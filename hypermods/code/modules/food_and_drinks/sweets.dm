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


/obj/item/food/gumball/shield
	name = "gumball"
	desc = "A colorful, sugary gumball. This one has an odd marking upon it."
	icon = 'hypermods/icons/obj/food/lollipop.dmi'
	icon_state = "gumball_shield"
	random_color = FALSE
	crafted_food_buff = /datum/status_effect/force_shield

/obj/item/food/gumball/shield/Initialize(mapload)
	. = ..()
	add_traits(list(TRAIT_HANDMADE, TRAIT_CONTRABAND), INNATE_TRAIT) // Handmade trait for the food buff to work
	var/datum/component/edible/edible_component = GetComponent(/datum/component/edible)
	edible_component.handmade_complexity = FOOD_COMPLEXITY_1 // We'll also have to set this manually.

/obj/item/food/gumball/shield/bubblewrap
	icon_state = "gumball_shield_bubblewrap"
	crafted_food_buff = /datum/status_effect/force_shield/bubblewrap

/obj/item/food/gumball/shield/flameaura
	icon_state = "gumball_shield_flameaura"
	crafted_food_buff = /datum/status_effect/force_shield/flameaura

/obj/item/food/gumball/shield/thundercoin
	icon_state = "gumball_shield_thundercoin"
	crafted_food_buff = /datum/status_effect/force_shield/thundercoin

/obj/item/food/gumball/extralife
	name = "gumball"
	desc = "A colorful, sugary gumball. This one has an odd marking upon it."
	icon = 'hypermods/icons/obj/food/lollipop.dmi'
	icon_state = "gumball_extralife"
	random_color = FALSE
	crafted_food_buff = /datum/status_effect/extra_lives/single

/obj/item/food/gumball/extralife/Initialize(mapload)
	. = ..()
	add_traits(list(TRAIT_HANDMADE, TRAIT_CONTRABAND), INNATE_TRAIT) // Handmade trait for the food buff to work
	var/datum/component/edible/edible_component = GetComponent(/datum/component/edible)
	edible_component.handmade_complexity = FOOD_COMPLEXITY_1 // We'll also have to set this manually.
