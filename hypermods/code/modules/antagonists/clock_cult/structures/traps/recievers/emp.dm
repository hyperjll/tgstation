/obj/item/clockwork/trap_placer/emp
	name = "emp tile"
	desc = "A tile with a large glowing gem in the middle."
	icon_state = "emp"
	result_path = /obj/structure/destructible/clockwork/trap/emp
	clockwork_desc = "A tile capable of hitting targets above it with a light electromagnetic wave when triggered."

/obj/structure/destructible/clockwork/trap/emp
	name = "emp tile"
	desc = "A tile with a large glowing gem in the middle."
	icon_state = "emp_on"
	component_datum = /datum/component/clockwork_trap/emp
	unwrench_path = /obj/item/clockwork/trap_placer/emp
	clockwork_desc = "A tile capable of hitting targets above it with a light electromagnetic wave when triggered."
	COOLDOWN_DECLARE(empblast_cooldown)
	/// Time between shots
	var/empblast_cd_time = 20 SECONDS

/obj/structure/destructible/clockwork/trap/emp/examine(mob/user)
	. = ..()

	if(!COOLDOWN_FINISHED(src, empblast_cooldown) && IS_CLOCK(user))
		. += span_brass("It's not ready to activate again yet!")

/// Hit the target(s) above you with a light emp.
/obj/structure/destructible/clockwork/trap/emp/proc/emp_blast()
	if(!COOLDOWN_FINISHED(src, empblast_cooldown))
		return

	for(var/mob/living/intruding_mob in get_turf(src))
		if(intruding_mob.incorporeal_move || (intruding_mob.movement_type & (FLOATING|FLYING)))
			continue

		if(IS_CLOCK(intruding_mob))
			to_chat(intruding_mob, span_warning("You dodge out of the way of [src]!"))
			continue

		//playsound(src, 'sound/machines/clockcult/brass_skewer.ogg', 50, TRUE)
		icon_state = "emp"

		intruding_mob.emp_act(EMP_LIGHT)
		new /obj/effect/temp_visual/emp/pulse(get_turf(intruding_mob))

	COOLDOWN_START(src, empblast_cooldown, empblast_cd_time)
	addtimer(CALLBACK(src, PROC_REF(revert_icon)), empblast_cd_time)


/obj/structure/destructible/clockwork/trap/emp/proc/revert_icon()
	icon_state = initial(icon_state)

/datum/component/clockwork_trap/emp
	takes_input = TRUE

/datum/component/clockwork_trap/emp/trigger()
	if(!..())
		return

	var/obj/structure/destructible/clockwork/trap/emp/emp_parent = parent
	emp_parent.emp_blast()
