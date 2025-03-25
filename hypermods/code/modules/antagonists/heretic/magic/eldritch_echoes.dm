/datum/action/cooldown/spell/pointed/eldritch_echoes
	name = "Eldritch Echoes"
	desc = "A touch-range spell that causes massive damage to a target after an extended period of time. \
		Using this a second time on a target does nothing but reset the timer."
	background_icon_state = "bg_heretic"
	overlay_icon_state = "bg_heretic_border"
	button_icon = 'hypermods/icons/mob/actions/actions_ecult.dmi'
	button_icon_state = "eldritch_echoes"
	ranged_mousepointer = 'icons/effects/mouse_pointers/throw_target.dmi'
	sound = 'sound/effects/curse/curse2.ogg'

	cooldown_time = 60 SECONDS
	cast_range = 1

	sound = null
	school = SCHOOL_FORBIDDEN
	invocation = "W'TN'SS TH'M, 'ND L'ST'N!"
	invocation_type = INVOCATION_SHOUT
	spell_requirements = NONE

/datum/action/cooldown/spell/pointed/eldritch_echoes/before_cast(atom/cast_on)
	. = ..()
	if(. & SPELL_CANCEL_CAST)
		return
	if(!ismob(cast_on))
		return SPELL_CANCEL_CAST

/datum/action/cooldown/spell/pointed/eldritch_echoes/cast(mob/living/carbon/human/cast_on)
	. = ..()
	if(cast_on.can_block_magic(antimagic_flags))
		cast_on.visible_message(
			span_danger("A low-pitched hum can be heard from [cast_on], but nothing happens!"),
			span_danger("You hear a low-pitched hum but nothing happens! You've been protected!")
		)
		return
	var/turf/targeted_turf = get_turf(cast_on)

	playsound(targeted_turf, 'sound/effects/chemistry/ahaha.ogg', 80, TRUE)
	cast_on.apply_status_effect(/datum/status_effect/eldritch_echoes, "eldritch_echoes")
