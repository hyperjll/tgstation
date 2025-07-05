/obj/item/implant/lingextract
	name = "regenerate implant"
	desc = "Regenerates limbs and organs."
	icon = 'hypermods/icons/mob/actions/actions_changeling.dmi'
	icon_state = "regenerate_clean"
	uses = 0 // Requires time to calibrate with the host.
	var/maxuses = 2 // Generous, as we start off with nothing
	var/rechargetime = 10 MINUTES
	var/deleteonnouses = FALSE
	var/recharging = TRUE // Set this to true cuz we start off with no charges

/obj/item/implant/lingextract/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Tiger Cooperative Regeneration Implant<BR>
				<b>Life:</b> Two days.<BR>
				<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
				<HR>
				<b>Implant Details:</b> Subjects injected with implant can activate an injection of highly complex regenerative dna attuned to the host.<BR>
				<b>Function:</b> Results in near instantaneous regeneration of host's limbs and organs.<BR>
				<b>Integrity:</b> Implant can only be used once before requiring a lengthy period to synthesize more regenerative dna compatible with the host."}
	return dat

/obj/item/implant/lingextract/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(restore_charge)), rechargetime) // We start off with nothing, so start charging.

/obj/item/implant/lingextract/activate()
	. = ..()
	if(!uses)
		var/mob/living/carbon/carbon_imp_in = imp_in
		balloon_alert(carbon_imp_in, "no charge!")
		return

	uses--

	to_chat(imp_in, span_notice("You feel your body shudder as you rapidly regenerate!"))

	var/mob/living/carbon/carbon_imp_in = imp_in
	carbon_imp_in.regenerate_limbs()
	carbon_imp_in.regenerate_organs()
	for(var/datum/wound/iter_wound as anything in carbon_imp_in.all_wounds)
		iter_wound.remove_wound()

	if(!uses && deleteonnouses)
		addtimer(CALLBACK(carbon_imp_in, TYPE_PROC_REF(/atom, balloon_alert), carbon_imp_in, "implant degraded!"), 1 SECONDS)
		qdel(src)

	if((maxuses > uses) && !recharging)
		recharging = TRUE
		addtimer(CALLBACK(src, PROC_REF(restore_charge)), rechargetime)

/obj/item/implant/lingextract/proc/restore_charge(mob/living/carbon/implanted_in)
	if(maxuses > uses)
		uses++
		var/mob/living/carbon/carbon_imp_in = imp_in
		balloon_alert(carbon_imp_in, "regenerate implant: [uses] uses left!")
		addtimer(CALLBACK(src, PROC_REF(restore_charge)), rechargetime) // keep charging till you can't
	else
		recharging = FALSE

/obj/item/implanter/lingextract
	name = "implanter (regenerate)"
	imp_type = /obj/item/implant/lingextract
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "simplanter0"
	base_icon_state = "simplanter"

/obj/item/implantcase/lingextract
	name = "Implant Case - 'Regenerate'"
	desc = "A glass case containing a regenerate implant."
	imp_type = /obj/item/implant/lingextract

