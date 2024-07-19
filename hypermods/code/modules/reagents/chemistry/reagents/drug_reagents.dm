/datum/reagent/drug/syndimethamphetamine
	name = "Methamphetamine"
	description = "Neutralizes mannitol. Reduces stun times by about 300%, speeds the user up, and allows the user to quickly recover stamina while dealing a small amount of Brain damage. If overdosed the subject will move randomly, laugh randomly, drop items and suffer from Toxin and Brain damage. If addicted the subject will constantly jitter and drool, before becoming dizzy and losing motor control and eventually suffer heavy toxin damage."
	reagent_state = LIQUID
	color = "#FAFAFA"
	addiction_types = list(/datum/addiction/stimulants = 4)
	metabolization_rate = 0.5 * REAGENTS_METABOLISM

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
