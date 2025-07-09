/obj/item/implant/romerol
	name = "romerol implant"
	desc = "Use results in zombification."
	icon = 'hypermods/icons/hud/implants.dmi'
	icon_state = "romerol"
	uses = 1

/obj/item/implant/romerol/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Romerol Payload<BR>
				<b>Life:</b> Unknown<BR>
				<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
				<HR>
				<b>Implant Details:</b> Contains a peculiar chemical capable of turning people into zombies.<BR>
				<b>Function:</b> Zombification.<BR>
				<b>Integrity:</b> Implant can only be used once before self-destructing."}
	return dat

/obj/item/implant/romerol/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(.)
		RegisterSignal(target, COMSIG_LIVING_DEATH, PROC_REF(activate))

/obj/item/implant/romerol/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(.)
		UnregisterSignal(target, COMSIG_LIVING_DEATH)

/obj/item/implant/romerol/activate()
	. = ..()

	to_chat(imp_in, span_notice("You hear a click within your head as a sense of dread washes over you."))

	var/mob/living/carbon/human/zombified_mob = imp_in
	if(!zombified_mob.get_organ_slot(ORGAN_SLOT_ZOMBIE))
		var/obj/item/organ/zombie_infection/nodamage/ZI = new()
		ZI.Insert(zombified_mob)
		ZI.converts_living = TRUE // Just in case we activated this manually.

	if(zombified_mob.get_organ_slot(ORGAN_SLOT_ZOMBIE)) // Did we actually place that zombie organ?
		var/obj/item/organ/zombie_infection/z_infection = zombified_mob.get_organ_slot(ORGAN_SLOT_ZOMBIE)
		if(z_infection.converts_living) // Just in case the check above didn't go through
			z_infection.zombify(zombified_mob)

		zombified_mob.visible_message(
			span_userdanger("[zombified_mob] suddenly transforms into a zombie!"),
			span_userdanger("You activate your romerol payload and transform into a zombie!"))

	qdel(src)
