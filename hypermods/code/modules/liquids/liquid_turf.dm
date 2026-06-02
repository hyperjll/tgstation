/turf
	var/obj/effect/abstract/liquid_turf/liquids
	var/liquid_height = 0
	var/turf_height = 0

/turf/proc/reasses_liquids()
	if(!liquids)
		return
	if(!liquids.liquid_group)
		liquids.liquid_group = new(1, liquids)

/turf/proc/liquid_update_turf()
	if(!liquids)
		return
	//Check atmos adjacency to cut off any disconnected groups
	if(liquids.liquid_group)
		var/assoc_atmos_turfs = list()
		for(var/tur in get_atmos_adjacent_turfs())
			assoc_atmos_turfs[tur] = TRUE
		//Check any cardinals that may have a matching group
		for(var/direction in GLOB.cardinals)
			var/turf/T = get_step(src, direction)
			if(!T.liquids)
				return

/turf/proc/add_liquid_from_reagents(datum/reagents/giver, no_react = FALSE, chem_temp, amount)
	var/list/compiled_list = list()
	var/multiplier = amount ? amount / giver.total_volume : 1
	for(var/r in giver.reagent_list)
		var/datum/reagent/R = r
		if(!(R.type in GLOB.liquid_blacklist))
			compiled_list[R.type] = R.volume * multiplier
	if(!compiled_list.len) //No reagents to add, don't bother going further
		return
	if(!isopenturf(src)) // If we're in a closed turf, we shouldn't be a liquid puddle.
		return
	if(!liquids)
		liquids = new(src)
	liquids.liquid_group.add_reagents(liquids, compiled_list, chem_temp)

//More efficient than add_liquid for multiples
/turf/proc/add_liquid_list(reagent_list, no_react = FALSE, chem_temp)
	if(liquids && !liquids.liquid_group)
		qdel(liquids)
		return

	if(!liquids)
		liquids = new(src)
	liquids.liquid_group.add_reagents(liquids, reagent_list, chem_temp)
	//Expose turf
	liquids.liquid_group.expose_members_turf(liquids)

/turf/proc/add_liquid(reagent, amount, no_react = FALSE, chem_temp = 300)
	if(reagent in GLOB.liquid_blacklist)
		return
	if(!liquids)
		liquids = new(src)

	liquids.liquid_group.add_reagent(liquids, reagent, amount, chem_temp)
	//Expose turf
	liquids.liquid_group.expose_members_turf(liquids)

//More efficient than remove_liquid for multiples
/turf/proc/remove_all_liquid(reagent_list, no_react = FALSE, chem_temp)
	if(liquids)
		qdel(liquids)

/turf/proc/remove_liquid(reagent, amount)
	if(!liquids)
		return

	liquids.liquid_group.remove_reagent(liquids, reagent, amount)

// for space cleaner shenanigans

/turf/proc/space_cleaner_on_liquids()
	if(!liquids)
		return
	if(!liquids.liquid_group)
		return
	if(!liquids.liquid_group.reagents)
		return

	liquids.liquid_group.evaporation_multiplier += 0.1

	if(liquids.liquid_group.reagents_per_turf >= 10) // let's not replace entire chemical oceans with water if we spray cleaner on it once.
		return

	for(var/datum/reagent/reagent_type in liquids.liquid_group.reagents.reagent_list)
		if(!istype(reagent_type.type, /datum/reagent/water))
			var/reagent_to_remove = reagent_type.type
			liquids.liquid_group.add_reagent(liquids, /datum/reagent/water, (reagent_type.volume * 0.1), liquids.liquid_group.group_temperature)
			liquids.liquid_group.remove_reagent(liquids, reagent_to_remove, (reagent_type.volume * 0.1))
