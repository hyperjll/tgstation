/obj/machinery/computer/apc_control/proc/try_hack_console(mob/living/hacker, duration = 30 SECONDS)
	if(!can_hack(hacker, feedback = TRUE))
		return FALSE

	AI_notify_hack()
	if(!do_after(hacker, duration, src, extra_checks = CALLBACK(src, PROC_REF(can_hack), hacker)))
		return FALSE

	hack_console(hacker)
	return TRUE

/// Checks if this console is hackable. Used as a callback during try_hack_console's doafter as well.
/obj/machinery/computer/apc_control/proc/can_hack(mob/living/hacker, feedback = FALSE)
	if(machine_stat & (NOPOWER|BROKEN))
		if(feedback && hacker)
			balloon_alert(hacker, "can't hack!")
		return FALSE
	var/area/console_area = get_area(src)
	if(!console_area || !(console_area.area_flags & VALID_TERRITORY))
		if(feedback && hacker)
			balloon_alert(hacker, "signal too weak!")
		return FALSE
	return TRUE

/obj/machinery/computer/apc_control/proc/hack_console(mob/living/hacker)
	force_event(/datum/round_event_control/grid_check, "apc console hack")

	message_admins("[ADMIN_LOOKUPFLW(hacker)] hacked a [name] located at [ADMIN_VERBOSEJMP(src)], resulting in a grid check!")
	hacker.log_message("hacked a power flow control console, resulting in a grid check.", LOG_GAME, log_globally = TRUE)
