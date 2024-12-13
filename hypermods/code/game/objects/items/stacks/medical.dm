/obj/item/stack/medical/bloodpack
	name = "universal blood pack"
	singular_name = "blood pack"
	desc = "A pack of universal-grade blood with an in-built miniature IV. The label reads '10% Iron, 25% Saline-Glucose, 65% Filgrastim'"
	icon = 'hypermods/icons/obj/medical/stack_medical.dmi'
	icon_state = "bloodpack"
	amount = 25
	max_amount = 25
	self_delay = 20
	other_delay = 40
	novariants = TRUE
	repeating = FALSE
	hitsound = 'sound/misc/moist_impact.ogg'
	grind_results = list(/datum/reagent/iron = 0.1, /datum/reagent/medicine/salglu_solution = 0.25, /datum/reagent/medicine/filgrastim = 0.65)
	merge_type = /obj/item/stack/medical/bloodpack

/obj/item/stack/medical/bloodpack/begin_heal_loop(mob/living/patient, mob/living/user, auto_change_zone = TRUE)
	if(DOING_INTERACTION_WITH_TARGET(user, patient))
		return FALSE
	var/heal_zone = check_zone(user.zone_selected)
	if(!try_heal_checks(patient, user, heal_zone))
		return FALSE
	//SSblackbox.record_feedback("nested tally", "medical_item_used", 1, list(type, auto_change_zone ? "auto" : "manual")) // let's not log this. it causes errors.
	patient.balloon_alert(user, "treating [parse_zone(heal_zone)]...")
	INVOKE_ASYNC(src, PROC_REF(try_heal), patient, user, heal_zone, FALSE, iscarbon(patient) && auto_change_zone) // auto change is useless for non-carbons
	return TRUE

/obj/item/stack/medical/bloodpack/try_heal_checks(mob/living/patient, mob/user)
	if(patient.stat == DEAD)
		patient.balloon_alert(user, "they're dead!")
		return FALSE
	if(iscarbon(patient))
		if(patient.blood_volume < BLOOD_VOLUME_NORMAL)
			return TRUE
		else
			to_chat(user, span_warning("[patient] is at normal blood levels, this won't do any good."))
			return FALSE
	else
		patient.balloon_alert(user, "can't heal [patient]!")
		return FALSE

/obj/item/stack/medical/bloodpack/heal_carbon(mob/living/patient, mob/user)
	patient.blood_volume += 10
	playsound(src, 'sound/misc/soggy.ogg', 30, TRUE)
	to_chat(user, span_warning("You've applied the [src] to [patient]."))
	return TRUE
