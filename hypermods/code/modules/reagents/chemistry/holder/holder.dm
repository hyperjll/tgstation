/// Removes all reagent of X type. @strict set to 1 determines whether the childs of the type are included.
/datum/reagents/proc/remove_all_type(reagent_type, amount, strict = 0, safety = 1)
	if(!isnum(amount))
		return 1
	var/list/cached_reagents = reagent_list
	var/has_removed_reagent = 0

	for(var/datum/reagent/reagent as anything in cached_reagents)
		var/matches = 0
		// Switch between how we check the reagent type
		if(strict)
			if(reagent.type == reagent_type)
				matches = 1
		else
			if(istype(reagent, reagent_type))
				matches = 1
		// We found a match, proceed to remove the reagent. Keep looping, we might find other reagents of the same type.
		if(matches)
			// Have our other proc handle removement
			has_removed_reagent = remove_reagent(reagent.type, amount, safety)

	return has_removed_reagent
