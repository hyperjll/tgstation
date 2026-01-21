/datum/reagent
	///Whether it will evaporate if left untouched on a liquids simulated puddle
	var/evaporates = TRUE
	///How much fire power does the liquid have, for burning on simulated liquids. Not enough fire power/unit of entire mixture may result in no fire
	var/liquid_fire_power = 0
	///How fast does the liquid burn on simulated turfs, if it does
	var/liquid_fire_burnrate = 0
	///Whether a fire from this requires oxygen in the atmosphere
	var/fire_needs_oxygen = TRUE
	///The opacity of the chems used to determine the alpha of liquid turfs
	var/opacity = 175
	///The rate of evaporation in units per call
	var/evaporation_rate = 1
	/// do we have a turf exposure (used to prevent liquids doing un-needed processes)
	var/turf_exposure = FALSE
	/// are we slippery?
	var/slippery = TRUE
	/// how slippery, slip chance will override each other, highest takes all.
	var/slip_chance = 7
	/// are we sticky?
	var/sticky = FALSE
	/// chance to 'catch' someone's movement similar to webbing. Requires the turf to be sticky.
	var/sticky_chance = 10
	///are we able to merge
	var/can_merge = TRUE

/datum/reagent/proc/add_to_member(obj/effect/abstract/liquid_turf/adder)
	return

/datum/reagent/proc/remove_from_member(obj/effect/abstract/liquid_turf/remover)
	return

/datum/reagent/proc/evaporate(turf/exposed_turf, reac_volume)
	return
