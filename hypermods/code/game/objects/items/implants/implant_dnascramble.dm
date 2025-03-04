/obj/item/implant/dnascramble
	name = "dna scrambler implant"
	desc = "An experimental implant designed by a combination of Interdyne and Cybersun researchers to provide agents with fresh identities on-demand."
	icon_state = "lingspacesuit"
	icon = 'icons/obj/clothing/suits/costume.dmi'
	uses = 1

/obj/item/implant/dnascramble/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Cybersun/Interdyne DNA Scrambler Implant<BR>
				<b>Life:</b> Sixteen days.<BR>
				<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
				<HR>
				<b>Implant Details:</b> Subjects injected with implant can activate an injection of heavy mutation-causing chemicals, and modify identification cards using unknown technology.<BR>
				<b>Function:</b> Scrambles the DNA of the subject, resulting in a new identity, and can alter personalized identification cards to match the new identity.<BR>
				<b>Integrity:</b> Implant can only be used once before self-destructing."}
	return dat

/obj/item/implant/dnascramble/activate()
	. = ..()
	var/mob/living/carbon/human/imp_in_carbon = imp_in

	imp_in_carbon.visible_message("<b>[imp_in_carbon]</b> suddenly transforms!")
	randomize_human_normie(imp_in_carbon)

	// ID and id-related data
	var/obj/item/card/id/id_card = imp_in_carbon.get_idcard(hand_first = FALSE)
	if (id_card)
		id_card.registered_name = imp_in_carbon.dna.real_name
		id_card.name = "[id_card.registered_name] ([id_card.assignment])"

	qdel(src)

/obj/item/implanter/dnascramble
	name = "implanter (dna scramble)"
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "simplanter0"
	base_icon_state = "simplanter"
	imp_type = /obj/item/implant/dnascramble
