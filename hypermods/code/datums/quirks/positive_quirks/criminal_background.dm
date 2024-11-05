/datum/quirk/criminal_background
	name = "Criminal Background"
	desc = "You've been brought low in life before and had to scrape by through... less-than-honest work. Luckily, this means you've got some connections."
	icon = FA_ICON_STAR
	value = 20
	medical_record_text = "Patient appears to be overly cautious and paranoid, likely brought on by their past."
	//mail_goodies = list()

/datum/quirk/criminal_background/add_unique(client/client_source)
	var/mob/living/carbon/human/criminalmind = quirk_holder

	if(prob(5) && !IS_TRAITOR(criminalmind) || !IS_HERETIC(criminalmind) || IS_CULTIST(criminalmind) || IS_CHANGELING(criminalmind) || IS_HEAD_REVOLUTIONARY(criminalmind) || IS_SPY(criminalmind))
		sleep(60 SECONDS) // A full minute before you get hit with antag, just to leave you guessin. (and to ensure you don't roll traitor and syndi sleeper)
		criminalmind.mind.add_antag_datum(/datum/antagonist/traitor/infiltrator/sleeper_agent)
