/datum/action/item_action/chemstorage
	name = "Activate Chemical Storage Implant"

/obj/item/implant/syndiechem
	name = "Chemical Storage Implant"
	desc = "Stores chemicals within for body for later activation."
	icon = 'icons/hud/implants.dmi'
	icon_state = "chemicalstore"
	actions_types = list(/datum/action/item_action/activate_injector)

/obj/item/implant/syndiechem/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Syndicate Chemical Storage Implant<BR>
				<b>Life:</b> Persists even after death.<BR>
				<b>Important Notes: While it isn't likely, it's wise to proceed caution as some people enjoy turning themselves into bombs.
				Regardless, most people prefer loading these with useful chemicals.</B><BR>
				<HR>
				<b>Implant Details:</b><BR>
				<b>Function:</b> Contains a small capsule that can contain various chemicals. Upon receiving a neural signal,<BR>
				the implant releases the chemicals directly into the blood stream.<BR>
				<b>Special Features:</b>
				<i>Micro-Capsule</i>- Can be loaded with any sort of chemical agent via the common syringe and can hold 50 units.<BR>
				Can only be loaded while still in its original case.<BR>
				<b>Integrity:</b> Implant will last regardless if the subject is alive or dead."}
	return dat

/obj/item/implant/syndiechem/Initialize(mapload)
	. = ..()
	create_reagents(100, OPENCONTAINER)

/obj/item/implant/syndiechem/activate(cause)
	. = ..()
	if(!cause || !imp_in)
		return
	var/mob/living/carbon/R = imp_in
	var/injectamount = null
	if (cause == "action_button")
		injectamount = reagents.total_volume
	else
		injectamount = cause
	reagents.trans_to(R, injectamount)
	if(!reagents.total_volume)
		to_chat(R, span_hear("You hear the faintest of clicks."))
		qdel(src)


/obj/item/implantcase/syndiechem
	name = "Implant Case - 'Chemical Storage'"
	desc = "A glass case containing a chemical storage implant."
	imp_type = /obj/item/implant/syndiechem

/obj/item/implantcase/chem/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/reagent_containers/syringe) && imp)
		W.afterattack(imp, user, TRUE, params)
		return TRUE
	else
		return ..()
