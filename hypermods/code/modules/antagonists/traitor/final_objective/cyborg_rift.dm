/datum/traitor_objective/ultimate/cyborg_rift
	name = "Summon a rift for rogue cyborgs to infiltrate the station by calling a droppod down at %AREA%"
	description = "Go to %AREA%, and receive the rift payload. Find a location for your rift, \
	and plant the rift charge to bring forth your silicon invaders. The cyborgs SHOULD serve you, so go wild."

	//this is a prototype so this progression is for all basic level kill objectives

	///area type the objective owner must be in to receive the bomb
	var/area/rift_spawnarea_type
	///checker on whether we have sent the bomb yet.
	var/sent_item = FALSE

/datum/traitor_objective/ultimate/cyborg_rift/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	var/list/possible_areas = GLOB.the_station_areas.Copy()
	for(var/area/possible_area as anything in possible_areas)
		//remove areas too close to the destination, too obvious for our poor shmuck, or just unfair
		if(ispath(possible_area, /area/station/hallway) || ispath(possible_area, /area/station/security))
			possible_areas -= possible_area
	if(length(possible_areas) == 0)
		return FALSE
	rift_spawnarea_type = pick(possible_areas)
	replace_in_name("%AREA%", initial(rift_spawnarea_type.name))
	return TRUE

/datum/traitor_objective/ultimate/cyborg_rift/generate_ui_buttons(mob/user)
	var/list/buttons = list()
	if(!sent_item)
		buttons += add_ui_button("", "Pressing this will call down a pod with rift charge.", "beacon", "beacon")
	return buttons

/datum/traitor_objective/ultimate/cyborg_rift/ui_perform_action(mob/living/user, action)
	. = ..()
	switch(action)
		if("beacon")
			if(sent_item)
				return
			var/area/delivery_area = get_area(user)
			if(delivery_area.type != rift_spawnarea_type)
				to_chat(user, span_warning("You must be in [initial(rift_spawnarea_type.name)] to receive the rift charge."))
				return
			sent_item = TRUE
			podspawn(list(
				"target" = get_turf(user),
				"style" = /datum/pod_style/syndicate,
				"spawn" = /obj/item/grenade/c4/wormhole,
			))
