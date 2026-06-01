/datum/status_effect/no_gravity
	id = "no_gravity"
	alert_type = null
	duration = 2 SECONDS
	status_type = STATUS_EFFECT_UNIQUE

/datum/status_effect/no_gravity/on_apply()
	owner.AddElement(/datum/element/forced_gravity, 0)

/datum/status_effect/no_gravity/on_remove()
	owner.RemoveElement(/datum/element/forced_gravity, 0)


/datum/status_effect/forced_combat/tunnel_madness
	id = "tunnel_madness"
	remove_on_fullheal = TRUE
	alert_type = null

/datum/status_effect/forced_combat/tunnel_madness/will_attack(mob/living/friendly)
	return (!friendly?.has_faction(FACTION_RAT))
