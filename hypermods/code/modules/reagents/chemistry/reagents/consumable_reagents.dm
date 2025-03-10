/datum/reagent/consumable/hearty_punch
	name = "Cheap Hearty Punch"
	description = "A hearty fruit punch with various medicinal chemicals mixed within. A substitute for it's alcoholic cousin."
	color = rgb(140, 0, 0)
	quality = DRINK_VERYGOOD
	metabolization_rate = 0.4 * REAGENTS_METABOLISM
	taste_description = "bravado in the face of disaster"

/datum/reagent/consumable/hearty_punch/on_mob_life(mob/living/carbon/M)
	if(M.health <= 0)
		M.adjustBruteLoss(-1, 0)
		M.adjustFireLoss(-1, 0)
		M.adjustOxyLoss(-1, 0)
		M.adjustToxLoss(-1, 0)
		. = 1
	return ..() || .

/datum/reagent/consumable/changelingsting
	name = "Cheap Changeling Sting"
	description = "You take a tiny sip and feel a burning sensation..."
	color = "#2E6671" // rgb: 46, 102, 113
	quality = DRINK_GOOD
	taste_description = "your brain coming out your nose"

/datum/reagent/consumable/changelingsting/on_mob_life(mob/living/carbon/target)
	var/datum/antagonist/changeling/changeling = target.mind?.has_antag_datum(/datum/antagonist/changeling)
	changeling?.adjust_chemicals(metabolization_rate * REM * 0.5)
	return ..()

/datum/reagent/consumable/turbo
	name = "Cheap Turbo"
	description = "A turbulent cocktail associated with outlaw hoverbike racing. Not for the faint of heart."
	color = "#e94c3a"
	quality = DRINK_VERYGOOD
	taste_description = "the outlaw spirit"

/datum/reagent/consumable/turbo/on_mob_metabolize(mob/living/L)
	..()
	L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/cheapturbo)

/datum/reagent/consumable/turbo/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/cheapturbo)
	..()

/datum/reagent/consumable/turbo/on_mob_life(mob/living/carbon/M)
	if(prob(1))
		to_chat(M, span_notice("[pick("You feel disregard for the rule of law.", "You feel pumped!", "Your head is pounding.", "Your thoughts are racing..")]"))
	M.adjustStaminaLoss(-0.25)
	return ..()

/datum/reagent/consumable/old_timer
	name = "Cheap Old Timer"
	description = "An archaic potation enjoyed by old coots of all ages."
	color = "#996835"
	quality = DRINK_NICE
	taste_description = "simpler times"

/datum/reagent/consumable/old_timer/on_mob_life(mob/living/carbon/human/metabolizer, seconds_per_tick, times_fired)
	. = ..()
	if(SPT_PROB(40, seconds_per_tick) && istype(metabolizer))
		metabolizer.age += 1
		if(metabolizer.age > 70)
			metabolizer.set_facial_haircolor("#cccccc", update = FALSE)
			metabolizer.set_haircolor("#cccccc", update = TRUE)
			if(metabolizer.age > 100)
				metabolizer.become_nearsighted(type)
				if(metabolizer.gender == MALE)
					metabolizer.set_facial_hairstyle("Beard (Very Long)", update = TRUE)

				if(metabolizer.age > 969) //Best not let people get older than this or i might incur G-ds wrath
					metabolizer.visible_message(span_notice("[metabolizer] becomes older than any man should be.. and crumbles into dust!"))
					metabolizer.dust(just_ash = FALSE, drop_items = TRUE, force = FALSE)


/datum/reagent/consumable/between_the_sheets
	name = "Cheap Between the Sheets"
	description = "A provocatively named classic. Funny enough, doctors recommend drinking it before taking a nap."
	color = "#F4C35A"
	quality = DRINK_GOOD
	taste_description = "seduction"

/datum/reagent/consumable/between_the_sheets/on_mob_life(mob/living/L)
	..()
	if(L.IsSleeping())
		if(L.getBruteLoss() && L.getFireLoss()) //If you are damaged by both types, slightly increased healing but it only heals one. The more the merrier wink wink.
			if(prob(40))
				L.adjustBruteLoss(-2)
			else
				L.adjustFireLoss(-2)
		else if(L.getBruteLoss()) //If you have only one, it still heals but not as well.
			L.adjustBruteLoss(-1)
		else if(L.getFireLoss())
			L.adjustFireLoss(-1)


/datum/reagent/rockcandyruby
	name = "Ruby Rock Candy"
	description = "An incredibly powerful reagent anomalously found within ruby rock candy. Provides long-term health regeneration."
	color = "#ff0000"
	metabolization_rate = 0.025 * REAGENTS_METABOLISM
	taste_description = "expensive gemstones"

/datum/reagent/rockcandyruby/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-1, 0)
	M.adjustFireLoss(-1, 0)
	M.adjustOxyLoss(-1, 0)
	M.adjustToxLoss(-1, 0)
	..()
	. = 1

/datum/reagent/rockcandysapphire
	name = "Sapphire Rock Candy"
	description = "An incredibly powerful reagent anomalously found within sapphire rock candy. Extinguishes the consumer and provides increased resistance against burns."
	color = "#0000ff"
	metabolization_rate = 0.025 * REAGENTS_METABOLISM
	taste_description = "expensive gemstones"

/datum/reagent/rockcandysapphire/on_mob_life(mob/living/carbon/M)
	if(M.on_fire)
		M.adjust_fire_stacks(-1)

/datum/reagent/rockcandysapphire/on_mob_metabolize(mob/living/M)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.physiology.burn_mod *= 0.85

/datum/reagent/rockcandysapphire/on_mob_end_metabolize(mob/living/M)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.physiology.burn_mod /= 0.85

/datum/reagent/rockcandyemerald
	name = "Emerald Rock Candy"
	description = "An incredibly powerful reagent anomalously found within emerald rock candy. Boosts universal agility in all who consume it by 15%."
	color = "#00ff00"
	metabolization_rate = 0.025 * REAGENTS_METABOLISM
	taste_description = "expensive gemstones"

/datum/reagent/rockcandyemerald/on_mob_metabolize(mob/living/L)
	..()
	L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/emeraldrockcandy)

/datum/reagent/rockcandyemerald/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/emeraldrockcandy)

/datum/reagent/rockcandytopaz
	name = "Topaz Rock Candy"
	description = "An incredibly powerful reagent anomalously found within topaz rock candy. Quickly heals those in critical condition, and provides temporary self-respiration."
	color = "#ff9933"
	metabolization_rate = 0.025 * REAGENTS_METABOLISM
	taste_description = "expensive gemstones"

/datum/reagent/rockcandytopaz/on_mob_life(mob/living/carbon/M)
	if(M.health <= 0)
		M.adjustBruteLoss(-5, 0)
		M.adjustFireLoss(-5, 0)
		M.adjustOxyLoss(-5, 0)
		M.adjustToxLoss(-5, 0)
		. = 1
	return ..() || .

/datum/reagent/rockcandytopaz/on_mob_metabolize(mob/living/carbon/M)
	ADD_TRAIT(M, TRAIT_NOBREATH, "topazrockcandy")

/datum/reagent/rockcandytopaz/on_mob_end_metabolize(mob/living/carbon/M)
	REMOVE_TRAIT(M, TRAIT_NOBREATH, "topazrockcandy")

/datum/reagent/rockcandymagic
	name = "Magic Rock Candy"
	description = "An incredibly powerful reagent anomalously found within magical rock candy. Temporarily augments the consumer, granting them increased physical stats such as heightened health, defense, speed, and regeneration."
	color = "#6600ff"
	metabolization_rate = 0.025 * REAGENTS_METABOLISM
	taste_description = "a collection of expensive gemstones"

/datum/reagent/rockcandymagic/on_mob_metabolize(mob/living/L)
	..()
	L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/rockcandymagic)

	var/mob/living/carbon/human/H = L
	if(ishuman(L))
		L.maxHealth += 10 // Boost max health
		H.physiology.brute_mod *= 0.925
		H.physiology.burn_mod *= 0.925
		H.physiology.tox_mod *= 0.925
		H.physiology.oxy_mod *= 0.925

/datum/reagent/rockcandymagic/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/rockcandymagic)

	var/mob/living/carbon/human/H = L
	if(ishuman(L))
		L.maxHealth -= 10 // Boost max health
		H.physiology.brute_mod /= 0.925
		H.physiology.burn_mod /= 0.925
		H.physiology.tox_mod /= 0.925
		H.physiology.oxy_mod /= 0.925

/datum/reagent/rockcandymagic/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-0.5, 0)
	M.adjustFireLoss(-0.5, 0)
	M.adjustOxyLoss(-0.1, 0)
	M.adjustToxLoss(-0.25, 0)
	..()
	. = 1

/datum/reagent/consumable/coffeeplus
	name = "Coffee"
	description = "Coffee is a brewed drink prepared from roasted seeds, commonly called coffee beans, of the coffee plant. There's something special about this brew..."
	color = "#482000" // rgb: 72, 32, 0
	nutriment_factor = 0
	overdose_threshold = 80
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	taste_description = "bitterness"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	glass_price = DRINK_PRICE_STOCK
	metabolized_traits = list(TRAIT_STIMULATED)

/datum/reagent/consumable/coffeeplus/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	affected_mob.set_jitter_if_lower(10 SECONDS * REM * seconds_per_tick)

/datum/reagent/consumable/coffeeplus/on_mob_metabolize(mob/living/L)
	..()
	L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/coffeeplus)

/datum/reagent/consumable/coffeeplus/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/coffeeplus)
	..()

/datum/reagent/consumable/coffeeplus/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	affected_mob.adjustBruteLoss(-0.1, 0)
	affected_mob.adjustFireLoss(-0.1, 0)
	affected_mob.adjustOxyLoss(-0.1, 0)
	affected_mob.adjustToxLoss(-0.1, 0)

	affected_mob.adjustStaminaLoss(-1 * REM * seconds_per_tick)
	affected_mob.adjust_dizzy(-14 SECONDS * REM * seconds_per_tick)
	affected_mob.adjust_drowsiness(-9 SECONDS * REM * seconds_per_tick)
	affected_mob.AdjustSleeping(-6 SECONDS * REM * seconds_per_tick)
	//310.15 is the normal bodytemp.
	affected_mob.adjust_bodytemperature(25 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * seconds_per_tick, 0, affected_mob.get_body_temp_normal())
	if(holder.has_reagent(/datum/reagent/consumable/frostoil))
		holder.remove_reagent(/datum/reagent/consumable/frostoil, 5 * REM * seconds_per_tick)
	if(holder.has_reagent(/datum/reagent/medicine/haloperidol))
		holder.remove_reagent(/datum/reagent/medicine/haloperidol, 3 * REM * seconds_per_tick)
	if(holder.has_reagent(/datum/reagent/medicine/morphine))
		holder.remove_reagent(/datum/reagent/medicine/morphine, 3 * REM * seconds_per_tick)
	if(holder.has_reagent(/datum/reagent/toxin/nocturine))
		holder.remove_reagent(/datum/reagent/toxin/nocturine, 2 * REM * seconds_per_tick)


/datum/reagent/consumable/ethanol/moonshine/traitor
	name = "Moonshine"
	boozepwr = 95

/datum/reagent/consumable/ethanol/moonshine/traitor/on_mob_life(mob/living/carbon/M, seconds_per_tick, times_fired)
	. = ..()
	if(IS_TRAITOR(M))
		M.reagents.remove_reagent(/datum/reagent/consumable/ethanol/moonshine/traitor, 2)
		..()
		. = 1

		M.reagents.add_reagent(/datum/reagent/medicine/omnizine, 2)
		..()
		. = 1


/datum/reagent/consumable/rainbow_chili
	name = "Rainbow Chili"
	description = "An anomalous reagent that quickly diffuses into various other reagents. The ultimate gamble."
	color = "#ffffff"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	taste_description = "a roll of the dice"
	var/r_type = ""

/datum/reagent/consumable/rainbow_chili/on_mob_life(mob/living/carbon/M, seconds_per_tick, times_fired)
	. = ..()
	var/list/r_types = subtypesof(/datum/reagent/)
	for(var/i in 1 to 1)
		r_type = pick(r_types)

	M.reagents.add_reagent(r_type, 1)
	..()
	. = 1

	M.reagents.remove_reagent(/datum/reagent/consumable/rainbow_chili, 1)
	..()
	. = 1


/datum/reagent/consumable/vhfcs // Slower sugar production, but much slower metabolize speed = large amounts of sugar over large amount of time.
	name = "Very-High-Fructose Corn Syrup"
	description = "Decays into sugar."
	color = "#DBCE95"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	taste_description = "extra sweet slime"

/datum/reagent/consumable/vhfcs/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	holder.add_reagent(/datum/reagent/consumable/sugar, 2.4 * REM * seconds_per_tick)


/datum/reagent/consumable/melonium
	name = "Melonium"
	description = "A robust and mysterious substance."
	color = "#00ff2c"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	var/t_type = ""
	var/m_type = ""

/datum/reagent/consumable/melonium/expose_mob(mob/living/exposed_mob, methods=INGEST, reac_volume, show_message = TRUE)
	. = ..()
	if(!iscarbon(exposed_mob))
		return
	var/mob/living/carbon/carbies = exposed_mob
	if(carbies.stat == DEAD)
		show_message = 0
	if(!(methods & (INGEST)))
		return

	switch(rand(1,5))
		if(1)
			to_chat(carbies, span_alert("What an explosive burst of flavor!"))
			var/turf/T = get_turf(carbies.loc)
			explosion(T, 0, 0, 1, flame_range = 0)
		if(2)
			to_chat(carbies, span_alert("So juicy!"))
			var/list/t_types = subtypesof(/datum/reagent/toxin/)
			for(var/i in 1 to 1)
				t_type = pick(t_types)

			carbies.reagents.add_reagent(t_type, 10)
			..()
			. = 1

			var/list/m_types = subtypesof(/datum/reagent/medicine/)
			for(var/i in 1 to 1)
				m_type = pick(m_types)

			carbies.reagents.add_reagent(m_type, 10)
			..()
			. = 1
		if(3)
			to_chat(carbies, span_alert("How refreshing!"))
			var/need_mob_update
			need_mob_update = carbies.adjustOrganLoss(ORGAN_SLOT_BRAIN, 30 * REM, required_organ_flag = affected_organ_flags)
			need_mob_update += carbies.adjustBruteLoss(-200 * REM * normalise_creation_purity(), updating_health = FALSE, required_bodytype = affected_bodytype)
			need_mob_update += carbies.adjustFireLoss(-200 * REM * normalise_creation_purity(), updating_health = FALSE, required_bodytype = affected_bodytype)
			need_mob_update += carbies.adjustToxLoss(30 * REM * normalise_creation_purity(), updating_health = FALSE, required_bodytype = affected_bodytype)
			need_mob_update += carbies.adjustOxyLoss(30 * REM * normalise_creation_purity(), updating_health = FALSE, required_bodytype = affected_bodytype)
			if(need_mob_update)
				return UPDATE_MOB_HEALTH
		if(4)
			to_chat(carbies, span_alert("This flavor is out of this world!"))
			carbies.adjust_confusion(10 SECONDS)
			carbies.adjust_disgust(10)
			carbies.adjust_hallucinations(1 MINUTES)
		if(5)
			to_chat(carbies, span_alert("What stunning texture!"))
			carbies.AdjustSleeping(6 SECONDS * REM)
			carbies.AdjustStun(7 SECONDS * REM)
			carbies.AdjustKnockdown(8 SECONDS * REM)
			carbies.adjust_stutter(20 SECONDS)


/datum/reagent/consumable/clockwork_orange
	name = "Clockwork Orange"
	description = "An almost miracle juice capable of restoring someone's youth."
	color = "#fa8c0b"
	taste_description = "uncomfortable"

/datum/reagent/consumable/clockwork_orange/on_mob_life(mob/living/carbon/human/metabolizer, seconds_per_tick, times_fired)
	. = ..()
	if(SPT_PROB(20, seconds_per_tick) && istype(metabolizer))
		if(metabolizer.age > 13)
			metabolizer.age -= 1
