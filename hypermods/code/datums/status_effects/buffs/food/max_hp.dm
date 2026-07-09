/datum/status_effect/food/health_increase
	id = "t1_health"
	alert_type = /atom/movable/screen/alert/status_effect/food/health_increase_t1
	var/health_increase = 5

/datum/status_effect/food/health_increase/on_creation(mob/living/new_owner, timeout_mod = 1, strength = 1)
	health_increase *= (1 + (strength / 50))
	. = ..()

/atom/movable/screen/alert/status_effect/food/health_increase_t1
	name = "Healthy"
	desc = "The food you've consumed has boosted your maximum health by a small amount."
	overlay_state = "in_love"

/datum/status_effect/food/health_increase/t2
	id = "t2_health"
	alert_type = /atom/movable/screen/alert/status_effect/food/health_increase_t2
	health_increase = 10

/datum/status_effect/food/health_increase/t2/on_creation(mob/living/new_owner, timeout_mod = 1, strength = 1)
	new_owner.remove_status_effect(/datum/status_effect/food/health_increase)
	. = ..()

/atom/movable/screen/alert/status_effect/food/health_increase_t2
	name = "Vitality"
	desc = "The food you've consumed has boosted your maximum health by a moderate amount."
	overlay_state = "in_love"

/datum/status_effect/food/health_increase/t3
	id = "t3_health"
	alert_type = /atom/movable/screen/alert/status_effect/food/health_increase_t3
	health_increase = 20

/datum/status_effect/food/health_increase/t3/on_creation(mob/living/new_owner, timeout_mod = 1, strength = 1)
	new_owner.remove_status_effect(/datum/status_effect/food/health_increase/t2)
	. = ..()

/atom/movable/screen/alert/status_effect/food/health_increase_t3
	name = "Hearty"
	desc = "The food you've consumed has boosted your maximum health by a large amount."
	overlay_state = "in_love"

/datum/status_effect/food/health_increase/on_apply()
	if(ishuman(owner))
		var/mob/living/carbon/user = owner
		user.maxHealth += health_increase
	return ..()

/datum/status_effect/food/health_increase/on_remove()
	. = ..()
	if(ishuman(owner))
		var/mob/living/carbon/user = owner
		user.maxHealth -= health_increase
