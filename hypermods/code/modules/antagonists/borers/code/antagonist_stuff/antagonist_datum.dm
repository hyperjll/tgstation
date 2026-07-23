/datum/antagonist/cortical_borer
	name = "Cortical Borer"
	pref_flag = ROLE_CORTICAL_BORER
	roundend_category = "enslaved cortical borers" // may look a bit confusing, but these borers are not a part of a hivemind. So they are probably enslaved
	antagpanel_category = "Cortical Borers"
	ui_name = "AntagInfoBorer"
	//count_against_dynamic_roll_chance = FALSE // there are thousands of them, we do not need them to be the only antagonist
	//prevent_roundtype_conversion = FALSE
	show_to_ghosts = TRUE

	/// Our linked borer, used for the antagonist panel TGUI
	var/mob/living/basic/cortical_borer/cortical_owner

	/// Borer mob type, used for antag token spawns.
	var/borer_mob_type = /mob/living/basic/cortical_borer/neutered

/datum/antagonist/cortical_borer/on_gain()
	cortical_owner = owner.current
	forge_objectives()
	return ..()

/datum/antagonist/cortical_borer/get_preview_icon()
	var/datum/universal_icon/borer_icon = uni_icon('hypermods/code/modules/antagonists/borers/icons/animal.dmi', "brainslug")
	borer_icon.shift(NORTH, 8)
	return finish_preview_icon(borer_icon)

/datum/antagonist/cortical_borer/hivemind
	name = "Hivemind Cortical Borer"
	roundend_category = "cortical borers"
	borer_mob_type = /mob/living/basic/cortical_borer

	/// The team of borers
	var/datum/team/cortical_borers/borers

/datum/antagonist/cortical_borer/hivemind/forge_objectives()
	var/datum/objective/custom/borer_objective_produce_eggs = new
	borer_objective_produce_eggs.reward_for_completion = TRUE
	borer_objective_produce_eggs.explanation_text = "We require [GLOB.objective_egg_borer_number] different borers to produce [GLOB.objective_egg_egg_number] eggs to spread widely in order to increase our chances of survival."

	var/datum/objective/custom/borer_objective_willing_hosts = new
	borer_objective_willing_hosts.reward_for_completion = TRUE
	borer_objective_willing_hosts.explanation_text = "We require [GLOB.objective_willing_hosts] willing hosts to create a backbone for our continued survival, should our prey attempt to exterminate us."

	var/datum/objective/custom/borer_objective_learn_chemicals = new
	borer_objective_learn_chemicals.reward_for_completion = TRUE
	borer_objective_learn_chemicals.explanation_text = "We need to learn [GLOB.objective_blood_borer] chemicals from the bloodstreams of our hosts to acquire further chemical insight."

	objectives += borer_objective_produce_eggs
	objectives += borer_objective_willing_hosts
	objectives += borer_objective_learn_chemicals

/datum/antagonist/cortical_borer/hivemind/create_team(datum/team/cortical_borers/new_team)
	if(!new_team)
		for(var/datum/antagonist/cortical_borer/hivemind/borer in GLOB.antagonists)
			if(!borer.owner)
				stack_trace("Antagonist datum without owner in GLOB.antagonists: [borer]")
				continue
			if(borer.borers)
				borers = borer.borers
				return
		borers = new /datum/team/cortical_borers
		return
	if(!istype(new_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	borers = new_team

/datum/antagonist/cortical_borer/hivemind/get_team()
	return borers

/datum/antagonist/cortical_borer/ui_static_data(mob/user)
	var/list/data = list()
	for(var/datum/action/cooldown/borer/ability as anything in cortical_owner.known_abilities)
		var/list/ability_data = list()

		ability_data["ability_name"] = initial(ability.name)
		ability_data["ability_explanation"] = initial(ability.ability_explanation)

		ability_data["ability_icon"] = initial(ability.button_icon_state)

		data["ability"] += list(ability_data)

	return data + ..()

/datum/antagonist/cortical_borer/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/simple/borer_icons),
	)
