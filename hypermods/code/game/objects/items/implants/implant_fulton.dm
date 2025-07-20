/obj/item/implant/fulton_recovery
	name = "fulton recovery implant"
	desc = "Hardly anything will be left of you when the dust settles."
	icon = 'icons/obj/fulton.dmi'
	icon_state = "extraction_pack"
	var/chosen_area_turf = null
	var/obj/item/extraction_pack/non_contractor/inf_use/our_fulton

/obj/item/implant/fulton_recovery/Initialize(mapload)
	. = ..()
	our_fulton = new(src)
	our_fulton.attach_time = 0 SECONDS

/obj/item/implant/fulton_recovery/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Corpse Retrieval and Transportation Implant C.R.T.I<BR>
				<b>Life:</b> Activates upon death after selecting a location for corpse recovery.<BR>
				<b>Important Notes:</b> <font color='red'>Borderline Illegal</font><BR>
				<HR>
				<b>Implant Details:</b> Contains a pocket of bluespace with a fulton extraction pack within ready for deployment.<BR>
				<b>Function:</b> Transports the host to a pre-designated location after death.<BR>
				<b>Integrity:</b> Implant is stable and re-usable."}
	return dat

/obj/item/implant/fulton_recovery/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(.)
		RegisterSignal(target, COMSIG_LIVING_DEATH, PROC_REF(activate))

/obj/item/implant/fulton_recovery/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(.)
		UnregisterSignal(target, COMSIG_LIVING_DEATH)

/obj/item/implant/fulton_recovery/activate()
	. = ..()
	if(isnull(chosen_area_turf))
		if(imp_in.stat == DEAD) // prevent accidental location assigns
			balloon_alert(imp_in, "fulton location wasn't set.")
			return
		chosen_area_turf = get_turf(imp_in)

		our_fulton.beacon_ref = WEAKREF(chosen_area_turf)
		balloon_alert(imp_in, "linked to current location!")
	else
		var/mob/living/carbon/human/carbon_imp_in = imp_in
		if(carbon_imp_in.stat == DEAD)
			our_fulton.interact_with_atom(carbon_imp_in, imp_in)
		else
			balloon_alert(carbon_imp_in, "only activates when dead!")

/obj/item/implanter/fulton_recovery
	name = "implanter (fulton recovery)"
	imp_type = /obj/item/implant/fulton_recovery

/obj/item/implanter/fulton_recovery/syndi
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "simplanter0"
	base_icon_state = "simplanter"

/obj/item/implantcase/fulton_recovery
	name = "Implant Case - 'Fulton Recovery'"
	desc = "A glass case containing a fulton recovery implant."
	imp_type = /obj/item/implant/fulton_recovery
