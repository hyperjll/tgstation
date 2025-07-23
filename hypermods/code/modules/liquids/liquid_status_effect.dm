/datum/status_effect/water_affected
	id = "wateraffected"
	alert_type = null
	duration = STATUS_EFFECT_PERMANENT

/datum/status_effect/water_affected/on_apply()
	//We should be inside a liquid turf if this is applied
	calculate_water_slow()
	return TRUE

/datum/status_effect/water_affected/proc/calculate_water_slow()
	//Factor in swimming skill here?
	var/turf/T = get_turf(owner)
	var/slowdown_amount = T.liquids.liquid_group.group_overlay_state * 0.5
	owner.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/liquids, multiplicative_slowdown = slowdown_amount)

/datum/status_effect/water_affected/tick()
	var/turf/owner_turf = get_turf(owner)
	if(QDELETED(owner_turf) || QDELETED(owner_turf.liquids) || owner_turf.liquids.liquid_group.group_overlay_state == LIQUID_STATE_PUDDLE)
		qdel(src)
		return
	calculate_water_slow()
	//Make the reagents touch the person

	var/fraction = SUBMERGEMENT_PERCENT(owner, owner_turf.liquids)
	owner_turf.liquids.liquid_group.expose_members_turf(owner_turf.liquids)
	owner_turf.liquids.liquid_group.transfer_to_atom(owner_turf.liquids, ((SUBMERGEMENT_REAGENTS_TOUCH_AMOUNT * fraction / 20)), owner)

	if(owner_turf.liquids.liquid_group.group_overlay_state == LIQUID_STATE_FULLTILE)
		var/mob/living/carbon/human/drowning_human = owner
		drowning_human.losebreath++

	return ..()

/datum/status_effect/water_affected/on_remove()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/liquids)

/datum/movespeed_modifier/liquids
	variable = TRUE
	blacklisted_movetypes = FLOATING | FLYING
