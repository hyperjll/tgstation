/datum/action/cooldown/spell/pointed/slow
	name = "Slow"
	desc = "Warps time around a target, drastically slowing them down for the next 5 seconds."
	background_icon_state = "bg_heretic"
	overlay_icon_state = "bg_heretic_border"
	button_icon = 'hypermods/icons/mob/actions/actions_ecult.dmi'
	button_icon_state = "slow"
	ranged_mousepointer = 'icons/effects/mouse_pointers/throw_target.dmi'

	cooldown_time = 30 SECONDS
	cast_range = 1

	sound = null
	school = SCHOOL_FORBIDDEN
	invocation = "C'G' 'F T'M'E!"
	invocation_type = INVOCATION_SHOUT
	spell_requirements = NONE

/datum/action/cooldown/spell/pointed/slow/before_cast(atom/cast_on)
	. = ..()
	if(. & SPELL_CANCEL_CAST)
		return
	if(!ismob(cast_on))
		return SPELL_CANCEL_CAST

/datum/action/cooldown/spell/pointed/slow/cast(mob/living/carbon/human/cast_on)
	. = ..()
	if(cast_on.can_block_magic(antimagic_flags))
		cast_on.visible_message(
			span_danger("A white flash emits from [cast_on], but nothing happens!"),
			span_danger("You feel time slow to a crawl for just a moment, but it ends just as quickly as it began! You've been protected!")
		)
		return
	var/turf/targeted_turf = get_turf(cast_on)

	playsound(targeted_turf, 'sound/effects/magic/voidblink.ogg', 80, TRUE)
	cast_on.apply_status_effect(/datum/status_effect/hereticslow, "hereticslow")


/datum/status_effect/hereticslow
	id = "hereticslow"
	duration = 5 SECONDS
	alert_type = /atom/movable/screen/alert/status_effect/hereticslow
	///The overlay that gets applied to whoever has this status active
	var/obj/effect/abstract/slowedaura/effect_overlay

/datum/status_effect/hereticslow/on_creation(mob/living/new_owner, set_duration)
	. = ..()
	effect_overlay = new /obj/effect/abstract/slowedaura(new_owner)
	QDEL_IN(effect_overlay, 0.8 SECONDS)
	RegisterSignal(effect_overlay, COMSIG_QDELETING, PROC_REF(clear_overlay))
	new_owner.vis_contents += effect_overlay


/datum/status_effect/hereticslow/on_apply()
	owner.add_movespeed_modifier(/datum/movespeed_modifier/hereticslow)

/datum/status_effect/hereticslow/on_remove()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/hereticslow)


///Makes sure to clear the ref in case the voidball ever suddenly disappears
/datum/status_effect/hereticslow/proc/clear_overlay()
	SIGNAL_HANDLER
	effect_overlay = null

//----Voidball effect
/obj/effect/abstract/slowedaura
	icon = 'hypermods/icons/mob/actions/actions_ecult.dmi'
	icon_state = "slow_effect"
	layer = ABOVE_ALL_MOB_LAYER
	vis_flags = VIS_INHERIT_ID

//---- Screen alert
/atom/movable/screen/alert/status_effect/hereticslow
	name = "Slowed"
	desc = "You've been trapped in a miniature time singularity!" // GOTTA GO... slow?
	icon = 'hypermods/icons/mob/actions/actions_ecult.dmi'
	icon_state = "slow_effect"
