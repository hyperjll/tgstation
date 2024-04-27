/obj/item/food/monkeycube/mice
	name = "mice cube"
	desc = "A Waffle Co. brand mice cube. Now with extra cheese!"
	bite_consumption = 20
	food_reagents = list(
		/datum/reagent/carbon = 25,
		/datum/reagent/blood = 5,
		/datum/reagent/medicine/strange_reagent = 5,
	)
	tastes = list("cheese" = 1, "cartoon antics" = 1, "wire-munching critters" = 1)
	spawned_mob = /mob/living/basic/mouse

/obj/item/food/monkeycube/syndi
	name = "monkey cube"
	desc = "Just add water!"
	bite_consumption = 12
	food_reagents = list(
		/datum/reagent/carbon = 25,
		/datum/reagent/blood = 5,
		/datum/reagent/medicine/strange_reagent = 5,
	)
	tastes = list("the jungle" = 1, "bananas" = 1, "evil" = 1)
	spawned_mob = /mob/living/basic/trooper/syndicate/melee/space
