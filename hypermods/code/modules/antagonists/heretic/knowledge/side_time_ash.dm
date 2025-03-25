/datum/heretic_knowledge_tree_column/time_to_ash
	neighbour_type_left = /datum/heretic_knowledge_tree_column/main/time
	neighbour_type_right = /datum/heretic_knowledge_tree_column/main/ash

	route = PATH_SIDE

	tier1 = /datum/heretic_knowledge/spell/slow
	tier2 = /datum/heretic_knowledge/spell/cursed_flames
	tier3 = /datum/heretic_knowledge/spell/eldritch_echoes

// Sidepaths for knowledge between Ash and Time.
/datum/heretic_knowledge/spell/slow
	name = "Slow"
	desc = "Grants you Slow, a touch-range spell that lets you manipulate time upon another, \
		causing them to move drastically slower for the next 5 seconds. Requires a focus to use."
	gain_text = "The Nightwatcher walked these paths, leaving burned clues etched by second nature."
	action_to_add = /datum/action/cooldown/spell/pointed/slow
	cost = 1

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

/datum/heretic_knowledge/spell/eldritch_echoes
	name = "Eldritch Echoes"
	desc = "A touch-range spell that causes massive damage to a target after an extended period of time. \
		Using this a second time on a target does nothing but reset the timer."
	gain_text = "Beyond the veil i witnessed something strange, countless eyes stared back at me. \
		But most peculiar was the tune they sung as they watched."
	action_to_add = /datum/action/cooldown/spell/pointed/eldritch_echoes
	cost = 1

/datum/heretic_knowledge/spell/cursed_flames
	name = "Cursed Flames"
	desc = "A long-ranged spell that ignites a target instantly, \
		and drenches them with flammable liquids."
	gain_text = "The Nightwatcher himself once sought out the Time Lords. \
		Seeking answers as to how to preserve the fire within and out."
	action_to_add = /datum/action/cooldown/spell/pointed/cursed_flames
	cost = 1
