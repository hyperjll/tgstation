/obj/item/implant/pacify
	name = "pacification implant"
	desc = "An implant designed to repress violent tendencies within the host's brain."
	actions_types = null

/obj/item/implant/pacify/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(.)
		target.add_traits(list(TRAIT_PACIFISM), IMPLANT_TRAIT)

/obj/item/implant/pacify/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(.)
		target.remove_traits(list(TRAIT_PACIFISM), IMPLANT_TRAIT)

/obj/item/implanter/pacify
	name = "implanter (pacification)"
	imp_type = /obj/item/implant/pacify

/obj/item/implantcase/pacify
	name = "Implant Case - 'Pacification'"
	desc = "A glass case containing a pacification implant."
	imp_type = /obj/item/implant/pacify


/obj/item/implant/violentpsychosis
	name = "violent psychosis implant"
	desc = "An implant which pulses areas of the brain to stimulate violent tendencies, causing the host to fight in unpredictable ways."
	actions_types = null
	var/datum/martial_art/psychotic_brawling/psychotic_brawling

/obj/item/implant/violentpsychosis/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(.)
		psychotic_brawling = new()
		psychotic_brawling.allow_temp_override = FALSE
		if(!psychotic_brawling.teach(target, TRUE))
			to_chat(target, span_notice("But your martial knowledge keeps you grounded."))
			qdel(src)

/obj/item/implant/violentpsychosis/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(.)
		psychotic_brawling.fully_remove(target)
		QDEL_NULL(psychotic_brawling)

/obj/item/implanter/violentpsychosis
	name = "implanter (violent psychosis)"
	imp_type = /obj/item/implant/violentpsychosis

/obj/item/implantcase/violentpsychosis
	name = "Implant Case - 'Violent Psychosis'"
	desc = "A glass case containing a violent psychosis implant."
	imp_type = /obj/item/implant/violentpsychosis

/**
/obj/item/implant/
	name = " implant"
	desc = "An implant ."
	actions_types = null

/obj/item/implant//implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(.)
		target.add_traits(list(TRAIT_), IMPLANT_TRAIT)

/obj/item/implant//removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(.)
		target.remove_traits(list(TRAIT_), IMPLANT_TRAIT)

/obj/item/implanter/
	name = "implanter ()"
	imp_type = /obj/item/implant/

/obj/item/implantcase/
	name = "Implant Case - ''"
	desc = "A glass case containing a  implant."
	imp_type = /obj/item/implant/
**/
