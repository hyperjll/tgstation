/datum/quirk/natural_def
	name = "Naturally Robust"
	desc = "Whether by genetic superiority or by intense physical training, you're much more hardy than normal people."
	icon = FA_ICON_SHIELD_ALT
	value = 8
	medical_record_text = "Patient has above-average physical health."
	//mail_goodies = list()

/datum/quirk/natural_def/add(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder

	if(prob(50))
		human_holder.physiology.brute_mod *= 0.95
		to_chat(quirk_holder, span_boldnotice("You are naturally robust against Brute damage."))
	else
		human_holder.physiology.burn_mod *= 0.95
		to_chat(quirk_holder, span_boldnotice("You are naturally robust against Burn damage."))
