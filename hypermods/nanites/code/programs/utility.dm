//Programs that interact with other programs or nanites directly, or have other special purposes.
/datum/nanite_program/viral
	name = "Viral Replica"
	desc = "The nanites constantly send encrypted signals attempting to forcefully copy their own programming into other nanite clusters, also overriding or disabling their cloud sync."
	use_rate = 0.5
	rogue_types = list(/datum/nanite_program/toxic)

	///The cooldown between pulses.
	COOLDOWN_DECLARE(pulse_cooldown)

/datum/nanite_program/viral/register_extra_settings()
	extra_settings[NES_PROGRAM_OVERWRITE] = new /datum/nanite_extra_setting/type("Add To", list("Overwrite", "Add To", "Ignore"))
	extra_settings[NES_CLOUD_OVERWRITE] = new /datum/nanite_extra_setting/number(0, 0, 100)

/datum/nanite_program/viral/active_effect()
	if(!COOLDOWN_FINISHED(src, pulse_cooldown))
		return
	var/datum/nanite_extra_setting/program = extra_settings[NES_PROGRAM_OVERWRITE]
	var/datum/nanite_extra_setting/cloud = extra_settings[NES_CLOUD_OVERWRITE]
	for(var/mob/living/people_in_range in orange(host_mob, 5))
		if(SEND_SIGNAL(people_in_range, COMSIG_NANITE_IS_STEALTHY))
			continue
		switch(program.get_value())
			if("Overwrite")
				SEND_SIGNAL(people_in_range, COMSIG_NANITE_SYNC, nanites, TRUE)
			if("Add To")
				SEND_SIGNAL(people_in_range, COMSIG_NANITE_SYNC, nanites, FALSE)
		SEND_SIGNAL(people_in_range, COMSIG_NANITE_SET_CLOUD, cloud.get_value())
	COOLDOWN_START(src, pulse_cooldown, 7.5 SECONDS)

/datum/nanite_program/self_scan
	name = "Host Scan"
	desc = "The nanites display a detailed readout of a body scan to the host."
	unique = FALSE
	can_trigger = TRUE
	trigger_cost = 3
	trigger_cooldown = 50
	rogue_types = list(/datum/nanite_program/toxic)

/datum/nanite_program/self_scan/register_extra_settings()
	extra_settings[NES_SCAN_TYPE] = new /datum/nanite_extra_setting/type("Medical", list("Medical", "Chemical", "Nanite"))

/datum/nanite_program/self_scan/on_trigger(comm_message)
	if(host_mob.stat == DEAD)
		return

	var/datum/nanite_extra_setting/scanned_nanites = extra_settings[NES_SCAN_TYPE]
	switch(scanned_nanites.get_value())
		if("Medical")
			healthscan(host_mob, host_mob)
		if("Chemical")
			chemscan(host_mob, host_mob)
		if("Nanite")
			SEND_SIGNAL(host_mob, COMSIG_NANITE_SCAN, host_mob, TRUE)

/datum/nanite_program/stealth
	name = "Stealth"
	desc = "The nanites mask their activity from superficial scans, becoming undetectable by HUDs and non-specialized scanners."
	rogue_types = list(/datum/nanite_program/toxic)
	use_rate = 0.2

/datum/nanite_program/stealth/enable_passive_effect()
	. = ..()
	nanites.stealth = TRUE
	host_mob.hud_set_nanite_indicator(remove = TRUE)

/datum/nanite_program/stealth/disable_passive_effect()
	. = ..()
	nanites.stealth = FALSE
	host_mob.hud_set_nanite_indicator()

/datum/nanite_program/reduced_diagnostics
	name = "Reduced Diagnostics"
	desc = "Disables some high-cost diagnostics in the nanites, making them unable to communicate their program list to portable scanners. \
		Doing so saves some power, slightly increasing their replication speed."
	rogue_types = list(/datum/nanite_program/toxic)
	use_rate = -0.1

/datum/nanite_program/reduced_diagnostics/enable_passive_effect()
	. = ..()
	nanites.diagnostics = FALSE

/datum/nanite_program/reduced_diagnostics/disable_passive_effect()
	. = ..()
	nanites.diagnostics = TRUE

/datum/nanite_program/relay
	name = "Relay"
	desc = "The nanites receive and relay long-range nanite signals."
	rogue_types = list(/datum/nanite_program/toxic)

/datum/nanite_program/relay/register_extra_settings()
	extra_settings[NES_RELAY_CHANNEL] = new /datum/nanite_extra_setting/number(1, 1, 9999)

/datum/nanite_program/relay/enable_passive_effect()
	. = ..()
	SSnanites.nanite_relays |= src

/datum/nanite_program/relay/disable_passive_effect()
	. = ..()
	SSnanites.nanite_relays -= src

/datum/nanite_program/relay/proc/relay_signal(code, relay_code, source)
	if(!activated)
		return
	if(!host_mob)
		return
	var/datum/nanite_extra_setting/nanite_setting = extra_settings[NES_RELAY_CHANNEL]
	if(relay_code != nanite_setting.get_value())
		return
	SEND_SIGNAL(host_mob, COMSIG_NANITE_SIGNAL, code, source)

/datum/nanite_program/relay/proc/relay_comm_signal(comm_code, relay_code, comm_message)
	if(!activated)
		return
	if(!host_mob)
		return
	var/datum/nanite_extra_setting/nanite_setting = extra_settings[NES_RELAY_CHANNEL]
	if(relay_code != nanite_setting.get_value())
		return
	SEND_SIGNAL(host_mob, COMSIG_NANITE_COMM_SIGNAL, comm_code, comm_message)

/datum/nanite_program/metabolic_synthesis
	name = "Metabolic Synthesis"
	desc = "The nanites use the metabolic cycle of the host to speed up their replication rate, using their extra nutrition as fuel."
	use_rate = -0.5 //generates nanites
	rogue_types = list(/datum/nanite_program/toxic)

/datum/nanite_program/metabolic_synthesis/check_conditions()
	if(!iscarbon(host_mob))
		return FALSE
	var/mob/living/carbon/C = host_mob
	if(C.nutrition <= NUTRITION_LEVEL_WELL_FED)
		return FALSE
	return ..()

/datum/nanite_program/metabolic_synthesis/active_effect()
	host_mob.adjust_nutrition(-0.5)

/datum/nanite_program/access
	name = "Subdermal ID"
	desc = "The nanites store the host's ID access rights in a subdermal magnetic strip. Updates when triggered, copying the host's current access."
	can_trigger = TRUE
	trigger_cost = 3
	trigger_cooldown = 30
	rogue_types = list(/datum/nanite_program/skin_decay)
	///List of all access that the Subdermal ID is currently holding onto.
	var/list/access = list()

//Syncs the nanites with the cumulative current mob's access level. Can potentially wipe existing access.
/datum/nanite_program/access/on_trigger(comm_message)
	var/list/new_access = list()
	var/obj/item/current_item
	current_item = host_mob.get_active_held_item()
	if(current_item)
		new_access += current_item.GetAccess()
	current_item = host_mob.get_inactive_held_item()
	if(current_item)
		new_access += current_item.GetAccess()
	if(ishuman(host_mob))
		var/mob/living/carbon/human/human_host = host_mob
		current_item = human_host.wear_id
		if(current_item)
			new_access += current_item.GetAccess()
	else if(isanimal(host_mob))
		var/mob/living/simple_animal/animal_host = host_mob
		current_item = animal_host.access_card
		if(current_item)
			new_access += current_item.GetAccess()
	access = new_access

/datum/nanite_program/spreading
	name = "Infective Exo-Locomotion"
	desc = "The nanites gain the ability to survive for brief periods outside of the human body, as well as the ability to start new colonies without an integration process; \
			resulting in an extremely infective strain of nanites."
	use_rate = 1.50
	rogue_types = list(/datum/nanite_program/aggressive_replication, /datum/nanite_program/necrotic)
	COOLDOWN_DECLARE(spread_delay)

/datum/nanite_program/spreading/active_effect()
	if(!COOLDOWN_FINISHED(src, spread_delay))
		return
	COOLDOWN_START(src, spread_delay, 8 SECONDS)

	var/list/mob/living/carbon/human/target_hosts = list()
	for(var/mob/living/carbon/human/nearby_humans in oview(5, host_mob))
		if(!prob(25))
			continue
		if(!(nearby_humans.mob_biotypes & (MOB_ORGANIC|MOB_UNDEAD)))
			continue
		target_hosts += nearby_humans
	if(!target_hosts.len)
		return
	var/mob/living/carbon/human/infectee = pick(target_hosts)
	if(!(infectee.wear_suit) || prob(100 - infectee.wear_suit.get_armor_rating(BIO)))
		//this will potentially take over existing nanites!
		infectee.AddComponent(/datum/component/nanites, null, 10)
		SEND_SIGNAL(infectee, COMSIG_NANITE_SYNC, nanites)
		log_game("[infectee] was infected by spreading nanites by [key_name(host_mob)] at [AREACOORD(infectee)].")

/datum/nanite_program/nanite_sting
	name = "Nanite Sting"
	desc = "When triggered, projects a nearly invisible spike of nanites that attempts to infect a nearby non-host with a copy of the host's nanites cluster."
	can_trigger = TRUE
	trigger_cost = 5
	trigger_cooldown = 100
	rogue_types = list(/datum/nanite_program/glitch, /datum/nanite_program/toxic)

/datum/nanite_program/nanite_sting/on_trigger(comm_message)
	var/list/mob/living/carbon/human/target_hosts = list()
	for(var/mob/living/carbon/human/nearby_humans in oview(1, host_mob))
		var/datum/component/nanites/nanites = nearby_humans.GetComponent(/datum/component/nanites)
		if(!(nearby_humans.mob_biotypes & (MOB_ORGANIC|MOB_UNDEAD)) || nanites || !nearby_humans.Adjacent(host_mob))
			continue
		target_hosts += nearby_humans
	if(!target_hosts.len)
		consume_nanites(-5)
		return
	var/mob/living/carbon/human/infectee = pick(target_hosts)
	if(!(infectee.wear_suit) || prob(100 - infectee.wear_suit.get_armor_rating(BIO)))
		//unlike with Infective Exo-Locomotion, this can't take over existing nanites, because Nanite Sting only targets non-hosts.
		infectee.AddComponent(/datum/component/nanites, null, 5)
		SEND_SIGNAL(infectee, COMSIG_NANITE_SYNC, nanites)
		log_game("[infectee] was infected by a nanite cluster by [key_name(host_mob)] at [AREACOORD(infectee)].")
		to_chat(infectee, span_warning("You feel a tiny prick."))

/datum/nanite_program/mitosis
	name = "Mitosis"
	desc = "The nanites gain the ability to self-replicate, using bluespace to power the process. Becomes more effective the more nanites are already in the host.\
			The replication has also a chance to corrupt the nanite programming due to copy faults - cloud sync is highly recommended."
	use_rate = 0
	rogue_types = list(/datum/nanite_program/toxic)

/datum/nanite_program/mitosis/active_effect()
	var/rep_rate = round(nanites.nanite_volume / 50, 1) //0.5 per 50 nanite volume
	rep_rate *= 0.5
	nanites.adjust_nanites(null, rep_rate)
	if(prob(rep_rate))
		var/datum/nanite_program/fault = pick(nanites.programs)
		if(fault == src)
			return
		fault.software_error()

/datum/nanite_program/dermal_button
	name = "Dermal Button"
	desc = "Displays a button on the host's skin, which can be used to send a signal to the nanites."
	unique = FALSE
	var/datum/action/innate/nanite_button/button

/datum/nanite_program/dermal_button/register_extra_settings()
	extra_settings[NES_SENT_CODE] = new /datum/nanite_extra_setting/number(1, 1, 9999)
	extra_settings[NES_BUTTON_NAME] = new /datum/nanite_extra_setting/text("Button")
	extra_settings[NES_ICON] = new /datum/nanite_extra_setting/type("power", list(
		"blank",
		"one",
		"two",
		"three",
		"four",
		"five",
		"plus",
		"minus",
		"exclamation",
		"question",
		"cross",
		"info",
		"heart",
		"skull",
		"brain",
		"brain_damage",
		"injection",
		"blood",
		"shield",
		"reaction",
		"network",
		"power",
		"radioactive",
		"electricity",
		"magnetism",
		"scan",
		"repair",
		"id",
		"wireless",
		"say",
		"sleep",
		"bomb",
	))

/datum/nanite_program/dermal_button/enable_passive_effect()
	. = ..()
	var/datum/nanite_extra_setting/bn_name = extra_settings[NES_BUTTON_NAME]
	var/datum/nanite_extra_setting/bn_icon = extra_settings[NES_ICON]
	if(!button)
		button = new(src, bn_name.get_value(), bn_icon.get_value())
	button.target = host_mob
	button.Grant(host_mob)

/datum/nanite_program/dermal_button/disable_passive_effect()
	. = ..()
	if(button)
		button.Remove(host_mob)

/datum/nanite_program/dermal_button/on_mob_remove()
	qdel(button)
	return ..()

/datum/nanite_program/dermal_button/proc/press()
	if(activated)
		host_mob.visible_message(
			span_notice("[host_mob] presses a button on [host_mob.p_their()] forearm."),
			span_notice("You press the nanite button on your forearm."),
			null, 2,
		)
		var/datum/nanite_extra_setting/sent_code = extra_settings[NES_SENT_CODE]
		SEND_SIGNAL(host_mob, COMSIG_NANITE_SIGNAL, sent_code.get_value(), "a [name] program")

/datum/action/innate/nanite_button
	name = "Button"
	button_icon = 'hypermods/nanites/icons/nanite_actions.dmi'
	button_icon_state = "power_green"
	check_flags = AB_CHECK_HANDS_BLOCKED|AB_CHECK_IMMOBILE|AB_CHECK_CONSCIOUS
	var/datum/nanite_program/dermal_button/program

/datum/action/innate/nanite_button/New(datum/nanite_program/dermal_button/program, program_name, program_icon)
	..()
	src.program = program
	src.name = program_name
	button_icon_state = "nanite_[program_icon]"

/datum/action/innate/nanite_button/Activate()
	program.press()


/datum/nanite_program/research
	name = "Distributed Computing"
	desc = "The nanites aid the research servers by performing a portion of its calculations, providing additional general research point generation and nanite point generation."
	use_rate = 0.1
	rogue_types = list(/datum/nanite_program/toxic)

/datum/nanite_program/research/active_effect()
	if(!iscarbon(host_mob))
		return
	var/points = 0.1
	if(!host_mob.client) //less brainpower
		points *= 0.25
	var/datum/techweb/station_techweb = locate(/datum/techweb/science) in SSresearch.techwebs
	station_techweb.add_point_list(list(TECHWEB_POINT_TYPE_GENERIC = points))
	station_techweb.add_point_list(list(TECHWEB_POINT_TYPE_NANITES = points))

/datum/nanite_program/accelerated_synthesis
	name = "Accelerated Synthesis"
	desc = "The nanites adopt a simpler method of self-replication to speed up their replication rate, while this may cause corruptions, it won't prevent cloud linking."
	use_rate = -0.5 //generates nanites
	rogue_types = list(/datum/nanite_program/toxic)

/datum/nanite_program/accelerated_synthesis/active_effect()
	if(prob(0.1))
		var/datum/nanite_program/fault = pick(nanites.programs)
		if(fault == src)
			return
		fault.software_error()

/datum/nanite_program/construct_tool
	name = "Construct Nanite Tool"
	desc = "The nanites gather into the palm of the host's hand and form a specific tool such as a crowbar or wrench."
	unique = FALSE
	can_trigger = TRUE
	trigger_cost = 40
	trigger_cooldown = 30
	rogue_types = list(/datum/nanite_program/toxic)

/datum/nanite_program/construct_tool/register_extra_settings()
	extra_settings[NES_TOOL_CHOICE] = new /datum/nanite_extra_setting/type("Crowbar", list("Crowbar", "Screwdriver", "Welding Tool", "Wirecutters", "Wrench"))

/datum/nanite_program/construct_tool/on_trigger(comm_message)
	if(host_mob.stat == DEAD)
		return

	var/datum/nanite_extra_setting/scanned_nanites = extra_settings[NES_TOOL_CHOICE]
	switch(scanned_nanites.get_value())
		if("Crowbar")
			var/obj/item/crowbar/nanite/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())
		if("Screwdriver")
			var/obj/item/screwdriver/nanite/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())
		if("Welding Tool")
			var/obj/item/weldingtool/nanite/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())
		if("Wirecutters")
			var/obj/item/wirecutters/nanite/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())
		if("Wrench")
			var/obj/item/wrench/nanite/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())

/obj/item/crowbar/nanite
	name = "nanite crowbar"
	desc = "A small crowbar, upon closer inspection, the material is moving ever-so-slightly. Can be used for prying floor tiles or opening unpowered doors."

/obj/item/crowbar/nanite/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(destroy_nanite_item)), 20 SECONDS)

/obj/item/crowbar/nanite/proc/destroy_nanite_item()
	visible_message(span_danger("The nanite crowbar is beginning to destabilize..."), span_userdanger("The nanite crowbar is destabilizing..."))
	sleep(10 SECONDS)
	visible_message(span_danger("The nanite crowbar crumbles into nothing..."), span_userdanger("The nanite crowbar suddenly vanishes with little fanfare."))
	qdel(src)

/obj/item/screwdriver/nanite
	name = "nanite screwdriver"
	desc = "A small screwdriver, upon closer inspection, the material is moving ever-so-slightly."

/obj/item/screwdriver/nanite/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(destroy_nanite_item)), 20 SECONDS)

/obj/item/screwdriver/nanite/proc/destroy_nanite_item()
	visible_message(span_danger("The nanite screwdriver is beginning to destabilize..."), span_userdanger("The nanite screwdriver is destabilizing..."))
	sleep(10 SECONDS)
	visible_message(span_danger("The nanite screwdriver crumbles into nothing..."), span_userdanger("The nanite screwdriver suddenly vanishes with little fanfare."))
	qdel(src)

/obj/item/weldingtool/nanite
	name = "nanite welding tool"
	desc = "A standard edition welder provided by Nanotrasen, upon closer inspection, the material is moving ever-so-slightly."

/obj/item/weldingtool/nanite/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(destroy_nanite_item)), 20 SECONDS)

/obj/item/weldingtool/nanite/proc/destroy_nanite_item()
	visible_message(span_danger("The nanite welding tool is beginning to destabilize..."), span_userdanger("The nanite welding tool is destabilizing..."))
	sleep(10 SECONDS)
	visible_message(span_danger("The nanite welding tool crumbles into nothing..."), span_userdanger("The nanite welding tool suddenly vanishes with little fanfare."))
	qdel(src)

/obj/item/wirecutters/nanite
	name = "nanite wirecutters"
	desc = "Your typical pair of wirecutters, upon closer inspection, the material is moving ever-so-slightly."

/obj/item/wirecutters/nanite/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(destroy_nanite_item)), 20 SECONDS)

/obj/item/wirecutters/nanite/proc/destroy_nanite_item()
	visible_message(span_danger("The nanite wirecutters is beginning to destabilize..."), span_userdanger("The nanite wirecutters is destabilizing..."))
	sleep(10 SECONDS)
	visible_message(span_danger("The nanite wirecutters crumbles into nothing..."), span_userdanger("The nanite wirecutters suddenly vanishes with little fanfare."))
	qdel(src)

/obj/item/wrench/nanite
	name = "nanite wrench"
	desc = "A wrench with common uses, upon closer inspection, the material is moving ever-so-slightly."

/obj/item/wrench/nanite/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(destroy_nanite_item)), 20 SECONDS)

/obj/item/wrench/nanite/proc/destroy_nanite_item()
	visible_message(span_danger("The nanite wrench is beginning to destabilize..."), span_userdanger("The nanite wrench is destabilizing..."))
	sleep(10 SECONDS)
	visible_message(span_danger("The nanite wrench crumbles into nothing..."), span_userdanger("The nanite wrench suddenly vanishes with little fanfare."))
	qdel(src)

/datum/nanite_program/convert_nanites
	name = "Convert Nanites"
	desc = "The nanites gather into the palm of the host's hand and form a specific material such as metal sheets or glass sheets. The items do NOT disappear afterward."
	unique = FALSE
	can_trigger = TRUE
	trigger_cost = 10
	trigger_cooldown = 10
	rogue_types = list(/datum/nanite_program/toxic)

/datum/nanite_program/convert_nanites/register_extra_settings()
	extra_settings[NES_MAT_CHOICE] = new /datum/nanite_extra_setting/type("One Iron Sheet", list("One Iron Sheet", "One Glass Sheet", "One Plastic Sheet", "One Plasma Sheet", "One Wood Sheet"))

/datum/nanite_program/convert_nanites/on_trigger(comm_message)
	if(host_mob.stat == DEAD)
		return

	var/datum/nanite_extra_setting/scanned_nanites = extra_settings[NES_MAT_CHOICE]
	switch(scanned_nanites.get_value())
		if("One Iron Sheet")
			var/obj/item/stack/sheet/iron/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())
		if("One Glass Sheet")
			var/obj/item/stack/sheet/glass/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())
		if("One Plastic Sheet")
			var/obj/item/stack/sheet/plastic/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())
		if("One Plasma Sheet")
			var/obj/item/stack/sheet/mineral/plasma/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())
		if("One Wood Sheet")
			var/obj/item/stack/sheet/mineral/wood/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())

/datum/nanite_program/construct_tool_adv
	name = "Construct Advanced Nanite Tool"
	desc = "The nanites gather into the palm of the host's hand and form a specific tool such as a multitool or holofan projector."
	unique = FALSE
	can_trigger = TRUE
	trigger_cost = 50
	trigger_cooldown = 60
	rogue_types = list(/datum/nanite_program/toxic)

/datum/nanite_program/construct_tool_adv/register_extra_settings()
	extra_settings[NES_ADV_TOOL_CHOICE] = new /datum/nanite_extra_setting/type("Multitool", list("Multitool", "Jaws of Life", "RPD", "Fire Extinguisher", "Crew Pinpointer", "Holofan Projector"))

/datum/nanite_program/construct_tool_adv/on_trigger(comm_message)
	if(host_mob.stat == DEAD)
		return

	var/datum/nanite_extra_setting/scanned_nanites = extra_settings[NES_ADV_TOOL_CHOICE]
	switch(scanned_nanites.get_value())
		if("Multitool")
			var/obj/item/multitool/nanite/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())
		if("Jaws of Life")
			var/obj/item/crowbar/power/nanite/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())
		if("RPD")
			var/obj/item/pipe_dispenser/nanite/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())
		if("Fire Extinguisher")
			var/obj/item/extinguisher/nanite/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())
		if("Crew Pinpointer")
			var/obj/item/pinpointer/crew/nanite/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())
		if("Holofan Projector")
			var/obj/item/holosign_creator/atmos/nanite/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())

/obj/item/multitool/nanite
	name = "nanite multitool"
	desc = "Used for pulsing wires to test which to cut. Not recommended by doctors. Upon closer inspection, the material is moving ever-so-slightly."

/obj/item/multitool/nanite/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(destroy_nanite_item)), 50 SECONDS)

/obj/item/multitool/nanite/proc/destroy_nanite_item()
	visible_message(span_danger("The nanite multitool is beginning to destabilize..."), span_userdanger("The nanite multitool is destabilizing..."))
	sleep(10 SECONDS)
	visible_message(span_danger("The nanite multitool crumbles into nothing..."), span_userdanger("The nanite multitool suddenly vanishes with little fanfare."))
	qdel(src)

/obj/item/crowbar/power/nanite
	name = "nanite jaws of life"
	desc = "A set of jaws of life, compressed through the magic of science. Upon closer inspection, the material is moving ever-so-slightly."

/obj/item/crowbar/power/nanite/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(destroy_nanite_item)), 50 SECONDS)

/obj/item/crowbar/power/nanite/proc/destroy_nanite_item()
	visible_message(span_danger("The nanite jaws of life is beginning to destabilize..."), span_userdanger("The nanite jaws of life is destabilizing..."))
	sleep(10 SECONDS)
	visible_message(span_danger("The nanite jaws of life crumbles into nothing..."), span_userdanger("The nanite jaws of life suddenly vanishes with little fanfare."))
	qdel(src)

/obj/item/pipe_dispenser/nanite
	name = "Nanite Rapid Pipe Dispenser (RPD)"
	desc = "A device used to rapidly pipe things. Upon closer inspection, the material is moving ever-so-slightly."

/obj/item/pipe_dispenser/nanite/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(destroy_nanite_item)), 50 SECONDS)

/obj/item/pipe_dispenser/nanite/proc/destroy_nanite_item()
	visible_message(span_danger("The nanite rapid pipe dispenser is beginning to destabilize..."), span_userdanger("The nanite rapid pipe dispenser is destabilizing..."))
	sleep(10 SECONDS)
	visible_message(span_danger("The nanite rapid pipe dispenser crumbles into nothing..."), span_userdanger("The nanite rapid pipe dispenser suddenly vanishes with little fanfare."))
	qdel(src)

/obj/item/extinguisher/nanite
	name = "nanite fire extinguisher"
	desc = "A traditional red fire extinguisher. Upon closer inspection, the material is moving ever-so-slightly."

/obj/item/extinguisher/nanite/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(destroy_nanite_item)), 20 SECONDS)

/obj/item/extinguisher/nanite/proc/destroy_nanite_item()
	visible_message(span_danger("The nanite extinguisher is beginning to destabilize..."), span_userdanger("The nanite extinguisher is destabilizing..."))
	sleep(10 SECONDS)
	visible_message(span_danger("The nanite extinguisher crumbles into nothing..."), span_userdanger("The nanite extinguisher suddenly vanishes with little fanfare."))
	qdel(src)

/obj/item/pinpointer/crew/nanite
	name = "nanite crew pinpointer"
	desc = "A handheld tracking device that points to crew suit sensors. Upon closer inspection, the material is moving ever-so-slightly."

/obj/item/pinpointer/crew/nanite/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(destroy_nanite_item)), 50 SECONDS)

/obj/item/pinpointer/crew/nanite/proc/destroy_nanite_item()
	visible_message(span_danger("The nanite crew pinpointer is beginning to destabilize..."), span_userdanger("The nanite crew pinpointer is destabilizing..."))
	sleep(10 SECONDS)
	visible_message(span_danger("The nanite crew pinpointer crumbles into nothing..."), span_userdanger("The nanite crew pinpointer suddenly vanishes with little fanfare."))
	qdel(src)

/obj/item/holosign_creator/atmos/nanite
	name = "nanite ATMOS holofan projector"
	desc = "A holographic projector that creates hard light barriers that prevent changes in atmosphere conditions. Upon closer inspection, the material is moving ever-so-slightly."

/obj/item/holosign_creator/atmos/nanite/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(destroy_nanite_item)), 50 SECONDS)

/obj/item/holosign_creator/atmos/nanite/proc/destroy_nanite_item()
	visible_message(span_danger("The nanite ATMOS holofan projector is beginning to destabilize..."), span_userdanger("The nanite ATMOS holofan projector is destabilizing..."))
	sleep(10 SECONDS)
	visible_message(span_danger("The nanite ATMOS holofan projector crumbles into nothing..."), span_userdanger("The nanite ATMOS holofan projector suddenly vanishes with little fanfare."))
	qdel(src)

/datum/nanite_program/construct_tool_super
	name = "Construct Super Nanite Tool"
	desc = "The nanites gather into the palm of the host's hand and form a specific tool such as a holotool."
	unique = TRUE
	can_trigger = TRUE
	trigger_cost = 80
	trigger_cooldown = 60
	rogue_types = list(/datum/nanite_program/toxic)

/datum/nanite_program/construct_tool_super/register_extra_settings()
	extra_settings[NES_SUPER_TOOL_CHOICE] = new /datum/nanite_extra_setting/type("Holotool", list("Holotool"))

/datum/nanite_program/construct_tool_super/on_trigger(comm_message)
	if(host_mob.stat == DEAD)
		return

	var/datum/nanite_extra_setting/scanned_nanites = extra_settings[NES_SUPER_TOOL_CHOICE]
	switch(scanned_nanites.get_value())
		if("Holotool")
			var/obj/item/holotool/nanite/Newitem = new
			if(!host_mob.put_in_active_hand(Newitem))
				host_mob.forceMove(host_mob.drop_location())

/obj/item/holotool/nanite
	name = "nanite holotool"
	desc = "A highly experimental holographic tool projector. Upon closer inspection, the material is moving ever-so-slightly."

/obj/item/holotool/nanite/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(destroy_nanite_item)), 50 SECONDS)

/obj/item/holotool/nanite/proc/destroy_nanite_item()
	visible_message(span_danger("The nanite holotool is beginning to destabilize..."), span_userdanger("The nanite holotool is destabilizing..."))
	sleep(10 SECONDS)
	visible_message(span_danger("The nanite holotool crumbles into nothing..."), span_userdanger("The nanite holotool suddenly vanishes with little fanfare."))
	qdel(src)


/datum/nanite_program/bluespace_blood
	name = "Bluespace Harvestation"
	desc = "The nanites will harvest foreign bluespace energies and store them away. Once the proper signal is recieved, the nanites invest the bluespace energies into the host's bloodstream. Causing temporary spontaneous short-range teleportation."
	can_trigger = TRUE
	trigger_cost = 25
	trigger_cooldown = 100
	rogue_types = list(/datum/nanite_program/toxic)

/datum/nanite_program/bluespace_blood/on_trigger()
	host_mob.reagents.add_reagent(/datum/reagent/bluespace, 10)


/datum/nanite_program/botsummon
	name = "Simple Bot Construction"
	desc = "The nanites expend a large amount of themselves to develop a single simple bot capable of assisting the station and it's personnel."
	unique = FALSE
	can_trigger = TRUE
	trigger_cost = 100
	trigger_cooldown = 600
	rogue_types = list(/datum/nanite_program/glitch)

/datum/nanite_program/botsummon/register_extra_settings()
	extra_settings[NES_BOT_CHOICE] = new /datum/nanite_extra_setting/type("Medibot", list("Medibot", "Cleanbot", "Repairbot", "Firebot", "Honkbot", "Securitron"))

/datum/nanite_program/botsummon/on_trigger(comm_message)
	if(host_mob.stat == DEAD)
		return

	var/datum/nanite_extra_setting/scanned_nanites = extra_settings[NES_BOT_CHOICE]
	switch(scanned_nanites.get_value())
		if("Medibot")
			new /mob/living/basic/bot/medbot(host_mob.loc)
		if("Cleanbot")
			new /mob/living/basic/bot/cleanbot(host_mob.loc)
		if("Repairbot")
			new /mob/living/basic/bot/repairbot(host_mob.loc)
		if("Firebot")
			new /mob/living/basic/bot/firebot(host_mob.loc)
		if("Honkbot")
			new /mob/living/basic/bot/honkbot(host_mob.loc)
		if("Securitron")
			new /mob/living/simple_animal/bot/secbot(host_mob.loc)


/datum/nanite_program/researchplus
	name = "Nanite Research Servers"
	desc = "The nanites adopt research server programming and may expend themselves to generate both general and nanite research points in substantial amounts."
	use_rate = 0.5
	rogue_types = list(/datum/nanite_program/glitch)

/datum/nanite_program/researchplus/active_effect()
	if(!iscarbon(host_mob))
		return
	var/points = 0.2
	if(!host_mob.client) //less brainpower
		points *= 0.25
	var/datum/techweb/station_techweb = locate(/datum/techweb/science) in SSresearch.techwebs
	station_techweb.add_point_list(list(TECHWEB_POINT_TYPE_GENERIC = points))
	station_techweb.add_point_list(list(TECHWEB_POINT_TYPE_NANITES = points))


/datum/nanite_program/deadchat
	name = "Otherworldly Programming"
	desc = "The nanites keep the host's brain in a constant state of near-death, causing strange yet vivid auditory hallucinations."
	use_rate = 0.6
	rogue_types = list(/datum/nanite_program/nerve_decay)

/datum/nanite_program/deadchat/enable_passive_effect()
	. = ..()
	host_mob.add_traits(list(TRAIT_SIXTHSENSE), TRAIT_NANITES)

/datum/nanite_program/deadchat/disable_passive_effect()
	. = ..()
	host_mob.remove_traits(list(TRAIT_SIXTHSENSE), TRAIT_NANITES)


/datum/nanite_program/monitoring
	name = "Monitoring"
	desc = "The nanites monitor the host's vitals and location, sending them to the suit sensor network.  Cannot function if the host isn't wearing a suit."
	rogue_types = list(/datum/nanite_program/toxic)

/datum/nanite_program/monitoring/enable_passive_effect()
	. = ..()
	SSnanites.nanite_monitored_mobs |= host_mob

/datum/nanite_program/monitoring/disable_passive_effect()
	. = ..()
	SSnanites.nanite_monitored_mobs -= host_mob
