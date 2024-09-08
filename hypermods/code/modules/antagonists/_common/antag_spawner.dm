/obj/item/antag_spawner/nuke_ops/syndicat
	name = "syndicate syndicat beacon"
	desc = "A single-use beacon designed to quickly launch reinforcement cyborgs into the field."
	antag_datum = /datum/antagonist/nukeop/reinforcement
	special_role_name = "Syndicat"

/obj/item/antag_spawner/nuke_ops/syndicat/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/basic/syndicat/scat = new()
	var/datum/antagonist/nukeop/creator_op = user.has_antag_datum(/datum/antagonist/nukeop,TRUE)
	if(!creator_op)
		return
	var/obj/structure/closet/supplypod/pod = setup_pod()

	scat.ckey = our_client.ckey

	scat.mind.add_antag_datum(antag_datum, creator_op ? creator_op.get_team() : null)
	scat.mind.special_role = special_role_name
	scat.forceMove(pod)
	new /obj/effect/pod_landingzone(get_turf(src), pod)

/obj/item/antag_spawner/nuke_ops/syndicat/setup_pod()
	var/obj/structure/closet/supplypod/pod = new(null, pod_style)
	pod.explosionSize = list(0,0,0,0)
	pod.bluespace = TRUE
	return pod

/obj/item/antag_spawner/nanotrasen/cerberus // Technically a syndicate thing, but whatever.
	name = "necronomicon"
	desc = "A single-use beacon designed to quickly launch reinforcement cyborgs into the field."
	icon = 'hypermods/icons/obj/service/library.dmi'
	icon_state = "necronomicon"
	inhand_icon_state = "necronomicon"
	lefthand_file = 'icons/mob/inhands/items/books_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/books_righthand.dmi'
	var/antag_datum = /datum/antagonist/cerberus
	special_role_name = "Cerberus"
	//fail_text = "Unable to connect to the 'Other Side'. Please wait and try again later or use the necronomicon on your uplink to get your points refunded."
	delaydelete = TRUE

/obj/item/antag_spawner/nanotrasen/cerberus/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/basic/cerberus/doggo = new()

	doggo.ckey = our_client.key

	doggo.mind.add_antag_datum(antag_datum)
	doggo.mind.special_role = special_role_name

	if(length(GLOB.newplayer_start)) // needed as hud code doesn't render huds if the atom is in nullspace, so just move the dog somewhere safe
		doggo.forceMove(pick(GLOB.newplayer_start))
	else
		doggo.forceMove(locate(1,1,1))

	var/turf/our_turf = get_turf(src)
	doggo.forceMove(our_turf)

	qdel(src) // Cuz we delayed the deletion to ensure the src exists to get it's own location.

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
	var/pod_style = /datum/pod_style
	/// Where do we land our pod?
	var/turf/spawn_location
	/// Are we currently polling?
	var/polling = FALSE
	/// Dont delete right away?
	var/delaydelete = FALSE

/obj/item/antag_spawner/nanotrasen/proc/check_usability(mob/user)
	if(used)
		to_chat(user, span_warning("[src] is out of power!"))
		return FALSE
	return TRUE

/obj/item/antag_spawner/nanotrasen/proc/setup_pod()
	var/obj/structure/closet/supplypod/pod = new(null, pod_style)
	pod.explosionSize = list(0,0,0,0)
	pod.bluespace = TRUE
	return pod

/obj/item/antag_spawner/nanotrasen/attack_self(mob/user)
	if(!(check_usability(user)))
		return
	if(polling)
		to_chat(user, span_warning("Currently attempting to contact Central Command. Please be patient."))
		return

	polling = TRUE
	to_chat(user, span_notice("You activate the [src] and hope central command is generous."))
	var/mob/chosen_one = SSpolling.poll_ghost_candidates("Do you want to play as a [special_role_name]?", null, null, 15 SECONDS, null, alert_pic = src, role_name_text = special_role_name, amount_to_pick = 1)
	if(chosen_one)
		if(QDELETED(src) || !check_usability(user))
			return
		used = TRUE
		spawn_antag(chosen_one.client, get_turf(src), user.mind)
		do_sparks(4, TRUE, src)
		if(!delaydelete)
			qdel(src)
	else
		polling = FALSE
		to_chat(user, span_warning("Unable to contact central command. Please wait and try again."))


/obj/item/antag_spawner/nanotrasen/securityborg
	name = "security cyborg beacon"
	desc = "A beacon of some sort, it's often used by security forces to call forth silicon-based assistants."
	/// The name of the special role given to the recruit
	special_role_name = "Security Cyborg"
	/// Style used by the droppod
	pod_style = /datum/pod_style

/obj/item/antag_spawner/nanotrasen/securityborg/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/silicon/robot/model/security/secborg = new()
	our_client.prefs.safe_transfer_prefs_to(secborg, is_antag = FALSE)
	secborg.ckey = our_client.key
	if(length(GLOB.newplayer_start)) // needed as hud code doesn't render huds if the atom (in this case the cyborg) is in nullspace, so just move the cyborg somewhere safe
		secborg.forceMove(pick(GLOB.newplayer_start))
	else
		secborg.forceMove(locate(1,1,1))

	var/obj/structure/closet/supplypod/pod = setup_pod()
	secborg.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/clownborg
	name = "clown cyborg beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call forth silicon-based assistants."
	/// The name of the special role given to the recruit
	special_role_name = "Clown Cyborg"
	/// Style used by the droppod
	pod_style = /datum/pod_style

/obj/item/antag_spawner/nanotrasen/clownborg/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/silicon/robot/model/clown/borg = new()
	our_client.prefs.safe_transfer_prefs_to(borg, is_antag = FALSE)
	borg.ckey = our_client.key
	if(length(GLOB.newplayer_start)) // needed as hud code doesn't render huds if the atom (in this case the cyborg) is in nullspace, so just move the cyborg somewhere safe
		borg.forceMove(pick(GLOB.newplayer_start))
	else
		borg.forceMove(locate(1,1,1))

	var/obj/structure/closet/supplypod/pod = setup_pod()
	borg.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/engiborg
	name = "engineering cyborg beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call forth silicon-based assistants."
	/// The name of the special role given to the recruit
	special_role_name = "Engineering Cyborg"
	/// Style used by the droppod
	pod_style = /datum/pod_style

/obj/item/antag_spawner/nanotrasen/engiborg/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/silicon/robot/model/engineering/borg = new()
	our_client.prefs.safe_transfer_prefs_to(borg, is_antag = FALSE)
	borg.ckey = our_client.key
	if(length(GLOB.newplayer_start)) // needed as hud code doesn't render huds if the atom (in this case the cyborg) is in nullspace, so just move the cyborg somewhere safe
		borg.forceMove(pick(GLOB.newplayer_start))
	else
		borg.forceMove(locate(1,1,1))

	var/obj/structure/closet/supplypod/pod = setup_pod()
	borg.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/medicalborg
	name = "medical cyborg beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call forth silicon-based assistants."
	/// The name of the special role given to the recruit
	special_role_name = "Medical Cyborg"
	/// Style used by the droppod
	pod_style = /datum/pod_style

/obj/item/antag_spawner/nanotrasen/medicalborg/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/silicon/robot/model/medical/borg = new()
	our_client.prefs.safe_transfer_prefs_to(borg, is_antag = FALSE)
	borg.ckey = our_client.key
	if(length(GLOB.newplayer_start)) // needed as hud code doesn't render huds if the atom (in this case the cyborg) is in nullspace, so just move the cyborg somewhere safe
		borg.forceMove(pick(GLOB.newplayer_start))
	else
		borg.forceMove(locate(1,1,1))

	var/obj/structure/closet/supplypod/pod = setup_pod()
	borg.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/janitorborg
	name = "janitorial cyborg beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call forth silicon-based assistants."
	/// The name of the special role given to the recruit
	special_role_name = "Janitor Cyborg"
	/// Style used by the droppod
	pod_style = /datum/pod_style

/obj/item/antag_spawner/nanotrasen/janitorborg/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/silicon/robot/model/janitor/borg = new()
	our_client.prefs.safe_transfer_prefs_to(borg, is_antag = FALSE)
	borg.ckey = our_client.key
	if(length(GLOB.newplayer_start)) // needed as hud code doesn't render huds if the atom (in this case the cyborg) is in nullspace, so just move the cyborg somewhere safe
		borg.forceMove(pick(GLOB.newplayer_start))
	else
		borg.forceMove(locate(1,1,1))

	var/obj/structure/closet/supplypod/pod = setup_pod()
	borg.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/minerborg
	name = "mining cyborg beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call forth silicon-based assistants."
	/// The name of the special role given to the recruit
	special_role_name = "Mining Cyborg"
	/// Style used by the droppod
	pod_style = /datum/pod_style

/obj/item/antag_spawner/nanotrasen/minerborg/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/silicon/robot/model/miner/borg = new()
	our_client.prefs.safe_transfer_prefs_to(borg, is_antag = FALSE)
	borg.ckey = our_client.key
	if(length(GLOB.newplayer_start)) // needed as hud code doesn't render huds if the atom (in this case the cyborg) is in nullspace, so just move the cyborg somewhere safe
		borg.forceMove(pick(GLOB.newplayer_start))
	else
		borg.forceMove(locate(1,1,1))

	var/obj/structure/closet/supplypod/pod = setup_pod()
	borg.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/peaceborg
	name = "peacekeeping cyborg beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call forth silicon-based assistants."
	/// The name of the special role given to the recruit
	special_role_name = "Peacekeeper Cyborg"
	/// Style used by the droppod
	pod_style = /datum/pod_style

/obj/item/antag_spawner/nanotrasen/peaceborg/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/silicon/robot/model/peacekeeper/borg = new()
	our_client.prefs.safe_transfer_prefs_to(borg, is_antag = FALSE)
	borg.ckey = our_client.key
	if(length(GLOB.newplayer_start)) // needed as hud code doesn't render huds if the atom (in this case the cyborg) is in nullspace, so just move the cyborg somewhere safe
		borg.forceMove(pick(GLOB.newplayer_start))
	else
		borg.forceMove(locate(1,1,1))

	var/obj/structure/closet/supplypod/pod = setup_pod()
	borg.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/serviceborg
	name = "service cyborg beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call forth silicon-based assistants."
	/// The name of the special role given to the recruit
	special_role_name = "Service Cyborg"
	/// Style used by the droppod
	pod_style = /datum/pod_style

/obj/item/antag_spawner/nanotrasen/serviceborg/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/silicon/robot/model/service/borg = new()
	our_client.prefs.safe_transfer_prefs_to(borg, is_antag = FALSE)
	borg.ckey = our_client.key
	if(length(GLOB.newplayer_start)) // needed as hud code doesn't render huds if the atom (in this case the cyborg) is in nullspace, so just move the cyborg somewhere safe
		borg.forceMove(pick(GLOB.newplayer_start))
	else
		borg.forceMove(locate(1,1,1))

	var/obj/structure/closet/supplypod/pod = setup_pod()
	borg.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)


/obj/item/antag_spawner/nanotrasen/assistant
	name = "nanotrasen assistant beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Assistant"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/assistant/consistent/outfit = /datum/outfit/job/assistant/consistent
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/assistant/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance)) // Ten percent chance for the reinforcement to be antag.
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/scientist
	name = "nanotrasen  beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Scientist"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/scientist/outfit = /datum/outfit/job/
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/scientist/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/bartender
	name = "nanotrasen bartender beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Bartender"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/bartender/outfit = /datum/outfit/job/bartender
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/bartender/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/botanist
	name = "nanotrasen botanist beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Botanist"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/botanist/outfit = /datum/outfit/job/botanist
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/botanist/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/cargo_tech
	name = "nanotrasen cargo technician beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Cargo Technician"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/cargo_tech/outfit = /datum/outfit/job/cargo_tech
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/cargo_tech/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/chemist
	name = "nanotrasen chemist beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Chemist"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/chemist/outfit = /datum/outfit/job/chemist
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/chemist/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/clown
	name = "nanotrasen clown beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Clown"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/clown/outfit = /datum/outfit/job/clown
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/clown/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/cook
	name = "nanotrasen cook beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Cook"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/cook/outfit = /datum/outfit/job/cook
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/cook/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/coroner
	name = "nanotrasen coroner beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Coroner"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/coroner/outfit = /datum/outfit/job/coroner
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/coroner/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/curator
	name = "nanotrasen curator beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Curator"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/curator/outfit = /datum/outfit/job/curator
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/curator/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/detective
	name = "nanotrasen detective beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Detective"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/detective/outfit = /datum/outfit/job/detective
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 0

/obj/item/antag_spawner/nanotrasen/detective/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/geneticist
	name = "nanotrasen geneticist beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Geneticist"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/geneticist/outfit = /datum/outfit/job/geneticist
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/geneticist/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/janitor
	name = "nanotrasen janitor beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Janitor"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/janitor/outfit = /datum/outfit/job/janitor
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/janitor/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/lawyer
	name = "nanotrasen lawyer beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Lawyer"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/lawyer/outfit = /datum/outfit/job/lawyer
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/lawyer/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/medical_doctor
	name = "nanotrasen medical doctor beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Medical Doctor"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/doctor/outfit = /datum/outfit/job/doctor
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/medical_doctor/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/mime
	name = "nanotrasen mime beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Mime"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/mime/outfit = /datum/outfit/job/mime
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/mime/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/paramedic
	name = "nanotrasen paramedic beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Paramedic"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/paramedic/outfit = /datum/outfit/job/paramedic
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/paramedic/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/psychologist
	name = "nanotrasen psychologist beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Psychologist"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/psychologist/outfit = /datum/outfit/job/psychologist
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/psychologist/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/roboticist
	name = "nanotrasen roboticist beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Roboticist"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/roboticist/outfit = /datum/outfit/job/roboticist
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/roboticist/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/security_officer
	name = "nanotrasen security officer beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Security Officer"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/security/outfit = /datum/outfit/job/security
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 0

/obj/item/antag_spawner/nanotrasen/security_officer/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/shaft_miner
	name = "nanotrasen shaft miner beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Shaft Miner"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/miner/outfit = /datum/outfit/job/miner
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/shaft_miner/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/station_engineer
	name = "nanotrasen station engineer beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Station Engineer"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/engineer/outfit = /datum/outfit/job/engineer
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/station_engineer/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/warden
	name = "nanotrasen warden beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Warden"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/warden/outfit = /datum/outfit/job/warden
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 0

/obj/item/antag_spawner/nanotrasen/warden/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)

/obj/item/antag_spawner/nanotrasen/chaplain
	name = "nanotrasen chaplain beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = "Chaplain"
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job/chaplain/outfit = /datum/outfit/job/chaplain
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen/chaplain/spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)
/**
/obj/item/antag_spawner/nanotrasen/
	name = "nanotrasen  beacon"
	desc = "A beacon of some sort, it's often used by nanotrasen employees to call-in additional personnel. For emergencies only."
	/// The name of the special role given to the recruit
	special_role_name = ""
	/// Style used by the droppod
	pod_style = /datum/pod_style
	/// The applied outfit
	var/datum/outfit/job//outfit = /datum/outfit/job/
	/// Chance for reinforcement to be selected as an antagonist.
	var/antag_chance = 10

/obj/item/antag_spawner/nanotrasen//spawn_antag(client/our_client, turf/T, kind, datum/mind/user)
	var/mob/living/carbon/human/respawned = new()
	our_client.prefs.safe_transfer_prefs_to(respawned, is_antag = FALSE)
	respawned.ckey = our_client.key
	var/datum/mind/respawned_mind = respawned.mind
	if(length(GLOB.newplayer_start))
		respawned.forceMove(pick(GLOB.newplayer_start))
	else
		respawned.forceMove(locate(1,1,1))

	if(prob(antag_chance))
		respawned_mind.add_antag_datum(/datum/antagonist/traitor/infiltrator)

	respawned_mind.special_role = special_role_name

	respawned.equipOutfit(outfit)

	var/obj/structure/closet/supplypod/pod = setup_pod()
	respawned.forceMove(pod)
	new /obj/effect/pod_landingzone(spawn_location ? spawn_location : get_turf(src), pod)
**/
