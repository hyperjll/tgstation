/datum/reagent/medicine/dermalnanites
	name = "Dermal Nanites"
	description = "Specialized nanites that cures all damage types slowly over time. Stabilizes temperature and cleanses radiation. Metabolizes very slowly."
	reagent_state = LIQUID
	color = "#DCDCDC"
	metabolization_rate = 0.1
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	self_consuming = TRUE
	var/healing = 0.1
	var/radpower = 10

/datum/reagent/medicine/dermalnanites/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	if(affected_mob.bodytemperature > BODYTEMP_NORMAL)
		affected_mob.adjust_bodytemperature(-40 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	else if(affected_mob.bodytemperature < (BODYTEMP_NORMAL + 1))
		affected_mob.adjust_bodytemperature(40 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()

	affected_mob.adjustToxLoss(-healing, FALSE)
	affected_mob.adjustOxyLoss(-healing, FALSE)
	affected_mob.adjustBruteLoss(-healing, FALSE)
	affected_mob.adjustFireLoss(-healing, FALSE)

	..()
	. = TRUE

/datum/reagent/medicine/dermalnanites/on_mob_metabolize(mob/living/carbon/affected_mob)
	..()
	if(ishuman(affected_mob))
		var/mob/living/carbon/human/H = affected_mob
		H.physiology.brute_mod *= 0.75
		H.physiology.burn_mod *= 0.75
		H.physiology.tox_mod *= 0.75
		H.physiology.oxy_mod *= 0.75

/datum/reagent/medicine/dermalnanites/on_mob_end_metabolize(mob/living/carbon/affected_mob)
	if(ishuman(affected_mob))
		var/mob/living/carbon/human/H = affected_mob
		H.physiology.brute_mod /= 0.75
		H.physiology.burn_mod /= 0.75
		H.physiology.tox_mod /= 0.75
		H.physiology.oxy_mod /= 0.75

/datum/reagent/medicine/bicaridine
	name = "Bicaridine"
	description = "Restores bruising. Overdose causes it instead."
	reagent_state = LIQUID
	color = "#C8A5DC"
	overdose_threshold = 30

/datum/reagent/medicine/bicaridine/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-2*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/bicaridine/overdose_process(mob/living/M)
	M.adjustBruteLoss(4*REM, FALSE, FALSE)
	..()
	. = 1

/datum/reagent/medicine/dexalin
	name = "Dexalin"
	description = "Restores oxygen loss. Overdose causes it instead."
	reagent_state = LIQUID
	color = "#C8A5DC"
	overdose_threshold = 30

/datum/reagent/medicine/dexalin/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-2*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/dexalin/overdose_process(mob/living/M)
	M.adjustOxyLoss(4*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/kelotane
	name = "Kelotane"
	description = "Restores fire damage. Overdose causes it instead."
	reagent_state = LIQUID
	color = "#C8A5DC"
	overdose_threshold = 30

/datum/reagent/medicine/kelotane/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(-2*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/kelotane/overdose_process(mob/living/M)
	M.adjustFireLoss(4*REM, FALSE, FALSE)
	..()
	. = 1

/datum/reagent/medicine/antitoxin
	name = "Anti-Toxin"
	description = "Heals toxin damage and removes toxins in the bloodstream. Overdose causes toxin damage."
	reagent_state = LIQUID
	color = "#C8A5DC"
	overdose_threshold = 30
	taste_description = "a roll of gauze"

/datum/reagent/medicine/antitoxin/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-2*REM, 0)
	for(var/datum/reagent/toxin/R in M.reagents.reagent_list)
		M.reagents.remove_reagent(R.type,1)
	..()
	. = 1

/datum/reagent/medicine/antitoxin/overdose_process(mob/living/M)
	M.adjustToxLoss(4*REM, 0) // End result is 2 toxin loss taken, because it heals 2 and then removes 4.
	..()
	. = 1

/datum/reagent/medicine/tricordrazine
	name = "Tricordrazine"
	description = "Has a high chance to heal all types of damage. Overdose instead causes it."
	reagent_state = LIQUID
	color = "#C8A5DC"
	overdose_threshold = 30
	taste_description = "grossness"

/datum/reagent/medicine/tricordrazine/on_mob_life(mob/living/carbon/M)
	if(prob(80))
		M.adjustBruteLoss(-1*REM, 0)
		M.adjustFireLoss(-1*REM, 0)
		M.adjustOxyLoss(-1*REM, 0)
		M.adjustToxLoss(-1*REM, 0)
		. = 1
	..()

/datum/reagent/medicine/tricordrazine/overdose_process(mob/living/M)
	M.adjustToxLoss(2*REM, 0)
	M.adjustOxyLoss(2*REM, 0)
	M.adjustBruteLoss(2*REM, FALSE, FALSE)
	M.adjustFireLoss(2*REM, FALSE, FALSE)
	..()
	. = 1

/datum/reagent/medicine/barozine
	name = "Barozine"
	description = "A potent drug that prevents pressure damage. Causes extreme pain and jittering. Very poisonous when overdosed."
	reagent_state = LIQUID
	color = "#EA4F34"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 30

/datum/reagent/medicine/barozine/expose_mob(mob/living/carbon/M)
	..()
	if(M.stat == DEAD)
		return
	M.adjust_jitter(60 SECONDS)

/datum/reagent/medicine/barozine/on_mob_life(mob/living/carbon/M)
	if(prob(30))
		M.adjustFireLoss(1*REM, 0)
	if(prob(5))
		M.emote("scream")

	..()
	. = 1

/datum/reagent/medicine/barozine/on_mob_metabolize(mob/living/M)
	ADD_TRAIT(M, TRAIT_RESISTHIGHPRESSURE, type)
	ADD_TRAIT(M, TRAIT_RESISTLOWPRESSURE, type)

/datum/reagent/medicine/barozine/on_mob_end_metabolize(mob/living/M)
	REMOVE_TRAIT(M, TRAIT_RESISTHIGHPRESSURE, type)
	REMOVE_TRAIT(M, TRAIT_RESISTLOWPRESSURE, type)

/datum/reagent/medicine/barozine/overdose_process(mob/living/M)
	M.adjustToxLoss(6*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/changelingextract //is this used anywhere?
	name = "Changeling Regenerative Extract"
	description = "A highly complex regenerative chemical. Results in limb and organ growth."
	reagent_state = LIQUID
	color = "#A4D8D8"
	self_consuming = TRUE
	metabolization_rate = 1

/datum/reagent/medicine/changelingextract/on_mob_metabolize(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	affected_mob.regenerate_limbs()
	affected_mob.regenerate_organs()

/datum/reagent/medicine/experimentalstimulants
	name = "Experimental Stimulants"
	description = "Increases stun resistance, movement speed, and damage resistance in addition to quickly restoring the host's stamina all at the cost of poisoning over time and heart damage. Overdose amplifies the downsides."
	color = "#78008C"
	metabolization_rate = 0.05
	overdose_threshold = 30
	addiction_types = list(/datum/addiction/stimulants = 6) //1.2 per 2 seconds
	metabolized_traits = list(TRAIT_BATON_RESISTANCE, TRAIT_ANALGESIA, TRAIT_STIMULATED)

/datum/reagent/medicine/experimentalstimulants/on_mob_metabolize(mob/living/L)
	..()
	L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/expstimulants)
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.physiology.brute_mod *= 0.9
		H.physiology.burn_mod *= 0.9

/datum/reagent/medicine/experimentalstimulants/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/expstimulants)
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.physiology.brute_mod /= 0.9
		H.physiology.burn_mod /= 0.9
	..()

/datum/reagent/medicine/experimentalstimulants/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-0.5*REM, 0)
	M.adjustFireLoss(-0.5*REM, 0)
	M.AdjustAllImmobility(-80, FALSE)
	M.adjustStaminaLoss(-50*REM, 0)
	M.adjustToxLoss(0.4*REM, 0)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 0.4)

	M.reagents.remove_reagent(/datum/reagent/toxin/chloralhydrate, 3)
	..()
	. = 1

	M.reagents.remove_reagent(/datum/reagent/toxin/lexorin, 3)
	..()
	. = 1
/**
	if(holder.has_reagent(/datum/reagent/medicine/stimulants)) // to help prevent stimulant stacking, but i don't want to seriously cheat cheeky players.
		holder.remove_reagent(/datum/reagent/medicine/stimulants, 1)
		holder.add_reagent(/datum/reagent/medicine/experimentalstimulants, 0.1)
	..()
	. = 1
**/
/datum/reagent/medicine/experimentalstimulants/overdose_process(mob/living/M)
	M.adjustToxLoss(0.6*REM, 0)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 0.6)
	if(prob(40))
		M.adjustStaminaLoss(5*REM, 0)
	..()

/datum/reagent/medicine/dexalinplus
	name = "Dexalin Plus"
	description = "Restores oxygen loss and restores blood volume quickly. Overdose causes both instead."
	reagent_state = LIQUID
	color = "#0742CA"
	overdose_threshold = 25

/datum/reagent/medicine/dexalinplus/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-7*REM, 0)

	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume += 3

	M.reagents.remove_reagent(/datum/reagent/toxin/lexorin, 3)
	..()
	. = 1

/datum/reagent/medicine/dexalinplus/overdose_process(mob/living/carbon/M)
	M.adjustOxyLoss(10*REM, 0)
	M.adjustFireLoss(6*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/dermaline
	name = "Dermaline"
	description = "Restores fire damage greatly. Overdose causes a drop in bodily temperature and oxygen loss. Overdoses in small amounts."
	reagent_state = LIQUID
	color = "#084936"
	overdose_threshold = 20

/datum/reagent/medicine/dermaline/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(-4*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/dermaline/overdose_process(mob/living/M)
	M.adjust_bodytemperature(-40 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	M.losebreath++
	..()
	. = 1


/datum/reagent/medicine/dylovene
	name = "Dylovene"
	description = "Restores toxin damage slowly. Overdose causes minor tissue damage."
	reagent_state = LIQUID
	color = "#6600FF"
	overdose_threshold = 20

/datum/reagent/medicine/dylovene/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-0.5*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/dylovene/overdose_process(mob/living/M)
	M.adjustBruteLoss(1*REM, 0)
	..()
	. = 1


/datum/reagent/medicine/hyronalin
	name = "Hyronalin"
	description = "An all-purpose radiation cure. Overdose causes burns within the host."
	reagent_state = LIQUID
	color = "#00cc7a"
	overdose_threshold = 30
	metabolized_traits = list(TRAIT_HALT_RADIATION_EFFECTS)

/datum/reagent/medicine/hyronalin/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-0.5*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/hyronalin/overdose_process(mob/living/M)
	M.adjustFireLoss(4*REM, 0)
	..()
	. = 1


/datum/reagent/medicine/arithrazine
	name = "Arithrazine"
	description = "A strong all-purpose radiation cure, side effects include minor bruising of the patient. Has no overdose effects."
	reagent_state = LIQUID
	color = "#b34700"
	metabolized_traits = list(TRAIT_HALT_RADIATION_EFFECTS)

/datum/reagent/medicine/arithrazine/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-1*REM, 0)
	M.adjustBruteLoss(1*REM, 0)
	..()
	. = 1


/datum/reagent/medicine/coagulant/tranexamicacid
	name = "Tranexamic Acid"
	description = "A low-tolerance blood clotter, capable of staunching bloodloss and restoring small amounts of blood. Overdose causes internal bleeding."
	reagent_state = LIQUID
	color = "#9f6060"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 15
	clot_rate = 0.5 // .2 better than sangurite (0.3)
	passive_bleed_modifier = 0.5 // .2 better than sangurite (0.7)

/datum/reagent/medicine/coagulant/tranexamicacid/on_mob_life(mob/living/carbon/M)

	M.adjustOxyLoss(-1*REM, 0)
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume += 1

/datum/reagent/medicine/coagulant/tranexamicacid/overdose_process(mob/living/carbon/M)
	M.blood_volume -= 6
	..()
	. = 1

// New version of inaprovaline, which is buffed to be more useful.

/datum/reagent/medicine/coagulant/inaprovaline
	name = "Inaprovaline Plus"
	description = "Stabilizes the breathing of patients, and heals asphyxiation damage quickly. It also increases blood clotting efficiency. Good for those in critical condition."
	reagent_state = LIQUID
	metabolization_rate = 1.25 * REAGENTS_METABOLISM
	color = "#C8A5DC"
	ph = 8.5
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED|REAGENT_NO_RANDOM_RECIPE
	clot_rate = 0.1 // .2 worse than sangurite (0.3)
	passive_bleed_modifier = 0.9 // .2 worse than sangurite (0.7)

/datum/reagent/medicine/coagulant/inaprovaline/on_mob_life(mob/living/carbon/M)
	if(M.losebreath >= 5)
		M.losebreath -= 5
	M.adjustOxyLoss(-10*REM, 0)
	..()

/datum/reagent/medicine/coagulant/inaprovaline/on_mob_add(mob/living/M)
	ADD_TRAIT(M, TRAIT_COAGULATING, type)
	return ..()

/datum/reagent/medicine/coagulant/inaprovaline/on_mob_delete(mob/living/M)
	REMOVE_TRAIT(M, TRAIT_COAGULATING, type)
	return ..()


/datum/reagent/medicine/juggernaut
	name = "Juggernaut"
	description = "A potent painkiller that negates a significant amount of walkspeed loss from being hurt, with the additional special effect of absorbing and healing a portion of brute and burn damages taken between life cycles. Overdose causes confusion, loss of breath, and spontaneous paralysis."
	reagent_state = LIQUID
	color = "#ff1a1a"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 60
	addiction_types = list(/datum/addiction/stimulants = 2) //0.4 per 2 seconds

/datum/reagent/medicine/juggernaut/on_mob_metabolize(mob/living/L)
	..()
	L.ignore_slowdown(type)
	if(ishuman(L))
		var/mob/living/carbon/human/M = L
		M.physiology.brute_mod *= 0.8
		M.physiology.burn_mod *= 0.8

/datum/reagent/medicine/juggernaut/on_mob_end_metabolize(mob/living/L)
	L.unignore_slowdown(type)
	if(ishuman(L))
		var/mob/living/carbon/human/M = L
		M.physiology.brute_mod /= 0.8
		M.physiology.burn_mod /= 0.8

/datum/reagent/medicine/juggernaut/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-1*REM)
	M.adjustFireLoss(-1*REM)
	..()
	. = 1

/datum/reagent/medicine/juggernaut/overdose_process(mob/living/M)
	if(prob(45))
		M.drop_all_held_items()
		M.Paralyze(5, 1, 0)
		M.adjust_confusion(6 SECONDS * REM)
		M.losebreath += 5
	..()


/datum/reagent/medicine/filgrastim
	name = "Filgrastim"
	description = "A granulocyte colony stimulating factor analog, which helps the body create more blood."
	reagent_state = LIQUID
	color = "#660000"
	metabolization_rate = 0.4 * REAGENTS_METABOLISM

/datum/reagent/medicine/filgrastim/on_mob_life(mob/living/carbon/M)
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume += 2


/datum/reagent/medicine/coagulant/proconvertin
	name = "Proconvertin"
	description = "A VERY low-tolerance blood clotter, capable of staunching bloodloss quickly. Overdose causes massive oxygen loss."
	reagent_state = LIQUID
	color = "#9f6060"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 10
	clot_rate = 0.7 // .4 better than sangurite (0.3)
	passive_bleed_modifier = 0.3 // .4 better than sangurite (0.7)

/datum/reagent/medicine/coagulant/proconvertin/overdose_process(mob/living/carbon/M)
	M.adjustOxyLoss(5*REM, 0)
	..()
	. = 1


/datum/reagent/medicine/teporone
	name = "Teporone"
	description = "A less effective version of leporazine, it will effectively regulate a patient's body temperature, ensuring it never leaves safe levels."
	color = "#ddc8e9"

/datum/reagent/medicine/teporone/on_mob_life(mob/living/carbon/M)
	if(M.bodytemperature > BODYTEMP_NORMAL)
		M.adjust_bodytemperature(-10 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	else if(M.bodytemperature < (BODYTEMP_NORMAL + 1))
		M.adjust_bodytemperature(10 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()


/datum/reagent/medicine/healingnanites
	name = "Restoration Nanites"
	description = "Specialized nanites that quickly heals all damage types and restores the integrity of essential organs."
	reagent_state = LIQUID
	color = "#DCDCDC"
	metabolization_rate = 2.5 * REAGENTS_METABOLISM
	var/healing = 10
	self_consuming = TRUE

/datum/reagent/medicine/healingnanites/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	affected_mob.adjustToxLoss(-healing, FALSE)
	affected_mob.adjustOxyLoss(-healing, FALSE)
	affected_mob.adjustBruteLoss(-healing, FALSE)
	affected_mob.adjustFireLoss(-healing, FALSE)

	affected_mob.adjustOrganLoss(ORGAN_SLOT_BRAIN, -healing)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_HEART, -healing)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_LUNGS, -healing)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_LIVER, -healing)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_STOMACH, -healing)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_EYES, -healing)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_EARS, -healing)
	..()
	. = TRUE


/datum/reagent/medicine/resurrector_nanites
	name = "Resurrector Nanite Serum"
	description = "A serum of nanites capable of restoring corpses to living people in a timely manner."
	taste_description = "a bunch of tiny robots"
	self_consuming = TRUE
	metabolization_rate = 1

/datum/reagent/medicine/resurrector_nanites/expose_mob(mob/living/carbon/M)
	if(M.stat != DEAD)
		return
	M.notify_revival("Your body is being revived with Resurrector Nanites!")
	M.set_jitter_if_lower(20 SECONDS)
	sleep(10 SECONDS)
	M.fully_heal(heal_flags = HEAL_ALL)
	M.revive()
	M.emote("gasp")


/datum/reagent/medicine/enchantedgold
	name = "Enchanted Gold"
	description = "Slowly heals all damage types and slightly boosts maximum health."
	reagent_state = LIQUID
	color = "#ffff00"
	self_consuming = TRUE
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	var/healing = 0.5
	var/gold_text

/datum/reagent/medicine/enchantedgold/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-healing*REM, 0)
	M.adjustOxyLoss(-healing*REM, 0)
	M.adjustBruteLoss(-healing*REM, 0)
	M.adjustFireLoss(-healing*REM, 0)
	..()
	. = 1

	if(M.reagents.has_reagent(/datum/reagent/gold) && prob(50))
		M.reagents.add_reagent(type, 0.1)
	..()
	. = 1

/datum/reagent/medicine/enchantedgold/on_mob_metabolize(mob/living/M)
	gold_text = pick("golden", "mystical", "enchanted") //random text stuff
	to_chat(M, span_notice("You feel a [gold_text] power within you!"))
	M.maxHealth += 10 // Boost max health
	M.health += 10

/datum/reagent/medicine/enchantedgold/on_mob_end_metabolize(mob/living/M)
	to_chat(M, span_notice("You no longer feel that [gold_text] power within you."))
	M.maxHealth -= 10
	//M.health = min(M.health - 10, M.maxHealth) // absorption effect shouldn't be lethal.


/datum/reagent/medicine/enchantedsupergold
	name = "Super Enchanted Gold"
	description = "Quickly heals all damage types and boosts maximum health, also reduces incoming damage and renders you immune to fire."
	reagent_state = LIQUID
	color = "#ffff00"
	self_consuming = TRUE
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	var/healing = 2
	var/gold_text

/datum/reagent/medicine/enchantedsupergold/on_mob_life(mob/living/carbon/M)
	if(M.on_fire)
		M.adjust_fire_stacks(-4)

	M.adjustToxLoss(-healing*REM, 0)
	M.adjustOxyLoss(-healing*REM, 0)
	M.adjustBruteLoss(-healing*REM, 0)
	M.adjustFireLoss(-healing*REM, 0)
	..()
	. = 1

	if(M.reagents.has_reagent(/datum/reagent/gold) && prob(5))
		M.reagents.add_reagent(type, 0.1)
	..()
	. = 1

/datum/reagent/medicine/enchantedsupergold/on_mob_metabolize(mob/living/carbon/M)
	gold_text = pick("golden", "mystical", "enchanted") //random text stuff
	to_chat(M, span_notice("You feel an incredible [gold_text] power within you!"))
	M.maxHealth += 40 // Boost max health
	M.health += 40
	ADD_TRAIT(M, TRAIT_ASHSTORM_IMMUNE, type)
	ADD_TRAIT(M, TRAIT_SNOWSTORM_IMMUNE, type)
	ADD_TRAIT(M, TRAIT_LAVA_IMMUNE, type)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.physiology.brute_mod *= 0.8
		H.physiology.burn_mod *= 0.8
		H.physiology.tox_mod *= 0.8
		H.physiology.oxy_mod *= 0.8

/datum/reagent/medicine/enchantedsupergold/on_mob_end_metabolize(mob/living/carbon/M)
	to_chat(M, span_notice("You no longer feel that incredible [gold_text] power within you."))
	M.maxHealth -= 40
	//M.health = min(M.health - 40, M.maxHealth) // absorption effect shouldn't be lethal.
	REMOVE_TRAIT(M, TRAIT_ASHSTORM_IMMUNE, type)
	REMOVE_TRAIT(M, TRAIT_SNOWSTORM_IMMUNE, type)
	REMOVE_TRAIT(M, TRAIT_LAVA_IMMUNE, type)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.physiology.brute_mod /= 0.8
		H.physiology.burn_mod /= 0.8
		H.physiology.tox_mod /= 0.8
		H.physiology.oxy_mod /= 0.8

/datum/reagent/medicine/clownenhancer
	name = "Clown Juice"
	description = "Grants clownly people superpowers."
	reagent_state = LIQUID
	color = "#ff0066"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	var/wasenhanced = FALSE

/datum/reagent/medicine/clownenhancer/on_mob_metabolize(mob/living/M)
	if(ishuman(M) && (M.mind?.assigned_role == "Clown" || M.mind?.has_antag_datum(/datum/antagonist/nukeop/clownop)))
		var/mob/living/carbon/human/H = M
		H.physiology.brute_mod *= 0.2
		H.physiology.burn_mod *= 0.2
		H.physiology.tox_mod *= 0.2
		H.physiology.oxy_mod *= 0.2
		wasenhanced = TRUE

/datum/reagent/medicine/clownenhancer/on_mob_end_metabolize(mob/living/M)
	if(ishuman(M) && wasenhanced == TRUE) // Just to prevent admin fuck-ups
		var/mob/living/carbon/human/H = M
		H.physiology.brute_mod /= 0.2
		H.physiology.burn_mod /= 0.2
		H.physiology.tox_mod /= 0.2
		H.physiology.oxy_mod /= 0.2
		wasenhanced = FALSE


/datum/reagent/medicine/antiwater
	name = "Anti-Water"
	description = "Grants the user temporary aquaphobia?"
	reagent_state = LIQUID
	color = "#ff0066"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	var/wasenhanced = FALSE

/datum/reagent/medicine/antiwater/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(-0.1*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/antiwater/on_mob_metabolize(mob/living/M)
	ADD_TRAIT(M, TRAIT_NO_SLIP_WATER, type)
	if(ishuman(M) && !ispodperson(M)) // Trying not to pick on pods even more.
		var/mob/living/carbon/human/H = M
		H.physiology.burn_mod *= 1.1
		wasenhanced = TRUE

/datum/reagent/medicine/antiwater/on_mob_end_metabolize(mob/living/M)
	REMOVE_TRAIT(M, TRAIT_NO_SLIP_WATER, type)
	if(ishuman(M) && wasenhanced == TRUE)
		var/mob/living/carbon/human/H = M
		H.physiology.burn_mod /= 1.1
		wasenhanced = FALSE

/datum/reagent/medicine/lavaland_extract
	name = "Lavaland Extract"
	description = "An extract of lavaland atmospheric and mineral elements. Heals the user in small doses, but is extremely toxic otherwise."
	color = "#C8A5DC" // rgb: 200, 165, 220
	overdose_threshold = 3 //To prevent people stacking massive amounts of a very strong healing reagent

/datum/reagent/medicine/lavaland_extract/on_mob_life(mob/living/carbon/M)
	M.heal_bodypart_damage(5,5)
	..()
	return TRUE

/datum/reagent/medicine/lavaland_extract/overdose_process(mob/living/M)
	M.adjustBruteLoss(3*REM, 0, FALSE)
	M.adjustFireLoss(3*REM, 0, FALSE)
	M.adjustToxLoss(3*REM, 0)
	..()
	return TRUE

/datum/reagent/medicine/ultravasculine
	name = "Ultravasculine"
	description = "Rapidly flushes toxins and especially histamines from the body, but places some stress on the veins. Overdose increases the stress."
	reagent_state = LIQUID
	metabolization_rate = 1.25 * REAGENTS_METABOLISM
	color = "#710000"
	overdose_threshold = 30

/datum/reagent/medicine/ultravasculine/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-6*REM, 0)
	M.adjustBruteLoss(1*REM, 0)

	if(M.reagents.has_reagent(/datum/reagent/toxin/histamine))
		M.reagents.add_reagent(/datum/reagent/medicine/ultravasculine, 0.5)
	..()
	. = 1

	if(M.reagents.has_reagent(/datum/reagent/toxin/histamine))
		M.reagents.remove_reagent(/datum/reagent/toxin/histamine, 1)
	..()
	. = 1

/datum/reagent/medicine/ultravasculine/overdose_process(mob/living/carbon/M)
	M.adjustToxLoss(4*REM, 0)
	M.adjustBruteLoss(5*REM, 0)
	..()
	. = 1

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


/datum/reagent/medicine/antimagic
	name = "Holy Blessing"
	description = "Grants the user temporary rhabdophobia?"
	reagent_state = LIQUID
	color = "#ff0066"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM

/datum/reagent/medicine/antimagic/on_mob_metabolize(mob/living/M)
	ADD_TRAIT(M, TRAIT_HOLY, type)

/datum/reagent/medicine/antimagic/on_mob_end_metabolize(mob/living/M)
	REMOVE_TRAIT(M, TRAIT_HOLY, type)


/datum/reagent/medicine/hyperzine
	name = "Hyperzine"
	description = "A reverse-engineered panacea of unknown origin, quickly restores all damage, boosts speed, and renders the host nearly immune to stuns. Metabolizes quickly.."
	reagent_state = LIQUID
	color = "#DCDCDC"
	metabolization_rate = 2.5 * REAGENTS_METABOLISM
	var/healing = 7
	self_consuming = TRUE
	addiction_types = list(/datum/addiction/stimulants = 8) //1.6 per 2 seconds
	metabolized_traits = list(TRAIT_BATON_RESISTANCE, TRAIT_ANALGESIA, TRAIT_STIMULATED)

/datum/reagent/medicine/hyperzine/on_mob_metabolize(mob/living/L)
	..()
	L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/expstimulants)

/datum/reagent/medicine/hyperzine/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/expstimulants)
	..()

/datum/reagent/medicine/hyperzine/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	affected_mob.adjustToxLoss(-healing, FALSE)
	affected_mob.adjustOxyLoss(-healing, FALSE)
	affected_mob.adjustBruteLoss(-healing, FALSE)
	affected_mob.adjustFireLoss(-healing, FALSE)

	affected_mob.adjustOrganLoss(ORGAN_SLOT_BRAIN, -healing)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_HEART, -healing)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_LUNGS, -healing)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_LIVER, -healing)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_STOMACH, -healing)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_EYES, -healing)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_EARS, -healing)

	affected_mob.adjust_nutrition(-2) // Big oof

	affected_mob.AdjustAllImmobility(-60  * REM * seconds_per_tick)
	affected_mob.adjustStaminaLoss(-12 * REM * seconds_per_tick, updating_stamina = FALSE, required_biotype = affected_biotype)

	..()
	. = TRUE


/datum/reagent/medicine/styptic_powder
	name = "Styptic Powder"
	description = "If used in touch-based applications, immediately restores bruising as well as restoring more over time. The chemical will heal up to 45 points of damage at 45 units applied. If ingested through other means, deals minor toxin damage."
	reagent_state = LIQUID
	color = "#FF9696"
	ph = 5.1
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/medicine/styptic_powder/expose_mob(mob/living/exposed_mob, methods=TOUCH, reac_volume, show_message = TRUE)
	. = ..()
	if(!iscarbon(exposed_mob))
		return
	var/mob/living/carbon/carbies = exposed_mob
	if(carbies.stat == DEAD)
		show_message = 0
	if(!(methods & (PATCH|TOUCH|VAPOR)))
		return
	var/current_bruteloss = carbies.getBruteLoss() // because this will be changed after calling adjustBruteLoss()
	var/harmies = clamp(carbies.adjustBruteLoss(-1.25 * reac_volume, updating_health = FALSE, required_bodytype = affected_bodytype), 0, current_bruteloss)

	var/need_mob_update = harmies

	if(need_mob_update)
		carbies.updatehealth()
	if(show_message)
		to_chat(carbies, span_danger("You feel your bruises healing! It stings like hell!"))

	carbies.add_mood_event("painful_medicine", /datum/mood_event/painful_medicine)

/datum/reagent/medicine/silver_sulfadiazine
	name = "Silver Sulfadiazine"
	description = "If used in touch-based applications, immediately restores burn wounds as well as restoring more over time. The chemical will heal up to 45 points of damage at 45 units applied. If ingested through other means, deals minor toxin damage."
	reagent_state = LIQUID
	color = "#C8A5DC"
	ph = 7.2
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/medicine/silver_sulfadiazine/expose_mob(mob/living/exposed_mob, methods=TOUCH, reac_volume, show_message = TRUE)
	. = ..()
	if(!iscarbon(exposed_mob))
		return
	var/mob/living/carbon/carbies = exposed_mob
	if(carbies.stat == DEAD)
		show_message = 0
	if(!(methods & (PATCH|TOUCH|VAPOR)))
		return
	var/current_fireloss = carbies.getFireLoss() // because this will be changed after calling adjustFireLoss()
	var/burnies = clamp(carbies.adjustFireLoss(-1.25 * reac_volume, updating_health = FALSE, required_bodytype = affected_bodytype), 0, current_fireloss)

	var/need_mob_update = burnies

	if(need_mob_update)
		carbies.updatehealth()
	if(show_message)
		to_chat(carbies, span_danger("You feel your burns healing! It stings like hell!"))

	carbies.add_mood_event("painful_medicine", /datum/mood_event/painful_medicine)
