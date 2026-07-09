/*!
 * Custom implant which makes it safe to enter the syndicate satellite by given you the proper faction for turrets.
 */

/obj/item/implant/sat_authorization
	name = "Satellite Authorization implant"
	actions_types = null

/obj/item/implant/sat_authorization/implant(mob/living/target, mob/user, silent, force)
	. = ..()
	if(target.has_faction(ROLE_SYNDICATE))
		return FALSE
	target.add_faction(ROLE_SYNDICATE)

/obj/item/implant/sat_authorization/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	target.remove_faction(ROLE_SYNDICATE)

/obj/item/implanter/sat_authorization
	name = "implanter (satellite authorization)"
	imp_type = /obj/item/implant/sat_authorization
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "simplanter0"
	base_icon_state = "simplanter"
