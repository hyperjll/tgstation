/datum/status_effect/catchup // used by the mirage drive
	id = "catchup"
	duration = 1 SECONDS
	var/newcolor = list(rgb(77,77,77), rgb(150,150,150), rgb(28,28,28), rgb(0,0,0))

/datum/status_effect/catchup/on_apply()
	. = ..()
	if(.)
		owner.add_movespeed_modifier(/datum/movespeed_modifier/status_effect/catchup)
		owner.add_atom_colour(newcolor, FIXED_COLOUR_PRIORITY)

/datum/status_effect/catchup/on_remove()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/status_effect/catchup)
	owner.remove_atom_colour(FIXED_COLOUR_PRIORITY)
