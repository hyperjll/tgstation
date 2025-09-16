/// Begin the process of hacking.
/obj/machinery/vending/proc/try_hack(mob/living/hacker, duration = 30 SECONDS)
	if(!can_hack(hacker, feedback = TRUE))
		return FALSE

	if(!do_after(hacker, duration, src, extra_checks = CALLBACK(src, PROC_REF(can_hack), hacker)))
		return FALSE

	addtimer(CALLBACK(src, PROC_REF(hack_me)), 60 SECONDS)

	screwdrivable = FALSE // prevent cheese by just dissembling it to prevent being caught.

	message_admins("[ADMIN_LOOKUPFLW(hacker)] hacked a [name] located at [ADMIN_VERBOSEJMP(src)], causing the vending machine to become hostile!")
	hacker.log_message("hacked a [name] causing it become hostile.", LOG_GAME, log_globally = TRUE)

	return TRUE

/// Checks if this is hackable. Used as a callback during try_hack's doafter as well.
/obj/machinery/vending/proc/can_hack(mob/living/hacker, feedback = FALSE)
	if(machine_stat & (NOPOWER|BROKEN))
		if(feedback && hacker)
			balloon_alert(hacker, "can't hack!")
		return FALSE

	var/area/target_area = get_area(src)

	if(!target_area || !istype(target_area, /area/station) || target_area.outdoors)
		if(feedback && hacker)
			balloon_alert(hacker, "Must be on station!")
		return FALSE

	return TRUE

/obj/machinery/vending/proc/hack_me(mob/living/hacker)
	src.ai_controller = new /datum/ai_controller/vending_machine(src)
