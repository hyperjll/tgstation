/// Not actually an antag spawner, i just want secbots to be spawnable.

/obj/item/antag_spawner/nanotrasensecborg
	name = "security cyborg beacon"
	desc = "A beacon of some sort, it's often used by security forces to call forth silicon-based assistants."
	icon = 'icons/obj/devices/tracker.dmi'
	icon_state = "beacon"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	inhand_icon_state = "beacon"
	custom_price = 1000
	custom_premium_price = 1000

/obj/item/antag_spawner/nanotrasensecborg/proc/check_usability(mob/user)
	if(used)
		to_chat(user, span_warning("[src] has already been activated..."))
		return FALSE
	return TRUE


/obj/item/antag_spawner/nanotrasensecborg/attack_self(mob/user)
	if(!(check_usability(user)))
		return

	to_chat(user, span_notice("You activate the [src] and hope central command is generous."))
	var/list/secborg_candidates = SSpolling.poll_ghosts_for_target("Do you want to play as a security cyborg?", null, null, null, 150, null)
	if(LAZYLEN(secborg_candidates))
		if(QDELETED(src) || !check_usability(user))
			return
		used = TRUE
		var/mob/dead/observer/G = pick(secborg_candidates)
		spawn_antag(G.client, get_turf(src), "cyborg", user.mind)
		do_sparks(4, TRUE, src)
		qdel(src)
	else
		to_chat(user, span_warning("Unable to contact central command. Please wait and try again."))

/obj/item/antag_spawner/nanotrasensecborg/spawn_antag(client/C, turf/T, kind, datum/mind/user)
	var/mob/living/silicon/robot/model/security/M = new/mob/living/silicon/robot/model/security(T)
	C.prefs.apply_prefs_to(M)
	M.key = C.key
