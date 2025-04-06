/datum/status_effect/catchup // used by the mirage drive
	id = "catchup"
	duration = 1 SECONDS
	var/newcolor = list(rgb(77,77,77), rgb(150,150,150), rgb(28,28,28), rgb(0,0,0))

/datum/status_effect/catchup/on_apply()
	. = ..()
	if(.)
		owner.add_movespeed_modifier(/datum/movespeed_modifier/status_effect/catchup)
		owner.add_atom_colour(newcolor, FIXED_COLOUR_PRIORITY)

/datum/status_effect/catchup/on_remove()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/status_effect/catchup)
	owner.remove_atom_colour(FIXED_COLOUR_PRIORITY)


/datum/status_effect/regenerative_howl
	id = "regenerative_howl"
	duration = 1 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/regenerative_howl
	/// Whether we healed from our last tick
	var/healed_last_tick = FALSE

/datum/status_effect/regenerative_howl/tick(seconds_between_ticks)
	healed_last_tick = FALSE
	var/need_mob_update = FALSE

	if(owner.getBruteLoss() > 0)
		need_mob_update += owner.adjustBruteLoss(-0.5, updating_health = FALSE)
		healed_last_tick = TRUE

	if(owner.getFireLoss() > 0)
		need_mob_update += owner.adjustFireLoss(-0.5, updating_health = FALSE)
		healed_last_tick = TRUE

	if(owner.getToxLoss() > 0)
		// Forced, so slimepeople are healed as well.
		need_mob_update += owner.adjustToxLoss(-0.25, updating_health = FALSE, forced = TRUE)
		healed_last_tick = TRUE

	if(need_mob_update)
		owner.updatehealth()

	// Technically, "healed this tick" by now.
	if(healed_last_tick)
		new /obj/effect/temp_visual/heal(get_turf(owner), COLOR_RED)

	return ..()

/atom/movable/screen/alert/status_effect/regenerative_howl
	name = "Regenerative Howl"
	desc = "You succeeded in performing a Defensive Howl, and are slowly recouperating from any wounds."
	icon = 'hypermods/icons/ui_icons/antags/werewolf/werewolf_ui.dmi'
	icon_state = "howl"


/datum/status_effect/adrenaline_quirk
	id = "adrenaline_quirk"
	duration = 4 SECONDS
	alert_type = /atom/movable/screen/alert/status_effect/adrenaline_quirk

/datum/status_effect/adrenaline_quirk/on_apply()
	. = ..()
	if(.)
		owner.add_movespeed_modifier(/datum/movespeed_modifier/status_effect/adrenaline_quirk)

/datum/status_effect/adrenaline_quirk/on_remove()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/status_effect/adrenaline_quirk)

/atom/movable/screen/alert/status_effect/adrenaline_quirk
	name = "Adrenaline"
	desc = "Your wounds have resulted in your brain releasing a constant stream of adrenaline. You'll move about 20% faster."
	icon = 'hypermods/icons/hud/implants.dmi'
	icon_state = "adrenaline"
