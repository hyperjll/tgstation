#define INTERDICTION_LENS_RANGE 4
#define POWER_PER_PERSON 4

/obj/structure/destructible/clockwork/gear_base/powered/interdiction_lens
	name = "interdiction lens"
	desc = "A mesmerizing light that flashes to a rhythm that you just can't stop tapping to."
	clockwork_desc = "A small device which will slow down nearby attackers and projectiles at a large power cost, both active and passive."
	icon_state = "interdiction_lens"
	base_icon_state = "interdiction_lens"
	anchored = TRUE
	break_message = span_warning("The interdiction lens breaks into multiple fragments, which gently float to the ground.")
	max_integrity = 150
	minimum_power = POWER_PER_PERSON
	passive_consumption = 10
	/// Part 1/2 of the interdictor. This portion acts as the monitor, sending calls to the 2nd part when it finds something.
	var/datum/proximity_monitor/advanced/dampening_field
	/// Part 2 of the interdictor. This one actually does the dampening, but requires the dampening_field to tell it what to dampen
	var/obj/item/borg/projectile_dampen/clockcult/internal_dampener


/obj/structure/destructible/clockwork/gear_base/powered/interdiction_lens/Initialize(mapload)
	. = ..()
	internal_dampener = new


/obj/structure/destructible/clockwork/gear_base/powered/interdiction_lens/Destroy()
	if(enabled)
		STOP_PROCESSING(SSobj, src)
	QDEL_NULL(dampening_field)
	QDEL_NULL(internal_dampener)
	return ..()


/obj/structure/destructible/clockwork/gear_base/powered/interdiction_lens/process(delta_time)
	. = ..()
	if(!.)
		return

	for(var/mob/living/living_mob in viewers(INTERDICTION_LENS_RANGE, src))
		if(!IS_CLOCK(living_mob) && use_power(POWER_PER_PERSON))
			living_mob.apply_status_effect(STATUS_EFFECT_INTERDICTION)

	for(var/obj/vehicle/sealed/mecha/mech in range(INTERDICTION_LENS_RANGE, src))
		var/clock_pilot = FALSE
		for(var/mob/living/pilot in mech.occupants)
			if(!IS_CLOCK(pilot))
				continue

			clock_pilot = TRUE
			break

		if(clock_pilot || !use_power(POWER_PER_PERSON))
			continue

		mech.emp_act(EMP_HEAVY)
		do_sparks(mech, TRUE, mech)


/obj/structure/destructible/clockwork/gear_base/powered/interdiction_lens/repowered()
	. = ..()
	flick("interdiction_lens_recharged", src)

	if(istype(dampening_field))
		QDEL_NULL(dampening_field)

	dampening_field = new(src, INTERDICTION_LENS_RANGE, TRUE, src)


/obj/structure/destructible/clockwork/gear_base/powered/interdiction_lens/depowered()
	. = ..()
	flick("interdiction_lens_discharged", src)
	QDEL_NULL(dampening_field)


/obj/structure/destructible/clockwork/gear_base/powered/interdiction_lens/free/use_power(amount)
	return


/obj/structure/destructible/clockwork/gear_base/powered/interdiction_lens/free/check_power(amount)
	if(!LAZYLEN(transmission_sigils))
		return FALSE
	return TRUE


//Dampening field

/datum/proximity_monitor/advanced/projectile_dampener/peaceborg/clockwork
	/// 0.75 or 25% less damage is default rn.
	//bullet_effects.projectile_damage_multiplier = 0.75 // Only -25% damage instead of -50%

/datum/proximity_monitor/advanced/projectile_dampener/peaceborg/clockwork/catch_bullet_effect(obj/projectile/bullet)
	if(isliving(bullet.firer))
		var/mob/living/living_firer = bullet.firer
		if(IS_CLOCK(living_firer))
			return

	ADD_TRAIT(bullet,TRAIT_GOT_DAMPENED, REF(src))
	RegisterSignal(bullet, COMSIG_ATOM_UPDATE_OVERLAYS, PROC_REF(projectile_overlay_updated))
	SEND_SIGNAL(src, COMSIG_DAMPENER_CAPTURE, bullet)
	bullet_effects.apply_effects(bullet)
	bullet.update_appearance()

/obj/item/borg/projectile_dampen/clockcult
	name = "internal clockcult projectile dampener"
	dampening_field = /datum/proximity_monitor/advanced/projectile_dampener/peaceborg/clockwork

/obj/item/borg/projectile_dampen/clockcult/process_recharge()
	energy = maxenergy

#undef INTERDICTION_LENS_RANGE
#undef POWER_PER_PERSON
