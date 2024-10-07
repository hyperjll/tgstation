/datum/action/cooldown/spell/pointed/skip_time
	name = "Skip Time"
	desc = "Lets you blink to your pointed destination, has exceptionally long range. \
		Grants you a temporary speed boost after use."
	background_icon_state = "bg_heretic"
	overlay_icon_state = "bg_heretic_border"
	button_icon = 'hypermods/icons/mob/actions/actions_ecult.dmi'
	button_icon_state = "time_skip"
	ranged_mousepointer = 'icons/effects/mouse_pointers/throw_target.dmi'

	school = SCHOOL_FORBIDDEN
	cooldown_time = 20 SECONDS

	invocation = "SK'P F'RTH."
	invocation_type = INVOCATION_WHISPER
	spell_requirements = NONE

	cast_range = 20
	/// The minimum range to cast the skip.
	var/min_cast_range = 2

/datum/action/cooldown/spell/pointed/skip_time/before_cast(atom/cast_on)
	. = ..()
	if(. & SPELL_CANCEL_CAST)
		return

	if(owner && get_dist(get_turf(owner), get_turf(cast_on)) < min_cast_range)
		cast_on.balloon_alert(owner, "too close!")
		return . | SPELL_CANCEL_CAST

/datum/action/cooldown/spell/pointed/skip_time/cast(atom/cast_on)
	. = ..()
	var/turf/targeted_turf = get_turf(cast_on)

	playsound(targeted_turf, 'sound/effects/magic/blink.ogg', 80, TRUE)

	var/mob/living/carbon/human/heretic = owner
	heretic.age += (rand(3,5)) // The price of skipping time.

	if(!heretic.has_status_effect(/datum/status_effect/timeskipped))
		heretic.apply_status_effect(/datum/status_effect/timeskipped)

	if(!heretic.has_status_effect(/datum/status_effect/rapidaging/lesser))
		heretic.apply_status_effect(/datum/status_effect/rapidaging/lesser)

	do_teleport(
		owner,
		targeted_turf,
		precision = 1,
		no_effects = TRUE,
		channel = TELEPORT_CHANNEL_MAGIC,
	)
