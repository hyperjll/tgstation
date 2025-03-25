/obj/item/food/donkpocket/syndi
	name = "donkpocket"
	desc = "The food of choice for the seasoned traitor."
	icon_state = "donkpocket"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/drug/syndimethamphetamine = 6)
	warm_type = /obj/item/food/donkpocket/warm/syndi
	tastes = list("meat" = 2, "dough" = 2, "laziness" = 1)
	foodtypes = GRAIN | MEAT

/obj/item/food/donkpocket/syndi/make_bakeable()
	AddComponent(/datum/component/bakeable, warm_type, rand(baking_time_short, baking_time_long), TRUE, TRUE, child_added_reagents)

/obj/item/food/donkpocket/syndi/make_microwaveable()
	AddElement(/datum/element/microwavable, warm_type, child_added_reagents)

/obj/item/food/donkpocket/warm/syndi
	name = "warm donkpocket"
	desc = "The heated food of choice for the seasoned traitor."
	food_reagents = list(/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/medicine/omnizine = 5,
		/datum/reagent/drug/syndimethamphetamine = 6)
	tastes = list("meat" = 2, "dough" = 2, "laziness" = 1)
	foodtypes = GRAIN | MEAT
