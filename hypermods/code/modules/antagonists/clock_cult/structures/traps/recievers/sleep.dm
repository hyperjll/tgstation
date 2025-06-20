/obj/item/clockwork/trap_placer/sleepy
	name = "slumber tile"
	desc = "A tile with an entrancing blue shimmer."
	icon_state = "sleep"
	result_path = /obj/structure/destructible/clockwork/trap/sleepy
	clockwork_desc = "A tile that when activated, robs the people standing above it of their consciousness briefly."

/obj/structure/destructible/clockwork/trap/sleepy
	name = "slumber tile"
	desc = "A tile with an entrancing blue shimmer."
	icon_state = "sleep_on"
	component_datum = /datum/component/clockwork_trap/sleepy
	unwrench_path = /obj/item/clockwork/trap_placer/sleepy
	clockwork_desc = "A tile that when activated, robs the people standing above it of their consciousness briefly."
	COOLDOWN_DECLARE(sleepy_cooldown)
	/// Time between shots
	var/sleepy_cd_time = 20 SECONDS

/obj/structure/destructible/clockwork/trap/sleepy/examine(mob/user)
	. = ..()

	if(!COOLDOWN_FINISHED(src, sleepy_cooldown) && IS_CLOCK(user))
		. += span_brass("It's not ready to activate again yet!")

/// A 5 second insta-sleep is pretty powerful, then again we have a skewer which does is basically this but you can fight back.
/obj/structure/destructible/clockwork/trap/sleepy/proc/sleepy_time()
	if(!COOLDOWN_FINISHED(src, sleepy_cooldown))
		return

	for(var/mob/living/carbon/intruding_mob in get_turf(src))
		if(intruding_mob.incorporeal_move || (intruding_mob.movement_type & (FLOATING|FLYING)))
			continue

		if(IS_CLOCK(intruding_mob))
			to_chat(intruding_mob, span_warning("You dodge out of the way of [src]!"))
			continue

		//playsound(src, 'sound/machines/clockcult/brass_skewer.ogg', 50, TRUE)
		icon_state = "sleep"

		intruding_mob.Sleeping(5 SECONDS)
		intruding_mob.adjust_drowsiness(10 SECONDS)

	COOLDOWN_START(src, sleepy_cooldown, sleepy_cd_time)
	addtimer(CALLBACK(src, PROC_REF(revert_icon)), sleepy_cd_time)


/obj/structure/destructible/clockwork/trap/sleepy/proc/revert_icon()
	icon_state = initial(icon_state)

/datum/component/clockwork_trap/sleepy
	takes_input = TRUE

/datum/component/clockwork_trap/sleepy/trigger()
	if(!..())
		return

	var/obj/structure/destructible/clockwork/trap/sleepy/sleepy_parent = parent
	sleepy_parent.sleepy_time()
