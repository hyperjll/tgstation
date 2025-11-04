/// Begin the process of hacking into the bank machine to put the station into debt.
/obj/machinery/computer/bank_machine/proc/try_hack_console(mob/living/hacker, duration = 30 SECONDS)
	if(!can_hack(hacker, feedback = TRUE))
		return FALSE

	AI_notify_hack()
	if(!do_after(hacker, duration, src, extra_checks = CALLBACK(src, PROC_REF(can_hack), hacker)))
		return FALSE

	hack_console(hacker)
	return TRUE

/// Checks if this console is hackable. Used as a callback during try_hack_console's doafter as well.
/obj/machinery/computer/bank_machine/proc/can_hack(mob/living/hacker, feedback = FALSE)
	if(machine_stat & (NOPOWER|BROKEN))
		if(feedback && hacker)
			balloon_alert(hacker, "can't hack!")
		return FALSE
	var/area/console_area = get_area(src)
	if(!console_area || !istype(console_area, /area/station/command/vault))
		if(feedback && hacker)
			balloon_alert(hacker, "bank machine must be within the vault!")
		return FALSE
	return TRUE

/obj/machinery/computer/bank_machine/proc/hack_console(mob/living/hacker)
	var/steal_amount = synced_bank_account.account_balance
	var/debt_amount = rand(1000, 4000) // OOF
	synced_bank_account.adjust_money(-steal_amount)
	synced_bank_account.account_debt = debt_amount

	message_admins("[ADMIN_LOOKUPFLW(hacker)] hacked a [name] located at [ADMIN_VERBOSEJMP(src)], resulting in the station going into crippling debt!")
	hacker.log_message("hacked a bank machine, resulting in student debt, except it's a station.", LOG_GAME, log_globally = TRUE)

	priority_announce(
		"Attention crew: Our financial consultants have reported a sudden, massive loss in our coffers as a result of recent actions taken on your end. We'll be sticking you with the bill, have a good shift.",
		"[command_name()] High-Priority Update",
	)

