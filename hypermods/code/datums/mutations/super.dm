/datum/mutation/superhuman
	name = "Super"
	desc = "A down-right supernatural mutation found only within sentient humanoids. It enhances many of a humanoid's physical and mental attributes to a near unprecedented state."
	quality = POSITIVE
	text_gain_indication = "<span class='notice'>You feel as though you've become far greater than you ever were.</span>"
	text_lose_indication = "<span class='notice'>Your super-humanity has been robbed from you.</span>"
	locked = TRUE
	difficulty = 40
	instability = 50
	species_allowed = list(SPECIES_HUMAN)
	conflicts = list(/datum/mutation/hulk)
	//mutadone_proof = TRUE
	var/superhumanhealing = FALSE
	mutation_traits = list(
		TRAIT_NO_SLIP_WATER,
		TRAIT_PUSHIMMUNE,
		TRAIT_STUNIMMUNE,
		TRAIT_NODISMEMBER,
	)

/datum/mutation/superhuman/on_acquiring(mob/living/carbon/human/acquirer)
	. = ..()
	if(!.)
		return

	superhumanhealing = TRUE
	acquirer.maxHealth += 50
	acquirer.physiology.brute_mod *= 0.90
	acquirer.physiology.burn_mod *= 0.90
	acquirer.physiology.tox_mod *= 0.90
	acquirer.physiology.oxy_mod *= 0.90
	acquirer.add_traits(mutation_traits, TRAIT_NO_SLIP_WATER)
	acquirer.add_traits(mutation_traits, TRAIT_PUSHIMMUNE)
	acquirer.add_traits(mutation_traits, TRAIT_STUNIMMUNE)
	acquirer.add_traits(mutation_traits, TRAIT_NODISMEMBER)
	owner.add_movespeed_mod_immunities("superhuman", /datum/movespeed_modifier/damage_slowdown)

/datum/mutation/superhuman/on_losing(mob/living/carbon/human/owner)
	if(..())
		return

	superhumanhealing = FALSE
	owner.maxHealth -= 50
	owner.physiology.brute_mod /= 0.90
	owner.physiology.burn_mod /= 0.90
	owner.physiology.tox_mod /= 0.90
	owner.physiology.oxy_mod /= 0.90
	owner.remove_traits(mutation_traits, TRAIT_NO_SLIP_WATER)
	owner.remove_traits(mutation_traits, TRAIT_PUSHIMMUNE)
	owner.remove_traits(mutation_traits, TRAIT_STUNIMMUNE)
	owner.remove_traits(mutation_traits, TRAIT_NODISMEMBER)
	owner.remove_movespeed_mod_immunities("superhuman", /datum/movespeed_modifier/damage_slowdown)

/datum/mutation/superhuman/on_life(seconds_per_tick, times_fired, mob/living/carbon/human/H)
	if(superhumanhealing)
		addtimer(CALLBACK(src, PROC_REF(heal)), 1 SECONDS)

/datum/mutation/superhuman/proc/heal()
	if(owner.get_oxy_loss())
		owner.adjust_oxy_loss(-0.25)
	if(owner.get_brute_loss())
		owner.adjust_brute_loss(-0.25)
	if(owner.get_fire_loss())
		owner.adjust_fire_loss(-0.25)
	if(owner.get_tox_loss())
		owner.adjust_tox_loss(-0.25)

	owner.adjust_stamina_loss(-2.5)

	owner.adjust_organ_loss(ORGAN_SLOT_BRAIN, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_HEART, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_EYES, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_EARS, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_LUNGS, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_LIVER, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_STOMACH, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_TONGUE, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_APPENDIX, -0.25)
