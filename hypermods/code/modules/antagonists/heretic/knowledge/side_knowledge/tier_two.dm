/datum/heretic_knowledge/curse/age
	name = "Curse of Age"
	desc = "Allows you to transmute a timer and a diamond to cast a curse of age on a crew member. \
		After casting, the crew member's age will be increased by 40 years over the duration of the curse. \
		If supplied with an item with the target's fingerprints or is covered in the victim's blood the duration of the curse is doubled."
	gain_text = "All who've ever stood against the Lords of Time met a similar end."
	duration = 40 SECONDS
	//duration_modifier = 2
	curse_color = "#d8d8d8"
	cost = 1
	research_tree_icon_path = 'hypermods/icons/ui_icons/antags/heretic/knowledge.dmi'
	research_tree_icon_state = "curse_age"
	drafting_tier = 2

/datum/heretic_knowledge/curse/age/curse(mob/living/carbon/human/chosen_mob, boosted = FALSE)
	to_chat(chosen_mob, span_danger("You feel your life is fleeting..."))
	chosen_mob.apply_status_effect(/datum/status_effect/age_curse)
	return ..()

/datum/heretic_knowledge/curse/age/uncurse(mob/living/carbon/human/chosen_mob, boosted = FALSE)
	if(QDELETED(chosen_mob))
		return

	chosen_mob.remove_status_effect(/datum/status_effect/age_curse)
	to_chat(chosen_mob, span_green("You manage to catch a long-winded breath as your body relaxes."))
	return ..()
