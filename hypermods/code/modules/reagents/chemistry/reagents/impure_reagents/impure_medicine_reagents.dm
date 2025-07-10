/datum/reagent/inverse/bicaridine
	name = "Razorium"
	description = "Causes wide-spread lacerations and cuts when exposed to a patient."
	color = "#eaffff"
	taste_description = "razors"
	tox_damage = 0

/datum/reagent/inverse/bicaridine/expose_mob(mob/living/exposed_mob, methods=TOUCH, reac_volume, show_message = TRUE)
	if(!iscarbon(exposed_mob))
		return
	var/mob/living/carbon/carbies = exposed_mob
	if(carbies.stat == DEAD)
		show_message = 0
	if(!(methods & (PATCH|TOUCH|VAPOR)))
		return
	var/harmies = clamp(carbies.adjustBruteLoss(2 * reac_volume, updating_health = FALSE, required_bodytype = affected_bodytype), 0, 20)

	var/need_mob_update = harmies

	if(need_mob_update)
		carbies.updatehealth()
	if(show_message)
		to_chat(carbies, span_danger("You feel thousands of tiny cuts scour your body!"))
	. = ..()

/datum/reagent/inverse/bicaridine/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	var/need_mob_update
	need_mob_update += affected_mob.adjustBruteLoss(2 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH
	. = ..()

/datum/reagent/inverse/kelotane
	name = "Insuzine"
	description = "Heals burns within the patient quickly and reduces their bodily temperature quickly. If overdosed, it'll encase them in a block of ice should they be cold. Purges certain electrical reagents. Overdoses in small amounts."
	color = "#9966ff"
	taste_description = "frosty medicine"
	ph = 10
	overdose_threshold = 12
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	tox_damage = 0

/datum/reagent/inverse/kelotane/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	var/need_mob_update

	if(!overdosed)
		need_mob_update += affected_mob.adjustFireLoss(-4 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	affected_mob.adjust_bodytemperature(rand(-30,-25) * TEMPERATURE_DAMAGE_COEFFICIENT * REM * seconds_per_tick, 80) // Chilly af

	affected_mob.reagents.remove_reagent(/datum/reagent/teslium, 4)
	affected_mob.reagents.remove_reagent(/datum/reagent/tazinide, 4)
	affected_mob.reagents.remove_reagent(/datum/reagent/teslium/energized_jelly, 4)
	affected_mob.reagents.remove_reagent(/datum/reagent/consumable/liquidelectricity, 4)
	affected_mob.reagents.remove_reagent(/datum/reagent/consumable/liquidelectricity/enriched, 4)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH
	. = ..()

/datum/reagent/inverse/kelotane/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	var/need_mob_update
	need_mob_update += affected_mob.adjustFireLoss(2 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)

	var/target_temp = affected_mob.get_body_temp_normal(apply_change = FALSE)
	if(affected_mob.bodytemperature <= target_temp && !affected_mob.has_status_effect(/datum/status_effect/frozenstasis)) // If cold, incase in ice. This re-applies the cube should it be broken.
		affected_mob.adjust_bodytemperature(-300)
		affected_mob.apply_status_effect(/datum/status_effect/frozenstasis)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH
	. = ..()

/datum/reagent/inverse/kelotane/on_mob_end_metabolize(mob/living/affected_mob)
	. = ..()
	affected_mob.remove_status_effect(/datum/status_effect/frozenstasis)

/datum/reagent/inverse/kelotane/on_mob_delete(mob/living/affected_mob, amount)
	. = ..()
	affected_mob.remove_status_effect(/datum/status_effect/frozenstasis)
