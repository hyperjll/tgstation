#define SPIN_DISTANCE 30
#define SPIN_SPEED 15

/obj/item/clockwork/trap_placer/spin
	name = "spinning plate"
	desc = "A plate with pneumatic-powered motors underneath."
	icon_state = "spin_on"
	result_path = /obj/structure/destructible/clockwork/trap/spin
	clockwork_desc = "A plate capable of high-speed rotations that flings everything in random cardinal directions when triggered."

/obj/structure/destructible/clockwork/trap/spin
	name = "spinning plate"
	desc = "A plate with pneumatic-powered motors underneath. It's probably best you don't step on it."
	icon_state = "spin"
	component_datum = /datum/component/clockwork_trap/spin
	unwrench_path = /obj/item/clockwork/trap_placer/spin
	clockwork_desc = "A plate capable of high-speed rotations that flings everything in random cardinal directions when triggered."
	COOLDOWN_DECLARE(spin_cooldown)
	/// Time between spins
	var/spin_cd_time = 10 SECONDS

/obj/structure/destructible/clockwork/trap/spin/examine(mob/user)
	. = ..()

	if(!COOLDOWN_FINISHED(src, spin_cooldown) && IS_CLOCK(user))
		. += span_brass("It's not ready to activate again yet!")

/// Throw absolutely everything around.
/obj/structure/destructible/clockwork/trap/spin/proc/fuck_you()
	if(!COOLDOWN_FINISHED(src, spin_cooldown))
		return

	COOLDOWN_START(src, spin_cooldown, spin_cd_time)
	addtimer(CALLBACK(src, PROC_REF(revert_icon)), 1 SECONDS)

	icon_state = "spin_on"
	var/direction = pick(GLOB.cardinals)

	for(var/atom/movable/movable_atom in get_turf(src))

		if(movable_atom.anchored)
			continue

		movable_atom.throw_at(get_edge_target_turf(src, direction), SPIN_DISTANCE, SPIN_SPEED)


/obj/structure/destructible/clockwork/trap/spin/proc/revert_icon()
	icon_state = initial(icon_state)

/datum/component/clockwork_trap/spin
	takes_input = TRUE

/datum/component/clockwork_trap/spin/trigger()
	if(!..())
		return

	var/obj/structure/destructible/clockwork/trap/spin/spin_parent = parent
	spin_parent.fuck_you()

#undef SPIN_DISTANCE
#undef SPIN_SPEED
