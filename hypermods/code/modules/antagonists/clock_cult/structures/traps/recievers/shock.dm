/obj/item/clockwork/trap_placer/shock
	name = "shock tile"
	desc = "A tile which radiates with electrical energy."
	icon_state = "shock"
	result_path = /obj/structure/destructible/clockwork/trap/shock
	clockwork_desc = "A tile rigged directly to your cult's energy source, when triggered, it'll electrocute everyone standing on it."

/obj/structure/destructible/clockwork/trap/shock
	name = "shock tile"
	desc = "A tile which radiates with electrical energy."
	icon_state = "shock_on"
	component_datum = /datum/component/clockwork_trap/shock
	unwrench_path = /obj/item/clockwork/trap_placer/shock
	clockwork_desc = "A tile rigged directly to your cult's energy source, when triggered, it'll electrocute everyone standing on it."
	COOLDOWN_DECLARE(shock_cooldown)
	/// Time between shocks
	var/shock_cd_time = 20 SECONDS

/obj/structure/destructible/clockwork/trap/shock/examine(mob/user)
	. = ..()

	if(!COOLDOWN_FINISHED(src, shock_cooldown) && IS_CLOCK(user))
		. += span_brass("It's not ready to activate again yet!")

/// Shock everyone above us
/obj/structure/destructible/clockwork/trap/shock/proc/electrify()
	if(!COOLDOWN_FINISHED(src, shock_cooldown))
		return

	for(var/mob/living/intruding_mob in get_turf(src))
		if(intruding_mob.incorporeal_move || (intruding_mob.movement_type & (FLOATING|FLYING)))
			continue

		if(IS_CLOCK(intruding_mob))
			to_chat(intruding_mob, span_warning("You dodge out of the way of [src]!"))
			continue

		//playsound(src, 'sound/machines/clockcult/brass_skewer.ogg', 50, TRUE)
		icon_state = "shock"

		intruding_mob.electrocute_act(10, src, 1, SHOCK_NOGLOVES|SHOCK_SUPPRESS_MESSAGE)

	COOLDOWN_START(src, shock_cooldown, shock_cd_time)
	addtimer(CALLBACK(src, PROC_REF(revert_icon)), shock_cd_time)


/obj/structure/destructible/clockwork/trap/shock/proc/revert_icon()
	icon_state = initial(icon_state)

/datum/component/clockwork_trap/shock
	takes_input = TRUE

/datum/component/clockwork_trap/shock/trigger()
	if(!..())
		return

	var/obj/structure/destructible/clockwork/trap/shock/shock_parent = parent
	shock_parent.electrify()
