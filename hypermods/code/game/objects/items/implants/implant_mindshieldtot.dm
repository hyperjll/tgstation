/obj/item/implant/mindshieldtot
	name = "syndicate mindshield implant"
	desc = "Fakes the mindshield signal recieved by security HUDs."
	actions_types = null

/obj/item/implant/mindshieldtot/get_data()
	return "<b>Implant Specifications:</b><BR> \
		<b>Name:</b> Syndicate Fake Mindshield Implant<BR> \
		<b>Life:</b> Thirty Days.<BR> \
		<b>Important Notes:</b> Agents injected with this device are shown to be shielded from brainwashing on security HUDs.<BR> \
		<HR> \
		<b>Implant Details:</b><BR> \
		<b>Function:</b> Contains a small device which mimics nanotrasen's mindshield implant, but does nothing else.<BR> \
		<b>Special Features:</b> Will trick security HUDs to reveal you to be mindshielded.<BR> \
		<b>Integrity:</b> Implant will last so long as the device isn't destroyed or removed via surgery or biological attacks."


/obj/item/implant/mindshieldtot/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(!.)
		return FALSE

	target.add_traits(list(TRAIT_MINDSHIELD), IMPLANT_TRAIT)
	target.sec_hud_set_implants()
	if(!silent)
		to_chat(target, span_notice("You feel something beep within your head."))
	return TRUE

/obj/item/implant/mindshieldtot/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(!.)
		return FALSE
	if(isliving(target))
		var/mob/living/L = target
		target.remove_traits(list(TRAIT_MINDSHIELD), IMPLANT_TRAIT)
		L.sec_hud_set_implants()
	if(target.stat != DEAD && !silent)
		to_chat(target, span_boldnotice("You feel something peculiar leave your head, but nothing else happens."))
	return TRUE

/obj/item/implanter/mindshieldtot
	name = "implanter (syndicate mindshield)"
	imp_type = /obj/item/implant/mindshieldtot

/obj/item/implantcase/mindshieldtot
	name = "implant case - 'Syndicate Mindshield'"
	desc = "A glass case containing a poor quality mindshield implant."
	imp_type = /obj/item/implant/mindshieldtot
