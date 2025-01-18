/datum/antagonist/initial_infected
	name = "\improper Initial Infected"
	antagpanel_category = "Zombies"
	roundend_category = "Initial Infected"
	job_rank = ROLE_INITIAL_INFECTED
	var/special_role = ROLE_INITIAL_INFECTED
	stinger_sound = 'hypermods/sound/ambience/antag/romerolsmuggler.ogg'
	hud_icon = 'hypermods/icons/mob/huds/antag_hud.dmi'
	antag_hud_name = "iinfected"
	show_to_ghosts = FALSE
	preview_outfit = /datum/outfit/job/scientist
	var/datum/team/iinfected/romerol_team

/datum/antagonist/initial_infected/greet()
	play_stinger()
	to_chat(owner, span_big("You are the [owner.special_role]!"))
	owner.announce_objectives()

/datum/antagonist/initial_infected/get_team()
	return romerol_team

/datum/antagonist/initial_infected/apply_innate_effects(mob/living/mob_override)
	add_team_hud(mob_override || owner.current, /datum/antagonist/initial_infected)

/datum/antagonist/initial_infected/forge_objectives()
	if(romerol_team)
		objectives |= romerol_team.objectives

/datum/antagonist/initial_infected/admin_add(datum/mind/new_owner,mob/admin)
	new_owner.set_assigned_role(SSjob.get_job_type(/datum/job/initial_infected))
	new_owner.add_antag_datum(src)
	message_admins("[key_name_admin(admin)] has romerol'd [key_name_admin(new_owner)].")
	log_admin("[key_name(admin)] has romerol'd [key_name(new_owner)].")

/datum/antagonist/initial_infected/get_preview_icon()
	var/icon/final_icon = render_preview_outfit(preview_outfit)

	final_icon.Blend(make_background_clone_icon(preview_outfit), ICON_UNDERLAY, -8, 0)
	final_icon.Scale(64, 64)

	return finish_preview_icon(final_icon)

/datum/antagonist/initial_infected/proc/make_background_clone_icon(datum/outfit/zombie_fit)
	var/mob/living/carbon/human/dummy/consistent/zombie = new

	var/icon/zombie_icon = render_preview_outfit(zombie_fit, zombie)
	zombie_icon.ChangeOpacity(0.7)
	zombie_icon.Blend(icon('icons/effects/blood.dmi', "maskblood"), ICON_OVERLAY)
	zombie.set_species(/datum/species/zombie)
	qdel(zombie)

	return zombie_icon

/datum/antagonist/initial_infected/on_gain()
	owner.special_role = special_role
	implant_me()
	forge_objectives()
	return ..()

/datum/antagonist/initial_infected/proc/implant_me()
	var/obj/item/implant/romerol/Rimplant = new /obj/item/implant/romerol()
	Rimplant.implant(owner.current, null, TRUE, TRUE)

/datum/antagonist/initial_infected/on_removal()
	if(owner.current)
		to_chat(owner.current,span_userdanger("You are no longer the [special_role]!"))
	owner.special_role = null
	return ..()

/datum/antagonist/initial_infected/forge_objectives()
	var/datum/objective/assassinate/zombies/objective_main = new
	objective_main.owner = owner
	objective_main.objective_name = "Kill Everyone"
	objectives += objective_main



/datum/objective/assassinate/zombies
	name = "kill or zombify everyone"

/datum/objective/assassinate/zombies/check_completion()
	return completed || (!considered_alive(target) || considered_afk(target) || considered_exiled(target) || iszombie(target))

/datum/objective/assassinate/zombies/update_explanation_text()
	. = ..()
	if(!target?.current)
		explanation_text = "Free Objective"
		CRASH("WARNING! [ADMIN_LOOKUPFLW(owner)] initial infected objectives forged without an original!")
	explanation_text = "Commit wide-spread carnage and sabotage as you turn the station's crew into zombies! How you go about this is entirely up to you."

/datum/objective/assassinate/zombies/proc/find_all_targets()
	var/list/all_targets = list()
	for(var/mob/living/carbon/human/player as anything in GLOB.human_list)
		if(player.stat == DEAD) // If they aren't dead
			continue
		if(iszombie(player)) // If they aren't already a zombie
			continue
		if((player.mind?.assigned_role.departments_bitflags))
			all_targets += player.mind

	for(var/datum/objective/assassinate/zombies/kill in owner.get_all_objectives())
		if(kill.target in all_targets)
			all_targets -= kill.target

	if(!all_targets.len)
		find_target() // No possible targets? Better try again you bastard.
		return
	else
		target = list(all_targets)


/datum/team/iinfected
	name = "The Initial Infected"
	member_name = "Initial Infected"

/datum/team/iinfected/roundend_report()
	var/list/report = list()

	if(length(members))
		report += "The [member_name] were:"
		report += printplayerlist(members)

		var/datum/objective/assassinate/zombies/iiobjective = locate(/datum/objective/assassinate/zombies) in objectives

		if(iiobjective)
			objectives -= iiobjective
			if(iiobjective.check_completion())
				report += span_greentext(span_header("The initial infected wiped out the stations crew!<br>"))
			else
				report += span_redtext(span_header("The initial infected failed to truely eradicate life on the station...<br>"))

	return "<div class='panel redborder'>[report.Join("<br>")]</div>"
