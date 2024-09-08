/datum/action/item_action/change_tool
	name = "Change Holotool Setting"

/datum/action/item_action/change_ht_color
	name = "Change Holotool Color"


/obj/item/holotool
	name = "experimental holotool"
	desc = "A highly experimental holographic tool projector."
	icon = 'hypermods/icons/obj/holotool.dmi'
	icon_state = "holotool"
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	usesound = 'sound/items/pshoom.ogg'
	lefthand_file = 'hypermods/icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/equipment/tools_righthand.dmi'
	actions_types = list(/datum/action/item_action/change_tool, /datum/action/item_action/change_ht_color)
	resistance_flags = FIRE_PROOF | ACID_PROOF

	var/datum/holotool_mode/current_tool
	var/obj/item/multitool/internal_multitool // A kludge caused by the statefulness of multitools,
	// to be retained until we have the hubris to abstract all multitool functionality into some /datum/component, and break modularity in a hundred ways
	var/list/available_modes
	var/list/mode_names
	var/list/radial_modes
	var/current_color = "#48D1CC" //mediumturquoise

/obj/item/holotool/Initialize(mapload)
	. = ..()
	internal_multitool = new /obj/item/multitool(src)

/obj/item/holotool/Destroy()
	. = ..()
	qdel(internal_multitool)

/obj/item/holotool/examine(mob/user)
	. = ..()
	. += span_notice("It is currently set to [current_tool ? current_tool.name : "'off'"] mode.")
	. += span_notice("Ctrl+Click it to open the radial menu!")

/obj/item/holotool/interact_with_atom(atom/interacting_with, mob/living/M, mob/living/user)
	if(tool_behaviour == TOOL_SCREWDRIVER)
		return

	if(tool_behaviour == TOOL_WELDER && ishuman(M))
		if(!ishuman(interacting_with))
			return NONE
		if(user.combat_mode)
			return NONE

		var/mob/living/carbon/human/attacked_humanoid = interacting_with
		var/obj/item/bodypart/affecting = attacked_humanoid.get_bodypart(check_zone(user.zone_selected))
		if(isnull(affecting) || !IS_ROBOTIC_LIMB(affecting))
			return NONE

		var/use_delay = 0

		if(user == attacked_humanoid)
			user.visible_message(span_notice("[user] starts to fix some of the dents on [attacked_humanoid]'s [affecting.name]."),
			span_notice("You start fixing some of the dents on [attacked_humanoid == user ? "your" : "[attacked_humanoid]'s"] [affecting.name]."))
			use_delay = 5 SECONDS

		if(!use_tool(attacked_humanoid, user, use_delay, volume=50, amount=1))
			return ITEM_INTERACT_BLOCKING

		attacked_humanoid.item_heal(user, brute_heal = 15, burn_heal = 0, heal_message_brute = "dents", heal_message_burn = "burnt wires", required_bodytype = BODYTYPE_ROBOTIC)
		return ITEM_INTERACT_SUCCESS
	. = ..()

/obj/item/holotool/use(used)
	return TRUE //it just always works, capiche!?

/obj/item/holotool/tool_use_check(mob/living/user, amount)
	return TRUE	//always has enough "fuel"

/obj/item/holotool/ui_action_click(mob/user, datum/action/action)
	if(istype(action, /datum/action/item_action/change_tool))
		update_listing()
		var/datum/holotool_mode/chosen = input("Choose tool settings", "Tool", null, null) as null|anything in available_modes
		switch_tool(user, chosen)
	else
		var/C = input(user, "Select Color", "Select color", "#48D1CC") as null|color
		if(!C || QDELETED(src))
			return
		current_color = C
	update_appearance(UPDATE_ICON)
	action.build_all_button_icons()
	user.regenerate_icons()

/obj/item/holotool/proc/switch_tool(mob/user, datum/holotool_mode/mode)
	if(!mode || !istype(mode))
		return
	if(current_tool)
		current_tool.on_unset(src)
	current_tool = mode
	current_tool.on_set(src)
	playsound(loc, 'hypermods/sound/items/holotool.ogg', get_clamped_volume(), 1, -1)
	update_appearance(UPDATE_ICON)
	user.regenerate_icons()


/obj/item/holotool/proc/update_listing()
	LAZYCLEARLIST(available_modes)
	LAZYCLEARLIST(radial_modes)
	LAZYCLEARLIST(mode_names)
	for(var/A in subtypesof(/datum/holotool_mode))
		var/datum/holotool_mode/M = new A
		if(M.can_be_used(src))
			LAZYADD(available_modes, M)
			LAZYSET(mode_names, M.name, M)
			var/image/holotool_img = image(icon = icon, icon_state = icon_state)
			var/image/tool_img = image(icon = icon, icon_state = M.name)
			tool_img.color = current_color
			holotool_img.overlays += tool_img
			LAZYSET(radial_modes, M.name, holotool_img)
		else
			qdel(M)

/obj/item/holotool/update_icon(updates=ALL)
	. = ..()
	cut_overlays()
	if(current_tool)
		var/mutable_appearance/holo_item = mutable_appearance(icon, current_tool.name)
		holo_item.color = current_color
		inhand_icon_state = current_tool.name
		add_overlay(holo_item)
		if(current_tool.name == "off")
			set_light(0)
		else
			set_light(3, null, current_color)
	else
		inhand_icon_state = "holotool"
		icon_state = "holotool"
		set_light(0)

	for(var/datum/action/A as anything in actions)
		A.build_all_button_icons()

/obj/item/holotool/proc/check_menu(mob/living/user)
	if(!istype(user))
		return FALSE
	if(user.incapacitated || !user.Adjacent(src))
		return FALSE
	return TRUE

/obj/item/holotool/attack_self(mob/user)
	update_listing()
	var/chosen = show_radial_menu(user, src, radial_modes, custom_check = CALLBACK(src, PROC_REF(check_menu),user))
	if(!check_menu(user))
		return
	if(chosen)
		var/new_tool = LAZYACCESS(mode_names, chosen)
		if(new_tool)
			switch_tool(user, new_tool)

/obj/item/holotool/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(obj_flags & EMAGGED)
		return FALSE
	to_chat(user, span_danger("ZZT- ILLEGAL BLUEPRINT UNLOCKED- CONTACT !#$@^%$# NANOTRASEN SUPPORT-@*%$^%!"))
	do_sparks(5, 0, src)
	obj_flags |= EMAGGED
	return TRUE

// Spawn in RD closet
/obj/structure/closet/secure_closet/RD/PopulateContents()
	. = ..()
	new /obj/item/holotool(src)


/obj/item/holotool/syndicate
	name = "syndicate holotool"
	current_color = "#EE0000"
