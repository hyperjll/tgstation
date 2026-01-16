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
	nuke_icon_state = "old_nuclearbomb_base"

	infiltrator_id = null // our ship spawns at map load.

/// Gets the position we spawn at
/datum/antagonist/nukeop/commando/get_spawnpoint()
	var/team_number = 1
	if(nuke_team)
		team_number = nuke_team.members.Find(owner)

	return GLOB.commando_nukeop_start[((team_number - 1) % GLOB.nukeop_start.len) + 1]

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

/datum/outfit/commando_operative
	name = "Commando Operative (Preview only)"

	glasses = /obj/item/clothing/glasses/night
	back = /obj/item/storage/backpack/fireproof
	head = /obj/item/clothing/head/helmet/space/syndicate/black/red
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/space/syndicate/black/red
	suit_store = /obj/item/tank/jetpack/harness
	belt = /obj/item/storage/belt/military

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


/datum/outfit/syndicate/commando
	name = "Syndicate Commando Operative"
	tc = 0

	shoes = /obj/item/clothing/shoes/combat/swat
	belt = /obj/item/gun/ballistic/automatic/pistol
	l_pocket = /obj/item/pinpointer/commando_nuke
	backpack_contents = list(
		/obj/item/syndicate_voucher = 1,
	)

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

