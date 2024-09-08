/datum/antagonist/cerberus
	name = "\improper Cerberus"
	antagpanel_category = ANTAG_GROUP_SYNDICATE
	show_in_roundend = TRUE
	show_in_antagpanel = TRUE
	show_name_in_check_antagonists = TRUE
	count_against_dynamic_roll_chance = FALSE
	show_to_ghosts = TRUE
	/// The antagonist's master, used for objective
	var/mob/living/doggo_master

/datum/antagonist/cerberus/on_gain()
	doggo_master = owner.enslaved_to?.resolve()
	if(doggo_master)
		forge_objectives(doggo_master)
	return ..()

/datum/antagonist/cerberus/Destroy()
	doggo_master = null
	return ..()

/datum/antagonist/cerberus/greet()
	. = ..()
	owner.announce_objectives()

/datum/objective/cerberus
	var/mob/living/doggo_master

/datum/objective/cerberus/check_completion()
	return doggo_master.stat != DEAD

/datum/antagonist/cerberus/forge_objectives(mob/doggo_master)
	var/datum/objective/cerberus/objective = new
	objective.doggo_master = doggo_master
	objective.explanation_text = "Protect and obey all of your master [doggo_master]'s orders!"
	objective.owner = owner
	objectives += objective
