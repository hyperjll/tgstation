/datum/reagent/diseasedblood
	name = "Blood"
	description = "Are you sure this is tomato juice?"
	color = "#C80000" // rgb: 146, 209, 125
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	taste_description = "iron"

/datum/reagent/diseasedblood/expose_mob(mob/living/L, methods=TOUCH, reac_volume, show_message = 1, permeability = 1)
	if((methods & (PATCH|INGEST|INJECT)) || ((methods & VAPOR) && prob(min(reac_volume,100)*permeability)))
		L.ForceContractDisease(new /datum/disease/advance/random(), FALSE, TRUE)

/datum/reagent/liquid_air
	name = "Liquidized Breatheable Air"
	description = "A condensed liquid form of breatheable air."
	reagent_state = LIQUID
	metabolization_rate = 1.5 * REAGENTS_METABOLISM
	color = "#000000"
	taste_description = "air"

/datum/reagent/liquid_air/expose_turf(turf/open/exposed_turf, reac_volume)
	. = ..()
	if(istype(exposed_turf))
		var/temp = holder ? holder.chem_temp : T20C
		exposed_turf.atmos_spawn_air("oxygen=[reac_volume/2];TEMP=[temp]")
		exposed_turf.atmos_spawn_air("nitrogen=[reac_volume/5];TEMP=[temp]")
	return
