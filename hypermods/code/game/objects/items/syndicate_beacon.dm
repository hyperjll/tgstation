/obj/item/syndicate_beacon
	name = "satellite transponder"
	desc = "A remote used to contact and synchronize with foreign space-bodies, usually other space stations."
	icon = 'icons/obj/devices/remote.dmi'
	icon_state = "designator_syndicate"
	var/require_agent = TRUE

/obj/item/syndicate_beacon/attack_self(mob/user, modifiers)
	. = ..()
	if(LAZYACCESS(SSmapping.loaded_lazy_templates, LAZY_TEMPLATE_KEY_SYNDICATE_SATELLITE))
		to_chat(user, span_warning("There is already a satellite in orbit!"))
		qdel(src)
		var/obj/item/storage/box/syndie_kit/syndicate_gate_bundle/new_box = new
		user.put_in_active_hand(new_box)
		return

	to_chat(user, span_warning("You press a button on the [src] and it begins to hum! This may take a moment."))

	if(length(SSpolling.currently_polling) > 0  && require_agent)
		to_chat(user, span_warning("Satellite currently inoperable, please try again later."))
		return

	var/list/volunteers = SSpolling.poll_ghost_candidates(
		"Do you wish to be a support agent aboard an isolated vessel?",
		check_jobban = ROLE_SYNDICATE,
		poll_time = 10 SECONDS,
		ignore_category = POLL_IGNORE_SYNDICATE,
	)
	var/volunteer_count = length(volunteers)
	if(volunteer_count == 0 && require_agent)
		to_chat(user, span_warning("Satellite currently inoperable, please try again later."))
		return
	shuffle_inplace(volunteers)

	SSmapping.lazy_load_template(LAZY_TEMPLATE_KEY_SYNDICATE_SATELLITE)

	if(volunteer_count != 0)
		var/obj/effect/mob_spawn/ghost_role/pod_to_spawn_from = locate(/obj/effect/mob_spawn/ghost_role/human/syndicate/satellite)
		pod_to_spawn_from.create_from_ghost(pick(volunteers))

	if(QDELETED(src) || !user || !user.is_holding(src) || user.incapacitated)
		return

	qdel(src)
	var/new_box = new /obj/item/storage/box/syndie_kit/syndicate_gate_bundle()
	user.put_in_active_hand(new_box)

/obj/item/syndicate_beacon/no_agent // Used for testing purposes
	require_agent = FALSE
