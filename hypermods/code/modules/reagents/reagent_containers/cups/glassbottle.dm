// Filled Molotovs

/obj/item/reagent_containers/cup/glass/bottle/molotov/ethanol
	list_reagents = list(/datum/reagent/consumable/ethanol = 100)

/obj/item/reagent_containers/cup/glass/bottle/molotov/fuel
	list_reagents = list(/datum/reagent/fuel = 100)

/obj/item/reagent_containers/cup/glass/bottle/molotov/clf3
	list_reagents = list(/datum/reagent/clf3 = 100)

/obj/item/reagent_containers/cup/glass/bottle/molotov/phlogiston
	list_reagents = list(/datum/reagent/phlogiston = 100)

/obj/item/reagent_containers/cup/glass/bottle/molotov/napalm
	list_reagents = list(/datum/reagent/napalm = 100)

/obj/item/reagent_containers/cup/glass/bottle/molotov/hellwater
	list_reagents = list(/datum/reagent/hellwater = 100)

/obj/item/reagent_containers/cup/glass/bottle/molotov/plasma
	list_reagents = list(/datum/reagent/toxin/plasma = 100)

/obj/item/reagent_containers/cup/glass/bottle/molotov/spore_burning
	list_reagents = list(/datum/reagent/toxin/spore_burning = 100)

/obj/item/reagent_containers/cup/glass/bottle/molotov/milktov
	name = "milktov"
	desc = "I am the milk man. My milk is delicious. Special delivery today!"
	icon_state = "glassbottle"
	list_reagents = list(/datum/reagent/consumable/milk = 100)
	active = TRUE
	accelerants = list(
		/datum/reagent/consumable/milk,
	)

/obj/item/reagent_containers/cup/glass/bottle/molotov/milktov/attackby(obj/item/I, mob/user, params)
	return

/obj/item/reagent_containers/cup/glass/bottle/molotov/milktov/smash(atom/target, mob/thrower, ranged = FALSE)
	var/explosive = 0
	for(var/datum/reagent/contained_reagent in reagents.reagent_list)
		for(var/accelerant_type in accelerants)
			if(istype(contained_reagent, accelerant_type))
				explosive = 1
				break
	..()
	if(explosive && active)
		explosion(target.loc,0,2,1,flame_range = 8)


/obj/item/reagent_containers/cup/glass/bottle/moonshine/traitor
	list_reagents = list(/datum/reagent/consumable/ethanol/moonshine/traitor = 100)

/obj/item/reagent_containers/cup/glass/bottle/eigenstasium
	list_reagents = list(/datum/reagent/eigenstate = 100)