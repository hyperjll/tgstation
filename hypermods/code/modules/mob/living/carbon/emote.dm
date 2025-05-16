/datum/emote/living/carbon/bleat
	key = "bleat"
	key_third_person = "bleats"
	vary = TRUE
	sound = SFX_SHEEP_BLEAT
	message = "bleats!"
	message_mime = "bleats silently."
	emote_type = EMOTE_VISIBLE | EMOTE_AUDIBLE

/datum/emote/living/carbon/bleat/can_run_emote(mob/living/carbon/user, status_check = TRUE , intentional, params)
	if(!iscarbon(user) || ((!istype(user.get_organ_slot(ORGAN_SLOT_HEART), /obj/item/organ/heart/sheep) && !istype(user.get_organ_slot(ORGAN_SLOT_LIVER), /obj/item/organ/liver/sheep))))
		return FALSE
	return ..()

/datum/emote/living/carbon/baah
	key = "baah"
	key_third_person = "baahs"
	vary = TRUE
	sound = SFX_SHEEP_BLEAT
	message = "baahs!"
	message_mime = "baahs silently."
	emote_type = EMOTE_VISIBLE | EMOTE_AUDIBLE

/datum/emote/living/carbon/baah/can_run_emote(mob/living/carbon/user, status_check = TRUE , intentional, params)
	if(!iscarbon(user) || ((!istype(user.get_organ_slot(ORGAN_SLOT_HEART), /obj/item/organ/heart/sheep) && !istype(user.get_organ_slot(ORGAN_SLOT_LIVER), /obj/item/organ/liver/sheep))))
		return FALSE
	return ..()
