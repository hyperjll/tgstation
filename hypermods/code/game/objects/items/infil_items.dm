/obj/item/adv_mulligan
	name = "advanced mulligan"
	desc = "Toxin that permanently changes your DNA into the one of last injected person. Use it on the victim to extract their DNA then inject it into yourself!"
	icon = 'icons/obj/medical/syringe.dmi'
	icon_state = "dnainjector"
	inhand_icon_state = "dnainjector"
	worn_icon_state = "pen"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	var/used = FALSE ///determines wether the injector is used up or nah
	var/datum/dna/originalDNA // the mob DNA we stole.
	var/originalname // the name of the mob who'd DNA we got.

/obj/item/adv_mulligan/interact_with_atom(atom/movable/victim, mob/living/carbon/human/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(!istype(user))
		return
	if(used)
		to_chat(user, span_warning("[src] has been already used, you can't activate it again!"))
		return
	if(ishuman(victim))
		var/mob/living/carbon/human/target = victim
		if(user.real_name != target.dna.real_name)
			originalDNA = new target.dna.type
			target.dna.copy_dna(originalDNA, COPY_DNA_SE|COPY_DNA_SPECIES)
			originalname = target.real_name
			to_chat(user, span_notice("You stealthly stab [target.name] with [src]."))
			icon_state = "dnainjector"
		else
			if(originalDNA)
				mutate(user)
			else
				to_chat(user, span_notice("You can't stab yourself with [src]!"))

/obj/item/adv_mulligan/attack_self(mob/living/carbon/user)
	mutate(user)

/obj/item/adv_mulligan/proc/mutate(mob/living/carbon/user)
	if(used)
		to_chat(user, span_notice("[src] has been already used, you can't activate it again!"))
		return
	if(!originalDNA)
		to_chat(user, span_notice("[src] doesn't have any DNA loaded in it!"))
		return

	if(!do_after(user, 2 SECONDS))
		return

	var/mob/living/carbon/human/ourself = user

	ourself.visible_message(span_warning("[ourself.name] shivers in pain and soon transforms into [originalname]!"), \
		span_notice("You inject yourself with [src] and suddenly become a copy of [originalname]."))

	ourself.real_name = originalname
	originalDNA.copy_dna(ourself.dna, COPY_DNA_SE|COPY_DNA_SPECIES)
	ourself.updateappearance(mutcolor_update=1)
	ourself.domutcheck()
	used = TRUE

	icon_state = "dnainjector0"
	originalDNA = null

/obj/item/adv_mulligan/examine(mob/user)
	. = ..()
	if (used)
		. += "This one is all used up."


/obj/item/infiltrator_radio
	name = "Infiltrator Radio"
	desc = "How is this thing running without a battery?"
	icon = 'hypermods/icons/obj/devices/infils.dmi'
	icon_state = "infiltrator_radio"
	w_class = WEIGHT_CLASS_SMALL
	///has the player claimed all his objectives' rewards?
	var/objectives_complete = FALSE
	///List of objectives we have already checked
	var/list/checked_objectives = list()
	///has the player completed all objectives and got hijack?
	var/hijacker_rdy = FALSE
	///Pool of rewards -- Each objective is supposed to only be completed once, and each reward should be impactful and not something like implants (of which double purchases aren't helpful)
	var/reward_items = list(
		/obj/item/storage/box/syndie_kit/chemicalsynth,
		/obj/item/storage/box/syndie_kit/observe,
		/obj/item/storage/box/syndie_kit/disruptor,
		/obj/item/storage/box/syndie_kit/anatomy,
		/obj/item/storage/box/syndie_kit/breacher,
		/obj/item/storage/box/syndie_kit/chameleondeluxe,
		/obj/item/storage/box/syndie_kit/communicator,
		/obj/item/storage/box/syndie_kit/sleeper,
		/obj/item/storage/box/syndie_kit/smuggler,
		/obj/item/storage/briefcase/lobbyist,
		/obj/item/storage/medkit/emergency/hyperzine,
		/obj/item/storage/toolbox/guncase/traitor,
		/obj/item/storage/box/syndie_kit/feral_cat_grenades,
		/obj/item/storage/toolbox/guncase/traitor/viper,
		/obj/item/storage/belt/holster/nukie/clover/full,
		/obj/item/storage/briefcase/sniper_traitor,
		/obj/item/storage/briefcase/shotgun_traitor,
		/obj/item/storage/briefcase/akm_traitor,
		/obj/item/dnainjector/acidspit/syndicate,
		/obj/item/melee/bostaff,
		/obj/item/clothing/gloves/rapid,
		/obj/item/trident/electrified,
		/obj/item/fireaxe/firey,
		/obj/item/gun/energy/recharge/ebow,
		/obj/item/mindbatterer, // admittedly an op item. Getting one for free is pretty neat.
		/obj/item/storage/toolbox/guncase/traitor/cobra,
		/obj/item/storage/belt/champion/wrestling,
		/obj/item/storage/briefcase/pblowgun,
		/obj/item/grenade/spawnergrenade/minisyndies,
		/obj/item/storage/backpack/duffelbag/syndie/c4,
		/obj/item/storage/backpack/duffelbag/syndie/x4,
		/obj/item/sbeacondrop/bomb,
		/obj/item/shadowcloak,
		/obj/item/gun/energy/pickpocket,
		/obj/item/storage/portable_chem_mixer/chemicompiler,
		/obj/item/compressionkit,
		/obj/item/storage/box/syndie_kit/syndicate_teleporter,
		/obj/item/mod/control/pre_equipped/traitor,
		/obj/item/storage/box/syndie_kit/stimulant_kit,
		/obj/item/storage/box/syndie_kit/impsur_strongarm,
	)

/obj/item/infiltrator_radio/Initialize(mapload)
	. = ..()
	add_overlay("infiltrator_radio_overlay")

/obj/item/infiltrator_radio/proc/check_reward_status(mob/living/user)
	for(var/datum/objective/goal in user.mind.get_all_objectives())
		if(goal.check_completion() && !(goal.explanation_text in checked_objectives))
			return goal
	return FALSE

/obj/item/infiltrator_radio/proc/give_reward(mob/living/user)
	var/datum/objective/addobj = check_reward_status(user)
	checked_objectives += addobj.explanation_text
	var/reward = pick(reward_items)
	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = reward,
	))
	reward_items -= reward //cant get duplicate rewards
	var/obj/item/stack/telecrystal/five/TCbonus = new
	if(!user.put_in_active_hand(TCbonus))
		TCbonus.forceMove(user.drop_location())
	var/list/bitch = user.mind.get_all_objectives()

	if(checked_objectives.len == bitch.len)
		objectives_complete = TRUE
		var/datum/objective/hijack/reward_obj = new
		reward_obj.owner = user.mind
		for(var/datum/antagonist/traitor/infiltrator/invader/antag_datum in user.mind.antag_datums)
			antag_datum.objectives += reward_obj


/obj/item/infiltrator_radio/ui_interact(mob/user, datum/tgui/ui)
	if(!isobserver(user) && !user.mind.has_antag_datum(/datum/antagonist/traitor/infiltrator/invader))
		to_chat(user, span_warning("The interface is covered with strange unintelligible encrypted symbols."))
		return

	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "InfilRadio", name)
		ui.open()


/obj/item/infiltrator_radio/ui_data(mob/user)
	var/list/data = list()
	data["check"] = check_reward_status(user)
	data["completed"] = objectives_complete
	data["final"] = hijacker_rdy
	return data

/obj/item/infiltrator_radio/ui_act(action, params)
	. = ..()
	if(.)
		return
	switch(action)
		if("claim_reward")
			if(check_reward_status(usr))
				give_reward(usr)
	return


/obj/item/missile_disk
	name = "missile disk"
	desc = "Used to store the coordinates of the station."
	icon = 'hypermods/icons/obj/devices/syndie_gadget.dmi'
	icon_state = "missiledisk"
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON
	///Does the disk have the station coordinates?
	var/stored = FALSE

/obj/item/missile_disk/interact_with_atom(atom/movable/victim, mob/living/carbon/human/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(!istype(victim, /obj/machinery/computer/communications))
		return
	if(stored)
		to_chat(user, span_warning("Disk already contains station coordinates."))
		return
	to_chat(user, span_warning("Downloading station coordinates..."))
	if(!do_after(user, 8 SECONDS))
		return
	playsound(src, 'sound/machines/beep/beep.ogg', 50, FALSE)
	to_chat(user, span_warning("Station coordinates successfully downloaded!"))
	stored = TRUE

/obj/item/missilephone
	name = "large handphone"
	desc = "Hello? Is this the police?"
	icon = 'hypermods/icons/obj/devices/syndie_gadget.dmi'
	icon_state = "missilephone"
	w_class = WEIGHT_CLASS_SMALL
	item_flags = NOBLUDGEON
	///has a disk been inserted into the phone?
	var/disk = FALSE
	///has the phone served its purpose?
	var/used = FALSE

/obj/item/missilephone/attackby(obj/item/missile_disk/terrorism, mob/user)
	if(!terrorism.stored)
		return
	playsound(src, 'sound/machines/terminal/terminal_insert_disc.ogg', 50, FALSE)
	to_chat(user, span_warning("Station coordinates uploaded to phone!"))
	disk = TRUE
	qdel(terrorism)
	add_overlay("missilephone_overlay")

/obj/item/missilephone/attack_self(mob/living/user)
	if(!ISADVANCEDTOOLUSER(user))
		to_chat(user, span_warning("This device is too advanced for you!"))
		return
	if(used)
		to_chat(user, span_warning("This [src] has already been used."))
		return FALSE
	if(!disk)
		to_chat(user, span_warning("This [src] doesn't have it's coordinates set!"))
		return FALSE

	if(tgui_alert(user, "Are you sure you want to launch the missiles?", "Missile Phone", list("Yes", "No")) == "Yes")
		if(used || QDELETED(src)) //Prevents fuckers from cheesing alert
			return FALSE

		to_chat(user, span_notice("You've sent the station's coordinates to god-knows-where..."))
		message_admins("[ADMIN_LOOKUPFLW(user)] has activated a Missile Phone.")
		user.log_message("activated a Missile Phone.", LOG_GAME)

		used = TRUE

		var/datum/round_event_control/missilegalore/missiles = new
		missiles.run_event()


/obj/item/grenade/c4/wormhole
	name = "Wormhole Projector"
	desc = "A device that opens up a portal gateway to our allies."
	icon = 'hypermods/icons/obj/weapons/grenade.dmi'
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/bombs_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/bombs_righthand.dmi'
	icon_state = "wormhole-explosive0"
	inhand_icon_state = "wormhole-explosive"
	boom_sizes = list(0, 0, 0)
	///The place that wiLL be used to summon the wormhole
	var/area/bombing_zone
	///the terrorist in question
	var/datum/weakref/bomber

/obj/item/grenade/c4/wormhole/proc/set_bombing_zone()
	for(var/sanity in 1 to 100)
		var/area/selected_area = pick(get_sorted_areas())
		if(!is_station_level(selected_area.z) || !(selected_area.area_flags & VALID_TERRITORY))
			continue
		bombing_zone = selected_area
		break

/obj/item/grenade/c4/wormhole/interact_with_atom(atom/movable/bombed, mob/user, flag)
	if(!isfloorturf(bombed))
		to_chat(user, span_notice("This wormhole projector must be planted on a floor!"))
		return
	if((get_area(target) != bombing_zone) && (get_area(src) != bombing_zone))
		if (!active)
			to_chat(user, span_notice("This isn't the location you're supposed to use this!"))
			return
	bomber = WEAKREF(user)
	return ..()

/obj/item/grenade/c4/wormhole/detonate(mob/living/lanced_by)
	if(!bomber)
		return
	var/mob/terrorist = bomber.resolve()
	var/turf/location
	location = get_turf(target)
	. = ..()
	var/obj/structure/cyborg_rift/rift = new /obj/structure/cyborg_rift(location)
	rift.owner = terrorist.real_name
	playsound(rift, 'sound/vehicles/rocketlaunch.ogg', 100, TRUE)
	notify_ghosts(
		"Someone has opened a Cyborg rift!",
		source = rift,
		header = "Cyborg Rift opened",
		notify_flags = NOTIFY_CATEGORY_NOFLASH,
	)
	priority_announce("An extra-dimensional rift has been detected within your sector, it's recommended such rifts be located and destroyed.", "Extra-Dimensional Affairs Report", 'sound/announcer/notice/notice1.ogg')
	/**
	var/datum/antagonist/traitor/fulp_infiltrator/infil = terrorist.mind.has_antag_datum(/datum/antagonist/traitor/fulp_infiltrator)
	if(!infil)
		return
	var/datum/objective/summon_wormhole/objective = locate() in infil.objectives
	objective.completed = TRUE
	**/

/obj/item/grenade/c4/wormhole/Destroy()
	bombing_zone = null
	bomber = null
	return ..()

/obj/structure/cyborg_rift
	name = "cyborg rift"
	desc = "A portal opened up to long-forgotten cyborgs."
	armor_type = /datum/armor/cyborg_rift
	max_integrity = 300
	icon = 'hypermods/icons/effects/effects.dmi'
	icon_state = "cyborg_rift"
	anchored = TRUE
	density = FALSE
	plane = MASSIVE_OBJ_PLANE
	///How many borgs have we spawned?
	var/borg_counter = 0
	///Max amount of borgs to produce.
	var/borg_max = INFINITY
	///name of the owner
	var/owner

/datum/armor/cyborg_rift
	melee = 99 // a little lee-way
	energy = 99 // a little lee-way
	bomb = 100
	fire = 100
	acid = 100

/obj/structure/cyborg_rift/attack_ghost(mob/user)
	. = ..()
	if(.)
		return
	summon_cyborg(user)
	if(borg_counter >= borg_max)
		qdel(src)

/obj/structure/cyborg_rift/proc/summon_cyborg(mob/user)
	var/cyborg_check = tgui_alert(user, "Become a rogue security cyborg?", "Cyborg Rift", list("Yes", "No"))
	if(cyborg_check != "Yes" || !src || QDELETED(src) || QDELETED(user))
		return FALSE

	if(borg_counter >= borg_max)
		return FALSE

	borg_counter += 1
	var/mob/living/silicon/robot/model/rogue/borg = new /mob/living/silicon/robot/model/rogue(loc)
	borg.SetEmagged(1)
	borg.set_connected_ai(null)
	borg.laws = new /datum/ai_laws/syndicate_override
	if(owner)
		borg.set_zeroth_law("Aid [owner] with their tasks in exacting revenge against Nanotrasen.")
	borg.laws.associate(src)
	borg.key = user.key

/mob/living/silicon/robot/model/rogue
	set_model = /obj/item/robot_model/security/rogue
	icon = 'hypermods/icons/mob/silicon/robots.dmi'
	icon_state = "infilsec"
	scrambledcodes = TRUE

/obj/projectile/beam/laser/rogue
	damage = 10

/obj/item/ammo_casing/energy/lasergun/rogue
	projectile_type = /obj/projectile/beam/laser/rogue

/obj/item/gun/energy/laser/cyborg/rogue
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun/rogue)

/obj/item/robot_model/security/rogue
	name = "Rogue Security"
	emag_modules = list(/obj/item/gun/energy/laser/cyborg/rogue)
	cyborg_base_icon = "infilsec"

/mob/living/silicon/robot/model/rogue/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(istype(emag_card, /obj/item/card/emag/silicon_hack)) //cheeky MF thought YOU WAS CLEVER?
		to_chat(user, span_warning("This sequencer seems to be incompatible with this model of cyborgs!"))
		return
	return ..()

/mob/living/silicon/robot/model/rogue/ResetModel()
	self_destruct(src)
