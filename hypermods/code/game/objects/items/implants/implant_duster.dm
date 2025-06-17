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
