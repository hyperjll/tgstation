/obj/machinery/vending/cola/proc/try_hack_vendor(mob/living/hacker, duration = 30 SECONDS)
	if(!can_hack(hacker, feedback = TRUE))
		return FALSE

	if(!do_after(hacker, duration, src, extra_checks = CALLBACK(src, PROC_REF(can_force_spike_drinks), hacker)))
		return FALSE

	spike_drinks(hacker)
	return TRUE

/// Checks if this vendor is hackable. Used as a callback during try_hack_console's doafter as well.
/obj/machinery/vending/cola/proc/can_force_spike_drinks(mob/living/hacker, feedback = FALSE)
	if(machine_stat & (NOPOWER|BROKEN))
		if(feedback && hacker)
			balloon_alert(hacker, "can't hack!")
		return FALSE
	var/area/console_area = get_area(src)
	if(!console_area || !(console_area.area_flags & VALID_TERRITORY))
		if(feedback && hacker)
			balloon_alert(hacker, "not worth it!")
		return FALSE
	return TRUE

/obj/machinery/vending/cola/proc/spike_drinks(mob/living/hacker)
	force_spiked_drinks = TRUE

	message_admins("[ADMIN_LOOKUPFLW(hacker)] hacked a [name] located at [ADMIN_VERBOSEJMP(src)], spiking it's drinks!")
	hacker.log_message("hacked a [name], spiking it's drinks.", LOG_GAME, log_globally = TRUE)


/obj/machinery/vending/cola/random
	name = "\improper Random Drinkies"
	icon_state = "random_cola"
	desc = "Uh oh!"

/obj/machinery/vending/cola/random/Initialize(mapload)
	..()
	var/T = pick(subtypesof(/obj/machinery/vending/cola) - /obj/machinery/vending/cola/random)
	new T(loc)
	return INITIALIZE_HINT_QDEL
