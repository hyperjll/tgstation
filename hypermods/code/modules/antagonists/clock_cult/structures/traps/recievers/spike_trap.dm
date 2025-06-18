/obj/item/clockwork/trap_placer/spike_trap
	name = "spike trap"
	desc = "A large tile with pneumatic-powered spikes on the underside."
	icon_state = "spike_trap_on" // putting this on the spike_trap_on varient to diff between pressure plates
	result_path = /obj/structure/destructible/clockwork/trap/spike_trap
	clockwork_desc = "A spike trap which activates to impale the feet of the person(s) above it, dealing small damage and knocking them down."

//This doesn't function like a "trap" in of itself, but obscures vision when active.
/obj/structure/destructible/clockwork/trap/spike_trap
	name = "spike trap"
	desc = "A tile with spike-holes embedded into it. It's probably best you stay clear."
	icon_state = "spike_trap"
	clockwork_desc = "A spike trap which activates to impale the feet of the person(s) above it, dealing small damage and knocking them down."
	break_message = span_warning("The spike trap crumbles into a heap!")
	max_integrity = 100
	density = FALSE
	component_datum = /datum/component/clockwork_trap/spike_trap
	unwrench_path = /obj/item/clockwork/trap_placer/spike_trap
	COOLDOWN_DECLARE(spike_cooldown)
	/// Time until it's able to stab someones feet again
	var/spike_cd_time = 30 SECONDS
	/// Damage each trap deals when it's activated
	var/spike_damage = 5
	/// Damage type the trap deals
	var/spike_dmg_type = BRUTE
	/// Length of the spike knockdown debuff
	var/spike_knockdown_dur = 4 SECONDS

/obj/structure/destructible/clockwork/trap/spike_trap/proc/spike_em()
	if(!COOLDOWN_FINISHED(src, spike_cooldown))
		return

	/// Where the spikes attack
	var/spike_atk_location = pick(BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)

	for(var/mob/living/intruding_mob in get_turf(src))
		if(intruding_mob.incorporeal_move || (intruding_mob.movement_type & (FLOATING|FLYING)))
			continue

		if(IS_CLOCK(intruding_mob))
			to_chat(intruding_mob, span_warning("You dodge out of the way of [src]!"))
			continue

		playsound(src, 'sound/machines/clockcult/brass_skewer.ogg', 50, TRUE)
		icon_state = "spike_trap_on"

		intruding_mob.apply_damage(spike_damage, spike_dmg_type, spike_atk_location) // Fully var editable
		intruding_mob.Knockdown(spike_knockdown_dur)

		COOLDOWN_START(src, spike_cooldown, spike_cd_time)
		addtimer(CALLBACK(src, PROC_REF(retract)), 2 SECONDS)

/obj/structure/destructible/clockwork/trap/spike_trap/proc/retract()
	icon_state = initial(icon_state)


/datum/component/clockwork_trap/spike_trap
	takes_input = TRUE

/datum/component/clockwork_trap/spike_trap/trigger()
	if(!..())
		return

	var/obj/structure/destructible/clockwork/trap/spike_trap/spike_trap_parent = parent
	spike_trap_parent.spike_em()
