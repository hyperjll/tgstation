/obj/item/implant/duster
	name = "duster implant"
	desc = "Hardly anything will be left of you when the dust settles."
	actions_types = null

/obj/item/implant/duster/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Robust Corp RX-77 Employee Management Implant<BR>
				<b>Life:</b> Activates upon death.<BR>
				<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
				<HR>
				<b>Implant Details:</b> Contains compact thermo-gravitational explosive device capable of vaporizing nearly everything around itself within seconds.<BR>
				<b>Function:</b> Reduces the host to virtually nothing.<BR>
				<b>Integrity:</b> Implant is destroyed shortly after activation."}
	return dat

/obj/item/implant/duster/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	for(var/target_implant in target.implants)
		if(istype(target_implant, /obj/item/implant/explosive))
			target.balloon_alert(user, "implant is incompatible!")
			return FALSE

	. = ..()

	if(.)
		RegisterSignal(target, COMSIG_LIVING_DEATH, PROC_REF(activate))

/obj/item/implant/duster/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(.)
		UnregisterSignal(target, COMSIG_LIVING_DEATH)

/obj/item/implant/duster/activate()
	. = ..()

	imp_in.dust(just_ash = TRUE, drop_items = FALSE, force = FALSE)

	qdel(src)


/obj/item/implant/area_restricted_duster
	name = "area-restricted duster implant"
	desc = "Hardly anything will be left of you when the dust settles."
	actions_types = null
	/// We will dust you if you somehow aren't in this kind of area.
	var/list/limited_areas = list()

/obj/item/implant/area_restricted_duster/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Robust Corp RX-77 Employee Management Implant<BR>
				<b>Life:</b> Activates upon death.<BR>
				<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
				<HR>
				<b>Implant Details:</b> Contains compact thermo-gravitational explosive device capable of vaporizing nearly everything around itself within seconds.<BR>
				<b>Function:</b> Reduces the host to virtually nothing.<BR>
				<b>Integrity:</b> Implant is destroyed shortly after activation."}
	return dat

/obj/item/implant/area_restricted_duster/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if (!.)
		return
	if(!length(limited_areas))
		return
	limit_areas()

/obj/item/implant/area_restricted_duster/removed(mob/target, silent, special)
	. = ..()
	imp_in.dust(just_ash = TRUE, drop_items = FALSE, force = FALSE)
	qdel(src)

/// Limit the owner to the specified area
/obj/item/implant/area_restricted_duster/proc/limit_areas()
	if (isnull(imp_in))
		qdel(src)
		return
	RegisterSignal(imp_in, COMSIG_ENTER_AREA, PROC_REF(check_area))
	check_area(imp_in)

/// Called when our implantee moves somewhere
/obj/item/implant/area_restricted_duster/proc/check_area(mob/living/source)
	SIGNAL_HANDLER
	if (!length(limited_areas))
		return
	if (is_type_in_list(get_area(source), limited_areas))
		return
	playsound(imp_in, 'sound/items/timer.ogg', 50, vary = FALSE)
	to_chat(imp_in, span_boldwarning("You've left your station! Return quickly or you'll be dusted!"))
	addtimer(CALLBACK(src, PROC_REF(check_area_deadly)), 5 SECONDS, TIMER_DELETE_ME)

/// After a grace period they're still not in the designated area, killing time
/obj/item/implant/area_restricted_duster/proc/check_area_deadly()
	if (isnull(imp_in))
		return
	var/area/our_area = get_area(imp_in)
	if (is_type_in_list(our_area, limited_areas))
		return
	log_combat(src, imp_in, "dusted due to out of bounds")
	imp_in.dust(just_ash = TRUE, drop_items = FALSE, force = FALSE)

/obj/item/implant/area_restricted_duster/syndicate_satellite
	limited_areas = list(/area/centcom/syndicate_mothership/syndicate_satellite)
