// MARK OF TIME

/datum/status_effect/eldritch/time
	effect_icon = 'hypermods/icons/effects/eldritch.dmi'
	effect_icon_state = "emark9"

/datum/status_effect/eldritch/time/on_effect()
	if(iscarbon(owner))
		var/mob/living/carbon/human/carbon_human = owner
		carbon_human.age += 5

	owner.add_movespeed_modifier(/datum/movespeed_modifier/timemark)

	return ..()

/datum/status_effect/eldritch/time/on_remove()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/timemark)

	if(iscarbon(owner))
		var/mob/living/carbon/human/carbon_human = owner
		carbon_human.apply_status_effect(/datum/status_effect/rapidaging/lesser)
