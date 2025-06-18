/obj/item/clockwork/trap_placer/flame_trap
	name = "flame trap"
	desc = "A large tile with an in-built flamethrower utilizing flammable gases."
	icon_state = "flame_trap"
	result_path = /obj/structure/destructible/clockwork/trap/flame_trap
	clockwork_desc = "A flame trap which activates to ignite the person(s) above it, lighting them on fire."

//This doesn't function like a "trap" in of itself, but obscures vision when active.
/obj/structure/destructible/clockwork/trap/flame_trap
	name = "flame trap"
	desc = "A large tile with an in-built flamethrower utilizing flammable gases."
	icon_state = "flame_trap"
	clockwork_desc = "A flame trap which activates to ignite the person(s) above it, lighting them on fire."
	break_message = span_warning("The flame trap crumbles into a heap!")
	max_integrity = 100
	density = FALSE
	component_datum = /datum/component/clockwork_trap/flame_trap
	unwrench_path = /obj/item/clockwork/trap_placer/flame_trap
	COOLDOWN_DECLARE(flame_cooldown)
	/// Time until it's able to stab someones feet again
	var/flame_cd_time = 30 SECONDS
	/// The amount of fire stacks gained by being on this when it goes off
	var/flame_stacks = 1

/obj/structure/destructible/clockwork/trap/flame_trap/proc/flame_em()
	if(!COOLDOWN_FINISHED(src, flame_cooldown))
		return

	for(var/mob/living/intruding_mob in get_turf(src))
		if(intruding_mob.incorporeal_move || (intruding_mob.movement_type & (FLOATING|FLYING)))
			continue

		if(IS_CLOCK(intruding_mob))
			to_chat(intruding_mob, span_warning("You dodge out of the way of [src]!"))
			continue

		playsound(src, 'sound/effects/fire_puff.ogg', 50, TRUE)
		icon_state = "flame_trap_on"

		intruding_mob.adjust_wet_stacks(-flame_stacks) // Dry you off
		intruding_mob.adjust_fire_stacks(flame_stacks)
		intruding_mob.ignite_mob()

		COOLDOWN_START(src, flame_cooldown, flame_cd_time)
		addtimer(CALLBACK(src, PROC_REF(shut_off)), 5 SECONDS)

/obj/structure/destructible/clockwork/trap/flame_trap/proc/shut_off()
	icon_state = initial(icon_state)


/datum/component/clockwork_trap/flame_trap
	takes_input = TRUE

/datum/component/clockwork_trap/flame_trap/trigger()
	if(!..())
		return

	var/obj/structure/destructible/clockwork/trap/flame_trap/flame_trap_parent = parent
	flame_trap_parent.flame_em()
