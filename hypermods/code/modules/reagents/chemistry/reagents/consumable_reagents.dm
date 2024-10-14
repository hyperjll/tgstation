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
	L.add_movespeed_modifier(type, update=TRUE, priority=100, multiplicative_slowdown=-0.3, blacklisted_movetypes=(FLYING|FLOATING))

/datum/reagent/consumable/turbo/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(type)
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
