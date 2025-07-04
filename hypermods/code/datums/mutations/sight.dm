/datum/mutation/laser_eyes
	conflicts = list(/datum/mutation/laser_eyes/unstable, /datum/mutation/laser_eyes/unstable/syndicate)
	power_coeff = 1
	energy_coeff = 1

/// Laser eyes made by a geneticist
/datum/mutation/laser_eyes/unstable
	name = "Unstable Laser Eyes"
	desc = "Reflects concentrated light back from the eyes, however this mutation is very unstable and causes damage to the user."
	instability = 60
	conflicts = list(/datum/mutation/laser_eyes, /datum/mutation/laser_eyes/unstable/syndicate)
	synchronizer_coeff = 1
	var/shots_left = 4
	var/cooldown

/datum/mutation/laser_eyes/unstable/Destroy(force)
	if(shots_left != 4)
		STOP_PROCESSING(SSobj, src)
	return ..()

/datum/mutation/laser_eyes/unstable/on_ranged_attack(mob/living/carbon/human/source, atom/target, modifiers)
	if(!(source.combat_mode))
		return

	var/obj/item/organ/eyes/eyes = source.get_organ_slot(ORGAN_SLOT_EYES)
	if(!eyes)
		to_chat(source, span_warning("You don't have eyes to shoot lasers!"))
		return

	if(eyes.organ_flags & ORGAN_FAILING)
		to_chat(source, span_warning("You can't shoot lasers whilst your cornea is melted!"))
		return

	if(eyes.organ_flags == ORGAN_ROBOTIC)
		owner.balloon_alert(owner, "eyes robotic!")
		return FALSE

	if(!shots_left)
		source.balloon_alert(source, "can't fire!")
		to_chat(source, span_warning("You can't fire your laser eyes this fast!"))
		return

	. = ..()
	if(shots_left == 4)
		START_PROCESSING(SSobj, src)
	shots_left--

	var/backfire_damage = 5 * GET_MUTATION_SYNCHRONIZER(src)
	eyes.apply_organ_damage(backfire_damage)
	var/obj/item/bodypart/head/head = source.get_bodypart(BODY_ZONE_HEAD)
	if(head)
		head.receive_damage(burn = backfire_damage, damage_source = src)
	else
		source.adjustFireLoss(backfire_damage)

/datum/mutation/laser_eyes/unstable/process(seconds_per_tick)
	cooldown += seconds_per_tick
	if(cooldown >= 5)
		shots_left++
		cooldown -= 5
		var/obj/item/organ/eyes/eyes = owner.get_organ_slot(ORGAN_SLOT_EYES)
		if(eyes && !(eyes.organ_flags & ORGAN_FAILING))
			owner.balloon_alert(owner, "eyes recharged!")
			return

	if(shots_left == 4)
		STOP_PROCESSING(SSobj, src)
		cooldown = 0

/datum/mutation/laser_eyes/unstable/syndicate
	name = "Stabilized Laser Eyes"
	desc = "Reflects concentrated light back from the eyes, this strain of the mutation is high-quality, yet still causes the user to take damage on use."
	conflicts = list(/datum/mutation/laser_eyes, /datum/mutation/laser_eyes/unstable)
	instability = 40

/datum/mutation/meson_vision
	name = "Meson Visual Enhancement"
	desc = "A mutation that manipulates the subject's eyes in a way that makes them able to see behind walls to a limited degree."
	locked = TRUE
	quality = POSITIVE
	text_gain_indication = span_notice("More information seems to reach your eyes...")
	text_lose_indication = span_notice("The amount of information reaching your eyes fades...")
	instability = 20

/datum/mutation/meson_vision/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return

	owner.add_traits(list(TRAIT_MADNESS_IMMUNE, TRAIT_MESON_VISION), GENETIC_MUTATION)
	owner.update_sight()

/datum/mutation/meson_vision/on_losing(mob/living/carbon/human/owner)
	. = ..()
	if(.)
		return

	owner.remove_traits(list(TRAIT_MADNESS_IMMUNE, TRAIT_MESON_VISION), GENETIC_MUTATION)
	owner.update_sight()

/datum/mutation/flash_protection
	name = "Protected Cornea"
	desc = "A mutation that causes reinforcement to subject's eyes, allowing them to protect against disorientation from bright flashes via distributing excessive photons hitting the subject's eyes."
	locked = TRUE
	quality = POSITIVE
	text_gain_indication = span_notice("You stop noticing the glare from lights...")
	text_lose_indication = span_notice("Lights begin glaring again...")
	instability = 30

/datum/mutation/flash_protection/on_acquiring(mob/living/carbon/human/owner)
	if(!owner)
		return TRUE

	var/obj/item/organ/eyes/eyes = owner.get_organ_slot(ORGAN_SLOT_EYES)
	if(eyes && eyes.organ_flags == ORGAN_ROBOTIC)
		return TRUE

	. = ..()
	if(!.)
		return

	RegisterSignal(owner, COMSIG_CARBON_GAIN_ORGAN, PROC_REF(eye_implanted))
	RegisterSignal(owner, COMSIG_CARBON_LOSE_ORGAN, PROC_REF(eye_removed))
	if(eyes)
		eyes.flash_protect = FLASH_PROTECTION_FLASH

/datum/mutation/flash_protection/on_losing(mob/living/carbon/human/owner)
	. = ..()
	if(.)
		return

	UnregisterSignal(owner, list(COMSIG_CARBON_GAIN_ORGAN, COMSIG_CARBON_LOSE_ORGAN))
	var/obj/item/organ/eyes/eyes = owner.get_organ_slot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.flash_protect = initial(eyes.flash_protect)

/datum/mutation/flash_protection/proc/eye_implanted(mob/living/source, obj/item/organ/gained, special)
	SIGNAL_HANDLER

	var/obj/item/organ/eyes/eyes = gained
	if(!istype(eyes))
		return

	if(eyes.organ_flags == ORGAN_ROBOTIC)
		return

	eyes.flash_protect = FLASH_PROTECTION_FLASH

/datum/mutation/flash_protection/proc/eye_removed(mob/living/source, obj/item/organ/removed, special)
	SIGNAL_HANDLER

	var/obj/item/organ/eyes/eyes = removed
	if(!istype(eyes))
		return

	eyes.flash_protect = initial(eyes.flash_protect)

/datum/mutation/xray
	conflicts = list(/datum/mutation/weaker_xray, /datum/mutation/weaker_xray/syndicate)

/datum/mutation/weaker_xray
	name = "Unstable X-Ray Vision"
	desc = "A strange genome that allows the user to see between the spaces of walls at the cost of their eye health."
	locked = TRUE
	power_path = /datum/action/cooldown/toggle_xray
	instability = 60
	conflicts = list(/datum/mutation/xray, /datum/mutation/weaker_xray/syndicate)
	synchronizer_coeff = 1

/datum/mutation/weaker_xray/setup()
	. = ..()
	if(!.)
		return

	var/datum/action/cooldown/toggle_xray/modified_power = .
	modified_power.synchronizer = GET_MUTATION_SYNCHRONIZER(src)

/datum/action/cooldown/toggle_xray
	name = "Toggle X-ray"
	desc = "Concentrate your eyes to see through the walls, this makes your eyes take damage and be weaker to flashes."
	button_icon = 'icons/mob/actions/actions_changeling.dmi'
	button_icon_state = "augmented_eyesight"
	var/toggle = FALSE
	var/synchronizer = 1

/datum/action/cooldown/toggle_xray/Grant(mob/granted_to)
	. = ..()
	if(!owner)
		return

	RegisterSignal(owner, COMSIG_CARBON_GAIN_ORGAN, PROC_REF(eye_implanted))
	RegisterSignal(owner, COMSIG_CARBON_LOSE_ORGAN, PROC_REF(eye_removed))

/datum/action/cooldown/toggle_xray/Remove(mob/removed_from)
	if(owner)
		UnregisterSignal(owner, list(COMSIG_CARBON_GAIN_ORGAN, COMSIG_CARBON_LOSE_ORGAN))
		if(toggle)
			toggle_off()
	return ..()

/datum/action/cooldown/toggle_xray/IsAvailable(feedback = FALSE)
	. = ..()
	if(!.)
		return FALSE

	var/obj/item/organ/eyes/eyes = owner.get_organ_slot(ORGAN_SLOT_EYES)
	if(!eyes)
		if(feedback)
			to_chat(owner, span_warning("You don't have eyes to use X-ray with!"))
		return FALSE

	if(eyes.organ_flags & ORGAN_FAILING)
		if(feedback)
			to_chat(owner, span_warning("You can't use your X-ray vision whilst blind!"))
		return FALSE

	if(eyes.organ_flags == ORGAN_ROBOTIC)
		if(feedback)
			owner.balloon_alert(owner, "eyes robotic!")
		return FALSE

	return TRUE

/datum/action/cooldown/toggle_xray/Activate(atom/target)
	var/obj/item/organ/eyes/eyes = owner.get_organ_slot(ORGAN_SLOT_EYES)
	if(!eyes)
		return

	toggle = !toggle
	if(toggle)
		to_chat(owner, span_notice("You feel your eyes sting as you force them to see through solid matter."))
		eyes.flash_protect--
		eyes.apply_organ_damage(5 * synchronizer)
		ADD_TRAIT(owner, TRAIT_XRAY_VISION, GENETIC_MUTATION)
		owner.update_sight()
		START_PROCESSING(SSobj, src)
	else
		to_chat(owner, span_notice("You adjust your eyes to no longer see past the walls."))
		toggle_off()

/datum/action/cooldown/toggle_xray/process(seconds_per_tick)
	var/obj/item/organ/eyes/eyes = owner.get_organ_slot(ORGAN_SLOT_EYES)
	if(!eyes)
		toggle = !toggle
		toggle_off()
		return

	eyes.apply_organ_damage(seconds_per_tick * 2 * synchronizer)
	if(eyes.organ_flags & ORGAN_FAILING)
		toggle = !toggle
		toggle_off()

/datum/action/cooldown/toggle_xray/StartCooldownSelf(override_cooldown_time) // Since we're using process, this cant happen
	return

/datum/action/cooldown/toggle_xray/proc/toggle_off()
	REMOVE_TRAIT(owner, TRAIT_XRAY_VISION, GENETIC_MUTATION)
	STOP_PROCESSING(SSobj, src)
	var/obj/item/organ/eyes/eyes = owner.get_organ_slot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.flash_protect++

	owner.update_sight()

/datum/action/cooldown/toggle_xray/proc/eye_implanted(mob/living/source, obj/item/organ/gained, special)
	SIGNAL_HANDLER

	var/obj/item/organ/eyes/eyes = gained
	if(!istype(eyes))
		return

	eyes.flash_protect--

/datum/action/cooldown/toggle_xray/proc/eye_removed(mob/living/source, obj/item/organ/removed, special)
	SIGNAL_HANDLER

	var/obj/item/organ/eyes/eyes = removed
	if(!istype(eyes))
		return

	eyes.flash_protect = initial(eyes.flash_protect)
	if(toggle)
		toggle = !toggle
		toggle_off()

/datum/mutation/weaker_xray/syndicate
	name = "Refined X-Ray Vision"
	desc = "A strange genome that allows the user to see between the spaces of walls at the cost of their eye health. This one seems to be high-quality making it more stable."
	instability = 40
	conflicts = list(/datum/mutation/xray, /datum/mutation/weaker_xray)
