/datum/status_effect/timeskipped
	id = "time skipped"
	duration = 3 SECONDS
	alert_type = null

/datum/status_effect/timeskipped/on_apply()
	owner.add_movespeed_modifier(/datum/movespeed_modifier/timeskipped)
	return TRUE

/datum/status_effect/timeskipped/on_remove()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/timeskipped)
