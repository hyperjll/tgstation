// God this is the worst shit-code i've ever made.

/obj/item/reagent_containers/pill/patch/mender
	name = "auto-mender"
	desc = "A small electronic device designed to topically apply healing chemicals."
	icon = 'hypermods/icons/obj/medical/mender.dmi'
	icon_state = "mender"
	fill_icon_state = "mender-fluid"
	fill_icon = 'hypermods/icons/obj/medical/mender.dmi'
	volume = 200
	reagent_flags = SEALED_CONTAINER
	self_delay = 2.5 SECONDS
	apply_type = PATCH

	// Has the container been emagged open?
	var/tampered = 0
	// How much reagents are used each time?
	var/use_volume = 8
	// Use sounds
	var/static/list/sfx = list('hypermods/sound/items/mender.ogg','hypermods/sound/items/mender2.ogg')


/obj/item/reagent_containers/pill/patch/mender/examine(mob/user)
	. = ..()
	. += "It has [reagents.total_volume] units left."

/obj/item/reagent_containers/pill/patch/mender/update_overlays()
	. = ..()
	if(!reagents.total_volume)
		return

	var/fill_name = fill_icon_state ? fill_icon_state : icon_state
	var/mutable_appearance/filling = mutable_appearance(fill_icon, "[fill_name]")

	filling.color = mix_color_from_reagents(reagents.reagent_list)
	. += filling

/obj/item/reagent_containers/pill/patch/mender/emag_act(mob/user, obj/item/card/emag/E)
	if(user && E && !tampered)
		//to_chat(user, span_warning("You press on [src] with [E]. The anti-tamper lock is breaks!"))
		tampered = 1
		//reagent_flags = OPENCONTAINER|INJECTABLE
		//src.UpdateIcon()
	return TRUE

/obj/item/reagent_containers/pill/patch/mender/emp_act()
	if(!tampered)
		src.visible_message(span_alert("[src] malfunctions and identifies all substaces as harmful, removing them!"))
		playsound(src, "sparks", 75, 1, -1)
		reagents.clear_reagents()
	return TRUE

/obj/item/reagent_containers/pill/patch/mender/on_consumption(mob/consumer, mob/giver)
	if(reagents.total_volume)
		reagents.trans_to(consumer, use_volume, transferred_by = giver, methods = apply_type)
	playsound(src, pick(sfx), 50, 1)
	//qdel(src)

/obj/item/reagent_containers/pill/patch/mender/interact_with_atom(atom/target, mob/living/user, list/modifiers)
	if (ismob(target))
		var/mob/target_mob = target
		if(!canconsume(target_mob, user))
			return ITEM_INTERACT_BLOCKING
		if(target_mob == user)
			target_mob.visible_message(span_notice("[user] attempts to [apply_method] [src]."))
			if(self_delay)
				if(!do_after(user, self_delay, target_mob))
					return ITEM_INTERACT_BLOCKING
			to_chat(target_mob, span_notice("You [apply_method] [src]."))
		else
			target_mob.visible_message(span_danger("[user] attempts to force [target_mob] to [apply_method] [src]."), \
								span_userdanger("[user] attempts to force you to [apply_method] [src]."))
			if(!do_after(user, CHEM_INTERACT_DELAY(3 SECONDS, user), target_mob))
				return ITEM_INTERACT_BLOCKING
			target_mob.visible_message(span_danger("[user] forces [target_mob] to [apply_method] [src]."), \
								span_userdanger("[user] forces you to [apply_method] [src]."))
		on_consumption(target_mob, user)
		return ITEM_INTERACT_SUCCESS

	if(!dissolvable || !target.is_refillable())
		return NONE

	if(target.is_drainable() && !target.reagents.total_volume)
		to_chat(user, span_warning("[target] is empty! There's nothing to dissolve [src] in."))
		return ITEM_INTERACT_BLOCKING

	if(target.reagents.holder_full())
		to_chat(user, span_warning("[target] is full."))
		return ITEM_INTERACT_BLOCKING

	user.visible_message(span_warning("[user] slips something into [target]!"), span_notice("You dissolve [src] in [target]."), null, 2)
	reagents.trans_to(target, use_volume, transferred_by = user)
	playsound(src, pick(sfx), 50, 1)
	//qdel(src)
	return ITEM_INTERACT_SUCCESS

/obj/item/reagent_containers/pill/patch/mender/brute
	name = "auto-mender (brute)"
	list_reagents = list(/datum/reagent/medicine/styptic_powder = 200)

/obj/item/reagent_containers/pill/patch/mender/burn
	name = "auto-mender (burn)"
	list_reagents = list(/datum/reagent/medicine/silver_sulfadiazine = 200)

/obj/item/reagent_containers/pill/patch/mender/toxin
	name = "auto-mender (toxin)"
	list_reagents = list(/datum/reagent/medicine/dylovene = 150, /datum/reagent/medicine/antitoxin = 25, /datum/reagent/medicine/painkillers = 25)

/obj/item/reagent_containers/pill/patch/mender/oxy
	name = "auto-mender (oxygen)"
	list_reagents = list(/datum/reagent/medicine/dexalin = 150, /datum/reagent/medicine/coagulant/inaprovaline = 25, /datum/reagent/medicine/painkillers = 25)

/obj/item/reagent_containers/pill/patch/mender/all
	name = "auto-mender (advanced)"
	list_reagents = list(/datum/reagent/medicine/tricordrazine = 100, /datum/reagent/medicine/omnizine = 25, /datum/reagent/medicine/coagulant = 25, /datum/reagent/medicine/painkillers = 50)
