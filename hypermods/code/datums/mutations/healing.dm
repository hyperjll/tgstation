/datum/mutation/regenerative
	name = "Regenerative"
	desc = "A medical marvel of the genetic field, this mutation causes the host to slowly recover from all forms of damage."
	quality = POSITIVE
	text_gain_indication = "<span class='notice'>Somehow, you feel... better.</span>"
	text_lose_indication = "<span class='notice'>Your stomach drops as your flesh suddenly shifts awkwardly to a halt.</span>"
	difficulty = 12
	instability = 10
	energy_coeff = 1
	//mutadone_proof = FALSE
	locked = TRUE
	var/regenerative = FALSE

/datum/mutation/regenerative/on_acquiring(mob/living/carbon/human/acquirer)
	. = ..()
	if(!.)
		return

	regenerative = TRUE

/datum/mutation/regenerative/on_losing(mob/living/carbon/human/owner)
	if(..())
		return

	regenerative = FALSE

/datum/mutation/regenerative/on_life(seconds_per_tick, mob/living/carbon/human/H)
	if(regenerative)
		addtimer(CALLBACK(src, PROC_REF(heal)), 1 SECONDS)

/datum/mutation/regenerative/proc/heal()
	if(owner.get_oxy_loss())
		owner.adjust_oxy_loss(-0.25)
	if(owner.get_brute_loss())
		owner.adjust_brute_loss(-0.5)
	if(owner.get_fire_loss())
		owner.adjust_fire_loss(-0.5)
	if(owner.get_tox_loss())
		owner.adjust_tox_loss(-0.35, forced = TRUE)

	owner.adjust_organ_loss(ORGAN_SLOT_BRAIN, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_HEART, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_EYES, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_EARS, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_LUNGS, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_LIVER, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_STOMACH, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_TONGUE, -0.25)
	owner.adjust_organ_loss(ORGAN_SLOT_APPENDIX, -0.25)
