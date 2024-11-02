/obj/item/implant/explosive/deniability/deluxe
	name = "deluxe tactical deniability implant"
	delay = 1 MINUTES

/obj/item/implanter/tactical_deniability/deluxe
	name = "implanter (deluxe tactical deniability)"
	imp_type = /obj/item/implant/explosive/deniability/deluxe


/obj/item/implant/tenacity
	name = "tenacity implant"
	desc = "An experimental implant designed by Interdyne Pharmaceuticals with the aid of Cybersun Industries. \
			The implant blocks the brain from properly shutting down as a result of extensive bodily damage, \
			allowing the host to move freely even while greatly damaged!"

/obj/item/implant/tenacity/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(.)
		target.add_traits(list(TRAIT_NOSOFTCRIT, TRAIT_NOHARDCRIT), IMPLANT_TRAIT)

/obj/item/implant/tenacity/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(.)
		target.remove_traits(list(TRAIT_NOSOFTCRIT, TRAIT_NOHARDCRIT), IMPLANT_TRAIT)

/obj/item/implanter/tenacity
	name = "implanter (tenacity)"
	imp_type = /obj/item/implant/tenacity
