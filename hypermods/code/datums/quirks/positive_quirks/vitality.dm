/datum/quirk/vitality
	name = "Vitality"
	desc = "Whether by genetic superiority or by intense physical training, you're much more hardy than normal people."
	icon = FA_ICON_SHIELD_HEART
	value = 8
	medical_record_text = "Patient has above-average physical health."
	//mail_goodies = list()

/datum/quirk/vitality/add_unique(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.maxHealth += 10
