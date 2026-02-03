/obj/item/station_announcer
	name = "station announcer"
	desc = "A basic handheld radio that communicates with local telecommunication networks and announces encrypted messages broadly."
	icon = 'icons/obj/devices/voice.dmi'
	icon_state = "walkietalkie"
	inhand_icon_state = "walkietalkie"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	worn_icon_state = "radio"
	pickup_sound = SFX_GENERIC_DEVICE_PICKUP
	drop_sound = SFX_GENERIC_DEVICE_DROP

	obj_flags = CONDUCTS_ELECTRICITY
	slot_flags = ITEM_SLOT_BELT
	throw_speed = 3
	throw_range = 7
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT * 0.75, /datum/material/glass=SMALL_MATERIAL_AMOUNT * 0.25)
	COOLDOWN_DECLARE(announcer_cd)
	/// How long between announcements?
	var/cooldowndur = 2 MINUTES

/obj/item/station_announcer/attack_self(mob/living/carbon/user)
	if(!user)
		return

	if(!COOLDOWN_FINISHED(src, announcer_cd))
		balloon_alert(user, "on cooldown!")
		return

	if(!IS_TRAITOR(user))
		to_chat(user, span_danger("You attempt to utilize the announcer, but can't figure out the controls!"))
		return

	var/announcement_title = tgui_input_text(user,
		"What's the title of the announcement? This is NOT the name of Central Command.",
		"Announcement Title",
		max_length = 40,
	)

	if(!announcement_title)
		return

	var/announcement_message = tgui_input_text(user,
		"What message are you trying to announce?",
		"Announcement Message",
		max_length = MAX_MESSAGE_LEN,
	)

	if(!announcement_message)
		return

	var/report_option = alert(user, "Do you want it to be a classified message or announcement?", "Print Command Report", "Classified Message", "Announcement")
	switch(report_option)
		if("Classified Message")
			print_command_report("[announcement_message]", "[announcement_title]", TRUE)

		if("Announcement")
			var/announcement_sounds = list(
				'sound/announcer/notice/notice1.ogg',
				'sound/announcer/notice/notice2.ogg',
				'sound/announcer/notice/notice3.ogg',
			)
			var/announcement_sound = tgui_input_list(
				user,
				"Select the announcement sound to be played.",
				"Announcement Sound Selector",
				announcement_sounds,
			)

			if(!announcement_sound)
				return

			priority_announce("[announcement_message]", "[announcement_title]", announcement_sound)

	COOLDOWN_START(src, announcer_cd, cooldowndur)
