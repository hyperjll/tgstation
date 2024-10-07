/datum/action/cooldown/spell/accelerate
	name = "Accelerate"
	desc = "You warp time in your favor, causing you to become hastened for the next \
		6 seconds. All progress bar actions are performed 50% faster, and you move 50% faster. \
		You recover from all stuns 25% faster and rapidly purge toxins from your bloodstream. \
		You age rapidly while hastened, however."
	background_icon_state = "bg_heretic"
	overlay_icon_state = "bg_heretic_border"
	button_icon = 'hypermods/icons/mob/actions/actions_ecult.dmi'
	button_icon_state = "accelerate"
	ranged_mousepointer = 'icons/effects/mouse_pointers/throw_target.dmi'

	school = SCHOOL_FORBIDDEN
	cooldown_time = 40 SECONDS

	invocation = "G'TT' G' F'ST."
	invocation_type = INVOCATION_WHISPER
	spell_requirements = NONE

/datum/action/cooldown/spell/accelerate/before_cast(atom/cast_on)
	. = ..()
	if(. & SPELL_CANCEL_CAST)
		return

/datum/action/cooldown/spell/accelerate/cast(atom/cast_on)
	. = ..()
	var/mob/living/carbon/human/heretic = owner
	if(!heretic.has_status_effect(/datum/status_effect/timeskipped))
		heretic.apply_status_effect(/datum/status_effect/timeskipped)
