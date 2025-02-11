/obj/item/syndie_glue
	name = "bottle of super glue"
	desc = "A black market brand of high strength adhesive, rarely sold to the public. Do not ingest."
	icon = 'hypermods/icons/obj/devices/tool.dmi'
	icon_state = "glue"
	w_class = WEIGHT_CLASS_SMALL
	var/uses = 1

/obj/item/syndie_glue/interact_with_atom(atom/interacting_with, mob/living/user)
	. = ..()
	if(!interacting_with)
		return
	else
		if(uses == 0)
			to_chat(user, "<span class='warning'>The bottle of glue is empty!</span>")
			return
		if(istype(interacting_with, /obj/item))
			var/obj/item/Glue_target = interacting_with
			if(HAS_TRAIT_FROM(Glue_target, TRAIT_NODROP, "glued_item"))
				to_chat(user, "<span class='warning'>[Glue_target] is already sticky!</span>")
				return
			uses -= 1
			ADD_TRAIT(Glue_target, TRAIT_NODROP, "glued_item")
			Glue_target.desc += " It looks sticky."
			to_chat(user, "<span class='notice'>You smear the [Glue_target] with glue, making it incredibly sticky!</span>")
			if(uses == 0)
				icon_state = "glue_used"
				name = "empty bottle of super glue"
			return
