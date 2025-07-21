/obj/effect/anomaly/ice
	name = "cyrogenic anomaly"
	icon = 'hypermods/icons/effects/anomalies.dmi'
	icon_state = "cyrogenic"
	anomaly_core = /obj/item/assembly/signaler/anomaly/ice
	move_chance = 0
	pulse_icon = "cyrogenic_pulse"
	var/ticks = 0
	/// How many seconds between each gas release
	var/releasedelay = 10
	/// When going critical, give me the radius of the tile-freeze effect
	var/freezing_range = 10
	/// How long frozen tiles remain frozen?
	var/freeze_duration = 60 SECONDS
	/// The projectile type we attempt to fire every release.
	var/projectile_type = /obj/projectile/ice_anomaly

/**
/obj/effect/anomaly/ice/Initialize(mapload, new_lifespan)
	. = ..()
	apply_wibbly_filters(src)
**/

/obj/effect/anomaly/ice/anomalyEffect(seconds_per_tick)
	..()
	ticks += seconds_per_tick
	if(ticks < releasedelay)
		return FALSE
	else
		ticks -= releasedelay
	var/turf/open/tile = get_turf(src)
	if(istype(tile))
		tile.atmos_spawn_air("[GAS_O2]=1;[GAS_N2]=3;[TURF_TEMPERATURE(100)]")
	fire_shot()
	return TRUE

/obj/effect/anomaly/ice/proc/fire_shot(atom/target)
	var/obj/effect/our_anomaly = loc
	var/obj/projectile/shot = new projectile_type(get_turf(our_anomaly))

	if(!target)
		target = get_offset_target_turf(get_turf(our_anomaly), rand(-3, 3), rand(-3,3))

	//Shooting Code:
	shot.original = target
	shot.fired_from = src
	shot.firer = src // don't hit ourself that would be really annoying
	shot.impacted = list(WEAKREF(our_anomaly) = TRUE)
	shot.aim_projectile(target, our_anomaly)
	shot.fire()

/obj/effect/anomaly/ice/detonate()
	INVOKE_ASYNC(src, PROC_REF(freeze_area))

/obj/effect/anomaly/ice/proc/freeze_area()
	var/turf/open/tile = get_turf(src)
	if(istype(tile))
		tile.atmos_spawn_air("[GAS_FREON]=500;[TURF_TEMPERATURE(100)]") //Make it super cold.

	if(!tile)
		return

	playsound(tile, 'sound/effects/magic/ethereal_exit.ogg', 50, 1)

	for(var/any_turf in circle_range_turfs(center = get_turf(tile), radius = freezing_range))
		if(!isopenturf(any_turf))
			continue
		var/turf/open/open_turf = any_turf
		open_turf.MakeSlippery(TURF_WET_PERMAFROST, freeze_duration, freeze_duration, freeze_duration)
		//open_turf.temperature = temp -- not necessary.
