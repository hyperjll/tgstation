/obj/item/implant/empshield
	name = "EMP shield implant"
	desc = "An implant that completely protects from electro-magnetic pulses. It will shut down briefly if triggered too often."
	actions_types = null
	var/lastemp = 0
	var/numrecent = 0
	var/warning = TRUE
	var/overloadtimer = 10 SECONDS

/obj/item/implant/empshield/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	if(..())
		if(ishuman(target))
			target.AddElement(/datum/element/empprotection, EMP_PROTECT_SELF|EMP_PROTECT_CONTENTS)
			RegisterSignal(target, COMSIG_ATOM_EMP_ACT, PROC_REF(overloaded), target)
		return TRUE

/obj/item/implant/empshield/removed(mob/target, silent = FALSE, special = 0)
	if(..())
		if(ishuman(target))
			target.RemoveElement(/datum/element/empprotection, EMP_PROTECT_SELF|EMP_PROTECT_CONTENTS)
			UnregisterSignal(target, COMSIG_ATOM_EMP_ACT)
		return TRUE

/obj/item/implant/empshield/proc/overloaded(mob/living/target, severity)
	if(world.time - lastemp > overloadtimer)
		numrecent = 0
	numrecent += severity
	lastemp = world.time

	if(numrecent >= (5 * EMP_HEAVY) && ishuman(target))
		if(warning)
			to_chat(target, span_userdanger("You feel a twinge inside from your [src], you get the feeling it won't protect you anymore."))
			warning = FALSE
		target.RemoveElement(/datum/element/empprotection, EMP_PROTECT_SELF|EMP_PROTECT_CONTENTS)
		addtimer(CALLBACK(src, PROC_REF(refreshed), target), overloadtimer, TIMER_OVERRIDE | TIMER_UNIQUE)

/obj/item/implant/empshield/proc/refreshed(mob/living/target)
	to_chat(target, span_notice("A familiar feeling resonates from your [src], it seems to be functioning properly again."))
	warning = TRUE
	if(ishuman(target))
		target.AddElement(/datum/element/empprotection, EMP_PROTECT_SELF|EMP_PROTECT_CONTENTS)

/obj/item/implant/empshield/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Cybersun Industries EMP-Shield Implant<BR>
				<b>Life:</b> Unknown<BR>
				<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
				<HR>
				<b>Implant Details:</b> Subjects injected with implant are rendered immune to E.M.P's.<BR>
				<b>Function:</b> Shields the user from EMP's.<BR>
				<b>Integrity:</b> Implant can be used multiple times, but continuous EMP blasts can neutralize this implant temporarily."}
	return dat

/obj/item/implanter/empshield
	name = "implanter (EMP shield)"
	imp_type = /obj/item/implant/empshield


/obj/item/implanter/weapons_auth
	name = "implanter (weapon authentication)"
	imp_type = /obj/item/implant/weapons_auth


/obj/item/implanter/adrenalin
	name = "implanter (adrenalin)"
	imp_type = /obj/item/implant/adrenalin

/obj/item/implant/adrenalin
	name = "adrenal implant"
	desc = "Removes all stuns."
	icon_state = "adrenal"
	uses = 3

/obj/item/implant/adrenalin/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Cybersun Industries Adrenaline Implant<BR>
				<b>Life:</b> Five days.<BR>
				<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
				<HR>
				<b>Implant Details:</b> Subjects injected with implant can activate an injection of medical cocktails.<BR>
				<b>Function:</b> Removes stuns, increases speed, and has a mild healing effect.<BR>
				<b>Integrity:</b> Implant can only be used three times before reserves are depleted."}
	return dat

/obj/item/implant/adrenalin/activate()
	. = ..()
	uses--
	to_chat(imp_in, span_notice("You feel a sudden surge of energy!"))
	imp_in.SetStun(0)
	imp_in.SetKnockdown(0)
	imp_in.SetUnconscious(0)
	imp_in.SetParalyzed(0)
	imp_in.SetImmobilized(0)
	imp_in.adjustStaminaLoss(-75)
	imp_in.set_resting(FALSE)

	imp_in.reagents.add_reagent(/datum/reagent/medicine/synaptizine, 10)
	imp_in.reagents.add_reagent(/datum/reagent/medicine/omnizine, 10)
	imp_in.reagents.add_reagent(/datum/reagent/medicine/stimulants, 10)
	if(!uses)
		qdel(src)


/obj/item/implanter/scram
	name = "implanter (scram)"
	imp_type = /obj/item/implant/scram

/obj/item/implant/scram
	name = "scram implant"
	desc = "Teleports the user."
	icon = 'icons/effects/effects.dmi'
	icon_state = "shield1"
	uses = 2

/obj/item/implant/scram/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Hyper Foundation Scram Implant<BR>
				<b>Life:</b> Unknown.<BR>
				<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
				<HR>
				<b>Implant Details:</b> Subjects injected with implant can harness bluespace energies to teleport.<BR>
				<b>Function:</b> Teleports the implantee somewhere nearby, though it can locate a safe location to teleport to in case of emergencies.<BR>
				<b>Integrity:</b> Implant can only be used two times before it's circuitry is too damaged to continue operations."}
	return dat

/obj/item/implant/scram/activate()
	. = ..()
	uses--
	var/healthlossed = 0
	healthlossed = (imp_in.getBruteLoss() + imp_in.getFireLoss() + imp_in.getToxLoss())

	if((imp_in.getMaxHealth() / 4) < healthlossed) // Do you have a quarter of your health left or under?
		do_sparks(5,FALSE,imp_in)
		var/F = find_safe_turf(zlevel = imp_in.z, extended_safety_checks = TRUE)
		var/range = 0
		if(!F)
			do_sparks(5,FALSE,imp_in)
			do_teleport(imp_in, get_turf(imp_in), 24, asoundin = 'sound/effects/phasein.ogg', channel = TELEPORT_CHANNEL_BLUESPACE) // Double the range if no safe turf
			to_chat(imp_in, span_warning("You feel reality warp erratically as you're displaced!"))
		if(F)
			do_sparks(5,FALSE,imp_in)
			to_chat(imp_in, span_warning("You feel reality warp around you as you're teleported somewhere safe!"))
			do_teleport(imp_in, F, range, channel = TELEPORT_CHANNEL_BLUESPACE)
	else
		do_sparks(5,FALSE,imp_in)
		to_chat(imp_in, span_notice("You feel reality warp around you as you're teleported!"))
		do_teleport(imp_in, get_turf(imp_in), 12, asoundin = 'sound/effects/phasein.ogg', channel = TELEPORT_CHANNEL_BLUESPACE)

	if(!uses)
		qdel(src)


/obj/item/implant/radio/binary
	desc = "This world is MINE. I AM GOD HERE."
	radio_key = /obj/item/encryptionkey/binary
	subspace_transmission = TRUE

/obj/item/implanter/radio/binary
	name = "implanter (binary translating radio)"
	imp_type = /obj/item/implant/radio/binary
