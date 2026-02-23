/datum/status_effect/hollow
	id = "hollow"
	duration = INFINITY
	alert_type = /atom/movable/screen/alert/status_effect/hollow

/datum/status_effect/hollow/tick(seconds_between_ticks)
	owner.adjust_organ_loss(ORGAN_SLOT_BRAIN, -0.1)

	return ..()

/datum/status_effect/hollow/on_apply()
	. = ..()
	if(.)
		owner.add_traits(list(TRAIT_MUTE, TRAIT_COLORBLIND), "hollow")
		owner.add_client_colour(/datum/client_colour/monochrome, "hollow")

/datum/status_effect/hollow/on_remove()
	owner.remove_traits(list(TRAIT_MUTE, TRAIT_COLORBLIND), "hollow")
	owner.remove_client_colour("hollow")


/atom/movable/screen/alert/status_effect/hollow
	name = "Hollow"
	desc = "You've been reduced to a hollow shell of your former self, unable to speak and unable to recover. You are all and you are nothing."
	icon = 'hypermods/icons/hud/screen_alert.dmi'
	icon_state = "hollow"


/datum/status_effect/spasms/antidepressants
	id = "antidepressants_overdose"


/datum/status_effect/misery
	id = "misery"
	duration = INFINITY
	alert_type = /atom/movable/screen/alert/status_effect/miserable
	var/despair = FALSE
	var/suicidal = FALSE
	var/despair_chance = 4 // % chance per tick for a warning sign to other people
	var/suicidal_chance = 1 // % chance per tick for an incoming suicide attempt. (10 damage on a random limb + a wound)

/datum/status_effect/misery/tick(seconds_between_ticks)
	var/mob/living/carbon/human/moody_human = owner
	if(moody_human.mob_mood.sanity_level >= SANITY_LEVEL_DISTURBED && moody_human.mob_mood.mood_level >= MOOD_LEVEL_SAD1)
		owner.remove_status_effect(/datum/status_effect/misery)

	if(moody_human.mob_mood.sanity_level <= SANITY_LEVEL_UNSTABLE)
		despair = FALSE
		if(!linked_alert) // just it case we ahealed or something
			return
		linked_alert.name = "Miserable"
		linked_alert.desc = "You're not in the greatest of mental health. If your mood continues to remain low and your sanity declines further, health problems may occur. Find ways to distract yourself."
		linked_alert.icon_state = "misery"

	if(moody_human.mob_mood.sanity_level >= SANITY_LEVEL_CRAZY && !despair)
		despair = TRUE
		suicidal = FALSE
		if(!linked_alert) // just it case we ahealed or something
			return
		linked_alert.name = "Despair"
		linked_alert.desc = "Your sanity has reached hazardous levels. Health problems are sure to follow should your mental health not improve. You desperately need to distract yourself."
		linked_alert.icon_state = "despair"

	if(moody_human.mob_mood.sanity_level >= SANITY_LEVEL_INSANE && !suicidal)
		suicidal = TRUE
		if(!linked_alert) // just it case we ahealed or something
			return
		linked_alert.name = "Suicidal"
		linked_alert.desc = "You've reached critically low sanity and have little desire to keep going. If things don't turn around now, it'll all be over soon."
		linked_alert.icon_state = "suicidal"

	if(prob(despair_chance) && despair)
		if(is_species(owner, /datum/species/human/felinid))
			owner.emote("[pick("cry", "sigh", "sniff", "sulk", "hiss")]")
		else
			owner.emote("[pick("cry", "sigh", "sniff", "sulk")]")

	if(suicidal)
		if(prob(suicidal_chance))
			moody_human.suicidal_act()
		owner.adjust_organ_loss(ORGAN_SLOT_BRAIN, 0.1)

	return ..()

/atom/movable/screen/alert/status_effect/miserable
	name = "Miserable"
	desc = "You're not in the greatest of mental health. If your mood continues to remain low and your sanity declines further, health problems may occur. Find ways to distract yourself."
	icon = 'hypermods/icons/hud/screen_alert.dmi'
	icon_state = "misery"

/atom/movable/screen/alert/status_effect/despair
	name = "Despair"
	desc = "Your sanity has reached hazardous levels. Health problems are sure to follow should your mental health not improve. You desperately need to distract yourself."
	icon = 'hypermods/icons/hud/screen_alert.dmi'
	icon_state = "despair"

/atom/movable/screen/alert/status_effect/suicidal
	name = "Suicidal"
	desc = "You've reached critically low sanity and have little desire to keep going. If things don't turn around now, it'll all be over soon."
	icon = 'hypermods/icons/hud/screen_alert.dmi'
	icon_state = "suicidal"
