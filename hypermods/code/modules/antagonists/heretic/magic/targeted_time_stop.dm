/datum/action/cooldown/spell/pointed/target_time_stop
	name = "Cursed Flames"
	desc = "A long-ranged spell that ignites a target instantly, \
		and drenches them with flammable liquids."
	background_icon_state = "bg_heretic"
	overlay_icon_state = "bg_heretic_border"
	button_icon = 'hypermods/icons/mob/actions/actions_ecult.dmi'
	button_icon_state = "cursed_flames"
	ranged_mousepointer = 'icons/effects/mouse_pointers/throw_target.dmi'
	//sound = 'sound/effects/magic/voidblink.ogg'

	cooldown_time = 60 SECONDS
	cast_range = 7

	sound = null
	school = SCHOOL_FORBIDDEN
	invocation = "T'RR'R'' R'F'R'NC'!"
	invocation_type = INVOCATION_SHOUT
	spell_requirements = NONE
	/// The radius / range of the time stop.
	var/timestop_range = 1
	/// The duration of the time stop.
	var/timestop_duration = 3 SECONDS

/datum/action/cooldown/spell/pointed/target_time_stop/before_cast(atom/cast_on)
	. = ..()
	if(. & SPELL_CANCEL_CAST)
		return
	if(!ismob(cast_on))
		return SPELL_CANCEL_CAST

/datum/action/cooldown/spell/pointed/target_time_stop/cast(mob/living/carbon/human/cast_on)
	. = ..()
	if(cast_on.can_block_magic(antimagic_flags))
		cast_on.visible_message(
			span_danger("You see the world around [cast_on] come to a halt for a fraction of a second, but nothing else happens!"),
			span_danger("You felt something attempt to slow the world around you to a crawl! You've been protected!")
		)
		return

	var/turf/targeted_turf = get_turf(cast_on)

	new /obj/effect/timestop/magic(targeted_turf, timestop_range, timestop_duration, null)
