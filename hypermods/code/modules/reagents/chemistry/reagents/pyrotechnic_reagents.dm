/datum/reagent/tazinide //Tazinide. It's teslium if it were on steroids.
	name = "Tazinide"
	description = "An highly dangerous metallic mixture. Periodically electrocutes its victim, and makes electrocutions against them more deadly. Can often interfere with one's motor ability."
	reagent_state = LIQUID
	color = "#ffe700" //RGB: 32, 50, 77
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	taste_description = "charged evil"
	self_consuming = TRUE
	var/shock_timer = 0
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/tazinide/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	shock_timer++
	if(shock_timer >= rand(2, 10)) //Random shocks are wildly unpredictable
		shock_timer = 0
		affected_mob.electrocute_act(rand(5, 20), "Tazinide in their body", 1, SHOCK_NOGLOVES) //SHOCK_NOGLOVES because it's caused from INSIDE of you
		playsound(affected_mob, SFX_SPARKS, 50, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)

/datum/reagent/tazinide/on_mob_metabolize(mob/living/carbon/human/affected_mob)
	. = ..()
	if(!istype(affected_mob))
		return
	affected_mob.physiology.siemens_coeff *= 2

/datum/reagent/tazinide/on_mob_end_metabolize(mob/living/carbon/human/affected_mob)
	. = ..()
	if(!istype(affected_mob))
		return
	affected_mob.physiology.siemens_coeff *= 0.5
