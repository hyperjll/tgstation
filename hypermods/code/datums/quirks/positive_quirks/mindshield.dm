/datum/quirk/mindshielded
	name = "Valuable Employee"
	desc = "Due to your previous accomplishments or otherwise valuable work provided to Nanotrasen, you've been provided a mindshield implant to ensure you're not stolen by enemies of the corporation."
	icon = FA_ICON_STAR
	value = 10
	medical_record_text = "Patient has been trusted with a mindshield implant due to their exceptional value to Nanotrasen."
	//mail_goodies = list()

/datum/quirk/mindshielded/add_unique(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/implant/mindshield/mindshield = new /obj/item/implant/mindshield(human_holder)
	mindshield.implant(human_holder, null, silent = TRUE)
