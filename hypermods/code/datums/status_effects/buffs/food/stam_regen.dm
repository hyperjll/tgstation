/datum/status_effect/food/stam_regen
	id = "t1_stam_regen"
	alert_type = /atom/movable/screen/alert/status_effect/food/stam_regen_t1
	var/regen_rate = 0.25

/datum/status_effect/food/stam_regen/on_creation(mob/living/new_owner, timeout_mod = 1, strength = 1)
	. = ..()
	regen_rate *= (1 + (strength / 20))

/atom/movable/screen/alert/status_effect/food/stam_regen_t1
	name = "Small Stamina Regeneration Increase"
	desc = "You feel slightly more energetic."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "stam_t1"

/datum/status_effect/food/stam_regen/t2
	id = "t2_stam_regen"
	alert_type = /atom/movable/screen/alert/status_effect/food/stam_regen_t2
	regen_rate = 0.5

/atom/movable/screen/alert/status_effect/food/stam_regen_t2
	name = "Moderate Stamina Regeneration Increase"
	desc = "You feel more energetic."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "stam_t2"

/datum/status_effect/food/stam_regen/t3
	id = "t3_stam_regen"
	alert_type = /atom/movable/screen/alert/status_effect/food/stam_regen_t3
	regen_rate = 1

/atom/movable/screen/alert/status_effect/food/stam_regen_t3
	name = "Large Stamina Regeneration Increase"
	desc = "You feel full of energy."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "stam_t3"

/datum/status_effect/food/stam_regen/tick(seconds_between_ticks)
	var/need_mob_update = FALSE

	if(owner.get_stamina_loss() > 75 && !owner.get_stamina_loss() == 0)
		need_mob_update += owner.adjust_stamina_loss(-regen_rate)

	if(need_mob_update)
		owner.updatehealth()

	return ..()
