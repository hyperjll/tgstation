/obj/item/reagent_containers/cup/jerrycan/random
	name = "plastic jerrycan"
	list_reagents = list(/datum/reagent/water = 0)
	// How many times will we attempt to fill this container with chems. 4 is maximum considering in the best case scenario we get 50 chems four times over equaling the max volume.
	var/amt_of_chemrolls = 4
	/// Reagents we REALLY don't want to give out. Things like romerol have a higher chance of rolling due to multiple reagent rolls.
	var/list/blocked_reagents = list(/datum/reagent/romerol)

/obj/item/reagent_containers/cup/jerrycan/random/Initialize(mapload)
	for(var/i in 1 to rand(1,amt_of_chemrolls))
		list_reagents += list(get_random_reagent_id(blacklist = blocked_reagents) = rand(1,50))

	update_appearance()

	return ..()
