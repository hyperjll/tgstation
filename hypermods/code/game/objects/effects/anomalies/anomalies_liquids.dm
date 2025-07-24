/obj/effect/anomaly/liquid
	name = "liquid anomaly"
	icon = 'hypermods/icons/effects/anomalies.dmi'
	icon_state = "liquid"
	anomaly_core = /obj/item/assembly/signaler/anomaly/liquid
	move_chance = 0
	pulse_icon = "liquid_pulse"
	var/ticks = 0
	/// How many seconds between each release
	var/releasedelay = 20
	/// What reagent is this anomaly based off of?
	var/anomaly_reagent
	/// What mob do we spawn when we go critical?
	var/spawned_mob = /mob/living/basic/elemental
	/// How many of said mob do we spawn when we go critical?
	var/spawn_amt = 5
	/// Chance our elemental mob (if they ARE an elemental mob) carries over our anomaly's reagents.
	var/anom_reagent_passover_chance = 75

/obj/effect/anomaly/liquid/Initialize(mapload, new_lifespan)
	. = ..()
	reagents = new(100)

	var/list/r_types = subtypesof(/datum/reagent/)
	for(var/i in 1 to 1)
		anomaly_reagent = pick(r_types)

	reagents.add_reagent(anomaly_reagent, 100)
	var/datum/reagent/get_that_reagent_color = anomaly_reagent
	color = get_that_reagent_color.color

/obj/effect/anomaly/liquid/anomalyEffect(seconds_per_tick)
	..()
	ticks += seconds_per_tick
	if(ticks < releasedelay)
		return FALSE
	else
		ticks -= releasedelay
	var/turf/open/tile = get_turf(src)

	if(!tile)
		return

	tile.add_liquid_from_reagents(reagents)
	playsound(tile, 'sound/effects/splat.ogg', 50, 1)

	reagents.add_reagent(anomaly_reagent, 100) // Refill after losing the reagents.

	return TRUE

/obj/effect/anomaly/liquid/detonate()
	INVOKE_ASYNC(src, PROC_REF(release_the_hounds))

/obj/effect/anomaly/liquid/proc/release_the_hounds()
	var/turf/target_turf = get_turf(src)
	playsound(target_turf, 'sound/effects/splat.ogg', 100, TRUE)

	// Spawn some hostile syndicate critters and spread them out
	spawn_and_random_walk(spawned_mob, target_turf, spawn_amt, walk_chance = 50, admin_spawn = ((flags_1 & ADMIN_SPAWNED_1) ? TRUE : FALSE))
