/obj/item/food/pizza/meat/drugged/Initialize(mapload)
	slice_type = /obj/item/food/pizzaslice/meat/drugged
	food_reagents += list(/datum/reagent/consumable/ethanol/bacchus_blessing = 60)
	return ..()

/obj/item/food/pizzaslice/meat/drugged/Initialize(mapload)
	food_reagents += list(/datum/reagent/consumable/ethanol/bacchus_blessing = 6)
	return ..()


/obj/item/food/pizza/mushroom/explosive/Initialize(mapload)
	slice_type = /obj/item/food/pizzaslice/mushroom/explosive
	food_reagents += list(/datum/reagent/phlogiston = 30, /datum/reagent/gunpowder = 30)
	return ..()

/obj/item/food/pizzaslice/mushroom/explosive/Initialize(mapload)
	food_reagents += list(/datum/reagent/phlogiston = 3, /datum/reagent/gunpowder = 3)
	return ..()


/obj/item/food/pizza/vegetable/poisoned/Initialize(mapload)
	slice_type = /obj/item/food/pizzaslice/vegetable/poisoned
	food_reagents += list(/datum/reagent/toxin/amanitin = 60)
	return ..()

/obj/item/food/pizzaslice/vegetable/poisoned/Initialize(mapload)
	food_reagents += list(/datum/reagent/toxin/amanitin = 6)
	return ..()


/obj/item/food/pizza/donkpocket/atomic/Initialize(mapload)
	slice_type = /obj/item/food/pizzaslice/donkpocket/atomic
	food_reagents += list(/datum/reagent/consumable/ethanol/atomicbomb = 60)
	return ..()

/obj/item/food/pizzaslice/donkpocket/atomic/Initialize(mapload)
	food_reagents += list(/datum/reagent/consumable/ethanol/atomicbomb = 6)
	return ..()


/obj/item/food/pizza/dank/poisoned/Initialize(mapload)
	slice_type = /obj/item/food/pizzaslice/dank/poisoned
	food_reagents += list(/datum/reagent/toxin/fentanyl = 60)
	return ..()

/obj/item/food/pizzaslice/dank/poisoned/Initialize(mapload)
	food_reagents += list(/datum/reagent/toxin/fentanyl = 6)
	return ..()


/obj/item/food/pizza/sassysage/neurotoxin/Initialize(mapload)
	slice_type = /obj/item/food/pizzaslice/sassysage/neurotoxin
	food_reagents += list(/datum/reagent/consumable/ethanol/neurotoxin = 60)
	return ..()

/obj/item/food/pizzaslice/sassysage/neurotoxin/Initialize(mapload)
	food_reagents += list(/datum/reagent/consumable/ethanol/neurotoxin = 6)
	return ..()


/obj/item/food/pizza/pineapple/teslafied/Initialize(mapload)
	slice_type = /obj/item/food/pizzaslice/pineapple/teslafied
	food_reagents += list(/datum/reagent/teslium = 60)
	return ..()

/obj/item/food/pizzaslice/pineapple/teslafied/Initialize(mapload)
	food_reagents += list(/datum/reagent/teslium = 6)
	return ..()
