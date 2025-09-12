/obj/item/implant/radar
	name = "radar implant"
	desc = "An implant designed to pinpoint people nearby using their suit sensors."
	//actions_types = null
	icon = 'icons/obj/devices/tracker.dmi'
	icon_state = "pinpointer_crew"
	var/atom/movable/target
	var/ignore_suit_sensor_level = TRUE
	var/ignore_trackable = FALSE

/obj/item/implant/radar/activate()
	. = ..()
	var/mob/living/carbon/carbon_imp_in = imp_in
	var/list/name_counts = list()
	var/list/names = list()

	for(var/i in GLOB.human_list)
		var/mob/living/carbon/human/H = i
		if(!trackable(H) && !ignore_trackable)
			continue

		var/crewmember_name = "Unknown"
		if(H.wear_id)
			var/obj/item/card/id/I = H.wear_id.GetID()
			if(I?.registered_name)
				crewmember_name = I.registered_name

		while(crewmember_name in name_counts)
			name_counts[crewmember_name]++
			crewmember_name = "[crewmember_name] ([name_counts[crewmember_name]])"
		names[crewmember_name] = H
		name_counts[crewmember_name] = 1

	if(!length(names))
		carbon_imp_in.balloon_alert(carbon_imp_in, "no signals!")
		return
	var/pinpoint_target = tgui_input_list(carbon_imp_in, "Person to find", "Radar", sort_list(names))
	if(isnull(pinpoint_target))
		return
	if(isnull(names[pinpoint_target]))
		return
	if(QDELETED(src) || !carbon_imp_in || carbon_imp_in.incapacitated)
		return

	target = names[pinpoint_target]

	carbon_imp_in.balloon_alert(carbon_imp_in, "at [get_area_name(target)].")

	var/dist = get_dist(src, target)
	var/dir = get_dir(carbon_imp_in, target)
	var/arrow_color

	switch(dist)
		if (0)
			return
		if(1 to 5)
			arrow_color = COLOR_GREEN
		if(6 to 10)
			arrow_color = COLOR_YELLOW
		if(11 to 15)
			arrow_color = COLOR_ORANGE
		else
			arrow_color = COLOR_RED

	var/datum/hud/user_hud = carbon_imp_in.hud_used
	if(!user_hud || !istype(user_hud, /datum/hud) || !islist(user_hud.infodisplay))
		return

	var/atom/movable/screen/multitool_arrow/arrow = new(null, user_hud)
	arrow.color = arrow_color
	arrow.screen_loc = around_player
	arrow.transform = matrix(dir2angle(dir), MATRIX_ROTATE)

	user_hud.infodisplay += arrow
	user_hud.show_hud(user_hud.hud_version)

	QDEL_IN(arrow, 1.5 SECONDS)

/obj/item/implant/radar/proc/trackable(mob/living/carbon/human/H)
	var/turf/here = get_turf(src)
	var/turf/there = get_turf(H)
	if(here && there && (there.z == here.z || (is_station_level(here.z) && is_station_level(there.z)))) // Device and target should be on the same level or different levels of the same station
		if (istype(H.w_uniform, /obj/item/clothing/under))
			var/obj/item/clothing/under/U = H.w_uniform
			if(U.has_sensor && (U.sensor_mode >= SENSOR_COORDS || ignore_suit_sensor_level)) // Suit sensors must be on maximum or a contractor pinpointer
				return TRUE
	return FALSE

/obj/item/implant/radar/super
	name = "radar implant"
	desc = "An implant designed to locate any and all lifeforms by connecting to our experimental life-scanner array."
	ignore_trackable = TRUE


/obj/item/implant/crewmonitor
	name = "crew monitor implant"
	desc = "An implant designed to hack into suit sensor networks for easy access to the host."
	//actions_types = null
	icon = 'icons/obj/devices/scanner.dmi'
	icon_state = "crew_monitor"

/obj/item/implant/crewmonitor/activate()
	GLOB.crewmonitor.show(imp_in,src)


/obj/item/implanter/radar
	name = "implanter (radar)"
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "simplanter0"
	base_icon_state = "simplanter"
	imp_type = /obj/item/implant/radar

/obj/item/implantcase/radar
	name = "Implant Case - 'Radar'"
	desc = "A glass case containing a radar implant."
	imp_type = /obj/item/implant/radar

/obj/item/implanter/radar/super
	name = "implanter (radar array)"
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "simplanter0"
	base_icon_state = "simplanter"
	imp_type = /obj/item/implant/radar/super

/obj/item/implanter/crewmonitor
	name = "implanter (crew monitor)"
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "simplanter0"
	base_icon_state = "simplanter"
	imp_type = /obj/item/implant/crewmonitor

/obj/item/implantcase/crewmonitor
	name = "Implant Case - 'Crew Monitor'"
	desc = "A glass case containing a crew monitor implant."
	imp_type = /obj/item/implant/crewmonitor
