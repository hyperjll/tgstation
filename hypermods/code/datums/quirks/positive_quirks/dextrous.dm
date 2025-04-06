/datum/quirk/dextrous
	name = "Dextrous"
	desc = "You've got extra-ordinary ability with your hands, and can perform all actions that have a 'progress bar' 10% faster."
	icon = FA_ICON_RUNNING
	value = 8
	medical_record_text = "Patient demonstrates heightened ability with their hands."
	//mail_goodies = list()

/datum/quirk/dextrous/add_unique(client/client_source)
	var/mob/living/carbon/human/dex_man = quirk_holder

	dex_man.add_actionspeed_modifier(/datum/actionspeed_modifier/dextrous)

/datum/quirk/dextrous/remove(client/client_source)
	var/mob/living/carbon/human/dex_man = quirk_holder

	dex_man.remove_actionspeed_modifier(/datum/actionspeed_modifier/dextrous)
