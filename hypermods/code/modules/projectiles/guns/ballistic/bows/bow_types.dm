/obj/item/gun/ballistic/bow/longbow/syndicate
	name = "compact longbow"
	desc = "A slim, stylish and sleek compact longbow, it's been painted a suspicious black-and-red color scheme."
	icon = 'hypermods/icons/obj/weapons/bows/bows.dmi'
	icon_state = "syndicate_bow"
	base_icon_state = "syndicate_bow"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/bows_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/bows_righthand.dmi'
	inhand_icon_state = "syndicate_bow"
	w_class = WEIGHT_CLASS_NORMAL


/obj/item/gun/ballistic/bow/energy
	name = "hardlight bow"
	desc = "A modern bow that can fabricate hardlight arrows using an internal energy."
	icon = 'hypermods/icons/obj/weapons/bows/bows.dmi'
	icon_state = "bow_hardlight"
	base_icon_state = "bow_hardlight"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	inhand_icon_state = "bow_hardlight"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/bow/energy
	internal_magazine = TRUE
	drawn = TRUE // We're starting drawn and ready to go.
	var/recharge_time = 1 SECONDS

	var/can_fold = FALSE
	var/folded_w_class = WEIGHT_CLASS_NORMAL
	var/folded = FALSE
	var/fold_sound = 'sound/items/weapons/batonextend.ogg'

/obj/item/gun/ballistic/bow/energy/Initialize(mapload)
	. = ..()
	if(folded)
		toggle_folded(TRUE)
	update_icon_state()

/obj/item/gun/ballistic/bow/energy/examine(mob/user)
	. = ..()
	var/obj/item/ammo_box/magazine/internal/bow/energy/M = accepted_magazine_type
	if(magazine.ammo_type)
		var/obj/item/arrow_type = magazine.ammo_type
		. += "It is current firing mode is \"[initial(arrow_type.name)]\"[M.selectable_types.len > 1 ? ", you can select firing modes by using ALT + CLICK" : ""]."
	if(can_fold)
		. += "[folded ? "It is currently folded, you can unfold it" : "It can be folded into a compact form"] by using CTRL + CLICK."

/obj/item/gun/ballistic/bow/energy/update_icon_state()
	. = ..()
	if(folded)
		icon_state = "[initial(icon_state)]_folded"
		inhand_icon_state = "[initial(inhand_icon_state)]_folded"
	else if(get_ammo())
		icon_state = initial(icon_state)
	else
		inhand_icon_state = initial(inhand_icon_state)
		icon_state = initial(icon_state)

	if(ismob(loc))
		var/mob/M = loc
		M.update_held_items()

/obj/item/gun/ballistic/bow/energy/shoot_live_shot(mob/living/user, pointblank, atom/pbtarget, message)
	if(folded)
		to_chat(user, span_notice("You must unfold [src] before firing it!"))
		return FALSE
	. = ..()

/obj/item/gun/ballistic/bow/energy/attack_self(mob/living/user)
	if(folded)
		toggle_folded(FALSE, user)
	if(!chambered && !get_ammo())
		if(!do_after(user, recharge_time, src))
			return
		recharge_arrow()
		to_chat(user, span_notice("You fabricate an arrow."))
	if(..())
		return TRUE
	update_appearance(UPDATE_ICON)

/obj/item/gun/ballistic/bow/energy/clear_chambered(datum/source)
	if(chambered)
		UnregisterSignal(chambered, COMSIG_MOVABLE_MOVED)
		chambered = null
		return TRUE
	return FALSE

/obj/item/gun/ballistic/bow/energy/drop_arrow()
	clear_chambered()
	chambered = magazine.get_round()
	update_appearance()

/obj/item/gun/ballistic/bow/energy/drop_arrow_if_not_held()
	return // just causes problems if we drop the arrow by dropping the bow.

/obj/item/gun/ballistic/bow/energy/proc/recharge_arrow()
	if(folded || magazine.get_round(TRUE))
		return
	var/obj/item/ammo_casing/arrow/new_arrow = new magazine.ammo_type()
	magazine.give_round(new_arrow)
	chambered = new_arrow
	update_icon()
	playsound(src, 'sound/effects/sparks/sparks4.ogg', 25, 0)

/obj/item/gun/ballistic/bow/energy/attackby(obj/item/I, mob/user, params)
	return

/obj/item/gun/ballistic/bow/energy/click_alt(mob/living/user)
	if(select_projectile(user))
		clear_chambered()
		chambered = magazine.get_round()
		drawn = TRUE
		update_icon()
	return CLICK_ACTION_SUCCESS

/obj/item/gun/ballistic/bow/energy/proc/select_projectile(mob/living/user)
	var/obj/item/ammo_box/magazine/internal/bow/energy/M = magazine
	if(folded)
		user.balloon_alert(user, "Unfold it first!")
		return FALSE
	if(!istype(M) || !M.selectable_types)
		return FALSE
	var/list/selectable_types = M.selectable_types

	switch(selectable_types.len)
		if(1)
			M.ammo_type = selectable_types[1]
			to_chat(user, span_notice("\The [src] doesn't have any other firing modes."))
			return FALSE
		if(2)
			selectable_types = selectable_types - M.ammo_type
			var/obj/item/ammo_casing/arrow/energy/new_ammo_type = selectable_types[1]
			M.ammo_type = new_ammo_type
			to_chat(user, span_notice("You switch \the [src]'s firing mode to \"[initial(new_ammo_type.name)]\"."))
			return TRUE
		else
			var/list/choice_list = list()
			var/list/radial_list = list()
			for(var/type in M.selectable_types)
				var/obj/item/arrow_type = type
				var/datum/radial_menu_choice/choice = new
				choice.image = image(initial(arrow_type.icon), icon_state = initial(arrow_type.icon_state))
				choice.info = initial(arrow_type.desc)
				choice_list[initial(arrow_type.name)] = arrow_type
				radial_list[initial(arrow_type.name)] = choice
			var/raw_choice = show_radial_menu(user, user, radial_list, tooltips = TRUE)
			if(!raw_choice || !(raw_choice in radial_list))
				return FALSE
			var/obj/item/ammo_casing/arrow/energy/choice = choice_list[raw_choice]
			if(!choice || !(choice in M.selectable_types))
				return FALSE
			M.ammo_type = choice
			to_chat(user, span_notice("You switch \the [src]'s firing mode to \"[initial(choice.name)]\"."))
	update_appearance(UPDATE_ICON)
	return TRUE

/obj/item/gun/ballistic/bow/energy/item_ctrl_click(mob/living/user)
	if(!can_fold || !user.is_holding(src))
		return ..()
	if(drawn)
		to_chat(user, span_notice("You can't fold \the [src] while drawing the bowstring."))
		return CLICK_ACTION_SUCCESS
	toggle_folded(!folded, user)
	return CLICK_ACTION_SUCCESS

/obj/item/gun/ballistic/bow/energy/proc/toggle_folded(new_folded, mob/living/user)
	if(!can_fold)
		return

	if(folded != new_folded)
		playsound(src.loc, fold_sound, 50, 1)

	folded = new_folded

	if(folded)
		w_class = folded_w_class
		clear_chambered()
		if(user)
			to_chat(user, span_notice("You fold [src]."))
	else
		w_class = initial(w_class)
		chambered = magazine.get_round()
		if(user)
			to_chat(user, span_notice("You extend [src], allowing it to be fired."))
	update_appearance(UPDATE_ICON)

/obj/item/gun/ballistic/bow/energy/advanced
	name = "advanced hardlight bow"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/bow/energy/advanced
	recharge_time = 0
	pin = /obj/item/firing_pin
	can_fold = TRUE

/obj/item/gun/ballistic/bow/energy/ert
	name = "\improper HL-P1 Multipurpose Combat Bow"
	desc = "An expensive hardlight bow designed by Nanotrasen and often sold to the SIC's espionage branch. Capable of firing disabler, energy, pulse, and taser bolts."
	icon_state = "bow_ert"
	base_icon_state = "bow_ert"
	inhand_icon_state = "bow_ert"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/bow/energy/ert
	pin = /obj/item/firing_pin
	can_fold = TRUE

/obj/item/gun/ballistic/bow/energy/syndicate
	name = "syndicate hardlight bow"
	desc = "A modern bow that can fabricate hardlight arrows using an internal energy. This one is designed by the Syndicate for silent takedowns of targets."
	icon_state = "bow_syndicate"
	base_icon_state = "bow_syndicate"
	inhand_icon_state = "bow_syndicate"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/bow/energy/syndicate
	pin = /obj/item/firing_pin
	fire_sound_volume = 0
	can_fold = TRUE

/obj/item/gun/ballistic/bow/energy/syndicate/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 3)

/obj/item/gun/ballistic/bow/energy/syndicate/folded
	folded = TRUE
