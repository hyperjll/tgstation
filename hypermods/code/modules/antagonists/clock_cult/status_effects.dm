/datum/status_effect/clockwork_tile
	alert_type = null
	id = "clockwork_tile_effects"
	tick_interval = 2 SECONDS
	remove_on_fullheal = FALSE

/datum/status_effect/clockwork_tile/tick(seconds_between_ticks)
	if(IS_CLOCK(owner))
		owner.adjustToxLoss(-4 * seconds_between_ticks)
		owner.adjustStaminaLoss(-10 * seconds_between_ticks)
		return
	else // We got deconverted, remove this shit.
		owner.remove_status_effect(/datum/status_effect/clockwork_tile)
	if(is_species(owner, /datum/species/golem/clockwork))
		owner.adjustBruteLoss(-1 * seconds_between_ticks)
		owner.adjustFireLoss(-1 * seconds_between_ticks)
		owner.adjustToxLoss(-1 * seconds_between_ticks)
		return


/datum/status_effect/interdiction
	id = "interdicted"
	duration = 2.5 SECONDS
	status_type = STATUS_EFFECT_REFRESH
	tick_interval = 0.2 SECONDS
	alert_type = /atom/movable/screen/alert/status_effect/interdiction
	/// If we kicked the owner out of running mode
	var/running_toggled = FALSE

/datum/status_effect/interdiction/tick()
	if(owner.move_intent != MOVE_INTENT_WALK)
		owner.toggle_move_intent(MOVE_INTENT_WALK)
		owner.adjust_confusion_up_to(1 SECONDS, 1 SECONDS)
		running_toggled = TRUE
		to_chat(owner, span_warning("You know you shouldn't be running here."))

	owner.add_movespeed_modifier(/datum/movespeed_modifier/clock_interdiction)

/datum/status_effect/interdiction/on_remove()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/clock_interdiction)

	if(running_toggled && owner.move_intent == MOVE_INTENT_WALK)
		owner.toggle_move_intent(MOVE_INTENT_RUN)

/atom/movable/screen/alert/status_effect/interdiction
	name = "Interdicted"
	desc = "I don't think I am meant to go this way."
	icon = 'hypermods/icons/hud/screen_alert.dmi'
	icon_state = "belligerent"

/datum/movespeed_modifier/clock_interdiction
	multiplicative_slowdown = 1.5


/datum/status_effect/clockwork_slab_regen
	id = "clockwork_slab_regen"
	alert_type = null
	duration = STATUS_EFFECT_PERMANENT
	/// Whether we healed from our last tick
	var/healed_last_tick = FALSE

/datum/status_effect/clockwork_slab_regen/tick(seconds_between_ticks)
	healed_last_tick = FALSE
	var/need_mob_update = FALSE

	if(owner.getBruteLoss() > 0)
		need_mob_update += owner.adjustBruteLoss(-0.25, updating_health = FALSE)
		healed_last_tick = TRUE

	if(owner.getFireLoss() > 0)
		need_mob_update += owner.adjustFireLoss(-0.25, updating_health = FALSE)
		healed_last_tick = TRUE

	if(owner.getToxLoss() > 0)
		need_mob_update += owner.adjustToxLoss(-0.25, updating_health = FALSE, forced = TRUE)
		healed_last_tick = TRUE

	if(need_mob_update)
		owner.updatehealth()

	// Technically, "healed this tick" by now.
	if(healed_last_tick)
		new /obj/effect/temp_visual/heal(get_turf(owner), COLOR_RED)

	return
