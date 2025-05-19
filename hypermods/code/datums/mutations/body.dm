/datum/mutation/human/strong
	instability = 25
	power_coeff = 1
	var/list/affected_limbs = list(
		BODY_ZONE_L_ARM = null,
		BODY_ZONE_R_ARM = null,
		BODY_ZONE_L_LEG = null,
		BODY_ZONE_R_LEG = null,
	)

/datum/mutation/human/strong/Destroy()
	for(var/body_part as anything in affected_limbs)
		if(!isnull(affected_limbs[body_part]))
			unregister_limb(null, affected_limbs[body_part])
	return ..()

/datum/mutation/human/strong/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return

	RegisterSignal(owner, COMSIG_CARBON_POST_ATTACH_LIMB, PROC_REF(register_limb))
	RegisterSignal(owner, COMSIG_CARBON_POST_REMOVE_LIMB, PROC_REF(unregister_limb))
	for(var/body_part as anything in affected_limbs)
		var/obj/item/bodypart/limb = owner.get_bodypart(check_zone(body_part))
		if(!limb)
			continue

		register_limb(owner, limb, initial = TRUE)

/datum/mutation/human/strong/on_losing(mob/living/carbon/human/owner)
	. = ..()
	if(.)
		return

	UnregisterSignal(owner, COMSIG_CARBON_POST_ATTACH_LIMB)
	UnregisterSignal(owner, COMSIG_CARBON_POST_REMOVE_LIMB)
	for(var/body_part as anything in affected_limbs)
		var/obj/item/bodypart/limb = owner.get_bodypart(check_zone(body_part))
		if(!limb)
			continue

		unregister_limb(owner, limb)

/datum/mutation/human/strong/setup()
	. = ..()
	if(isnull(owner) || GET_MUTATION_POWER(src) == 1)
		return

	for(var/body_part as anything in affected_limbs)
		var/obj/item/bodypart/limb = affected_limbs[body_part]
		limb.unarmed_damage_low += ((2 * GET_MUTATION_POWER(src)) - 2) // Bit cursed? Yep. Works with any mutation power? Yep.
		limb.unarmed_damage_high += ((2 * GET_MUTATION_POWER(src)) - 2)

/datum/mutation/human/strong/proc/register_limb(mob/living/carbon/human/owner, obj/item/bodypart/new_limb, special, initial = FALSE)
	SIGNAL_HANDLER
	if(new_limb.body_zone == BODY_ZONE_HEAD || new_limb.body_zone == BODY_ZONE_CHEST)
		return

	affected_limbs[new_limb.body_zone] = new_limb
	RegisterSignal(new_limb, COMSIG_QDELETING, PROC_REF(limb_gone))
	if(initial)
		new_limb.unarmed_damage_low += 2
		new_limb.unarmed_damage_high += 2
		return

	new_limb.unarmed_damage_low += (2 * GET_MUTATION_POWER(src))
	new_limb.unarmed_damage_high += (2 * GET_MUTATION_POWER(src))

/datum/mutation/human/strong/proc/unregister_limb(mob/living/carbon/human/owner, obj/item/bodypart/lost_limb, special)
	SIGNAL_HANDLER
	if(lost_limb.body_zone == BODY_ZONE_HEAD || lost_limb.body_zone == BODY_ZONE_CHEST)
		return

	affected_limbs[lost_limb.body_zone] = null
	UnregisterSignal(lost_limb, COMSIG_QDELETING)
	lost_limb.unarmed_damage_low -= (2 * GET_MUTATION_POWER(src))
	lost_limb.unarmed_damage_high -= (2 * GET_MUTATION_POWER(src))

/datum/mutation/human/strong/proc/limb_gone(obj/item/bodypart/deleted_limb)
	SIGNAL_HANDLER
	if(affected_limbs[deleted_limb.body_zone])
		affected_limbs[deleted_limb.body_zone] = null
		UnregisterSignal(deleted_limb, COMSIG_QDELETING)


/datum/mutation/human/thickskin
	name = "Thick skin"
	desc = "The user's skin acquires a leathery texture, and becomes more resilient to harm."
	quality = POSITIVE
	text_gain_indication = span_notice("Your skin feels dry and heavy.")
	text_lose_indication = span_notice("Your skin feels soft again...")
	instability = 30
	difficulty = 18

/datum/mutation/human/thickskin/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return

	var/datum/armor/owner_armor = owner.get_armor()
	var/list/armorlist = owner_armor.get_rating_list()
	armorlist[MELEE] += 10
	armorlist[BULLET] += 10
	owner.set_armor(owner_armor.generate_new_with_specific(armorlist))

/datum/mutation/human/thickskin/on_losing(mob/living/carbon/human/owner)
	. = ..()
	if(.)
		return

	var/datum/armor/owner_armor = owner.get_armor()
	var/list/armorlist = owner_armor.get_rating_list()
	armorlist[MELEE] -= 10
	armorlist[BULLET] -= 10
	owner.set_armor(owner_armor.generate_new_with_specific(armorlist))

/datum/mutation/human/densebones
	name = "Bone Densification"
	desc = "A mutation that gives the subject a rare form of increased bone density, making their entire body slightly more resilient to low kinetic blows."
	quality = POSITIVE
	text_gain_indication = span_notice("You feel your bones get denser.")
	text_lose_indication = span_notice("You feel your bones get lighter.")
	instability = 25
	difficulty = 16
	power_coeff = 1

/datum/mutation/human/densebones/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return

	var/datum/armor/owner_armor = owner.get_armor()
	var/list/armorlist = owner_armor.get_rating_list()
	armorlist[MELEE] += 5
	armorlist[WOUND] += 10
	owner.set_armor(owner_armor.generate_new_with_specific(armorlist))

/datum/mutation/human/densebones/on_losing(mob/living/carbon/human/owner)
	. = ..()
	if(.)
		return

	var/datum/armor/owner_armor = owner.get_armor()
	var/list/armorlist = owner_armor.get_rating_list()
	armorlist[MELEE] -= 5
	armorlist[WOUND] -= 10
	owner.set_armor(owner_armor.generate_new_with_specific(armorlist))

	if(GET_MUTATION_POWER(src) > 1)
		REMOVE_TRAIT(owner, TRAIT_HARDLY_WOUNDED, GENETIC_MUTATION)

/datum/mutation/human/densebones/setup()
	. = ..()
	if(owner && GET_MUTATION_POWER(src) > 1)
		ADD_TRAIT(owner, TRAIT_HARDLY_WOUNDED, GENETIC_MUTATION)

/datum/mutation/human/cerebral
	name = "Cerebral Neuroplasticity"
	desc = "A mutation that reorganizes the subject's brain, giving them more stamina while allowing for a slightly quicker recovery speed if exhausted."
	locked = TRUE
	quality = POSITIVE
	text_gain_indication = span_notice("You feel your brain get sturdier.")
	text_lose_indication = span_notice("You feel your brain getting weaker. ")
	instability = 60
	power_coeff = 1

/datum/mutation/human/cerebral/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return

	owner.physiology?.stamina_mod *= 0.7
	owner.physiology?.stun_mod *= 0.85

/datum/mutation/human/cerebral/on_losing(mob/living/carbon/human/owner)
	. = ..()
	if(.)
		return

	owner.physiology?.stamina_mod /= 0.7
	owner.physiology?.stun_mod /= 0.85
	if(GET_MUTATION_POWER(src) > 1)
		owner.physiology?.stamina_mod /= 0.85
		owner.physiology?.stun_mod /= 0.925

/datum/mutation/human/cerebral/setup()
	. = ..()
	if(owner && GET_MUTATION_POWER(src) > 1)
		owner.physiology?.stamina_mod *= 0.85
		owner.physiology?.stun_mod *= 0.925

/datum/mutation/human/fat
	name = "Obesity"
	desc = "A strange mutation that forces the body to rapidly produce lipid tissue."
	quality = NEGATIVE
	text_gain_indication = span_notice("You feel blubbery and lethargic!")
	text_lose_indication = span_notice("You feel fit!")

/datum/mutation/human/fat/on_life(seconds_per_tick, times_fired)
	if(HAS_TRAIT(owner, TRAIT_STASIS) || owner.stat == DEAD)
		return

	if(owner.nutrition <= NUTRITION_LEVEL_FAT)
		owner.nutrition += 25 * seconds_per_tick

/datum/mutation/human/no_fingerprints
	name = "Invisible Fingerprints"
	desc = "Subjects finger tips melt into a singular smooth structure, causing their fingerprints to be impossible to detect."
	quality = POSITIVE
	text_gain_indication = span_notice("Your fingers feel numb.")
	text_lose_indication = span_notice("Your fingers no longer feel numb.")
	instability = 10

/datum/mutation/human/no_fingerprints/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return

	ADD_TRAIT(owner, TRAIT_NO_FINGERPRINTS, GENETIC_MUTATION)

/datum/mutation/human/no_fingerprints/on_losing(mob/living/carbon/human/owner)
	. = ..()
	if(.)
		return

	REMOVE_TRAIT(owner, TRAIT_NO_FINGERPRINTS, GENETIC_MUTATION)

/datum/mutation/human/no_breath
	name = "Automatic Respiration"
	desc = "Subjects lungs begin to recycle CO2 into oxygen aided with melting the subjects airpipe shut making them have no need for air."
	quality = POSITIVE
	text_gain_indication = span_notice("You feel no need to breathe.")
	text_lose_indication = span_notice("You feel the need to breathe, once more.")
	instability = 30
	difficulty = 14

/datum/mutation/human/no_breath/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return

	ADD_TRAIT(owner, TRAIT_NOBREATH, GENETIC_MUTATION)

/datum/mutation/human/no_breath/on_losing(mob/living/carbon/human/owner)
	. = ..()
	if(.)
		return

	REMOVE_TRAIT(owner, TRAIT_NOBREATH, GENETIC_MUTATION)

/datum/mutation/human/dizzy
	name = "Dizzy"
	desc = "Causes the subjects cerebellum to shut down in certain places causing dizzyness."
	quality = NEGATIVE
	text_gain_indication = span_danger("You suddenly start feeling very dizzy...")
	text_lose_indication = span_notice("You regain your balance.")
	instability = 15
	synchronizer_coeff = 1
	power_coeff = 1
	energy_coeff = 1

/datum/mutation/human/dizzy/on_life(seconds_per_tick, times_fired)
	if(SPT_PROB(2.5 / GET_MUTATION_ENERGY(src), seconds_per_tick))
		to_chat(owner, span_warning("[pick("You feel dizzy.", "Your head spins.")]"))
		owner.adjust_dizzy_up_to(1 MINUTES * GET_MUTATION_SYNCHRONIZER(src) * GET_MUTATION_POWER(src), 3 MINUTES)

/datum/mutation/human/ear_cancer
	name = "Tinnitus"
	desc = "Causes the subjects to constantly hear a ringing noise."
	quality = MINOR_NEGATIVE
	text_gain_indication = span_warning("You start hearing ringing in your ears.")
	text_lose_indication = span_notice("You no longer bleed from your ears.")
	instability = 5
	synchronizer_coeff = 1

/datum/mutation/human/ear_cancer/on_life(seconds_per_tick, times_fired)
	var/obj/item/organ/ears/ears = owner.get_organ_slot(ORGAN_SLOT_EARS) // RIP THEM OUT TO STOP THE NOISE
	if(ears && SPT_PROB(5 * GET_MUTATION_SYNCHRONIZER(src), seconds_per_tick))
		to_chat(owner, span_warning("Your ears start to ring!"))
		SEND_SOUND(owner, sound('sound/items/weapons/flash_ring.ogg', 0, 1, 0, 250))
