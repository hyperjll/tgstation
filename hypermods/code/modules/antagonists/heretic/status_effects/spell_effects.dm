/datum/status_effect/timeskipped
	id = "time skipped"
	duration = 3 SECONDS
	alert_type = null

/datum/status_effect/timeskipped/on_apply()
	owner.add_movespeed_modifier(/datum/movespeed_modifier/timeskipped)

/datum/status_effect/timeskipped/on_remove()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/timeskipped)


/datum/status_effect/accelerated
	id = "accelerated"
	duration = 10 SECONDS
	alert_type = null

/datum/status_effect/accelerated/on_apply()
	owner.add_movespeed_modifier(/datum/movespeed_modifier/accelerate)
	owner.add_actionspeed_modifier(/datum/actionspeed_modifier/accelerate)

/datum/status_effect/accelerated/tick()
	var/mob/living/carbon/human/carbon_human = owner
	carbon_human.AdjustAllImmobility(-25)
	carbon_human.age += 2
	for(var/datum/reagent/toxin/R in carbon_human.reagents.reagent_list)
		carbon_human.reagents.remove_reagent(R.type,1)

/datum/status_effect/accelerated/on_remove()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/accelerate)
	owner.remove_actionspeed_modifier(/datum/actionspeed_modifier/accelerate)
