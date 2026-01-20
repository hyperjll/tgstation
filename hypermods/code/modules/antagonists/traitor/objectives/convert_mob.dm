/datum/traitor_objective_category/convert_mob
	name = "Send off a monkey to be indoctrinate"
	objectives = list(
		/datum/traitor_objective/convert_mob = 1,
	)

/datum/traitor_objective/convert_mob
	name = "Find a monkey and deliver it to %AREA% to be indoctrinated into the Syndicate"
	description = "Deliver a monkey to %AREA%, where our transport pod will be waiting. \
		We've been eager to turn one of Nanotrasen's captive monkies against them for a while. \
		You'll recieve an additional %TC% telecrystals if you deliver the monkey alive."

	duplicate_type = /datum/traitor_objective/convert_mob

	/// Area that the target needs to be delivered to
	var/area/dropoff_area
	/// Have we called the pod yet?
	var/pod_called = FALSE
	/// What mob do we want you to send off to be converted?
	var/convertable_target = /mob/living/carbon/human/species/monkey
	/// How much TC do we get from sending the mob alive
	var/alive_bonus = 1
	/// The applied outfit. Won't work with nonhuman spawn types.
	var/datum/outfit/outfit = /datum/outfit/syndicate_monkey
	/// The antag status to give the monkey.
	var/antag_datum = /datum/antagonist/syndicate_monkey
	/// All stripped targets belongings (weakrefs)
	var/list/target_belongings = list()
	/// The ID of the stoppable timer for returning the captured mob
	var/list/victim_timerid

	progression_minimum = 10 MINUTES
	progression_reward = list(3 MINUTES, 6 MINUTES)
	telecrystal_reward = list(1, 2)

/datum/traitor_objective/convert_mob/can_generate_objective(datum/mind/generating_for, list/possible_duplicates)
	if(length(possible_duplicates) > 0)
		return FALSE
	return TRUE

/datum/traitor_objective/convert_mob/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	var/list/possible_areas = GLOB.the_station_areas.Copy()
	for(var/area/possible_area as anything in possible_areas)
		if(ispath(possible_area, /area/station/hallway) || ispath(possible_area, /area/station/security) || initial(possible_area.outdoors))
			possible_areas -= possible_area

	dropoff_area = pick(possible_areas)
	replace_in_name("%AREA%", initial(dropoff_area.name))
	replace_in_name("%TC%", alive_bonus)
	return TRUE

/datum/traitor_objective/convert_mob/ungenerate_objective()
	dropoff_area = null

/datum/traitor_objective/convert_mob/generate_ui_buttons(mob/user)
	var/list/buttons = list()
	if(!pod_called)
		buttons += add_ui_button("Call Extraction Pod", "Pressing this will call down an extraction pod.", "rocket", "call_pod")
	return buttons

/datum/traitor_objective/convert_mob/ui_perform_action(mob/living/user, action)
	. = ..()
	switch(action)
		if("call_pod")
			if(pod_called)
				return
			var/area/user_area = get_area(user)

			if(user_area.type != dropoff_area)
				to_chat(user, span_warning("You must be in [initial(dropoff_area.name)] to call the extraction pod."))
				return

			call_pod(user)

/datum/traitor_objective/convert_mob/proc/call_pod(mob/living/user)
	pod_called = TRUE
	var/obj/structure/closet/supplypod/extractionpod/new_pod = new()
	RegisterSignal(new_pod, COMSIG_ATOM_ENTERED, PROC_REF(enter_check))
	new /obj/effect/pod_landingzone(get_turf(user), new_pod)

/datum/traitor_objective/convert_mob/proc/enter_check(obj/structure/closet/supplypod/extractionpod/source, entered_atom)
	SIGNAL_HANDLER
	if(!istype(source))
		CRASH("Smuggle objective's enter_check called with source being not an extraction pod: [source ? source.type : "N/A"]")

	var/mob/living/carbon/human/sent_mob = entered_atom

	for(var/obj/item/belonging in sent_mob.gather_belongings(FALSE, FALSE))
		if(belonging == sent_mob.get_item_by_slot(ITEM_SLOT_ICLOTHING) || belonging == sent_mob.get_item_by_slot(ITEM_SLOT_FEET))
			continue

		var/unequipped = sent_mob.temporarilyRemoveItemFromInventory(belonging)
		if (!unequipped)
			continue
		belonging.moveToNullspace()
		target_belongings.Add(WEAKREF(belonging))

	var/datum/market_item/hostage/market_item = sent_mob.process_capture(rand(500, 1000))
	RegisterSignal(market_item, COMSIG_MARKET_ITEM_SPAWNED, PROC_REF(on_victim_shipped))

	addtimer(CALLBACK(src, PROC_REF(handle_target), sent_mob), 1.5 SECONDS)

	if(sent_mob.type != convertable_target)
		fail_objective(penalty_cost = telecrystal_penalty)
		source.start_exit_sequence(source)
		return

	if(sent_mob.stat != DEAD)
		telecrystal_reward += alive_bonus

	succeed_objective()
	source.start_exit_sequence(source)

/datum/traitor_objective/convert_mob/proc/handle_target(mob/living/carbon/human/sent_mob)
	victim_timerid = addtimer(CALLBACK(src, PROC_REF(return_target), sent_mob), COME_BACK_FROM_CAPTURE_TIME, TIMER_STOPPABLE)

	var/actual_poll_time = (COME_BACK_FROM_CAPTURE_TIME - 1 SECONDS) // just before you're shipped back to the station.

	var/mob/chosen_one = SSpolling.poll_ghosts_for_target(
		question = "The Syndicate is looking to recruit a soul for [span_notice(sent_mob.name)] as a syndicate monkey!",
		check_jobban = ROLE_SYNDICATE,
		poll_time = actual_poll_time,
		checked_target = sent_mob,
		ignore_category = POLL_IGNORE_SYNDICATE,
		alert_pic = sent_mob,
		role_name_text = "syndicate recruitment",
		chat_text_border_icon = src,
	)
	on_poll_concluded(sent_mob, chosen_one)

/datum/traitor_objective/convert_mob/proc/return_target(mob/living/carbon/human/sent_mob)
	if(!sent_mob || QDELETED(sent_mob)) //suicided and qdeleted themselves
		return

	var/obj/structure/closet/supplypod/back_to_station/return_pod = new()
	return_pod.return_from_capture(sent_mob)
	returnal_side_effects(return_pod, sent_mob)

/datum/traitor_objective/convert_mob/proc/on_victim_shipped(datum/market_item/source, obj/item/market_uplink/uplink, shipping_method, turf/shipping_loc)
	SIGNAL_HANDLER
	deltimer(victim_timerid)
	returnal_side_effects(shipping_loc, source.item)

/datum/traitor_objective/convert_mob/proc/returnal_side_effects(atom/dropoff_location, mob/living/carbon/human/sent_mob)
	for(var/obj/item/belonging in sent_mob.gather_belongings())
		if(belonging == sent_mob.get_item_by_slot(ITEM_SLOT_ICLOTHING) || belonging == sent_mob.get_item_by_slot(ITEM_SLOT_FEET))
			continue
		sent_mob.dropItemToGround(belonging) // No souvenirs, except shoes and t-shirts

	for(var/datum/weakref/belonging_ref in target_belongings)
		var/obj/item/belonging = belonging_ref.resolve()
		if(!belonging)
			continue
		belonging.forceMove(dropoff_location)

	sent_mob.flash_act()
	sent_mob.adjust_confusion(10 SECONDS)
	sent_mob.adjust_dizzy(10 SECONDS)
	sent_mob.set_eye_blur_if_lower(30 SECONDS)
	sent_mob.dna.species.give_important_for_life(sent_mob) // so plasmamen do not get left for dead

	sent_mob.fully_replace_character_name(sent_mob.real_name, pick(GLOB.syndicate_monkey_names))
	sent_mob.crewlike_monkify()

	RegisterSignal(sent_mob, COMSIG_SPECIES_GAIN, PROC_REF(allergy))

	sent_mob.equipOutfit(outfit)

	sent_mob.mind?.add_antag_datum(antag_datum)

/// Assign the chosen ghost to the mob
/datum/traitor_objective/convert_mob/proc/on_poll_concluded(mob/living/carbon/human/sent_mob, mob/dead/observer/ghost)
	sent_mob.PossessByPlayer(ghost.key)


/datum/traitor_objective/convert_mob/proc/allergy(mob/living/carbon/human/sent_mob, datum/species/folly_species)
	SIGNAL_HANDLER
	if(is_simian(sent_mob))
		return
	// timer is long to let them panic and consider their folly, and because allergies take a while
	sent_mob.visible_message(span_bolddanger("[sent_mob] starts swelling unhealthily in size. It looks like they had an allergic reaction to becoming a [folly_species]!"), span_userdanger("As your monkey features morph, you feel your allergies coming in. Oh no."))
	// no brain or items. organs are funny though
	sent_mob.inflate_gib(drop_bitflags = DROP_ORGANS|DROP_BODYPARTS, gib_time = 25 SECONDS, anim_time = 40 SECONDS)


