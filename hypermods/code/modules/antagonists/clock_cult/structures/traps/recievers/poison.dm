/obj/item/clockwork/trap_placer/poison
	name = "poison trap"
	desc = "A tile with a strange violet pattern on it."
	icon_state = "poison"
	result_path = /obj/structure/destructible/clockwork/trap/poison
	clockwork_desc = "A tile enchanted with sickening magicks that manifest a random poison within the person standing on it when triggered."

/obj/structure/destructible/clockwork/trap/poison
	name = "poison trap"
	desc = "A tile with a strange violet pattern on it."
	icon_state = "poison_on"
	component_datum = /datum/component/clockwork_trap/poison
	unwrench_path = /obj/item/clockwork/trap_placer/poison
	clockwork_desc = "A tile enchanted with sickening magicks that manifest a random poison within the person standing on it when triggered."
	COOLDOWN_DECLARE(poison_cooldown)
	/// Time between shots
	var/poison_cd_time = 30 SECONDS
	/// Amount of toxins to inject per use
	var/poison_amt = 2

/obj/structure/destructible/clockwork/trap/poison/examine(mob/user)
	. = ..()

	if(!COOLDOWN_FINISHED(src, poison_cooldown) && IS_CLOCK(user))
		. += span_brass("It's not ready to activate again yet!")

/// Get a random poison and inject all humans above with it.
/obj/structure/destructible/clockwork/trap/poison/proc/toxify()
	if(!COOLDOWN_FINISHED(src, poison_cooldown))
		return

	var/r_type
	var/list/r_types = subtypesof(/datum/reagent/toxin/)
	for(var/i in 1 to 1)
		r_type = pick(r_types)

	for(var/mob/living/carbon/intruding_mob in get_turf(src))
		if(intruding_mob.incorporeal_move || (intruding_mob.movement_type & (FLOATING|FLYING)))
			continue

		if(IS_CLOCK(intruding_mob))
			to_chat(intruding_mob, span_warning("You dodge out of the way of [src]!"))
			continue

		//playsound(src, 'sound/machines/clockcult/brass_skewer.ogg', 50, TRUE)
		icon_state = "poison"

		intruding_mob.reagents?.add_reagent(r_type, poison_amt)

	COOLDOWN_START(src, poison_cooldown, poison_cd_time)
	addtimer(CALLBACK(src, PROC_REF(revert_icon)), poison_cd_time)


/obj/structure/destructible/clockwork/trap/poison/proc/revert_icon()
	icon_state = initial(icon_state)

/datum/component/clockwork_trap/poison
	takes_input = TRUE

/datum/component/clockwork_trap/poison/trigger()
	if(!..())
		return

	var/obj/structure/destructible/clockwork/trap/poison/poison_parent = parent
	poison_parent.toxify()
