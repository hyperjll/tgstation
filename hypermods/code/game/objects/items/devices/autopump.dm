/obj/item/auto_pump
	name = "auto-pump"
	desc = "An advanced medical device re-created after the DeForest Medical corporation was donated it's schematics by an unknown third party. \
			When used, it attaches to the host's chest and provides temporary life-support, warding against several life-threatening threats such as oxygen loss and respiratory arrest."
	icon = 'hypermods/icons/obj/medical/imported_medical.dmi'
	icon_state = "autopump_tiny"
	throwforce = 5
	w_class = WEIGHT_CLASS_SMALL
	throw_speed = 3
	throw_range = 7
	obj_flags = CONDUCTS_ELECTRICITY
	inhand_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'

/obj/item/auto_pump/attack_self(mob/living/carbon/user)
	if(!user)
		return

	if(!iscarbon(user))
		return

	if(user.has_status_effect(/datum/status_effect/auto_pump))
		to_chat(user, span_notice("You already have an Auto-Pump active! You can't attach another!"))
		return

	playsound(src.loc, 'hypermods/sound/items/autopumpstart.ogg', 50, TRUE)
	to_chat(user, span_notice("You attach [src] to your chest and it emits a loud electrical sound, followed by a faint buzzing..."))

	user.apply_status_effect(/datum/status_effect/auto_pump)

	qdel(src)

/obj/item/auto_pump/interact_with_atom(atom/target, mob/living/user, list/modifiers)
	if(!istype(target, /mob/living/carbon/human))
		return NONE
	var/mob/living/carbon/human/target_human = target
	if(target_human.has_status_effect(/datum/status_effect/auto_pump))
		to_chat(user, span_notice("You already have an Auto-Pump active! You can't attach another!"))
		return
	if(!do_after(user, 3 SECONDS))
		return

	playsound(src.loc, 'hypermods/sound/items/autopumpstart.ogg', 50, TRUE)
	to_chat(user, span_notice("You attach [src] to [target_human]'s chest and it emits a loud electrical sound, followed by a faint buzzing..."))

	target_human.apply_status_effect(/datum/status_effect/auto_pump)

	qdel(src)

