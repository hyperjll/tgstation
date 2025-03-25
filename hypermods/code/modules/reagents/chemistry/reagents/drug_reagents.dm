/datum/reagent/drug/syndimethamphetamine
	name = "Methamphetamine Plus"
	description = "Neutralizes mannitol. Reduces stun times by about 300%, speeds the user up, and allows the user to quickly recover stamina while dealing a small amount of Brain damage. If overdosed the subject will move randomly, laugh randomly, drop items and suffer from Toxin and Brain damage. If addicted the subject will constantly jitter and drool, before becoming dizzy and losing motor control and eventually suffer heavy toxin damage."
	color = "#FAFAFA"
	addiction_types = list(/datum/addiction/stimulants = 4)
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	metabolized_traits = list(TRAIT_STIMULATED)

/datum/reagent/drug/syndimethamphetamine/on_mob_metabolize(mob/living/L)
	..()
	L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/syndimeth)

/datum/reagent/drug/syndimethamphetamine/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/syndimeth)
	..()

/datum/reagent/drug/syndimethamphetamine/on_mob_life(mob/living/carbon/M)
	var/high_message = pick("You feel hyper.", "You feel like you need to go faster.", "You feel like you can run the world.")
	if(prob(5))
		to_chat(M, span_notice("[high_message]"))
	M.AdjustStun(-50, FALSE)
	M.AdjustKnockdown(-50, FALSE)
	M.AdjustUnconscious(-50, FALSE)
	M.AdjustParalyzed(-50, FALSE)
	M.AdjustImmobilized(-50, FALSE)
	M.adjustStaminaLoss(-3, 0)
	M.adjust_jitter(2 SECONDS)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1)
	if(prob(5))
		M.emote(pick("twitch", "shiver"))
	..()
	. = 1

/datum/reagent/drug/syndimethamphetamine/overdose_process(mob/living/M)
	if((M.mobility_flags & MOBILITY_MOVE) && !ismovable(M.loc))
		for(var/i in 1 to 4)
			step(M, pick(GLOB.cardinals))
	if(prob(20))
		M.emote("laugh")
	if(prob(33))
		M.visible_message(span_danger("[M]'s hands flip out and flail everywhere!"))
		M.drop_all_held_items()
	..()
	M.adjustToxLoss(1, 0)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, pick(0.5, 0.6, 0.7, 0.8, 0.9, 1))
	. = 1


/datum/reagent/drug/pumpupplus
	name = "Pump-Up Plus"
	description = "A fast acting, hard hitting drug that pushes the limit on what you can handle. Makes you immune to knockdowns entirely."
	color = "#e38e44"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = 35
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	addiction_types = list(/datum/addiction/stimulants = 0.6) //0.26 per 2 seconds
	metabolized_traits = list(TRAIT_BATON_RESISTANCE, TRAIT_ANALGESIA, TRAIT_STIMULATED)

/datum/reagent/drug/pumpupplus/on_mob_metabolize(mob/living/carbon/affected_mob)
	. = ..()
	var/obj/item/organ/liver/liver = affected_mob.get_organ_slot(ORGAN_SLOT_LIVER)
	if(liver && HAS_TRAIT(liver, TRAIT_MAINTENANCE_METABOLISM))
		affected_mob.add_mood_event("maintenance_fun", /datum/mood_event/maintenance_high)
		metabolization_rate *= 0.8

/datum/reagent/drug/pumpupplus/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	affected_mob.set_jitter_if_lower(10 SECONDS * REM * seconds_per_tick)
	affected_mob.AdjustKnockdown(-100, FALSE)
	affected_mob.adjustStaminaLoss(-2, 0)

	if(SPT_PROB(2.5, seconds_per_tick))
		to_chat(affected_mob, span_notice("[pick("Go! Go! GO!", "You feel ready...", "You feel invincible...")]"))
	if(SPT_PROB(7.5, seconds_per_tick))
		affected_mob.losebreath++
		affected_mob.adjustToxLoss(0.2, updating_health = FALSE, required_biotype = affected_biotype)
		return UPDATE_MOB_HEALTH

/datum/reagent/drug/pumpupplus/overdose_start(mob/living/affected_mob)
	. = ..()
	to_chat(affected_mob, span_userdanger("You can't stop shaking, your heart beats faster and faster..."))

/datum/reagent/drug/pumpupplus/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	affected_mob.set_jitter_if_lower(10 SECONDS * REM * seconds_per_tick)
	var/need_mob_update
	if(SPT_PROB(2.5, seconds_per_tick))
		affected_mob.drop_all_held_items()
	if(SPT_PROB(7.5, seconds_per_tick))
		affected_mob.emote(pick("twitch","drool"))
	if(SPT_PROB(10, seconds_per_tick))
		affected_mob.losebreath++
		affected_mob.adjustStaminaLoss(4, updating_stamina = FALSE, required_biotype = affected_biotype)
		need_mob_update = TRUE
	if(SPT_PROB(7.5, seconds_per_tick))
		need_mob_update += affected_mob.adjustToxLoss(2, updating_health = FALSE, required_biotype = affected_biotype)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH


/datum/reagent/drug/nicotwaine
	name = "Nicotwaine"
	description = "Moderately reduces stun times and increases bodily vigor. If overdosed it will deal major toxin and oxygen damage."
	color = "#60A584" // rgb: 96, 165, 132
	taste_description = "smoke"
	trippy = FALSE
	overdose_threshold = 30
	metabolization_rate = 0.125 * REAGENTS_METABOLISM
	ph = 8
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	addiction_types = list(/datum/addiction/nicotine = 30) // double of nicotine

	//Nicotine is used as a pesticide IRL.
/datum/reagent/drug/nicotwaine/on_hydroponics_apply(obj/machinery/hydroponics/mytray, mob/user)
	mytray.adjust_toxic(round(volume))
	mytray.adjust_pestlevel(-rand(2, 4))

/datum/reagent/drug/nicotwaine/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	if(SPT_PROB(0.3, seconds_per_tick))
		var/smoke_message = pick("You feel both relaxed and full of vigor!", "A wave of energy washes over you.","You blink and realize you hadn't blinked in a while.","You feel full of vigor.")
		to_chat(affected_mob, span_notice("[smoke_message]"))
	affected_mob.add_mood_event("smoked", /datum/mood_event/smoked)
	affected_mob.remove_status_effect(/datum/status_effect/jitter)
	affected_mob.AdjustAllImmobility(-60 * REM * seconds_per_tick)
	affected_mob.adjustStaminaLoss(-1, 0)

	return UPDATE_MOB_HEALTH

/datum/reagent/drug/nicotwaine/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update = affected_mob.adjustToxLoss(0.2 * REM * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	need_mob_update += affected_mob.adjustOxyLoss(1.4 * REM * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype, required_respiration_type = affected_respiration_type)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH
