/**
 * A version of chemical smoke with a intermediate lifespan which is invisible. Used by scented candles.
 */
/obj/effect/particle_effect/fluid/smoke/chem/invisible
	lifetime = 10 SECONDS
	opacity = FALSE
	alpha = 0

/obj/effect/particle_effect/fluid/smoke/chem/invisible/quick
	lifetime = 4 SECONDS

/datum/effect_system/fluid_spread/smoke/chem/invisible
	effect_type = /obj/effect/particle_effect/fluid/smoke/chem/invisible

/datum/effect_system/fluid_spread/smoke/chem/invisible/quick
	effect_type = /obj/effect/particle_effect/fluid/smoke/chem/invisible/quick
