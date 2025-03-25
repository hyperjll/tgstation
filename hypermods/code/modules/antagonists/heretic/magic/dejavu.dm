/datum/action/cooldown/spell/deja_vu
	name = "Deja Vu"
	desc = "Allows you the save a position in space and time, which you'll return to after 10 seconds. \
			Undoes any dismemberment and harm to the user should any befall you after casting."
	background_icon_state = "bg_heretic"
	overlay_icon_state = "bg_heretic_border"
	button_icon = 'hypermods/icons/mob/actions/actions_ecult.dmi'
	button_icon_state = "dejavu"
	ranged_mousepointer = 'icons/effects/mouse_pointers/throw_target.dmi'

	school = SCHOOL_FORBIDDEN
	cooldown_time = 40 SECONDS

	invocation = "R'M'MB'R."
	invocation_type = INVOCATION_WHISPER
	spell_requirements = NONE

/datum/action/cooldown/spell/deja_vu/before_cast(atom/cast_on)
	. = ..()
	if(. & SPELL_CANCEL_CAST)
		return

/datum/action/cooldown/spell/deja_vu/cast(atom/cast_on)
	. = ..()
	to_chat(owner, span_notice("You take a mental note of where you are now..."))
	owner.AddComponent(/datum/component/dejavu, 1)

	var/mob/living/carbon/human/heretic = owner
	heretic.age += (rand(3,5)) // The price of skipping time.
