/mob/living/silicon/pai/syndicate/ui_static_data(mob/user)
	var/list/data = list()
	data["available"] = available_syndicate_software // Get our custom list.
	data["directives"] = laws.supplied
	data["emagged"] = emagged
	data["languages"] = languages_granted
	data["master_name"] = master_name
	data["master_dna"] = master_dna
	return data

/mob/living/silicon/pai/syndicate/buy_software(selection)
	if(!available_syndicate_software[selection] || installed_software.Find(selection))
		return FALSE
	var/cost = available_syndicate_software[selection] // Making sure our new costs are enforced
	if(ram < cost)
		return FALSE
	installed_software.Add(selection)
	ram -= cost
	var/datum/hud/pai/pAIhud = hud_used
	pAIhud?.update_software_buttons()
	switch(selection)
		if("Atmospheric Sensor")
			atmos_analyzer = new(src)
		if("Digital Messenger")
			create_modularInterface()
		if("Internal GPS")
			internal_gps = new(src)
		if("Music Synthesizer")
			instrument = new(src)
		if("Newscaster")
			newscaster = new(src)
		if("Photography Module")
			aicamera = new /obj/item/camera/siliconcam/pai_camera(src)
		if("Remote Signaler")
			signaler = new(src)
	return TRUE

/mob/living/silicon/pai/syndicate/ui_act(action, list/params, datum/tgui/ui)
	. = ..()
	if(.)
		return TRUE
	if(action == "buy")
		buy_software(params["selection"])
		return TRUE
	if(action == "change image")
		change_image()
		return TRUE
	if(action == "check dna")
		check_dna()
		return TRUE
	// Software related ui actions
	if(available_software[action] && !installed_software.Find(action))
		balloon_alert(ui.user, "software unavailable!")
		return FALSE
	switch(action)
		if("Atmospheric Sensor")
			atmos_analyzer.attack_self(src)
			return TRUE
		if("Crew Manifest")
			ai_roster()
			return TRUE
		if("Crew Monitor")
			GLOB.crewmonitor.show(usr, src)
			return TRUE
		if("Digital Messenger")
			modularInterface?.interact(usr)
			return TRUE
		if("Door Jack")
			// Look to door_jack.dm for implementation
			door_jack(params["mode"])
			return TRUE
		if("Encryption Slot")
			balloon_alert(usr, "radio frequencies [!encrypt_mod ? "enabled" : "disabled"]")
			encrypt_mod = !encrypt_mod
			radio.subspace_transmission = !radio.subspace_transmission
			return TRUE
		if("Host Scan")
			host_scan(params["mode"])
			return TRUE
		if("Internal GPS")
			internal_gps.attack_self(src)
			return TRUE
		if("Music Synthesizer")
			instrument.interact(src)
			return TRUE
		if("Medical HUD")
			toggle_hud(PAI_TOGGLE_MEDICAL_HUD)
			return TRUE
		if("Newscaster")
			newscaster.ui_interact(src)
			return TRUE
		if("Photography Module")
			// Look to pai_camera.dm for implementation
			use_camera(usr, params["mode"])
			return TRUE
		if("Remote Signaler")
			signaler.ui_interact(src)
			return TRUE
		if("Security HUD")
			toggle_hud(PAI_TOGGLE_SECURITY_HUD)
			return TRUE
		if("Universal Translator")
			grant_languages()
			ui.send_full_update()
			return TRUE
		if("Host Repair")
			if(!host_repairing)
				host_repair()
				return TRUE
			else
				balloon_alert(usr, "Already active!")
				return FALSE
		if("Martyrdom")
			martyrdom()
			return TRUE
		if("Scram Pulse")
			scrampulse()
			return TRUE
		if("Antiviral")
			spaceacillin()
			return TRUE
		if("Stimulate")
			stimulate()
			return TRUE
		if("Thermal Sensors")
			thermalsensors()
			return TRUE
		if("Empulse")
			empblast()
			return TRUE
	return FALSE

/mob/living/silicon/pai/syndicate/proc/host_repair()
	var/mob/living/target = get_holder()

	if(target)
		target.adjustToxLoss(-0.1, FALSE)
		target.adjustOxyLoss(-0.1, FALSE)
		target.adjustBruteLoss(-0.1, FALSE)
		target.adjustFireLoss(-0.1, FALSE)
		target.updatehealth()
		host_repairing = TRUE
		addtimer(CALLBACK(src, PROC_REF(host_repair)), 1 SECONDS)
	else
		host_repairing = FALSE
		balloon_alert(usr, "Host Repair disabled!")

/mob/living/silicon/pai/syndicate/proc/martyrdom()
	src.visible_message(span_warning("[src] starts beeping ominously!"))
	notify_ghosts(
		"[src] is about to become a Martyr!",
		source = src,
		header = "Tick Tick Tick...",
		notify_flags = NOTIFY_CATEGORY_NOFLASH,
		ghost_sound = 'sound/machines/warning-buzzer.ogg',
		notify_volume = 75,
	)

	var/bomb_beeps_until_boom = 3
	while(bomb_beeps_until_boom > 0)
		//for extra spice
		var/beep_volume = 40
		playsound(loc, 'sound/items/timer.ogg', beep_volume, vary = FALSE)
		sleep(1 SECONDS)
		bomb_beeps_until_boom--
		beep_volume += 20
	if(bomb_beeps_until_boom == 0)
		explosion(src, 0, 2, 8, flame_range = 2)
		qdel(src)

/mob/living/silicon/pai/syndicate/proc/scrampulse()
	if(world.time < scrampulse_cooldown)
		usr.visible_message(span_danger("Your internal spacial destabilizer is still recharging!"))
		balloon_alert(usr, "On Cooldown!")
		return

	var/mob/living/target = get_holder()

	if(target)
		do_teleport(target, get_turf(src), 5, asoundin = 'sound/effects/phasein.ogg', channel = TELEPORT_CHANNEL_BLUESPACE)
		scrampulse_cooldown = (world.time + 120 SECONDS)
	else
		balloon_alert(usr, "No holder!")

/mob/living/silicon/pai/syndicate/proc/spaceacillin()
	if(world.time < chemsynth_cooldown)
		usr.visible_message(span_danger("Your internal chemical synthesizer is still recharging!"))
		balloon_alert(usr, "On Cooldown!")
		return

	var/mob/living/target = get_holder()

	if(target)
		target.reagents.add_reagent(/datum/reagent/medicine/spaceacillin, 1)
		to_chat(usr, span_notice("You inject [target] with antiviral chemicals!"))
		chemsynth_cooldown = (world.time + 60 SECONDS)
	else
		balloon_alert(usr, "No holder!")

/mob/living/silicon/pai/syndicate/proc/stimulate()
	if(world.time < chemsynth_cooldown)
		usr.visible_message(span_danger("Your internal chemical synthesizer is still recharging!"))
		balloon_alert(usr, "On Cooldown!")
		return

	var/mob/living/target = get_holder()

	if(target)
		target.reagents.add_reagent(/datum/reagent/medicine/stimulants, 3)
		to_chat(usr, span_notice("You inject [target] with stimulating chemicals!"))
		chemsynth_cooldown = (world.time + 60 SECONDS)
	else
		balloon_alert(usr, "No holder!")

/mob/living/silicon/pai/syndicate/proc/thermalsensors()
	if(!thermalVision)
		add_sight(SEE_TURFS|SEE_MOBS)
		thermalVision = TRUE
		to_chat(usr, span_notice("You notice shapes within the walls!"))
	else
		clear_sight(SEE_TURFS|SEE_MOBS)
		thermalVision = FALSE
		to_chat(usr, span_notice("Your turn off your thermal sensors."))

/mob/living/silicon/pai/syndicate/proc/empblast()
	if(world.time < empblast_cooldown)
		usr.visible_message(span_danger("Your internal electromagnetic coil is still recharging!"))
		balloon_alert(usr, "On Cooldown!")
		return

	empulse(src, 0, 4)
	empblast_cooldown = (world.time + 80 SECONDS)
