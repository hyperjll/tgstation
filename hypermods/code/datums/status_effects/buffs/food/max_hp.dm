/datum/status_effect/food/health_increase
	id = "t1_health"
	alert_type = /atom/movable/screen/alert/status_effect/food/health_increase_t1
	var/health_increase = 5

/datum/status_effect/food/health_increase/on_creation(mob/living/new_owner, timeout_mod = 1, strength = 1)
	health_increase *= (1 + (strength / 50))
	. = ..()

/atom/movable/screen/alert/status_effect/food/health_increase_t1
	name = "Small Health Increase"
	desc = "You feel slightly heartier."
	overlay_state = "in_love"

/datum/status_effect/food/health_increase/t2
	id = "t2_health"
	alert_type = /atom/movable/screen/alert/status_effect/food/health_increase_t2
	health_increase = 10

/atom/movable/screen/alert/status_effect/food/health_increase_t2
	name = "Small Health Increase"
	desc = "You feel heartier."
	overlay_state = "in_love"

/datum/status_effect/food/health_increase/t3
	id = "t3_health"
	alert_type = /atom/movable/screen/alert/status_effect/food/health_increase_t3
	health_increase = 20

/atom/movable/screen/alert/status_effect/food/health_increase_t3
	name = "Large Health Increase"
	desc = "You feel incredibly hearty."
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
