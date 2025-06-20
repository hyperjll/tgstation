#define FIRE_RANGE 4
#define BASE_DAMAGE 7
#define MINIMUM_DAMAGE 4
#define DAMAGE_FALLOFF 1

/obj/item/clockwork/trap_placer/turret
	name = "turret tile"
	desc = "A steam powered rotating floor panel with an in-built turret. When input is received it will pick a random hostile close by to shoot them."
	icon_state = "turret"
	result_path = /obj/structure/destructible/clockwork/trap/turret
	clockwork_desc = "A floor panel capable of flinging anyone back when triggered."

/obj/structure/destructible/clockwork/trap/turret
	name = "turret tile"
	desc = "A steam powered rotating floor panel with an in-built turret. When input is received it will pick a random hostile close by to shoot them."
	icon_state = "turret"
	component_datum = /datum/component/clockwork_trap/turret
	unwrench_path = /obj/item/clockwork/trap_placer/turret
	clockwork_desc = "A floor panel capable acting as an extremely weak turret. Exceptional when paired together at the same time. However, it does have a long cooldown between uses."
	COOLDOWN_DECLARE(turret_cooldown)
	/// Time between shots
	var/shoot_cooldown = 20 SECONDS

/obj/structure/destructible/clockwork/trap/turret/examine(mob/user)
	. = ..()

	if(!COOLDOWN_FINISHED(src, turret_cooldown) && IS_CLOCK(user))
		. += span_brass("It's not ready to activate again yet!")

/// Send all `atom/movable`s flying in the set direction for a decent distance
/obj/structure/destructible/clockwork/trap/turret/proc/shoot()
	if(!COOLDOWN_FINISHED(src, turret_cooldown))
		return

	COOLDOWN_START(src, turret_cooldown, shoot_cooldown)
	addtimer(CALLBACK(src, PROC_REF(cooldown_done)), shoot_cooldown)

	flick("turret_on", src)

	//Check hostiles in range
	var/list/valid_targets = list()
	for(var/mob/living/potential_target in hearers(FIRE_RANGE, src))

		if(IS_CLOCK(potential_target) || potential_target.stat)
			continue

		valid_targets += potential_target

	if(!length(valid_targets))
		return

	playsound(src, 'sound/items/match_strike.ogg', 10, TRUE)

	var/mob/living/target = pick(valid_targets)
	if(!target)
		return

	dir = get_dir(get_turf(src), get_turf(target))

	// Apply 10 damage (- 1 for each tile away they are), or 5, whichever is larger
	target.apply_damage(max(BASE_DAMAGE - (get_dist(src, target) * DAMAGE_FALLOFF), MINIMUM_DAMAGE), BURN)
	to_chat(target, span_boldwarning("You feel pellet of energy hit you!"))

	new /obj/effect/temp_visual/ratvar/ocular_warden(get_turf(target))
	new /obj/effect/temp_visual/ratvar/ocular_warden(get_turf(src))

	playsound(target, 'sound/items/syringeproj.ogg', 20, TRUE)

/// Visual update when the cooldown's finished
/obj/structure/destructible/clockwork/trap/turret/proc/cooldown_done()
	visible_message(span_brass("[src] whirrs with a loud *CLANK* as it reloads."))


/datum/component/clockwork_trap/turret
	takes_input = TRUE

/datum/component/clockwork_trap/turret/trigger()
	if(!..())
		return

	var/obj/structure/destructible/clockwork/trap/turret/turret_parent = parent
	turret_parent.shoot()

#undef FIRE_RANGE
#undef BASE_DAMAGE
#undef MINIMUM_DAMAGE
#undef DAMAGE_FALLOFF
