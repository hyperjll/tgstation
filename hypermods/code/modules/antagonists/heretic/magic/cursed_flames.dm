/datum/action/cooldown/spell/pointed/cursed_flames
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

/datum/action/cooldown/spell/pointed/cursed_flames/before_cast(atom/cast_on)
	. = ..()
	if(. & SPELL_CANCEL_CAST)
		return
	if(!ismob(cast_on))
		return SPELL_CANCEL_CAST

/datum/action/cooldown/spell/pointed/cursed_flames/cast(mob/living/carbon/human/cast_on)
	. = ..()
	if(cast_on.can_block_magic(antimagic_flags))
		cast_on.visible_message(
			span_danger("You see [cast_on] flash orange, but nothing else happens!"),
			span_danger("You feel a bit warmer but nothing else happens! You've been protected!")
		)
		return

	var/turf/targeted_turf = get_turf(cast_on)
	playsound(targeted_turf, 'sound/effects/magic/fireball.ogg', 80, TRUE)

	cast_on.adjust_fire_stacks(1)
	cast_on.ignite_mob()

	cast_on.apply_status_effect(/datum/status_effect/cursed_flames, "cursed_flames")
