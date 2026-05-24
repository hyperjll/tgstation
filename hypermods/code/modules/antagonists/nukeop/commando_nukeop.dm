/datum/antagonist/nukeop/commando
	name = ROLE_COMMANDO_OPERATIVE
	pref_flag =  ROLE_COMMANDO_OPERATIVE
	show_to_ghosts = TRUE
	hijack_speed = 3 //If you can't take out the station, take the shuttle instead.

	/// The DEFAULT outfit we will give to players granted this datum
	nukeop_outfit = /datum/outfit/syndicate/commando

	preview_outfit = /datum/outfit/commando_operative

	preview_outfit_behind = /datum/outfit/commando_operative

	/// In the preview icon, a nuclear fission explosive device, only appearing if there's an icon state for it.
	nuke_icon_state = "nuclearbomb_base"

	infiltrator_id = null // our ship spawns at map load.

/// Gets the position we spawn at
/datum/antagonist/nukeop/commando/get_spawnpoint()
	var/team_number = 1
	if(nuke_team)
		team_number = nuke_team.members.Find(owner)

	return GLOB.commando_nukeop_start[((team_number - 1) % GLOB.commando_nukeop_start.len) + 1]

/datum/antagonist/nukeop/commando/leader/get_spawnpoint()
	return pick(GLOB.commando_nukeop_leader_start)

/datum/antagonist/nukeop/commando/create_team(datum/team/nuclear/new_team)
	if(!new_team)
		// Find the first leader to join up
		for(var/datum/antagonist/nukeop/commando/leader/leader in GLOB.antagonists)
			if(leader.nuke_team)
				nuke_team = leader.nuke_team
				return
		// Otherwise make a new team entirely
		nuke_team = new /datum/team/nuclear/commando()
		return
	if(!istype(new_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	nuke_team = new_team

/datum/antagonist/nukeop/commando/admin_add(datum/mind/new_owner,mob/admin)
	new_owner.add_antag_datum(src)
	message_admins("[key_name_admin(admin)] has nuke op'ed [key_name_admin(new_owner)].")
	log_admin("[key_name(admin)] has nuke op'ed [key_name(new_owner)].")

/datum/antagonist/nukeop/commando/admin_send_to_base(mob/admin)
	owner.current.forceMove(pick(GLOB.commando_nukeop_start))

/datum/antagonist/nukeop/commando/admin_tell_code(mob/admin)
	var/code
	for (var/obj/machinery/nuclearbomb/commando/bombue as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/nuclearbomb/commando))
		if(length(bombue.r_code) <= 5 && bombue.r_code != initial(bombue.r_code))
			code = bombue.r_code
			break
	if (code)
		antag_memory += "<B>Syndicate Nuclear Bomb Code</B>: [code]<br>"
		to_chat(owner.current, "The nuclear authorization code is: <B>[code]</B>")
	else
		to_chat(admin, span_danger("No valid nuke found!"))

/datum/antagonist/nukeop/commando/on_respawn(mob/new_character)
	new_character.forceMove(pick(GLOB.commando_nukeop_start))
	equip_op()
	return TRUE

/datum/antagonist/nukeop/commando/give_alias()
	if(nuke_team?.syndicate_name)
		var/mob/living/carbon/human/human_to_rename = owner.current
		if(istype(human_to_rename)) // Reinforcements get a real name
			var/first_name = owner.current.client?.prefs?.read_preference(/datum/preference/name/operative_alias) || pick(GLOB.operative_aliases)
			var/chosen_name = "[nuke_team.syndicate_name] [first_name] "
			human_to_rename.fully_replace_character_name(human_to_rename.real_name, chosen_name)
		else
			var/number = 1
			number = nuke_team.members.Find(owner)
			owner.current.real_name = "[nuke_team.syndicate_name] Operative #[number]"

/// Actually moves our commando to where they should be
/datum/antagonist/nukeop/commando/move_to_spawnpoint()
	// Ensure that the commando base is loaded, and wait for it if required
	SSmapping.lazy_load_template(LAZY_TEMPLATE_KEY_COMMANDOBASE)
	var/turf/destination = get_spawnpoint()
	owner.current.forceMove(destination)
	if(!owner.current.onSyndieBase())
		message_admins("[ADMIN_LOOKUPFLW(owner.current)] is a COMMANDO OP and move_to_spawnpoint put them somewhere that isn't the commando base, help please.")
		stack_trace("Commando op move_to_spawnpoint resulted in a location not on the commando base. (Was moved to: [destination])")


/datum/antagonist/nukeop/commando/leader
	name = "Commando Operative Leader"
	nukeop_outfit = /datum/outfit/syndicate/commando/leader
	var/title = "commander"

/datum/antagonist/nukeop/commando/leader/memorize_code()
	..()
	if(nuke_team?.memorized_code)
		var/obj/item/paper/nuke_code_paper = new
		nuke_code_paper.add_raw_text("The nuclear authorization code is: <b>[nuke_team.memorized_code]</b>")
		nuke_code_paper.add_raw_text("Standard decryption time with the given disk: 15 MINUTES <br>Decrypting in the designated areas or with a Nanotrasen NAD will lower the decryption time. <br>NT NAD: 8 MINUTES <br>DECRYPTION AREA: 5 MINUTES")
		nuke_code_paper.name = "nuclear bomb code"
		var/mob/living/carbon/human/H = owner.current
		if(!istype(H))
			nuke_code_paper.forceMove(get_turf(H))
		else
			H.put_in_hands(nuke_code_paper, TRUE)
			H.update_icons()

/datum/antagonist/nukeop/commando/leader/greet()
	play_stinger()
	to_chat(owner, "<span class='warningplain'><B>You are the Syndicate [title] for this mission. You are responsible for guiding the team.</B></span>")
	to_chat(owner, "<span class='warningplain'><B>If you feel you are not up to this task, give your disk and radio to another operative.</B></span>")
	owner.announce_objectives()

/datum/antagonist/nukeop/commando/leader/on_gain()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(nuketeam_name_assign)), 1)

/datum/antagonist/nukeop/commando/leader/proc/nuketeam_name_assign()
	if(!nuke_team)
		return
	nuke_team.rename_team(ask_name())

/datum/antagonist/nukeop/commando/leader/proc/ask_name()
	var/randomname = pick(GLOB.operative_aliases)
	var/newname = tgui_input_text(owner.current, "You are the commando operative [title]. Please choose an operator name for your team.", "Name change", randomname, MAX_NAME_LEN)
	if (!newname)
		newname = randomname
	else
		newname = reject_bad_name(newname)
		if(!newname)
			newname = randomname

	return capitalize(newname)


/datum/team/nuclear/commando

/datum/team/nuclear/commando/rename_team(new_name)
	syndicate_name = new_name
	name = "[syndicate_name] Operators"
	for(var/I in members)
		var/datum/mind/synd_mind = I
		var/mob/living/carbon/human/human_to_rename = synd_mind.current
		if(!istype(human_to_rename))
			continue
		var/first_name = human_to_rename.client?.prefs?.read_preference(/datum/preference/name/operative_alias) || pick(GLOB.operative_aliases)
		var/chosen_name = "[syndicate_name] [first_name] "
		human_to_rename.fully_replace_character_name(human_to_rename.real_name, chosen_name)

/datum/team/nuclear/commando/antag_listing_entry()
	var/disk_report = "<b>Nuclear Disk(s)</b><br>"
	disk_report += "<table cellspacing=5>"
	for(var/obj/item/disk/nuclear/N in SSpoints_of_interest.real_nuclear_disks)
		disk_report += "<tr><td>[N.name], "
		var/atom/disk_loc = N.loc
		while(!isturf(disk_loc))
			if(ismob(disk_loc))
				var/mob/M = disk_loc
				disk_report += "carried by <a href='byond://?_src_=holder;[HrefToken()];adminplayeropts=[REF(M)]'>[M.real_name]</a> "
			if(isobj(disk_loc))
				var/obj/O = disk_loc
				disk_report += "in \a [O.name] "
			disk_loc = disk_loc.loc
		disk_report += "in [disk_loc.loc] at ([disk_loc.x], [disk_loc.y], [disk_loc.z])</td><td><a href='byond://?_src_=holder;[HrefToken()];adminplayerobservefollow=[REF(N)]'>FLW</a></td></tr>"
	disk_report += "</table>"
	var/common_part = ..()
	return common_part + disk_report

/datum/team/nuclear/commando/assign_nuke()
	memorized_code = random_nukecode()
	var/obj/machinery/nuclearbomb/commando/nuke = locate() in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/nuclearbomb/commando)
	if(!nuke)
		stack_trace("Syndicate nuke not found during nuke team creation.")
		memorized_code = null
		return
	tracked_nuke = nuke
	if(nuke.r_code == NUKE_CODE_UNSET)
		nuke.r_code = memorized_code
	else //Already set by admins/something else?
		memorized_code = nuke.r_code
	for(var/obj/machinery/nuclearbomb/beer/beernuke as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/nuclearbomb/beer))
		beernuke.r_code = memorized_code

/datum/team/nuclear/commando/get_result()
	var/shuttle_evacuated = EMERGENCY_ESCAPED_OR_ENDGAMED
	var/shuttle_landed_base = SSshuttle.emergency.is_hijacked()
	var/disk_rescued = is_disk_rescued()
	var/syndies_didnt_escape = !is_adv_infiltrator_docked_at_syndiebase()
	var/team_is_dead = are_all_operatives_dead()
	var/station_was_nuked = GLOB.station_was_nuked
	var/station_nuke_source = GLOB.station_nuke_source

	// The nuke detonated on the syndicate base
	if(station_nuke_source == DETONATION_HIT_SYNDIE_BASE)
		return NUKE_RESULT_FLUKE

	// The station was nuked
	if(station_was_nuked)
		// The station was nuked and the infiltrator failed to escape
		if(syndies_didnt_escape)
			return NUKE_RESULT_NOSURVIVORS
		// The station was nuked and the infiltrator escaped, and the nuke ops won
		else
			return NUKE_RESULT_NUKE_WIN

	// The station was not nuked, but something was
	else if(station_nuke_source && !disk_rescued)
		// The station was not nuked, but something was, and the syndicates didn't escape it
		if(syndies_didnt_escape)
			return NUKE_RESULT_WRONG_STATION_DEAD
		// The station was not nuked, but something was, and the syndicates returned to their base
		else
			return NUKE_RESULT_WRONG_STATION

	// Nuke didn't blow, but nukies somehow hijacked the emergency shuttle to land at the base anyways.
	else if(shuttle_landed_base)
		if(disk_rescued)
			return NUKE_RESULT_HIJACK_DISK
		else
			return NUKE_RESULT_HIJACK_NO_DISK

	// No nuke went off, the station rescued the disk
	else if(disk_rescued)
		// No nuke went off, the shuttle left, and the team is dead
		if(shuttle_evacuated && team_is_dead)
			return NUKE_RESULT_CREW_WIN_SYNDIES_DEAD
		// No nuke went off, but the nuke ops survived
		else
			return NUKE_RESULT_CREW_WIN

	// No nuke went off, but the disk was left behind
	else
		// No nuke went off, the disk was left, but all the ops are dead
		if(team_is_dead)
			return NUKE_RESULT_DISK_LOST
		// No nuke went off, the disk was left, there are living ops, but the shuttle left successfully
		else if(shuttle_evacuated)
			return NUKE_RESULT_DISK_STOLEN

	CRASH("[type] - got an undefined / unexpected result.")

/// Returns whether or not syndicate operatives escaped.
/proc/is_adv_infiltrator_docked_at_syndiebase()
	var/obj/docking_port/mobile/infiltrator/infiltrator_port = SSshuttle.getShuttle("adv_syndicate")

	var/datum/lazy_template/nukie_base/nukie_template = GLOB.lazy_templates[LAZY_TEMPLATE_KEY_COMMANDOBASE]
	if(!nukie_template)
		return FALSE // if its not even loaded, cant be docked

	for(var/datum/turf_reservation/loaded_area as anything in nukie_template.reservations)
		var/infiltrator_turf = get_turf(infiltrator_port)
		if(infiltrator_turf in loaded_area.reserved_turfs)
			return TRUE
	return FALSE


/datum/outfit/commando_operative
	name = "Commando Operative (Preview only)"

	glasses = /obj/item/clothing/glasses/night
	back = /obj/item/storage/backpack/fireproof
	head = /obj/item/clothing/head/helmet/space/syndicate/black/red
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/space/syndicate/black/red
	suit_store = /obj/item/tank/jetpack/harness
	belt = /obj/item/storage/belt/military

/datum/outfit/syndicate/commando
	name = "Syndicate Commando Operative"
	tc = 0

	shoes = /obj/item/clothing/shoes/combat/swat
	belt = /obj/item/gun/ballistic/automatic/pistol
	l_pocket = /obj/item/pinpointer/commando_nuke
	backpack_contents = list(
		/obj/item/syndicate_voucher = 1,
	)

/datum/outfit/syndicate/commando/post_equip(mob/living/carbon/human/nukie, visuals_only = FALSE)
	if(visuals_only)
		return

	// We don't require the nukiebase be loaded to function, but lets go ahead and kick off loading just in case
	INVOKE_ASYNC(SSmapping, TYPE_PROC_REF(/datum/controller/subsystem/mapping, lazy_load_template), LAZY_TEMPLATE_KEY_COMMANDOBASE)
	var/obj/item/radio/radio = nukie.ears
	radio.set_frequency(FREQ_SYNDICATE)
	radio.freqlock = RADIO_FREQENCY_LOCKED
	if(command_radio)
		radio.command = TRUE
		radio.use_command = TRUE
	if(ispath(uplink_type, /obj/item/uplink) || tc) // /obj/item/uplink understands 0 tc
		var/obj/item/uplink = new uplink_type(nukie, nukie.key, tc)
		nukie.equip_to_storage(uplink, ITEM_SLOT_BACK, indirect_action = TRUE, del_on_fail = TRUE)

	var/obj/item/implant/weapons_auth/weapons_implant = new/obj/item/implant/weapons_auth(nukie)
	weapons_implant.implant(nukie)
	var/obj/item/implant/duster/duster_implant = new/obj/item/implant/duster(nukie)
	duster_implant.implant(nukie)
	nukie.add_faction(ROLE_SYNDICATE)
	nukie.update_icons()

/datum/outfit/syndicate/commando/plasmaman
	name = "Syndicate Commando Operative (Plasmaman)"
	head = /obj/item/clothing/head/helmet/space/plasmaman/syndie
	uniform = /obj/item/clothing/under/plasmaman/syndicate
	r_hand = /obj/item/tank/internals/plasmaman/belt/full

/datum/outfit/syndicate/commando/leader
	name = "Syndicate Commando Operative Leader"
	command_radio = TRUE
	tc = 0

	belt = /obj/item/storage/belt/sheath/sabre/syndicate
	head = /obj/item/clothing/head/hats/hos/beret/syndicate
	id_trim = /datum/id_trim/chameleon/operative/nuke_leader
	backpack_contents = list(
		/obj/item/syndicate_voucher = 1,
		/obj/item/nuke_recaller = 1,
	)

/datum/outfit/syndicate/commando/leader/plasmaman
	name = "Syndicate Commando Operative Leader (Plasmaman)"
	head = /obj/item/clothing/head/helmet/space/plasmaman/syndie
	uniform = /obj/item/clothing/under/plasmaman/syndicate
	r_hand = /obj/item/tank/internals/plasmaman/belt/full

