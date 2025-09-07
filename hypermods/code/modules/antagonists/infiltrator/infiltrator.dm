/datum/antagonist/traitor/infiltrator/invader
	name = "Infiltrator"
	antagpanel_category = "Infiltrator"
	pref_flag = ROLE_INFILTRATOR
	hijack_speed = 1
	hud_icon = 'hypermods/icons/mob/huds/antag_hud.dmi'
	antag_hud_name = "infil_hud"
	show_name_in_check_antagonists = TRUE
	show_to_ghosts = TRUE
	preview_outfit = /datum/outfit/infiltrator
	var/give_equipment = TRUE ///gives infiltrators equipment
	var/mincorps = 1
	var/maxcorps = 2
	/// Have we been given a (escape with identity) objective already?
	var/escapewithnewIDobj = FALSE


/datum/antagonist/traitor/infiltrator/invader/proc/equip_infiltrator(mob/living/carbon/human/infiltrator = owner.current)
	switch(employer)
		if(INFILTRATOR_FACTION_CORPORATE_CLIMBER)
			return infiltrator.equipOutfit(/datum/outfit/infiltrator/cc)
		if(INFILTRATOR_FACTION_ANIMAL_RIGHTS_CONSORTIUM)
			return infiltrator.equipOutfit(/datum/outfit/infiltrator/arc)
		if(INFILTRATOR_FACTION_GORLEX_MARAUDERS)
			return infiltrator.equipOutfit(/datum/outfit/infiltrator/gm)


/datum/antagonist/traitor/infiltrator/invader/on_gain()
	..()
	if(give_equipment)
		equip_infiltrator(owner.current)
	owner.current.mind.set_assigned_role(SSjob.get_job_type(/datum/job/infiltrator))
	//LAZYADD(owner.current.mind.special_roles, ROLE_INFILTRATOR)
	uplink_handler.has_progression = FALSE
	uplink_handler.has_objectives = FALSE

/datum/antagonist/traitor/infiltrator/invader/admin_add(datum/mind/new_owner, mob/admin)
	// Should probably be moved somewhere better to make full use of it
	var/list/possible_employers = list(
		INFILTRATOR_FACTION_CORPORATE_CLIMBER,
		INFILTRATOR_FACTION_ANIMAL_RIGHTS_CONSORTIUM,
		INFILTRATOR_FACTION_GORLEX_MARAUDERS,
	)
	var/choice = input("What affiliation would you like [new_owner] to have?", "Affiliation") in possible_employers
	if(!choice)
		return
	employer = possible_employers[choice]
	message_admins("[key_name_admin(usr)] made [key_name_admin(new_owner)] into \a [employer] [name]")
	log_admin("[key_name_admin(usr)] made [key_name_admin(new_owner)] into \a [employer] [name]")
	new_owner.add_antag_datum(src)

/datum/antagonist/traitor/infiltrator/invader/pick_employer(faction)
	faction = rand(mincorps, maxcorps)
	switch(faction)
		if(1)
			employer = INFILTRATOR_FACTION_CORPORATE_CLIMBER
		if(2)
			employer = pick(INFILTRATOR_FACTION_ANIMAL_RIGHTS_CONSORTIUM , INFILTRATOR_FACTION_GORLEX_MARAUDERS)
	//forge_traitor_objectives()
	traitor_flavor = strings(TRAITOR_FLAVOR_FILE, employer)

/datum/outfit/infiltrator
	name = "Infiltrator"
	uniform = /obj/item/clothing/under/chameleon
	suit = /obj/item/clothing/suit/space/syndicate
	glasses = /obj/item/clothing/glasses/night
	mask = /obj/item/clothing/mask/gas/syndicate
	head = /obj/item/clothing/head/helmet/space/syndicate
	ears = /obj/item/radio/headset
	back = /obj/item/storage/backpack
	backpack_contents = list(
		/obj/item/storage/box/survival/syndie = 1,
		/obj/item/knife/combat/survival = 1,
		/obj/item/infiltrator_radio = 1,
		/obj/item/reagent_containers/syringe/mulligan = 1,
	)
	id = /obj/item/card/id/advanced
	id_trim = /datum/id_trim/chameleon/operative
	l_hand = /obj/item/tank/jetpack/oxygen
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/combat
	r_pocket = /obj/item/tank/internals/emergency_oxygen
	internals_slot = ITEM_SLOT_RPOCKET

/datum/outfit/infiltrator/cc
	name = "Corporate Climber Infiltrator"
	suit = /obj/item/clothing/suit/space/syndicate/blue
	head = /obj/item/clothing/head/helmet/space/syndicate/blue
	r_hand = /obj/item/adv_mulligan

/datum/outfit/infiltrator/arc
	name = "Animal Rights Consortium Infiltrator"
	suit = /obj/item/clothing/suit/space/syndicate/green
	head = /obj/item/clothing/head/helmet/space/syndicate/green
	r_hand = /obj/item/toy/plush/carpplushie/dehy_carp/mega

/datum/outfit/infiltrator/gm
	name = "Gorlex Marauders Infiltrator"
	suit = /obj/item/clothing/suit/space/syndicate/orange
	head = /obj/item/clothing/head/helmet/space/syndicate/orange
	r_hand = /obj/item/gun/ballistic/revolver/derringer
