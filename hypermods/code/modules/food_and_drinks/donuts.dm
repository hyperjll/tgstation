/obj/item/food/donut/deadly
	desc = "Goes great with Doctor's Delight."
	icon_state = "donut"
	max_volume = 1000
	bite_consumption = 1000
	ant_attracting = FALSE // ants be like: hell no.
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 950,
		/datum/reagent/consumable/sugar = 50)
	tastes = list("countless donuts" = 2, "sugar" = 2)

/obj/item/food/donut/deadly/lesser
	desc = "Goes great with Doctor's Delight."
	icon_state = "donut"
	max_volume = 50
	bite_consumption = 50
	ant_attracting = FALSE
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 40,
		/datum/reagent/consumable/sugar = 10)
	tastes = list("tens of donuts" = 2, "sugar" = 2)
