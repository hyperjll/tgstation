/datum/reagent/diseasedblood
	name = "Blood"
	description = "Are you sure this is tomato juice?"
	color = "#C80000" // rgb: 146, 209, 125
	taste_description = "iron"

/datum/reagent/diseasedblood/expose_mob(mob/living/L, methods=TOUCH, reac_volume, show_message = 1, permeability = 1)
	if((methods & (PATCH|INGEST|INJECT)) || ((methods & VAPOR) && prob(min(reac_volume,100)*permeability)))
		L.ForceContractDisease(new /datum/disease/advance/random(), FALSE, TRUE)

/datum/reagent/liquid_air
	name = "Liquidized Breatheable Air"
	description = "A condensed liquid form of breatheable air."
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
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/vestine
	name = "Vestine"
	description = "Produced by Vahlen Pharmaceuticals as a miracle component for producing difficult-to-make or otherwise luxorious reagents."
	color ="#253654"
	taste_description = "vaugely evil"

/datum/reagent/shrinkcompound
	name = "Shrink Compound"
	description = "A highly experimental chemical compound that results in temporary molecular compression of the host."
	color = "#FFFFFF"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	self_consuming = TRUE
	addiction_types = list(/datum/addiction/medicine = 10)
	var/current_size = RESIZE_DEFAULT_SIZE
	var/newsize = 1
	var/delay = 1 SECONDS // Timer between size adjustments
	var/max_shrinks = 75 // The maxmimum size reduction. This deducted by 1 each second (so 100 / ninety = 0.1 size mult)

/datum/reagent/shrinkcompound/on_mob_life(mob/living/carbon/affected_mob)
	..()
	while(max_shrinks > 0)
		affected_mob.update_transform(newsize/current_size)
		current_size = newsize
		sleep(delay)
		max_shrinks--
		newsize -= 0.01

/datum/reagent/shrinkcompound/on_mob_metabolize(mob/living/affected_mob)
	affected_mob.maxHealth -= 75
	affected_mob.density = FALSE

/datum/reagent/shrinkcompound/on_mob_end_metabolize(mob/living/affected_mob)
	// Putting this here to remove any additional size shenanigans
	affected_mob.maxHealth += 75 // Restore max health
	affected_mob.health += 75 // Restore missing health
	affected_mob.density = TRUE
	affected_mob.update_transform(RESIZE_DEFAULT_SIZE/current_size)
	current_size = RESIZE_DEFAULT_SIZE
	..()

/datum/reagent/plantnutriment/speedgrow
	name = "Speed-Gro"
	description = "A specialized nutriment, which decreases plant endurance and lifespan, but accelerates the plants production, maturation and age."
	color = "#6917D1"
	tox_prob = 10
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/plantnutriment/speedgrow/on_hydroponics_apply(obj/machinery/hydroponics/mytray, mob/user)
	var/obj/item/seeds/myseed = mytray.myseed
	if(!isnull(myseed))
		myseed.adjust_endurance(-round(volume * 0.4))
		myseed.adjust_lifespan(-round(volume * 0.1))
		myseed.adjust_production(-round(volume * 0.15))
		myseed.adjust_maturation(-round(volume * 0.15))

	var/obj/machinery/hydroponics/constructable/the_tray = mytray
	if(!isnull(the_tray))
		the_tray.age = (the_tray.age + round(volume * 0.5))
		the_tray.update_appearance()

/datum/reagent/glue
	name = "Glue"
	description = "A common arts & crafts reagent well-known for it's easy-to-apply adhesive properties."
	color = "#FFFFFF"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM
	evaporates = FALSE
	slippery = FALSE
	sticky = TRUE
	sticky_chance = 40

/datum/reagent/glue/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, metabolization_ratio)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjust_tox_loss(0.4 * metabolization_ratio * seconds_per_tick * normalise_creation_purity(), updating_health = FALSE, required_biotype = affected_biotype)
	need_mob_update = affected_mob.adjust_organ_loss(ORGAN_SLOT_BRAIN, 0.1 * REM * seconds_per_tick, required_organ_flag = affected_organ_flags)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH
