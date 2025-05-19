/datum/mutation/human/radproof
	name = "Radproof"
	desc = "Adapts the host's body to be better suited at preventing cancer caused by radioactivity at the expense of it's ability to handle toxic matter."
	quality = POSITIVE
	text_gain_indication = span_warning("You can't feel it in your bones!")
	instability = 35
	synchronizer_coeff = 1
	power_coeff = 1

/datum/mutation/human/radproof/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return

	ADD_TRAIT(owner, TRAIT_RADIMMUNE, GENETIC_MUTATION)
	owner.physiology?.tox_mod *= 1.5

/datum/mutation/human/radproof/on_losing(mob/living/carbon/human/owner)
	. = ..()
	if(.)
		return

	REMOVE_TRAIT(owner, TRAIT_RADIMMUNE, GENETIC_MUTATION)
	owner.physiology?.tox_mod /= 1.5
	if(GET_MUTATION_SYNCHRONIZER(src) < 1)
		owner.physiology?.tox_mod /= 0.85
	if(GET_MUTATION_POWER(src) > 1)
		REMOVE_TRAIT(owner, TRAIT_RADHEALING, GENETIC_MUTATION)

/datum/mutation/human/radproof/setup()
	. = ..()
	if(isnull(owner))
		return

	if(GET_MUTATION_SYNCHRONIZER(src) < 1)
		owner.physiology?.tox_mod *= 0.85
	if(GET_MUTATION_POWER(src) > 1)
		ADD_TRAIT(owner, TRAIT_RADHEALING, GENETIC_MUTATION)


/datum/mutation/human/radproof/super
	name = "Superior Radproof"
	desc = "Adapts the host's body to be better suited at preventing cancer caused by radioactivity at no expense to the host. Causes lots of instability and cannot be cured."
	quality = POSITIVE
	text_gain_indication = span_warning("You feel EVERYTHING in your bones!")
	instability = 40
	difficulty = 16
	mutadone_proof = TRUE
	locked = TRUE
