/obj/effect/anomaly/flesh
	name = "flesh anomaly"
	icon = 'hypermods/icons/effects/anomalies.dmi'
	icon_state = "flesh"
	anomaly_core = /obj/item/assembly/signaler/anomaly/flesh
	move_chance = 0
	pulse_icon = "flesh_pulse"
	var/ticks = 0
	/// How many seconds between each release
	var/releasedelay = 30
	/// What mob do we spawn when we pulse? Uses a subtype.
	var/spawned_mob_subtype = /mob/living/basic/flesh
	/// How many of said mob subtype do we spawn each pulse?
	var/spawn_amt = 1
	/// How many of said mob subtype do we spawn after going critical?
	var/crit_spawn_amt = 5
	/// Just a list likely for var edits to allow admins to pre-install mutations into an anomaly's tendon spawn.
	var/list/mutations = list()

/obj/effect/anomaly/flesh/anomalyEffect(seconds_per_tick)
	..()
	ticks += seconds_per_tick
	if(ticks < releasedelay)
		return FALSE
	else
		ticks -= releasedelay

	var/turf/target_turf = get_turf(src)
	playsound(target_turf, 'hypermods/sound/effects/radpulse1.ogg', 100, TRUE)

	var/spawned_mob
	var/list/possible_mobs = subtypesof(spawned_mob_subtype)
	for(var/i in 1 to 1) // Pick one at random.
		spawned_mob = pick(possible_mobs)

	spawn_and_random_walk(spawned_mob, target_turf, spawn_amt, walk_chance = 50, admin_spawn = ((flags_1 & ADMIN_SPAWNED_1) ? TRUE : FALSE))

	return TRUE

/obj/effect/anomaly/flesh/detonate()
	INVOKE_ASYNC(src, PROC_REF(release_the_hounds))

/obj/effect/anomaly/flesh/proc/release_the_hounds()
	var/turf/target_turf = get_turf(src)
	playsound(target_turf, 'hypermods/sound/effects/radpulse2.ogg', 100, TRUE)

	var/spawned_mob
	var/list/possible_mobs = subtypesof(spawned_mob_subtype)
	for(var/i in 1 to 1) // Pick one at random.
		spawned_mob = pick(possible_mobs)

	spawn_and_random_walk(spawned_mob, target_turf, crit_spawn_amt, walk_chance = 50, admin_spawn = ((flags_1 & ADMIN_SPAWNED_1) ? TRUE : FALSE))

	new /datum/spacetendons_controller(target_turf, mutations, 75, 10) //spawn a controller at turf with randomized stats and a single random mutation
