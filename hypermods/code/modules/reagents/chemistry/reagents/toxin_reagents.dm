/datum/reagent/toxin/norepinephricacid
	name = "Norepinephric acid"
	description = "Not to be confused with Norepinephrine, this toxin is known for it's specific use in crippling vision."
	reagent_state = LIQUID
	color = "#b7dbe1"
	toxpwr = 0
	taste_description = "milk"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	metabolization_rate = 0.5 * REAGENTS_METABOLISM

/datum/reagent/toxin/norepinephricacid/on_mob_life(mob/living/carbon/M)
	M.adjustOrganLoss(ORGAN_SLOT_EYES, 3, 95)
	..()

/datum/reagent/toxin/saxitoxin
	name = "Saxitoxin"
	description = "Nasty poison gas that's highly volatile when breathed. It features an unholy BRAIN-TOX-BURN triad on top of distinct jittering and stuns."
	reagent_state = GAS
	color = "#ffffc6"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/toxin/saxitoxin/expose_mob(mob/living/M, methods=TOUCH, reac_volume)
	if(!ishuman(M) && !ismonkey(M))
		return

	var/mob/living/carbon/victim = M
	if(methods & (TOUCH|VAPOR))
		//check for protection
		var/mouth_covered = victim.is_mouth_covered()
		var/eyes_covered = victim.is_eyes_covered()

		//actually handle the pepperspray effects
		if ( eyes_covered && mouth_covered )
			return
		else if ( mouth_covered )	// Reduced effects if partially protected
			if(prob(50))
				victim.emote("scream")
			victim.adjust_eye_blur(14)
			victim.set_confusion_if_lower(10 SECONDS)
			victim.damageoverlaytemp = 75
			victim.Paralyze(10 SECONDS)
			M.adjustStaminaLoss(3)
			return
		else if ( eyes_covered ) // Eye cover is better than mouth cover
			if(prob(20))
				victim.emote("cough")
			victim.adjust_eye_blur(4)
			victim.set_confusion_if_lower(5 SECONDS)
			victim.damageoverlaytemp = 50
			M.adjustStaminaLoss(3)
			return
		else // Oh dear :D
			if(prob(60))
				victim.emote("scream")
			victim.adjust_eye_blur(14)
			victim.set_confusion_if_lower(12 SECONDS)
			victim.damageoverlaytemp = 100
			victim.Paralyze(14 SECONDS)
			M.adjustStaminaLoss(5)
		victim.update_damage_hud()

/datum/reagent/toxin/saxitoxin/on_mob_life(mob/living/breather, seconds_per_tick, times_fired)
	breather.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1)
	breather.adjustFireLoss(1, FALSE)
	if(iscarbon(breather))
		breather.adjustToxLoss(1, FALSE)
	if(prob(10))
		breather.Paralyze(20, 1, 0)
		breather.adjust_jitter(10 SECONDS)
	return ..()

/datum/reagent/toxin/nocturine
	name = "Nocturine"
	description = "A nonlethal poison that causes near-instant loss of conscience in small doses for extended periods of time."
	silent_toxin = TRUE
	self_consuming = TRUE
	reagent_state = LIQUID
	color = "#11f4ff"
	toxpwr = 0
	metabolization_rate = 1 * REAGENTS_METABOLISM
	data = 35

/datum/reagent/toxin/nocturine/on_mob_life(mob/living/carbon/affected_mob)
	switch(current_cycle)
		if(1 to 3)
			affected_mob.adjustStaminaLoss(REM * data, 0)
			affected_mob.adjust_confusion(2 SECONDS * REM)
			affected_mob.adjust_drowsiness(4 SECONDS * REM)
		if(3 to INFINITY)
			affected_mob.adjustStaminaLoss(REM * data, 0)
			affected_mob.Sleeping(7 SECONDS * REM)
			. = TRUE
	..()

/datum/reagent/toxin/nanitedestroyers
	name = "Unknown Nanites"
	description = "A nanite-based virus. Metabolizes very slowly, and when depleted it causes a massive amount of toxin and brute damage depending on how long it has been in the victim's bloodstream."
	silent_toxin = TRUE
	self_consuming = TRUE
	reagent_state = LIQUID
	color = "#FFFFFF"
	toxpwr = 0
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	var/delayed_toxin_damage = 0
	var/delayed_brute_damage = 0
	var/delayed_organ_damage = 0

/datum/reagent/toxin/nanitedestroyers/on_mob_delete(mob/living/M)
	var/delayed_toxin_damage = current_cycle*2*REM
	M.log_message("has taken [delayed_toxin_damage] toxin damage from nanite destroyers", LOG_ATTACK)
	M.adjustToxLoss(delayed_toxin_damage)
	..()

/datum/reagent/toxin/nanitedestroyers/on_mob_delete(mob/living/M)
	var/delayed_brute_damage = current_cycle*1*REM
	M.log_message("has taken [delayed_brute_damage] brute damage from nanite destroyers", LOG_ATTACK)
	M.adjustBruteLoss(delayed_brute_damage)
	..()

/datum/reagent/toxin/nanitedestroyers/on_mob_delete(mob/living/M)
	var/delayed_organ_damage = current_cycle*0.5*REM
	M.log_message("has taken [delayed_organ_damage] organ damage from nanite destroyers", LOG_ATTACK)
	if(delayed_organ_damage >= 96)
		delayed_organ_damage = 95
	M.adjustOrganLoss(ORGAN_SLOT_HEART, delayed_organ_damage)
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS, delayed_organ_damage)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER, delayed_organ_damage)
	M.adjustOrganLoss(ORGAN_SLOT_STOMACH, delayed_organ_damage)
	..()


/datum/reagent/toxin/staminatoxin/neurotoxin_alien
	name = "Alien Neurotoxin"
	description = "A strong neurotoxin that puts the subject into a death-like state. Now 100% more concentrated!"
	color = "#2E2E61" // rgb: 46, 46, 97
	taste_description = "a numbing sensation"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	var/list/paralyzeparts = list(TRAIT_PARALYSIS_L_ARM, TRAIT_PARALYSIS_R_ARM, TRAIT_PARALYSIS_R_LEG, TRAIT_PARALYSIS_L_LEG)

/datum/reagent/toxin/staminatoxin/neurotoxin_alien/expose_mob(mob/living/M, methods, reac_volume, show_message, permeability)
	var/amount = round(max(reac_volume * clamp(permeability, 0, 1), 0.1))
	if(amount >= 0.5 && !isalien(M))
		M.reagents.add_reagent(type, amount)
		M.apply_damage(reac_volume / 2, TOX, null, (1 - permeability) * 100)

/datum/reagent/toxin/staminatoxin/neurotoxin_alien/proc/pickparalyze()
	var/selected = pick(paralyzeparts)
	paralyzeparts -= selected
	return selected

/datum/reagent/toxin/staminatoxin/neurotoxin_alien/on_mob_life(mob/living/carbon/M)
	M.adjust_dizzy(2 SECONDS)
	if(prob(40))
		if(prob(50))
			var/part = pickparalyze()
			if(part)
				M.balloon_alert(M, "your limbs go numb!")
				ADD_TRAIT(M, part, type)
		else
			M.drop_all_held_items()
			to_chat(M, span_warning("You can't feel your hands!"))
	. = 1
	..()

/datum/reagent/toxin/staminatoxin/neurotoxin_alien/on_mob_end_metabolize(mob/living/carbon/M)
	REMOVE_TRAIT(M, TRAIT_PARALYSIS_L_ARM, type)
	REMOVE_TRAIT(M, TRAIT_PARALYSIS_R_ARM, type)
	REMOVE_TRAIT(M, TRAIT_PARALYSIS_R_LEG, type)
	REMOVE_TRAIT(M, TRAIT_PARALYSIS_L_LEG, type)
	. = ..()

/datum/reagent/toxin/heartbreaker
	name = "Heartbreaker Toxin"
	description = "A hallucinogenic compound derived from mindbreaker toxin. it blocks neurological signals to the respiratory system, causing asphyxiation and heart failure."
	color = "#FF006F" // rgb: 139, 166, 233
	toxpwr = 0
	taste_description = "sourness"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	var/slurtimer = (3 * REM)

/datum/reagent/toxin/heartbreaker/on_mob_life(mob/living/carbon/M)
	M.adjust_slurring(slurtimer SECONDS)

	M.adjustOxyLoss(3.5 * REM, FALSE)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 1)

	M.adjustStaminaLoss(5, 0)
	return ..()
