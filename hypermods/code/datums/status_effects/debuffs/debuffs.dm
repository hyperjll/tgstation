/datum/status_effect/hollow
	id = "hollow"
	duration = INFINITY
	alert_type = /atom/movable/screen/alert/status_effect/hollow

/datum/status_effect/hollow/tick(seconds_between_ticks)
	owner.adjust_organ_loss(ORGAN_SLOT_BRAIN, -0.1)

	if(!owner.mob_mood?.mood_level == MOOD_LEVEL_NEUTRAL)
		owner.mob_mood.set_sanity(SANITY_NEUTRAL) // Im using set_sanity here for safety reasons as opposed to forcing it, like with mood. bite me.
		owner.mob_mood.mood_level = MOOD_LEVEL_NEUTRAL

	return ..()

/datum/status_effect/hollow/on_apply()
	. = ..()
	if(.)
		owner.add_traits(list(TRAIT_MUTE, TRAIT_COLORBLIND), "hollow")
		owner.add_client_colour(/datum/client_colour/monochrome, "hollow")

/datum/status_effect/hollow/on_remove()
	owner.remove_traits(list(TRAIT_MUTE, TRAIT_COLORBLIND), "hollow")
	owner.remove_client_colour("hollow")


/atom/movable/screen/alert/status_effect/hollow
	name = "Hollow"
	desc = "You've been reduced to a hollow shell of your former self, unable to speak and unable to recover. You are all and you are nothing."
	icon = 'hypermods/icons/hud/screen_alert.dmi'
	icon_state = "hollow"
