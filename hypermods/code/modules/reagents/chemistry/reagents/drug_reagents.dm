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

/datum/reagent/drug/syndimethamphetamine/on_mob_life(mob/living/carbon/M, metabolization_ratio)
	var/high_message = pick("You feel hyper.", "You feel like you need to go faster.", "You feel like you can run the world.")
	if(prob(5))
		to_chat(M, span_notice("[high_message]"))
	M.AdjustStun(-50, FALSE)
	M.AdjustKnockdown(-50, FALSE)
	M.AdjustUnconscious(-50, FALSE)
	M.AdjustParalyzed(-50, FALSE)
	M.AdjustImmobilized(-50, FALSE)
	M.adjust_stamina_loss(-3, 0)
	M.adjust_jitter(2 SECONDS)
	M.adjust_organ_loss(ORGAN_SLOT_BRAIN, 1 * metabolization_ratio * normalise_creation_purity())
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
	M.adjust_tox_loss(1, 0)
	M.adjust_organ_loss(ORGAN_SLOT_BRAIN, pick(0.5, 0.6, 0.7, 0.8, 0.9, 1))
	. = 1


/datum/reagent/drug/pumpupplus
	name = "Pump-Up Plus"
	description = "A fast acting, hard hitting drug that pushes the limit on what you can handle. Makes you immune to knockdowns entirely."
	color = "#e38e44"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = 35
	addiction_types = list(/datum/addiction/stimulants = 0.6) //0.26 per 2 seconds
	metabolized_traits = list(TRAIT_BATON_RESISTANCE, TRAIT_ANALGESIA, TRAIT_STIMULATED)

/datum/reagent/drug/pumpupplus/on_mob_metabolize(mob/living/carbon/affected_mob)
	. = ..()
	var/obj/item/organ/liver/liver = affected_mob.get_organ_slot(ORGAN_SLOT_LIVER)
	if(liver && HAS_TRAIT(liver, TRAIT_MAINTENANCE_METABOLISM))
		affected_mob.add_mood_event("maintenance_fun", /datum/mood_event/maintenance_high)
		metabolization_rate *= 0.8

/datum/reagent/drug/pumpupplus/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, metabolization_ratio)
	. = ..()
	affected_mob.set_jitter_if_lower(10 SECONDS * REM * seconds_per_tick)
	affected_mob.AdjustKnockdown(-100, FALSE)
	affected_mob.adjust_stamina_loss(-2, 0)

	if(SPT_PROB(2.5, seconds_per_tick))
		to_chat(affected_mob, span_notice("[pick("Go! Go! GO!", "You feel ready...", "You feel invincible...")]"))
	if(SPT_PROB(7.5, seconds_per_tick))
		affected_mob.losebreath++
		affected_mob.adjust_tox_loss(0.2 * metabolization_ratio * seconds_per_tick * normalise_creation_purity(), updating_health = FALSE, required_biotype = affected_biotype)
		return UPDATE_MOB_HEALTH

/datum/reagent/drug/pumpupplus/overdose_start(mob/living/affected_mob)
	. = ..()
	to_chat(affected_mob, span_userdanger("You can't stop shaking, your heart beats faster and faster..."))

/datum/reagent/drug/pumpupplus/overdose_process(mob/living/affected_mob, seconds_per_tick, metabolization_ratio)
	. = ..()
	affected_mob.set_jitter_if_lower(10 SECONDS * REM * seconds_per_tick)
	var/need_mob_update
	if(SPT_PROB(2.5, seconds_per_tick))
		affected_mob.drop_all_held_items()
	if(SPT_PROB(7.5, seconds_per_tick))
		affected_mob.emote(pick("twitch","drool"))
	if(SPT_PROB(10, seconds_per_tick))
		affected_mob.losebreath++
		affected_mob.adjust_stamina_loss(4 * metabolization_ratio * seconds_per_tick * normalise_creation_purity(), updating_stamina = FALSE, required_biotype = affected_biotype)
		need_mob_update = TRUE
	if(SPT_PROB(7.5, seconds_per_tick))
		need_mob_update += affected_mob.adjust_tox_loss(2 * metabolization_ratio * seconds_per_tick * normalise_creation_purity(), updating_health = FALSE, required_biotype = affected_biotype)
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

/datum/reagent/drug/nicotwaine/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, metabolization_ratio)
	. = ..()
	if(SPT_PROB(0.3, seconds_per_tick))
		var/smoke_message = pick("You feel both relaxed and full of vigor!", "A wave of energy washes over you.","You blink and realize you hadn't blinked in a while.","You feel full of vigor.")
		to_chat(affected_mob, span_notice("[smoke_message]"))
	affected_mob.add_mood_event("smoked", /datum/mood_event/smoked)
	affected_mob.remove_status_effect(/datum/status_effect/jitter)
	affected_mob.AdjustAllImmobility(-60 * REM * seconds_per_tick)
	affected_mob.adjust_stamina_loss(-1, 0)

	return UPDATE_MOB_HEALTH

/datum/reagent/drug/nicotwaine/overdose_process(mob/living/affected_mob, seconds_per_tick, metabolization_ratio)
	. = ..()
	var/need_mob_update
	need_mob_update = affected_mob.adjust_tox_loss(0.2 * metabolization_ratio * seconds_per_tick * normalise_creation_purity(), updating_health = FALSE, required_biotype = affected_biotype)
	need_mob_update += affected_mob.adjust_oxy_loss(1.4 * metabolization_ratio * seconds_per_tick * normalise_creation_purity(), updating_health = FALSE, required_biotype = affected_biotype, required_respiration_type = affected_respiration_type)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH


/datum/reagent/drug/painkillers
	name = "Painkillers"
	description = "Slowly heals brute and burn damage types while you have under 25 brute/burn damage of those types. Overdose causes minor toxin damage."
	color = "#f2feff"
	overdose_threshold = 30
	addiction_types = list(/datum/addiction/opioids = 10)
	taste_description = "diet morphine"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	metabolized_traits = list(TRAIT_ANALGESIA)
	var/damage_threshold = 50

/datum/reagent/drug/painkillers/on_mob_metabolize(mob/living/affected_mob)
	. = ..()
	if(volume >= 10)
		affected_mob.add_movespeed_mod_immunities("painkillers", /datum/movespeed_modifier/damage_slowdown)

/datum/reagent/drug/painkillers/on_mob_end_metabolize(mob/living/affected_mob)
	. = ..()
	affected_mob.remove_movespeed_mod_immunities("painkillers", /datum/movespeed_modifier/damage_slowdown)

/datum/reagent/drug/painkillers/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, metabolization_ratio)
	. = ..()
	var/totaldamage = (affected_mob.get_brute_loss() + affected_mob.get_fire_loss())
	if(totaldamage <= damage_threshold)
		var/need_mob_update
		need_mob_update += affected_mob.adjust_brute_loss(-0.4 * metabolization_ratio * seconds_per_tick * normalise_creation_purity(), updating_health = FALSE, required_bodytype = affected_bodytype)
		need_mob_update += affected_mob.adjust_fire_loss(-0.4 * metabolization_ratio * seconds_per_tick * normalise_creation_purity(), updating_health = FALSE, required_bodytype = affected_bodytype)
		if(need_mob_update)
			return UPDATE_MOB_HEALTH

/datum/reagent/drug/painkillers/overdose_process(mob/living/affected_mob, seconds_per_tick)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjust_tox_loss(0.5 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/drug/opium
	name = "Opium"
	description = "A relatively mild opioid, heals brute and burn damage while you have under 50 brute/burn damage. Provides body-wide pain relief, and slows mental activity. Overdose will causes brain damage, but has a high overdose limit."
	color = "#F5BE27"
	taste_description = "a tangy numbness"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 100
	ph = 10
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	addiction_types = list(/datum/addiction/opioids = 12)
	metabolized_traits = list(TRAIT_ANALGESIA)
	var/damage_threshold = 100

/datum/reagent/drug/opium/on_mob_metabolize(mob/living/affected_mob)
	. = ..()
	affected_mob.add_movespeed_mod_immunities(type, /datum/movespeed_modifier/damage_slowdown)

/datum/reagent/drug/opium/on_mob_end_metabolize(mob/living/affected_mob)
	. = ..()
	affected_mob.remove_movespeed_mod_immunities(type, /datum/movespeed_modifier/damage_slowdown)

/datum/reagent/drug/opium/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, metabolization_ratio)
	. = ..()
	if(current_cycle > 5)
		affected_mob.add_mood_event("numb", /datum/mood_event/narcotic_medium, name)
	if(affected_mob.disgust < DISGUST_LEVEL_VERYGROSS && SPT_PROB(50 * (2 - creation_purity), seconds_per_tick))
		affected_mob.adjust_disgust(0.5 * REM * seconds_per_tick)

	var/totaldamage = (affected_mob.get_brute_loss() + affected_mob.get_fire_loss())
	if(totaldamage <= damage_threshold)
		var/need_mob_update
		need_mob_update += affected_mob.adjust_brute_loss(-0.6 * metabolization_ratio * seconds_per_tick * normalise_creation_purity(), updating_health = FALSE, required_bodytype = affected_bodytype)
		need_mob_update += affected_mob.adjust_fire_loss(-0.6 * metabolization_ratio * seconds_per_tick * normalise_creation_purity(), updating_health = FALSE, required_bodytype = affected_bodytype)
		if(need_mob_update)
			return UPDATE_MOB_HEALTH

/datum/reagent/drug/opium/overdose_process(mob/living/affected_mob, seconds_per_tick)
	. = ..()
	if(SPT_PROB(35, seconds_per_tick))
		if(affected_mob.adjust_organ_loss(ORGAN_SLOT_BRAIN, 1.5 * REM * seconds_per_tick * normalise_creation_purity(), required_organ_flag = affected_organ_flags))
			return UPDATE_MOB_HEALTH
		affected_mob.set_dizzy_if_lower(4 SECONDS)
		affected_mob.set_jitter_if_lower(4 SECONDS)

/datum/reagent/drug/heroin
	name = "Heroin"
	description = "A strong synthesized opioid, heals brute and burn damage while you have under 75 brute/burn damage. Causes euphoria and strong pain relief. Very easy to overdose on or go into withdrawal over."
	color = "#B3B3B3"
	taste_description = "synthesized numbness"
	metabolization_rate = 0.4 * REAGENTS_METABOLISM
	overdose_threshold = 10
	ph = 6
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	addiction_types = list(/datum/addiction/opioids = 30)
	metabolized_traits = list(TRAIT_ANALGESIA)
	var/damage_threshold = 150

/datum/reagent/drug/heroin/on_mob_metabolize(mob/living/affected_mob)
	. = ..()
	affected_mob.add_movespeed_mod_immunities(type, /datum/movespeed_modifier/damage_slowdown)

/datum/reagent/drug/heroin/on_mob_end_metabolize(mob/living/affected_mob)
	. = ..()
	affected_mob.remove_movespeed_mod_immunities(type, /datum/movespeed_modifier/damage_slowdown)

/datum/reagent/drug/heroin/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, metabolization_ratio)
	. = ..()
	if(current_cycle > 5)
		affected_mob.add_mood_event("numb", /datum/mood_event/narcotic_heavy, name)
	if(affected_mob.disgust < DISGUST_LEVEL_VERYGROSS && SPT_PROB(50 * (2 - creation_purity), seconds_per_tick))
		affected_mob.adjust_disgust(1 * REM * seconds_per_tick)

	var/totaldamage = (affected_mob.get_brute_loss() + affected_mob.get_fire_loss())
	if(totaldamage <= damage_threshold)
		var/need_mob_update
		need_mob_update += affected_mob.adjust_brute_loss(-0.8 * metabolization_ratio * seconds_per_tick * normalise_creation_purity(), updating_health = FALSE, required_bodytype = affected_bodytype)
		need_mob_update += affected_mob.adjust_fire_loss(-0.8 * metabolization_ratio * seconds_per_tick * normalise_creation_purity(), updating_health = FALSE, required_bodytype = affected_bodytype)
		if(need_mob_update)
			return UPDATE_MOB_HEALTH

/datum/reagent/drug/heroin/overdose_process(mob/living/affected_mob, seconds_per_tick)
	. = ..()
	if(SPT_PROB(60, seconds_per_tick))
		if(affected_mob.adjust_organ_loss(ORGAN_SLOT_BRAIN, 1.5 * REM * seconds_per_tick * normalise_creation_purity(), required_organ_flag = affected_organ_flags))
			return UPDATE_MOB_HEALTH
		affected_mob.set_dizzy_if_lower(10 SECONDS)
		affected_mob.set_jitter_if_lower(10 SECONDS)


/datum/reagent/drug/antidepressants
	name = "Anti-Depressants"
	description = "A drug which acts as an emotional stabilizer within the host's mind, eliminating major negative moods and suppressing the symptoms of certain neurological diseases or mental illnesses."
	color = "#FFFFFF" // pure cu- I-I MEAN... Anti-Sad Juic- no, wait that's even worse. I'll stop.
	taste_description = "fluffy-wuffy clouds and cotton-candy kisses"
	ph = 12
	overdose_threshold = 20
	metabolization_rate = 0.12 * REAGENTS_METABOLISM
	metabolized_traits = list(TRAIT_FEARLESS)
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	addiction_types = list(/datum/addiction/opioids = 6)
	var/isaspastic = FALSE

/datum/reagent/drug/antidepressants/expose_mob(mob/living/carbon/human/human_thing, methods, reac_volume, show_message, touch_protection)
	. = ..()
	if(!ishuman(human_thing))
		return

/datum/reagent/drug/antidepressants/overdose_process(mob/living/affected_mob, seconds_per_tick)
	. = ..()
	if(SPT_PROB(12, seconds_per_tick))
		if(affected_mob.adjust_organ_loss(ORGAN_SLOT_BRAIN, 0.8 * REM * seconds_per_tick * normalise_creation_purity(), required_organ_flag = affected_organ_flags))
			return UPDATE_MOB_HEALTH
		affected_mob.set_dizzy_if_lower(20 SECONDS)
	if(!isaspastic)
		affected_mob.apply_status_effect(/datum/status_effect/spasms/antidepressants)
		isaspastic = TRUE

/datum/reagent/drug/antidepressants/on_mob_metabolize(mob/living/affected_mob)
	. = ..()
	affected_mob.apply_status_effect(/datum/status_effect/antidepressants)

/datum/reagent/drug/antidepressants/on_mob_end_metabolize(mob/living/affected_mob)
	. = ..()
	affected_mob.remove_status_effect(/datum/status_effect/antidepressants)
	affected_mob.remove_status_effect(/datum/status_effect/spasms/antidepressants)
