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

/datum/reagent/antihardcrit
	name = "Conscience Stabilizers"
	description = "A reagent specifically used to stabilize critical patients to allow them to move despite the severity of their injuries. Impossible to synthesize outside of virology."
	color = "#78008C"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM

/datum/reagent/antihardcrit/on_mob_metabolize(mob/living/L)
	..()
	ADD_TRAIT(L,TRAIT_NOHARDCRIT,type)

/datum/reagent/antihardcrit/on_mob_end_metabolize(mob/living/L)
	REMOVE_TRAIT(L,TRAIT_NOHARDCRIT,type)
	..()

/datum/reagent/diseasensstim
	name = "Neurological Stimulants"
	description = "A minor neurological sitmulant capable of boosting the host's movement speed. Impossible to synthesize outside of virology."
	color = "#78008C"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM

/datum/reagent/diseasensstim/on_mob_metabolize(mob/living/L)
	..()
	L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/diseasensstim)

/datum/reagent/diseasensstim/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/diseasensstim)
	..()

/datum/reagent/lemoline
	name = "Lemoline"
	description = "Commonly synthesized in off-station laboratories, used in several high-quality medicines."
	color ="#FFF44F"
	taste_description = "lemony"

/datum/reagent/vestine
	name = "Vestine"
	description = "Produced by Vahlen Pharmaceuticals as a miracle component for producing difficult-to-make or otherwise luxorious reagents."
	color ="#253654"
	taste_description = "vaugely evil"
