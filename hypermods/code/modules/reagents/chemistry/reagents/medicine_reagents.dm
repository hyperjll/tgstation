/datum/reagent/medicine/dermalnanites
	name = "Dermal Nanites"
	description = "Specialized nanites that cures all damage types slowly over time. Stabilizes temperature and cleanses radiation. Metabolizes very slowly."
	color = "#DCDCDC"
	metabolization_rate = 0.1
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	self_consuming = TRUE
	var/healing = 0.1
	var/radpower = 10

/datum/reagent/medicine/dermalnanites/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update

	need_mob_update += affected_mob.adjustBruteLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustFireLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustToxLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	need_mob_update += affected_mob.adjustOxyLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_respiration_type = affected_respiration_type)

	if(affected_mob.bodytemperature > BODYTEMP_NORMAL)
		affected_mob.adjust_bodytemperature(-40 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	else if(affected_mob.bodytemperature < (BODYTEMP_NORMAL + 1))
		affected_mob.adjust_bodytemperature(40 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

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
	color = "#f98a00"
	overdose_threshold = 30
	inverse_chem_val = 0.3
	inverse_chem = /datum/reagent/inverse/bicaridine

/datum/reagent/medicine/bicaridine/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustBruteLoss(-2 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/bicaridine/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustBruteLoss(4 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/dexalin
	name = "Dexalin"
	description = "Restores oxygen loss. Overdose causes it instead."
	color = "#24e7d9"
	overdose_threshold = 30

/datum/reagent/medicine/dexalin/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustOxyLoss(-2 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_respiration_type = affected_respiration_type)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/dexalin/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustOxyLoss(4 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_respiration_type = affected_respiration_type)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/kelotane
	name = "Kelotane"
	description = "Restores fire damage. Overdose causes it instead."
	color = "#f4a40b"
	overdose_threshold = 30
	inverse_chem_val = 0.3
	inverse_chem = /datum/reagent/inverse/kelotane

/datum/reagent/medicine/kelotane/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustFireLoss(-2 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/kelotane/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustFireLoss(4 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/antitoxin
	name = "Anti-Toxin"
	description = "Heals toxin damage and removes toxins in the bloodstream. Overdose causes toxin damage."
	color = "#24ea28"
	overdose_threshold = 30
	taste_description = "a roll of gauze"

/datum/reagent/medicine/antitoxin/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	if(affected_mob.adjustToxLoss(-2 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype))
		. = UPDATE_MOB_HEALTH

	for(var/datum/reagent/toxin/reagent as anything in affected_mob.reagents.reagent_list)
		if(reagent != src)
			affected_mob.reagents.remove_reagent(reagent.type, 1 * reagent.purge_multiplier * REM * seconds_per_tick)

/datum/reagent/medicine/antitoxin/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustToxLoss(4 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/tricordrazine
	name = "Tricordrazine"
	description = "Has a high chance to heal all types of damage. Overdose instead causes it."
	color = "#C8A5DC"
	overdose_threshold = 30
	taste_description = "grossness"

/datum/reagent/medicine/tricordrazine/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	if(prob(20)) // 20% chance to do nothing
		return
	var/need_mob_update
	need_mob_update += affected_mob.adjustBruteLoss(-1 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustFireLoss(-1 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustToxLoss(-1 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	need_mob_update += affected_mob.adjustOxyLoss(-1 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_respiration_type = affected_respiration_type)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/tricordrazine/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustBruteLoss(2 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustFireLoss(2 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustToxLoss(2 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	need_mob_update += affected_mob.adjustOxyLoss(2 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_respiration_type = affected_respiration_type)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/painkillers
	name = "Painkillers"
	description = "Slowly heals brute and burn damage types while you have under 25 TOTAL damage of those types. Overdose causes minor toxin damage."
	color = "#f2feff"
	overdose_threshold = 30
	taste_description = "diet morphine"

/datum/reagent/medicine/painkillers/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/totaldamage = (affected_mob.getBruteLoss() + affected_mob.getFireLoss())
	if(totaldamage <= 25)
		var/need_mob_update
		need_mob_update += affected_mob.adjustBruteLoss(-0.5 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
		need_mob_update += affected_mob.adjustFireLoss(-0.5 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
		if(need_mob_update)
			return UPDATE_MOB_HEALTH

/datum/reagent/medicine/painkillers/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustToxLoss(0.5 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/dexalinplus
	name = "Dexalin Plus"
	description = "Restores oxygen loss and restores blood volume quickly. Overdose causes both instead."
	color = "#0742CA"
	overdose_threshold = 25

/datum/reagent/medicine/dexalinplus/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustOxyLoss(-7 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_respiration_type = affected_respiration_type)

	if(affected_mob.blood_volume < BLOOD_VOLUME_NORMAL)
		affected_mob.blood_volume += 3

	affected_mob.reagents.remove_reagent(/datum/reagent/toxin/lexorin, 3)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/dexalinplus/overdose_process(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustOxyLoss(10 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_respiration_type = affected_respiration_type)
	need_mob_update += affected_mob.adjustFireLoss(6 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/dermaline
	name = "Dermaline"
	description = "Restores fire damage greatly. Overdose causes a drop in bodily temperature and oxygen loss. Overdoses in small amounts."
	color = "#084936"
	overdose_threshold = 20

/datum/reagent/medicine/dermaline/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustFireLoss(-4 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/dermaline/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	var/need_mob_update
	affected_mob.adjust_bodytemperature(-40 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	affected_mob.losebreath++

	need_mob_update = TRUE

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/dylovene
	name = "Dylovene"
	description = "Restores toxin damage slowly, reverses the severity of zombie infections. Overdose causes minor tissue damage."
	color = "#6600FF"
	overdose_threshold = 20

/datum/reagent/medicine/dylovene/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustToxLoss(-0.5 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)

	if(affected_mob.get_organ_slot(ORGAN_SLOT_ZOMBIE))
		var/obj/item/organ/zombie_infection/z_infection = affected_mob.get_organ_slot(ORGAN_SLOT_ZOMBIE)
		if(z_infection.damage_mult >= 0.02) // Slowly hinder the damage over time.
			z_infection.damage_mult -= 0.02 // Needs to be 0.02 to reverse the 0.01 per tick
			if(prob(10)) // 10% chance per tick to increase the maximum amount of time before someone become a zombie permanently.
				z_infection.revive_time_max += 1

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/dylovene/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustBruteLoss(1 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/hyronalin
	name = "Hyronalin"
	description = "An all-purpose radiation cure that also heals minor toxin damage. Overdose causes burns within the host."
	color = "#00cc7a"
	overdose_threshold = 30
	metabolized_traits = list(TRAIT_HALT_RADIATION_EFFECTS)

/datum/reagent/medicine/hyronalin/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustToxLoss(-0.5 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/hyronalin/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustFireLoss(0.5 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/arithrazine
	name = "Arithrazine"
	description = "A strong all-purpose radiation cure/blocker that also heals minor toxin damage, side effects include minor bruising of the patient. Has no overdose effects."
	color = "#b34700"
	metabolized_traits = list(TRAIT_HALT_RADIATION_EFFECTS, TRAIT_RADIMMUNE)

/datum/reagent/medicine/arithrazine/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustToxLoss(-1 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	need_mob_update += affected_mob.adjustBruteLoss(1 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/coagulant/tranexamicacid
	name = "Tranexamic Acid"
	description = "A low-tolerance blood clotter, capable of staunching bloodloss and restoring small amounts of blood. Overdose causes internal bleeding."
	color = "#9f6060"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 15
	clot_rate = 0.5 // .2 better than sangurite (0.3)
	passive_bleed_modifier = 0.5 // .2 better than sangurite (0.7)

/datum/reagent/medicine/coagulant/tranexamicacid/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustOxyLoss(-1 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_respiration_type = affected_respiration_type)

	if(affected_mob.blood_volume < BLOOD_VOLUME_NORMAL)
		affected_mob.blood_volume += 1

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/coagulant/tranexamicacid/overdose_process(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update

	affected_mob.blood_volume -= 6

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

// New version of inaprovaline, which is buffed to be more useful.

/datum/reagent/medicine/coagulant/inaprovaline
	name = "Inaprovaline Plus"
	description = "Stabilizes the breathing of patients, and heals asphyxiation damage quickly. It also increases blood clotting efficiency. Good for those in critical condition."
	metabolization_rate = 1.25 * REAGENTS_METABOLISM
	color = "#ff0000"
	ph = 8.5
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED|REAGENT_NO_RANDOM_RECIPE
	clot_rate = 0.1 // .2 worse than sangurite (0.3)
	passive_bleed_modifier = 0.9 // .2 worse than sangurite (0.7)

/datum/reagent/medicine/coagulant/inaprovaline/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustOxyLoss(-10 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_respiration_type = affected_respiration_type)

	if(affected_mob.losebreath >= 5)
		affected_mob.losebreath -= 5

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/coagulant/inaprovaline/on_mob_add(mob/living/M)
	ADD_TRAIT(M, TRAIT_COAGULATING, type)
	return ..()

/datum/reagent/medicine/coagulant/inaprovaline/on_mob_delete(mob/living/M)
	REMOVE_TRAIT(M, TRAIT_COAGULATING, type)
	return ..()

/datum/reagent/medicine/barozine
	name = "Barozine"
	description = "A potent drug that prevents pressure damage. Causes extreme pain and jittering. Very poisonous when overdosed."
	color = "#EA4F34"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 30

/datum/reagent/medicine/barozine/expose_mob(mob/living/carbon/affected_mob)
	..()
	if(affected_mob.stat == DEAD)
		return
	affected_mob.adjust_jitter(60 SECONDS)

/datum/reagent/medicine/barozine/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	if(prob(30))
		var/need_mob_update
		need_mob_update += affected_mob.adjustFireLoss(1 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
		if(need_mob_update)
			return UPDATE_MOB_HEALTH

	if(prob(5))
		affected_mob.emote("scream")

/datum/reagent/medicine/barozine/on_mob_metabolize(mob/living/M)
	ADD_TRAIT(M, TRAIT_RESISTHIGHPRESSURE, type)
	ADD_TRAIT(M, TRAIT_RESISTLOWPRESSURE, type)

/datum/reagent/medicine/barozine/on_mob_end_metabolize(mob/living/M)
	REMOVE_TRAIT(M, TRAIT_RESISTHIGHPRESSURE, type)
	REMOVE_TRAIT(M, TRAIT_RESISTLOWPRESSURE, type)

/datum/reagent/medicine/barozine/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustToxLoss(6 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/ultravasculine
	name = "Ultravasculine"
	description = "Rapidly flushes toxins and especially histamines from the body, but places some stress on the veins. Overdose increases the stress."
	metabolization_rate = 1.25 * REAGENTS_METABOLISM
	color = "#710000"
	overdose_threshold = 30

/datum/reagent/medicine/ultravasculine/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustBruteLoss(-6 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustToxLoss(1 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)

	if(affected_mob.reagents.has_reagent(/datum/reagent/toxin/histamine))
		affected_mob.reagents.add_reagent(/datum/reagent/medicine/ultravasculine, 0.5)

	affected_mob.reagents.remove_reagent(/datum/reagent/toxin/histamine, 1)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/ultravasculine/overdose_process(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustBruteLoss(5 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustToxLoss(4 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/ambuzol
	name = "Ambuzol"
	description = "Restores toxin damage slowly. Hinders and damages zombification infections over time, allowing one to be cured with enough exposure."
	color = "#0742CA"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM // super slow
	self_consuming = TRUE // Zombies/corpses don't process reagents.

/datum/reagent/medicine/ambuzol/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustToxLoss(-0.5 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)

	if(affected_mob.get_organ_slot(ORGAN_SLOT_ZOMBIE))
		var/obj/item/organ/zombie_infection/z_infection = affected_mob.get_organ_slot(ORGAN_SLOT_ZOMBIE)
		if(z_infection.damage_mult >= 0.05) // Slowly hinder the damage over time.
			z_infection.damage_mult -= 0.05 // Needs to be 0.02 to reverse the 0.01 per tick
		z_infection.damage += 1
		if(z_infection.damage >= 100) // If this zombie organ is 100 damage or above, cure us by removing the organ.
			qdel(z_infection)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH


/datum/reagent/medicine/changelingextract //is this used anywhere?
	name = "Changeling Regenerative Extract"
	description = "A highly complex regenerative chemical. Results in limb and organ growth."
	color = "#A4D8D8"
	self_consuming = TRUE
	metabolization_rate = 1

/datum/reagent/medicine/changelingextract/on_mob_metabolize(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	affected_mob.regenerate_limbs()
	affected_mob.regenerate_organs()
	for(var/datum/wound/iter_wound as anything in affected_mob.all_wounds)
		iter_wound.remove_wound()


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

/datum/reagent/medicine/experimentalstimulants/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustBruteLoss(-0.5 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustFireLoss(-0.5 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustToxLoss(0.4 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)

	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_HEART, 0.4 * REM * seconds_per_tick)

	affected_mob.AdjustAllImmobility(-80 * REM * seconds_per_tick * normalise_creation_purity())
	affected_mob.adjustStaminaLoss(-50 * REM * seconds_per_tick * normalise_creation_purity(), updating_stamina = FALSE)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

	affected_mob.reagents.remove_reagent(/datum/reagent/toxin/chloralhydrate, 3)
	affected_mob.reagents.remove_reagent(/datum/reagent/toxin/lexorin, 3)

/datum/reagent/medicine/experimentalstimulants/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustToxLoss(0.6 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)

	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_HEART, 0.6 * REM * seconds_per_tick)

	affected_mob.adjustStaminaLoss(5 * REM * seconds_per_tick * normalise_creation_purity(), updating_stamina = FALSE)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH


/datum/reagent/medicine/juggernaut
	name = "Juggernaut"
	description = "A potent painkiller that negates a significant amount of walkspeed loss from being hurt, with the additional special effect of absorbing and healing a portion of brute and burn damages taken between life cycles. Overdose causes confusion, loss of breath, and spontaneous paralysis."
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

/datum/reagent/medicine/juggernaut/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustBruteLoss(-1 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustFireLoss(-1 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/juggernaut/overdose_process(mob/living/M, seconds_per_tick, times_fired)
	if(prob(45))
		M.drop_all_held_items()
		M.Paralyze(5, 1, 0)
		M.adjust_confusion(6 SECONDS * REM)
		M.losebreath += 5
	..()


/datum/reagent/medicine/filgrastim
	name = "Filgrastim"
	description = "A granulocyte colony stimulating factor analog, which helps the body create more blood."
	color = "#660000"
	metabolization_rate = 0.4 * REAGENTS_METABOLISM

/datum/reagent/medicine/filgrastim/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update

	if(affected_mob.blood_volume < BLOOD_VOLUME_NORMAL)
		affected_mob.blood_volume += 2

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/coagulant/proconvertin
	name = "Proconvertin"
	description = "A VERY low-tolerance blood clotter, capable of staunching bloodloss quickly. Overdose causes massive oxygen loss."
	color = "#9f6060"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 10
	clot_rate = 0.7 // .4 better than sangurite (0.3)
	passive_bleed_modifier = 0.3 // .4 better than sangurite (0.7)

/datum/reagent/medicine/coagulant/proconvertin/overdose_process(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update

	need_mob_update += affected_mob.adjustOxyLoss(5 * REM * seconds_per_tick, updating_health = FALSE, required_respiration_type = affected_respiration_type)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/teporone
	name = "Teporone"
	description = "A less effective version of leporazine, it will effectively regulate a patient's body temperature, ensuring it never leaves safe levels."
	color = "#ddc8e9"

/datum/reagent/medicine/teporone/on_mob_life(mob/living/carbon/M, seconds_per_tick, times_fired)
	if(M.bodytemperature > BODYTEMP_NORMAL)
		M.adjust_bodytemperature(-10 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	else if(M.bodytemperature < (BODYTEMP_NORMAL + 1))
		M.adjust_bodytemperature(10 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()


/datum/reagent/medicine/healingnanites
	name = "Restoration Nanites"
	description = "Specialized nanites that quickly heals all damage types and restores the integrity of essential organs."
	color = "#DCDCDC"
	metabolization_rate = 2.5 * REAGENTS_METABOLISM
	var/healing = 10
	self_consuming = TRUE

/datum/reagent/medicine/healingnanites/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustBruteLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustFireLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustToxLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	need_mob_update += affected_mob.adjustOxyLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_respiration_type = affected_respiration_type)

	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_BRAIN, -healing * REM * seconds_per_tick)
	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_HEART, -healing * REM * seconds_per_tick)
	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_LUNGS, -healing * REM * seconds_per_tick)
	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_LIVER, -healing * REM * seconds_per_tick)
	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_STOMACH, -healing * REM * seconds_per_tick)
	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_EYES, -healing * REM * seconds_per_tick)
	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_EARS, -healing * REM * seconds_per_tick)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/hyperzine
	name = "Hyperzine"
	description = "A reverse-engineered panacea of unknown origin, quickly restores all damage, boosts speed, and renders the host nearly immune to stuns. Metabolizes quickly.."
	color = "#DCDCDC"
	metabolization_rate = 2.5 * REAGENTS_METABOLISM
	var/healing = 7
	self_consuming = TRUE
	addiction_types = list(/datum/addiction/stimulants = 8) //1.6 per 2 seconds
	metabolized_traits = list(TRAIT_BATON_RESISTANCE, TRAIT_ANALGESIA, TRAIT_STIMULATED)

/datum/reagent/medicine/hyperzine/on_mob_metabolize(mob/living/L)
	..()
	L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/hyperzine)

/datum/reagent/medicine/hyperzine/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/hyperzine)
	..()

/datum/reagent/medicine/hyperzine/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustBruteLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustFireLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustToxLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	need_mob_update += affected_mob.adjustOxyLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_respiration_type = affected_respiration_type)

	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_BRAIN, -healing * REM * seconds_per_tick)
	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_HEART, -healing * REM * seconds_per_tick)
	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_LUNGS, -healing * REM * seconds_per_tick)
	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_LIVER, -healing * REM * seconds_per_tick)
	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_STOMACH, -healing * REM * seconds_per_tick)
	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_EYES, -healing * REM * seconds_per_tick)
	need_mob_update += affected_mob.adjustOrganLoss(ORGAN_SLOT_EARS, -healing * REM * seconds_per_tick)

	affected_mob.adjust_nutrition(-2) // Big oof

	affected_mob.AdjustAllImmobility(-60  * REM * seconds_per_tick)
	affected_mob.adjustStaminaLoss(-12 * REM * seconds_per_tick, updating_stamina = FALSE, required_biotype = affected_biotype)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH


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
	color = "#ffff00"
	self_consuming = TRUE
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	var/healing = 0.5
	var/gold_text

/datum/reagent/medicine/enchantedgold/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustBruteLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustFireLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustToxLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	need_mob_update += affected_mob.adjustOxyLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_respiration_type = affected_respiration_type)

	if(affected_mob.reagents.has_reagent(/datum/reagent/gold) && prob(50))
		affected_mob.reagents.add_reagent(type, 0.1)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

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
	color = "#ffff00"
	self_consuming = TRUE
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	var/healing = 2
	var/gold_text

/datum/reagent/medicine/enchantedsupergold/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustBruteLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustFireLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustToxLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	need_mob_update += affected_mob.adjustOxyLoss(-healing * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_respiration_type = affected_respiration_type)

	if(affected_mob.on_fire)
		affected_mob.adjust_fire_stacks(-4)

	if(affected_mob.reagents.has_reagent(/datum/reagent/gold) && prob(5))
		affected_mob.reagents.add_reagent(type, 0.1)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

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
	color = "#ff0066"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	var/wasenhanced = FALSE

/datum/reagent/medicine/antiwater/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustFireLoss(-1 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

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

/datum/reagent/medicine/lavaland_extract/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	affected_mob.heal_bodypart_damage(5,5)
	..()
	return TRUE

/datum/reagent/medicine/lavaland_extract/overdose_process(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustBruteLoss(3 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustFireLoss(3 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustToxLoss(3 * REM * normalise_creation_purity() * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)

	if(need_mob_update)
		return UPDATE_MOB_HEALTH

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
	color = "#ff0066"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM

/datum/reagent/medicine/antimagic/on_mob_metabolize(mob/living/M)
	..()
	ADD_TRAIT(M, TRAIT_HOLY, type)

/datum/reagent/medicine/antimagic/on_mob_end_metabolize(mob/living/M)
	REMOVE_TRAIT(M, TRAIT_HOLY, type)
	..()


/datum/reagent/medicine/styptic_powder
	name = "Styptic Powder"
	description = "If used in touch-based applications, immediately restores bruising as well as restoring more over time. The chemical will heal up to 45 points of damage at 45 units applied. If ingested through other means, deals minor toxin damage."
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



/datum/reagent/medicine/final_fortuna
	name = "Final Fortuna"
	description = "Prevents death but weakens tendons and kills once it leaves your system."
	color = "#ad0a0a"
	metabolization_rate = REAGENTS_METABOLISM * 5
	overdose_threshold = 61
	var/static/list/subject_traits = list(
		TRAIT_STABLEHEART,
		TRAIT_NOHARDCRIT,
		TRAIT_NOSOFTCRIT,
		TRAIT_NOCRITDAMAGE,
		TRAIT_STUNIMMUNE,
		TRAIT_NODEATH,
		TRAIT_NO_DAMAGE_OVERLAY,
		TRAIT_EASYDISMEMBER
	)
	chemical_flags = REAGENT_IGNORE_STASIS
	///To prevent funky things
	var/active = FALSE

/datum/reagent/medicine/final_fortuna/on_mob_metabolize(mob/living/affected_mob)
	. = ..()
	if(!active && affected_mob.reagents.get_reagent_amount(/datum/reagent/medicine/final_fortuna) > 40)
		active = TRUE
		affected_mob.add_traits(subject_traits, type)

/datum/reagent/medicine/final_fortuna/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	if(!active)
		return
	affected_mob.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1)
	if(SPT_PROB(10, seconds_per_tick))
		affected_mob.emote("scream")

/datum/reagent/medicine/final_fortuna/on_mob_end_metabolize(mob/living/affected_mob)
	. = ..()
	if(!active)
		return
	affected_mob.remove_traits(subject_traits, type)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_BRAIN, 200, 200)
	affected_mob.updatehealth()

/datum/reagent/medicine/final_fortuna/overdose_process(mob/living/carbon/human/affected_mob, seconds_per_tick, times_fired)
	affected_mob.remove_traits(subject_traits, type)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_BRAIN, 200, 200)
	affected_mob.updatehealth()
