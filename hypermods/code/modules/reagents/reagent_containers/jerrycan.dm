/obj/item/reagent_containers/cup/jerrycan/random
	name = "plastic jerrycan"
	var/rolled_reagent = null
	// How many times will we attempt to fill this container with chems. 4 is maximum considering in the best case scenario we get 50 chems four times over equaling the max volume.
	var/amt_of_chemrolls = 4
	/// Reagents we REALLY don't want to give out. Things like romerol have a higher chance of rolling due to multiple reagent rolls.
	var/list/blocked_reagents = list(/datum/reagent/romerol)
	/// Minimum amount of reagent added per roll.
	var/reagent_minimum_amt = 1
	/// Maximum amount of reagent added per roll. Be careful not to over-exceed the total volume (200 for jerry can)
	var/reagent_maximum_amt = 50

/obj/item/reagent_containers/cup/jerrycan/random/Initialize(mapload)
	. = ..()
	for(var/i in 1 to rand(1,amt_of_chemrolls))
		rolled_reagent = (get_random_reagent_id(blacklist = blocked_reagents))
		src.reagents.add_reagent(rolled_reagent, rand(reagent_minimum_amt,reagent_maximum_amt))

	update_appearance()
