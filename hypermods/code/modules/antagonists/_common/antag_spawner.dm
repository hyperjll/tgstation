/// Not actually an antag spawner.
/obj/item/antag_spawner/nanotrasen
	name = "nanotrasen reinforcement beacon"
	desc = "A beacon of some sort, it's often used by Nanotrasen employees to request immediate personnel support."
	icon = 'icons/obj/devices/tracker.dmi'
	icon_state = "beacon"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	inhand_icon_state = "beacon"
	custom_price = 1000
	custom_premium_price = 1000
	/// The name of the special role given to the recruit
	var/special_role_name = "Nanotrasen Employee"
	/// Style used by the droppod
	var/pod_style = STYLE_STANDARD
	/// Where do we land our pod?
	var/turf/spawn_location

/obj/item/antag_spawner/nanotrasen/proc/check_usability(mob/user)
	if(used)
		to_chat(user, span_warning("[src] is out of power!"))
		return FALSE
	return TRUE

/// Creates the drop pod the nukie will be dropped by
/obj/item/antag_spawner/nanotrasen/proc/setup_pod()
	var/obj/structure/closet/supplypod/pod = new(null, pod_style)
	pod.explosionSize = list(0,0,0,0)
	pod.bluespace = TRUE
	return pod

/obj/item/antag_spawner/nanotrasen/attack_self(mob/user)
	if(!(check_usability(user)))
		return
	to_chat(user, span_notice("You activate the [src] and hope central command is generous."))
	var/mob/chosen_one = SSpolling.poll_ghost_candidates("Do you want to play as a [special_role_name]?", null, null, 15 SECONDS, null, alert_pic = src, role_name_text = special_role_name, amount_to_pick = 1)
	if(chosen_one)
		if(QDELETED(src) || !check_usability(user))
			return
		used = TRUE
		spawn_antag(chosen_one.client, get_turf(src), user.mind)
		do_sparks(4, TRUE, src)
		qdel(src)
	else
		to_chat(user, span_warning("Unable to contact central command. Please wait and try again."))


/obj/item/antag_spawner/nanotrasen/securityborg
	name = "security cyborg beacon"
	desc = "A beacon of some sort, it's often used by security forces to call forth silicon-based assistants."
	/// The name of the special role given to the recruit
	special_role_name = "Security Cyborg"
	/// Style used by the droppod
	pod_style = STYLE_STANDARD
/**
/obj/item/antag_spawner/nanotrasen/securityborg/proc/check_usability(mob/user)
	if(used)
		to_chat(user, span_warning("[src] is out of power!"))
		return FALSE
	return TRUE

/// Creates the drop pod the nukie will be dropped by
/obj/item/antag_spawner/nanotrasen/securityborg/proc/setup_pod()
	var/obj/structure/closet/supplypod/pod = new(null, pod_style)
	pod.explosionSize = list(0,0,0,0)
	pod.bluespace = TRUE
	return pod

/obj/item/antag_spawner/nanotrasen/securityborg/attack_self(mob/user)
	if(!(check_usability(user)))
		return

	to_chat(user, span_notice("You activate the [src] and hope central command is generous."))
	var/mob/chosen_one = SSpolling.poll_ghost_candidates("Do you want to play as a security cyborg?", null, null, 15 SECONDS, null, alert_pic = src, role_name_text = special_role_name, amount_to_pick = 1)
	if(chosen_one)
		if(QDELETED(src) || !check_usability(user))
			return
		used = TRUE
		spawn_antag(chosen_one.client, get_turf(src), user.mind)
		do_sparks(4, TRUE, src)
		qdel(src)
	else
		to_chat(user, span_warning("Unable to contact central command. Please wait and try again."))
**/
/obj/item/antag_spawner/nanotrasen/securityborg/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/silicon/robot/model/security/secborg = new()
	our_client.prefs.safe_transfer_prefs_to(secborg, is_antag = FALSE)
	secborg.ckey = our_client.key
	if(length(GLOB.newplayer_start)) // needed as hud code doesn't render huds if the atom (in this case the nukie) is in nullspace, so just move the nukie somewhere safe
		secborg.forceMove(pick(GLOB.newplayer_start))
	else
		secborg.forceMove(locate(1,1,1))

	var/obj/structure/closet/supplypod/pod = setup_pod()
	secborg.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)
