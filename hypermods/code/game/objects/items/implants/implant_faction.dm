/*!
 * Custom implant which makes it safe to enter the syndicate satellite
 */

/obj/item/implant/gate_authorization
	name = "Gate Authorization implant"
	actions_types = null

/obj/item/implant/gate_authorization/implant(mob/living/target, mob/user, silent, force)
	. = ..()
	if(target.has_faction(ROLE_SYNDICATE))
		return FALSE
	target.add_faction(ROLE_SYNDICATE)

/obj/item/implant/gate_authorization/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	target.remove_faction(ROLE_SYNDICATE)

/obj/item/implanter/gate_authorization
	name = "implanter (gate authorization)"
	imp_type = /obj/item/implant/gate_authorization
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "simplanter0"
	base_icon_state = "simplanter"
