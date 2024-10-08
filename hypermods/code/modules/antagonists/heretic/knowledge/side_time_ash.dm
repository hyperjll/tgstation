// Sidepaths for knowledge between Ash and Time.
/datum/heretic_knowledge/spell/slow
	name = "Slow"
	desc = "Grants you Slow, a short-range spell that lets you manipulate time upon another, \
		causing them to move drastically slower for the next 5 seconds. Requires a focus to use."
	gain_text = "The Nightwatcher walked these paths, leaving burned clues etched by second nature."
	next_knowledge = list(
		/datum/heretic_knowledge/spell/time_skip,
		/datum/heretic_knowledge/spell/ash_passage,
	)
	spell_to_add = /datum/action/cooldown/spell/pointed/slow
	cost = 1
	route = PATH_SIDE
	depth = 4

/datum/heretic_knowledge/curse/age
	name = "Curse of Age"
	desc = "Allows you to transmute a timer and a diamond to cast a curse of age on a crew member. \
		After casting, the crew member's age will be increased by 40 years over the duration of the curse. \
		If supplied with an item with the target's fingerprints, the duration of the curse is doubled."
	gain_text = "All who've ever stood against the Lords of Time met a similar end."
	next_knowledge = list(
		/datum/heretic_knowledge/time_mends_all,
		/datum/heretic_knowledge/spell/fire_blast,
	)
	required_atoms = list(
		/obj/item/assembly/timer = 1,
		/obj/item/stack/sheet/mineral/diamond = 1,
	)
	duration = 40 SECONDS
	duration_modifier = 2
	curse_color = "#d8d8d8"
	cost = 1
	route = PATH_SIDE
	research_tree_icon_path = 'hypermods/icons/ui_icons/antags/heretic/knowledge.dmi'
	research_tree_icon_state = "curse_age"
	depth = 7

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
	next_knowledge = list(
		/datum/heretic_knowledge/mad_mask,
		/datum/heretic_knowledge/spell/deja_vu,
	)
	spell_to_add = /datum/action/cooldown/spell/pointed/eldritch_echoes
	cost = 1
	route = PATH_SIDE
	depth = 8

/datum/heretic_knowledge/spell/cursed_flames
	name = "Cursed Flames"
	desc = "A long-ranged spell that ignites a target instantly, \
		and drenches them with flammable liquids."
	gain_text = "The Nightwatcher himself once sought out the Time Lords. \
		Seeking answers as to how to preserve the fire within and out."
	next_knowledge = list(
		/datum/heretic_knowledge/spell/flame_birth,
		/datum/heretic_knowledge/haste,
	)
	spell_to_add = /datum/action/cooldown/spell/pointed/cursed_flames
	cost = 1
	route = PATH_SIDE
	depth = 10
