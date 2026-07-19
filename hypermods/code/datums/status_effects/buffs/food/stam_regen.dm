/datum/status_effect/food/stam_regen
	id = "t1_stam_regen"
	alert_type = /atom/movable/screen/alert/status_effect/food/stam_regen_t1
	var/regen_rate = 1

/datum/status_effect/food/stam_regen/on_creation(mob/living/new_owner, timeout_mod = 1, strength = 1)
	regen_rate *= (1 + (strength / 20))
	if(new_owner.has_status_effect(/datum/status_effect/food/stam_regen/t3) || new_owner.has_status_effect(/datum/status_effect/food/stam_regen/t2))
		duration = 0 SECONDS
	. = ..()

/atom/movable/screen/alert/status_effect/food/stam_regen_t1
	name = "Energized"
	desc = "The food you've consumed has boosted your stamina recovery by a small amount."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "stam_t1"

/datum/status_effect/food/stam_regen/t2
	id = "t2_stam_regen"
	alert_type = /atom/movable/screen/alert/status_effect/food/stam_regen_t2
	regen_rate = 2

/datum/status_effect/food/stam_regen/t2/on_creation(mob/living/new_owner, timeout_mod = 1, strength = 1)
	new_owner.remove_status_effect(/datum/status_effect/food/stam_regen)
	if(new_owner.has_status_effect(/datum/status_effect/food/stam_regen/t3))
		duration = 0 SECONDS
	. = ..()

/atom/movable/screen/alert/status_effect/food/stam_regen_t2
	name = "Vigor"
	desc = "The food you've consumed has boosted your stamina recovery by a moderate amount."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "stam_t2"

/datum/status_effect/food/stam_regen/t3
	id = "t3_stam_regen"
	alert_type = /atom/movable/screen/alert/status_effect/food/stam_regen_t3
	regen_rate = 3

/datum/status_effect/food/stam_regen/t3/on_creation(mob/living/new_owner, timeout_mod = 1, strength = 1)
	new_owner.remove_status_effect(/datum/status_effect/food/stam_regen)
	new_owner.remove_status_effect(/datum/status_effect/food/stam_regen/t2)
	. = ..()

/atom/movable/screen/alert/status_effect/food/stam_regen_t3
	name = "Endurance"
	desc = "The food you've consumed has boosted your stamina recovery by a large amount."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "stam_t3"

/datum/status_effect/food/stam_regen/tick(seconds_between_ticks)
	var/need_mob_update = FALSE

	if(owner.get_stamina_loss() > 75 && !owner.get_stamina_loss() == 0)
		need_mob_update += owner.adjust_stamina_loss(-regen_rate)

	if(need_mob_update)
		owner.updatehealth()

	return ..()
