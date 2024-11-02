/obj/item/implant/mindhack
	name = "mindhack implant"
	desc = "An experimental implant which imprints an order within someone's mind."
	actions_types = null
	var/objective = "You are a Syndicate Agent. Protect and obey other Syndicate Agents."
	var/custom = FALSE

/obj/item/implant/mindhack/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(!istype(target) || !target.mind)
		return FALSE
	if(custom)
		if(!user || !user.Adjacent(src))
			return FALSE
		objective = tgui_input_text(user, "What order do you want to imprint on [target]?", "Brainwashing", max_length = 120)
		message_admins("[ADMIN_LOOKUPFLW(user)] set brainwash machine objective to '[objective]'.")
		user.log_message("set brainwash machine objective to '[objective]'.", LOG_GAME)
	else
		objective = "You are a Syndicate Agent. Protect and obey [user]."
	if(HAS_MIND_TRAIT(target, TRAIT_UNCONVERTABLE))
		return FALSE
	brainwash(target, objective)

	RegisterSignal(target, COMSIG_MOB_FLASHED, PROC_REF(on_flashed))

	message_admins("[ADMIN_LOOKUPFLW(user)] brainwashed [key_name_admin(target)] with objective '[objective]'.")
	user.log_message("has brainwashed [key_name(target)] with the objective '[objective]' using \the [src]", LOG_ATTACK)
	target.log_message("has been brainwashed with the objective '[objective]' by [key_name(user)] using \the [src]", LOG_VICTIM, log_globally = FALSE)
	log_game("[key_name(user)] brainwashed [key_name(target)] with objective '[objective]'.")
	return TRUE

/obj/item/implant/mindhack/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	UnregisterSignal(target, list(COMSIG_MOB_FLASHED, PROC_REF(on_flashed)))
	if(target.mind?.has_antag_datum(/datum/antagonist/brainwashed))
		target.mind?.remove_antag_datum(/datum/antagonist/brainwashed)

/obj/item/implant/mindhack/proc/on_flashed()
	SIGNAL_HANDLER

	if(!imp_in.mind)
		return
	if(HAS_MIND_TRAIT(imp_in, TRAIT_UNCONVERTABLE))
		return
	var/datum/antagonist/brainwashed/mindhacked = imp_in.mind.has_antag_datum(/datum/antagonist/brainwashed)
	if(!mindhacked)
		return
	addtimer(CALLBACK(src, PROC_REF(restore_brainwash)), 30 SECONDS) // Cuz the psychologist flash calls this shit too, both procs cause some bugs.

/obj/item/implant/mindhack/proc/restore_brainwash()
	brainwash(imp_in, objective)


/obj/item/implanter/mindhack
	name = "implanter (mindhack)"
	imp_type = /obj/item/implant/mindhack
