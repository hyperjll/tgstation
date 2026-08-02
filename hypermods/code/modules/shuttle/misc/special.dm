/obj/machinery/scanner_gate/toll_booth
	name = "toll booth"
	density = FALSE // Trying not to block shit, we'll handle passage at CanAllowThrough()
	locked = TRUE
	use_power = NO_POWER_USE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	speech_span = SPAN_ROBOT
	var/threshold = 500
	var/static/list/approved_passengers = list()
	var/static/list/check_times = list()
	var/list/payees = list()
	// Are we going to clear the approved passengers list soon?
	var/clearing_approved = FALSE

/obj/machinery/scanner_gate/toll_booth/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()

	if(mover in approved_passengers)
		set_scanline("scanning", 10)
		if(isvehicle(mover))
			var/obj/vehicle/vehicle = mover
			for(var/mob/living/rat in vehicle.occupants)
				if(!(rat in approved_passengers))
					say("Stowaway detected. Please exit the vehicle first.")
					return FALSE
		return TRUE
	if(isitem(mover))
		return TRUE
	if(isstructure(mover))
		var/obj/structure/struct = mover
		for(var/mob/living/rat in struct.contents)
			say("Stowaway detected. Preventing entry until stowaway is removed.")
			return FALSE
		return TRUE

	return FALSE

/obj/machinery/scanner_gate/toll_booth/auto_scan(atom/movable/AM)
	return

/obj/machinery/scanner_gate/toll_booth/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	return NONE

/obj/machinery/scanner_gate/toll_booth/emag_act(mob/user, obj/item/card/emag/emag_card)
	return FALSE

#define LUXURY_MESSAGE_COOLDOWN 100
/obj/machinery/scanner_gate/toll_booth/Bumped(atom/movable/AM)
	///If the atom entering the gate is a vehicle, we store it here to add to the approved list to enter/leave the scanner gate.
	var/obj/vehicle/vehicle
	///We store the driver of vehicles separately so that we can add them to the approved list once payment is fully processed.
	var/mob/living/driver_holdout
	if(!isliving(AM) && !isvehicle(AM))
		alarm_beep()
		return ..()

	var/datum/bank_account/account
	if(istype(AM.pulling, /obj/item/card/id))
		var/obj/item/card/id/I = AM.pulling
		if(I.registered_account)
			account = I.registered_account
		else if(!check_times[AM] || check_times[AM] < world.time) //Let's not spam the message
			to_chat(AM, span_notice("This ID card doesn't have an owner associated with it!"))
			check_times[AM] = world.time + LUXURY_MESSAGE_COOLDOWN
	else if(isliving(AM))
		var/mob/living/L = AM
		account = L.get_bank_account()

	else if(isvehicle(AM))
		vehicle = AM
		for(var/passenger in vehicle.occupants)
			if(!isliving(passenger))
				continue
			var/mob/living/rider = passenger
			if(vehicle.is_driver(rider))
				driver_holdout = rider
				var/obj/item/card/id/id = rider.get_idcard(TRUE)
				account = id?.registered_account
				break

	if(account)
		if(account.account_balance < threshold - payees[AM])
			account.adjust_money(-account.account_balance, "Toll Booth: Passage Fee")
			payees[AM] += account.account_balance
		else
			var/money_owed = threshold - payees[AM]
			account.adjust_money(-money_owed, "Toll Booth: Partial Passage Fee")
			payees[AM] += money_owed

	//Here is all the possible paygate payment methods.
	var/list/counted_money = list()
	for(var/obj/item/coin/C in AM.get_all_contents()) //Coins.
		if(payees[AM] >= threshold)
			break
		payees[AM] += C.value
		counted_money += C
	for(var/obj/item/stack/spacecash/S in AM.get_all_contents()) //Paper Cash
		if(payees[AM] >= threshold)
			break
		payees[AM] += S.value * S.amount
		counted_money += S
	for(var/obj/item/holochip/H in AM.get_all_contents()) //Holocredits
		if(payees[AM] >= threshold)
			break
		payees[AM] += H.credits
		counted_money += H

	if(payees[AM] < threshold && istype(AM.pulling, /obj/item/coin)) //Coins(Pulled).
		var/obj/item/coin/C = AM.pulling
		payees[AM] += C.value
		counted_money += C

	else if(payees[AM] < threshold && istype(AM.pulling, /obj/item/stack/spacecash)) //Cash(Pulled).
		var/obj/item/stack/spacecash/S = AM.pulling
		payees[AM] += S.value * S.amount
		counted_money += S

	else if(payees[AM] < threshold && istype(AM.pulling, /obj/item/holochip)) //Holocredits(pulled).
		var/obj/item/holochip/H = AM.pulling
		payees[AM] += H.credits
		counted_money += H

	if(payees[AM] < threshold) //Suggestions for those with no arms/simple animals.
		var/armless
		if(!ishuman(AM) && !isslime(AM))
			armless = TRUE
		else
			var/mob/living/carbon/human/H = AM
			if(!H.get_bodypart(BODY_ZONE_L_ARM) && !H.get_bodypart(BODY_ZONE_R_ARM))
				armless = TRUE

		if(armless)
			if(!AM.pulling || !iscash(AM.pulling) && !istype(AM.pulling, /obj/item/card/id))
				if(!check_times[AM] || check_times[AM] < world.time) //Let's not spam the message
					to_chat(AM, span_notice("Try pulling a valid ID, space cash, holochip or coin into \the [src]!"))
					check_times[AM] = world.time + LUXURY_MESSAGE_COOLDOWN

	if(payees[AM] >= threshold)
		for(var/obj/I in counted_money)
			qdel(I)
		payees[AM] -= threshold

		var/change = FALSE
		if(payees[AM] > 0)
			change = TRUE
			var/obj/item/holochip/holocred = new /obj/item/holochip(AM.loc, payees[AM]) //Change is made in holocredits exclusively.
			if(ishuman(AM))
				var/mob/living/carbon/human/H = AM
				if(!H.put_in_hands(holocred))
					AM.pulling = holocred
			else
				AM.pulling = holocred
			payees[AM] -= payees[AM]

		if(!clearing_approved)
			clearing_approved = TRUE
			addtimer(CALLBACK(src, PROC_REF(clear_approved_list)), 3 MINUTES)

		say("Thanks for paying the toll, [driver_holdout ? "[driver_holdout]" : "[AM]" ]![change ? " Here is your change." : ""]")
		approved_passengers |= AM
		if(vehicle)
			approved_passengers |= vehicle
		if(driver_holdout)
			approved_passengers |= driver_holdout

		check_times -= AM
		return
	else if (payees[AM] > 0)
		for(var/obj/I in counted_money)
			qdel(I)
		if(!check_times[AM] || check_times[AM] < world.time) //Let's not spam the message
			to_chat(AM, span_notice("[payees[AM]] [MONEY_SYMBOL] received. You need [threshold-payees[AM]] [MONEY_SYMBOL] more."))
			check_times[AM] = world.time + LUXURY_MESSAGE_COOLDOWN
		alarm_beep()
		return ..()
	else
		alarm_beep()
		return ..()

/obj/machinery/scanner_gate/toll_booth/proc/clear_approved_list()
	for(var/mob/living/approved_person in approved_passengers)
		approved_passengers -= approved_person
	say("Approved List has been cleared.")
	clearing_approved = FALSE
	return
