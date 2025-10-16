/datum/status_effect/heretic_passive/time
	name = "Times Mends All"
	passive_descriptions = list(
		"Passive Healing at the cost of your Youth, 40% Stun Resistance, and faster action speeds.",
		"Baton Resistance and 80% Stun Immunity.",
		"Increased Healing at a lower cost."
	)
	var/healing = -3
	var/stunresist = -40
	var/age_consumption = 0.2

/datum/status_effect/heretic_passive/time/tick()
	var/mob/living/carbon/human/carbon_human = owner
	if(iscarbon(carbon_human) && carbon_human.age >= 50) // First we determine if your eligable.
		return

	carbon_human.AdjustAllImmobility(stunresist)

	if(carbon_human.getBruteLoss())
		carbon_human.age += age_consumption
		carbon_human.adjustBruteLoss(healing)

	if(carbon_human.getFireLoss())
		carbon_human.age += age_consumption
		carbon_human.adjustFireLoss(healing)

	if(carbon_human.getToxLoss())
		carbon_human.age += age_consumption
		carbon_human.adjustToxLoss(healing)

	if(carbon_human.getOxyLoss())
		carbon_human.age += age_consumption
		carbon_human.adjustOxyLoss(healing)

/datum/status_effect/heretic_passive/time/on_apply()
	. = ..()
	owner.add_actionspeed_modifier(/datum/actionspeed_modifier/timemendsall)

/datum/status_effect/heretic_passive/time/heretic_level_upgrade()
	. = ..()
	stunresist = -80
	ADD_TRAIT(owner, TRAIT_BATON_RESISTANCE, "time_mends_all")

/datum/status_effect/heretic_passive/time/heretic_level_final()
	. = ..()
	healing = -5
	age_consumption = 0.1

/datum/status_effect/heretic_passive/time/on_remove()
	REMOVE_TRAIT(owner, TRAIT_BATON_RESISTANCE, "time_mends_all")
	owner.remove_actionspeed_modifier(/datum/actionspeed_modifier/timemendsall)
	return ..()
