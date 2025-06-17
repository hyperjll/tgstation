/obj/item/organ/heart/sheep
	name = "sheep heart"
	desc = "An heart that's seen it's fair share of work. Likely extracted from a sheep."
	icon_state = "heart-on"
	base_icon_state = "heart"
	maxHealth = STANDARD_ORGAN_THRESHOLD * 0.5 // Sheep are prone to fear, and are more prone to heart damage. No, it's not scientific i'm just fucking with you.
	var/damage_heart_toggle = TRUE
	/// The cooldown until the next time this heart cam speed you up.
	COOLDOWN_DECLARE(sheep_boost_cooldown)

/obj/item/organ/heart/sheep/on_life(seconds_per_tick, times_fired)
	. = ..()
	if(owner.health < 5 && COOLDOWN_FINISHED(src, sheep_boost_cooldown))
		COOLDOWN_START(src, sheep_boost_cooldown, rand(25 SECONDS, 1 MINUTES))
		to_chat(owner, span_userdanger("You feel yourself dying, but you something primal kicks in to keep you moving!"))
		owner.heal_overall_damage(brute = 15, burn = 15, required_bodytype = BODYTYPE_ORGANIC)
		if(damage_heart_toggle)
			var/mob/living/carbon/my_human = owner
			my_human.adjustOrganLoss(ORGAN_SLOT_HEART, 20)
		if(owner.reagents.get_reagent_amount(/datum/reagent/medicine/stimulants) < 10)
			owner.reagents.add_reagent(/datum/reagent/medicine/stimulants, 5) // About 30 seconds.

/obj/item/organ/heart/sheep/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/organ_set_bonus, /datum/status_effect/organ_set_bonus/sheep)

/obj/item/organ/liver/sheep
	name = "sheep liver"
	desc = "A sheep's liver. Rumored to provide healing for those weak of heart."
	icon_state = "liver"

/obj/item/organ/liver/sheep/handle_chemical(mob/living/carbon/organ_owner, datum/reagent/chem, seconds_per_tick, times_fired)
	. = ..()
	//parent returned COMSIG_MOB_STOP_REAGENT_TICK or we are failing
	if((. & COMSIG_MOB_STOP_REAGENT_TICK) || (organ_flags & ORGAN_FAILING))
		return
	if(istype(chem, /datum/reagent/consumable/nutriment))
		organ_owner.adjustBruteLoss(-0.1 * REM * seconds_per_tick, updating_health = TRUE)
		organ_owner.adjustFireLoss(-0.1 * REM * seconds_per_tick, updating_health = TRUE)

/obj/item/organ/liver/sheep/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/organ_set_bonus, /datum/status_effect/organ_set_bonus/sheep)

///bonus of the rat: you can ventcrawl!
/datum/status_effect/organ_set_bonus/sheep
	id = "organ_set_bonus_sheep"
	organs_needed = 2
	bonus_activate_text = span_notice("Sheep DNA is deeply infused with you! You've become resistant to extreme temperatures!")
	bonus_deactivate_text = span_notice("Your DNA is no longer majority sheep, and you're no longer resistant to extreme temperatures...")
	bonus_traits = list(TRAIT_RESISTHEAT, TRAIT_RESISTCOLD)
