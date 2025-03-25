/obj/item/gun/medbeam/harmful
	name = "Medical Beamgun"
	desc = "Don't cross the streams!"
	max_range = 12

/obj/item/gun/medbeam/harmful/on_beam_tick(mob/living/target)
	if(target.health != target.maxHealth)
		new /obj/effect/temp_visual/heal(get_turf(target), COLOR_HEALING_CYAN)
	var/need_mob_update
	need_mob_update = target.adjustBruteLoss(4, updating_health = FALSE, forced = TRUE)
	need_mob_update += target.adjustFireLoss(4, updating_health = FALSE, forced = TRUE)
	if(need_mob_update)
		target.updatehealth()
	return


/obj/item/gun/medbeam/uber
	name = "augmented medical beamgun"
	desc = "Doctor, are you sure this will work?"
	icon_state = "chronogun"
	actions_types = list(/datum/action/item_action/activate_uber)
	var/ubercharge = 0
	var/ubering = FALSE
	var/mob/last_holder
	var/mob/uber_target

/// Fully charged for debugging/bus purposes
/obj/item/gun/medbeam/uber/precharged
	name = "fully-charged augmented medical beamgun"
	ubercharge = 100
	icon_state = "chronogun"

/// The augmented medical beamgun is 58% charged.
/obj/item/gun/medbeam/uber/examine(mob/user)
	. = ..()
	if(ubercharge == 100)
		. += span_notice("[src] is fully charged!")
	else
		. += span_notice("[src] is [ubercharge]% charged.")

/// Handles ubercharge ticks and icon changes
/obj/item/gun/medbeam/uber/process(delta_time)
	..()

	if(current_target && !ubering)

		if(current_target.health == current_target.maxHealth)
			ubercharge += 1.25*delta_time // 80 seconds

		if(current_target.health < current_target.maxHealth)
			ubercharge += 2.5*delta_time // 40 seconds

	if(ubering)
		// No uber flashing
		if(current_target != uber_target)
			uber_act()
			ubercharge = 0
		else
			ubercharge -= 12.5*delta_time // 8 second uber
		if(ubercharge <= 0)
			uber_act()

	if(ubercharge >= 100)
		ubercharge = 100
		name = "fully-charged augmented medical beamgun"
	else
		name = "augmented medical beamgun"

	if(ubercharge < 0)
		ubercharge = 0

/// Sets last_holder for uber_act() to prevent exploits
/obj/item/gun/medbeam/uber/equipped(mob/user)
	..()
	last_holder = user

/// If target is lost, uber is lost
/obj/item/gun/medbeam/uber/LoseTarget()
	if(ubering)
		uber_act()
		ubercharge = 0

	..()

/// Activates/deactivates über
/obj/item/gun/medbeam/uber/proc/uber_act()
	if(!ubering)
		ubering = TRUE
		uber_target = current_target

		ADD_TRAIT(last_holder, TRAIT_GODMODE, "uber")
		last_holder.overlay_fullscreen("uber", /atom/movable/screen/fullscreen/uber)
		last_holder.add_atom_colour(list(LIGHT_COLOR_LIGHT_CYAN), TEMPORARY_COLOUR_PRIORITY)

		ADD_TRAIT(uber_target, TRAIT_GODMODE, "uber")
		uber_target.overlay_fullscreen("uber", /atom/movable/screen/fullscreen/uber)
		uber_target.add_atom_colour(list(LIGHT_COLOR_LIGHT_CYAN), TEMPORARY_COLOUR_PRIORITY)

	else /// this could remove an admin-given godmode but theres like 0.001% chance that will ever be an issue
		ubering = FALSE

		REMOVE_TRAIT(last_holder, TRAIT_GODMODE, "uber")
		last_holder.clear_fullscreen("uber")
		last_holder.remove_atom_colour(TEMPORARY_COLOUR_PRIORITY)

		REMOVE_TRAIT(uber_target, TRAIT_GODMODE, "uber")
		uber_target.clear_fullscreen("uber")
		uber_target.remove_atom_colour(TEMPORARY_COLOUR_PRIORITY)

/datum/action/item_action/activate_uber
	name = "Activate Übercharge"
	button_icon = 'icons/obj/chronos.dmi'
	button_icon_state = "chronogun"

/// Activates über if ubercharge is ready
/datum/action/item_action/activate_uber/Trigger(trigger_flags)

	if(!istype(target, /obj/item/gun/medbeam/uber))
		return

	var/obj/item/gun/medbeam/uber/gun = target

	if(!IsAvailable(feedback = FALSE))
		return

	if(gun.ubering)
		to_chat(owner, span_warning("You are already using übercharge!"))
		return

	if(gun.ubercharge < 100)
		to_chat(owner, span_warning("[gun] is only [gun.ubercharge]% charged!"))
		return

	gun.uber_act()

/atom/movable/screen/fullscreen/uber
	icon = 'hypermods/icons/mob/screen_full.dmi'
	icon_state = "uberoverlay"
	plane = FULLSCREEN_PLANE
	layer = CURSE_LAYER
