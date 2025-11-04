/obj/machinery/computer/upload/ai/proc/try_hack_console(mob/living/hacker, duration = 30 SECONDS)
	if(!can_hack(hacker, feedback = TRUE))
		return FALSE

	if(!do_after(hacker, duration, src, extra_checks = CALLBACK(src, PROC_REF(can_hack), hacker)))
		return FALSE

	hack_console(hacker)
	return TRUE

/// Checks if this console is hackable. Used as a callback during try_hack_console's doafter as well.
/obj/machinery/computer/upload/ai/proc/can_hack(mob/living/hacker, feedback = FALSE)
	if(machine_stat & (NOPOWER|BROKEN))
		if(feedback && hacker)
			balloon_alert(hacker, "can't hack!")
		return FALSE
	var/area/console_area = get_area(src)
	if(!console_area || !istype(console_area, /area/station/ai/upload/chamber))
		if(feedback && hacker)
			balloon_alert(hacker, "must be in the ai upload chamber!")
		return FALSE
	return TRUE

/obj/machinery/computer/upload/ai/proc/hack_console(mob/living/hacker)
	for(var/obj/machinery/door/locked_down as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/door))
		if(QDELETED(locked_down) || !is_station_level(locked_down.z))
			continue
		INVOKE_ASYNC(locked_down, TYPE_PROC_REF(/obj/machinery/door, hostile_lockdown), hacker)
		CHECK_TICK

	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(_malf_ai_undo_lockdown)), 90 SECONDS)

	var/obj/machinery/computer/communications/random_comms_console = locate() in GLOB.shuttle_caller_list
	random_comms_console?.post_status("alert", "lockdown")

	minor_announce("Hostile runtime detected in door controllers. Isolation lockdown protocols are now in effect. Please remain calm.", "Network Alert:", TRUE)
	to_chat(hacker, span_danger("Lockdown initiated. Network reset in 90 seconds."))
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(minor_announce),
		"Automatic system reboot complete. Have a secure day.",
		"Network reset:"), 90 SECONDS)

	message_admins("[ADMIN_LOOKUPFLW(hacker)] hacked a [name] located at [ADMIN_VERBOSEJMP(src)], resulting in a station-wide lockdown!")
	hacker.log_message("hacked an ai upload console, resulting in a station-wide lockdown.", LOG_GAME, log_globally = TRUE)
