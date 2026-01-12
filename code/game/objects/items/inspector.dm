///Energy used to say an error message.
#define ENERGY_TO_SPEAK (0.001 * STANDARD_CELL_CHARGE)

/**
 * # N-spect scanner
 *
 * Determines if an item or its contents are contraband.
 */
/obj/item/inspector
	name = "\improper N-spect scanner"
	desc = "Central Command standard issue inspection device. \
		Used for precision scans to determine if an item contains, or is itself, contraband."
	icon = 'icons/obj/devices/scanner.dmi'
	icon_state = "inspector"
	worn_icon_state = "salestagger"
	inhand_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	interaction_flags_click = NEED_DEXTERITY
	throw_range = 1
	throw_speed = 1
	sound_vary = TRUE
	pickup_sound = SFX_GENERIC_DEVICE_PICKUP
	drop_sound = SFX_GENERIC_DEVICE_DROP
	///Power cell used to power the scanner. Paths g
	var/obj/item/stock_parts/power_store/cell = /obj/item/stock_parts/power_store/cell/crap
	///Cell cover status
	var/cell_cover_open = FALSE
	///Does this item scan for contraband correctly? If not, will provide a flipped response.
	var/scans_correctly = TRUE

/obj/item/inspector/Initialize(mapload)
	. = ..()
	if(ispath(cell))
		cell = new cell(src)
	register_context()
	register_item_context()

// Clean up the cell on destroy
/obj/item/inspector/Exited(atom/movable/gone, direction)
	. = ..()
	if(gone == cell)
		cell = null

// support for items that interact with the cell
/obj/item/inspector/get_cell()
	return cell

/obj/item/inspector/crowbar_act(mob/living/user, obj/item/tool)
	cell_cover_open = !cell_cover_open
	balloon_alert(user, "[cell_cover_open ? "opened" : "closed"] cell cover")
	return ITEM_INTERACT_SUCCESS

/obj/item/inspector/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	if(cell_cover_open && istype(tool, /obj/item/stock_parts/power_store/cell))
		if(cell)
			to_chat(user, span_warning("[src] already has a cell installed."))
			return ITEM_INTERACT_BLOCKING
		if(user.transferItemToLoc(tool, src))
			cell = tool
			to_chat(user, span_notice("You successfully install \the [cell] into [src]."))
			return ITEM_INTERACT_SUCCESS
		return ITEM_INTERACT_BLOCKING
	return NONE

/obj/item/inspector/item_ctrl_click(mob/user)
	if(!cell_cover_open || !cell)
		return CLICK_ACTION_BLOCKING
	user.visible_message(span_notice("[user] removes \the [cell] from [src]!"), \
		span_notice("You remove [cell]."))
	cell.add_fingerprint(user)
	user.put_in_hands(cell)
	cell = null
	return CLICK_ACTION_SUCCESS

/obj/item/inspector/examine(mob/user)
	. = ..()
	. += span_info("Use in-hand to scan the local area, creating an encrypted security inspection.")
	. += span_info("Use on an item to scan if it contains, or is, contraband.")
	if(!cell_cover_open)
		. += span_notice("Its cell cover is closed. It looks like it could be <strong>pried</strong> out, but doing so would require an appropriate tool.")
		return
	. += span_notice("Its cell cover is open, exposing the cell slot. It looks like it could be <strong>pried</strong> in, but doing so would require an appropriate tool.")
	if(!cell)
		. += span_notice("The slot for a cell is empty.")
	else
		. += span_notice("\The [cell] is firmly in place. Ctrl-click with an empty hand to remove it.")

/obj/item/inspector/interact_with_atom(atom/movable/interacting_with, mob/living/user, list/modifiers)
	if(!user.Adjacent(interacting_with))
		return ITEM_INTERACT_BLOCKING
	if(cell_cover_open)
		balloon_alert(user, "close cover first!")
		return ITEM_INTERACT_BLOCKING
	if(!cell || !cell.use(0.001 * STANDARD_CELL_CHARGE))
		balloon_alert(user, "check cell!")
		return ITEM_INTERACT_BLOCKING

	if(iscarbon(interacting_with)) // Prevents scanning people
		return ITEM_INTERACT_BLOCKING

	if(contraband_sender(interacting_with, user))
		if(!istype(interacting_with, /obj/item)) // Can only send ITEMS not structures/atoms
			return ITEM_INTERACT_BLOCKING
		playsound(src, 'sound/items/pshoom/pshoom.ogg', 33, vary = TRUE, extrarange = SILENCED_SOUND_EXTRARANGE, frequency = 0.33, ignore_walls = FALSE) // Taken from the spy uplink to de-sensitize spy sounds
		balloon_alert(user, "wanted item detected! sending...")
		if(!do_after(user, 4 SECONDS, interacting_with))
			return ITEM_INTERACT_BLOCKING

		var/obj/effect/extraction_holder/holder_obj = new(get_turf(interacting_with))
		holder_obj.appearance = interacting_with.appearance
		interacting_with.forceMove(holder_obj)
		var/mutable_appearance/balloon2 = mutable_appearance('icons/effects/fulton_balloon.dmi', "fulton_expand", layer = VEHICLE_LAYER, appearance_flags = RESET_COLOR | RESET_ALPHA | RESET_TRANSFORM | KEEP_APART)
		balloon2.pixel_z = 10
		holder_obj.add_overlay(balloon2)
		addtimer(CALLBACK(src, PROC_REF(create_balloon), interacting_with, user, holder_obj, balloon2), 0.4 SECONDS)

		return ITEM_INTERACT_SUCCESS

	if(contraband_scan(interacting_with, user))
		playsound(src, 'sound/machines/uplink/uplinkerror.ogg', 40)
		balloon_alert(user, "contraband detected!")
		return ITEM_INTERACT_SUCCESS
	else
		playsound(src, 'sound/machines/ping.ogg', 20)
		balloon_alert(user, "clear")
		return ITEM_INTERACT_SUCCESS

/obj/item/inspector/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	var/update_context = FALSE
	if(cell_cover_open && cell)
		context[SCREENTIP_CONTEXT_CTRL_LMB] = "Remove cell"
		update_context = TRUE

	if(cell_cover_open && !cell && istype(held_item, /obj/item/stock_parts/power_store/cell))
		context[SCREENTIP_CONTEXT_LMB] = "Install cell"
		update_context = TRUE

	if(held_item?.tool_behaviour == TOOL_CROWBAR)
		context[SCREENTIP_CONTEXT_LMB] = "[cell_cover_open ? "close" : "open"] battery panel"
		update_context = TRUE

	if(update_context)
		return CONTEXTUAL_SCREENTIP_SET
	return NONE

/obj/item/inspector/add_item_context(obj/item/source, list/context, atom/target, mob/living/user)
	if(cell_cover_open || !cell)
		return NONE
	if(isitem(target))
		context[SCREENTIP_CONTEXT_LMB] = "Contraband Scan"
		return CONTEXTUAL_SCREENTIP_SET
	return NONE

/**
 * Scans the carbon or item for contraband.
 *
 * Arguments:
 * - scanned - what or who is scanned?
 * - user - who is performing the scanning?
 */
/obj/item/inspector/proc/contraband_scan(scanned, user)
	if(iscarbon(scanned))
		var/mob/living/carbon/scanned_carbon = scanned
		for(var/obj/item/content in scanned_carbon.get_all_contents_skipping_traits(TRAIT_CONTRABAND_BLOCKER))
			var/contraband_content = content.is_contraband()
			if((contraband_content && scans_correctly) || (!contraband_content && !scans_correctly))
				return TRUE

	if(isitem(scanned))
		var/obj/item/contraband_item = scanned
		var/contraband_status = contraband_item.is_contraband()
		if((contraband_status && scans_correctly) || (!contraband_status && !scans_correctly))
			return TRUE

	return FALSE

/**
 * Scans the carbon or item for "wanted" contraband, uplink items that can be traded for stuff.
 *
 * Arguments:
 * - scanned - what or who is scanned?
 * - user - who is performing the scanning?
 */
/obj/item/inspector/proc/contraband_sender(scanned, user)
	if(isitem(scanned))
		var/obj/item/contraband_item = scanned
		var/contraband_status = contraband_item.is_wanted_contraband()
		if((contraband_status && scans_correctly) || (!contraband_status && !scans_correctly))
			return TRUE

	return FALSE

/**
 * The balloon animation, stolen and refactored from the fulton extraction pack code.
 *
 * Arguments:
 * - thing - the item that was scanned, and is wanted contraband.
 * - user - who is responsible for the trade?
 */
/obj/item/inspector/proc/create_balloon(atom/movable/thing, mob/living/user, obj/effect/extraction_holder/holder_obj, mutable_appearance/balloon2)
	var/obj/item/item_thing = thing

	var/mutable_appearance/balloon = mutable_appearance('icons/effects/fulton_balloon.dmi', "fulton_balloon", layer = VEHICLE_LAYER, appearance_flags = RESET_COLOR | RESET_ALPHA | RESET_TRANSFORM | KEEP_APART)
	balloon.pixel_z = 10
	holder_obj.cut_overlay(balloon2)
	holder_obj.add_overlay(balloon)
	playsound(holder_obj.loc, 'sound/items/fulton/fultext_deploy.ogg', vol = 50, vary = TRUE, extrarange = -3)

	animate(holder_obj, pixel_z = 10, time = 2 SECONDS, flags = ANIMATION_RELATIVE)
	animate(pixel_z = 5, time = 1 SECONDS, flags = ANIMATION_RELATIVE)
	animate(pixel_z = -5, time = 1 SECONDS, flags = ANIMATION_RELATIVE)
	animate(pixel_z = 5, time = 1 SECONDS, flags = ANIMATION_RELATIVE)
	animate(pixel_z = -5, time = 1 SECONDS, flags = ANIMATION_RELATIVE)

	sleep(6 SECONDS)

	playsound(holder_obj.loc, 'sound/items/fulton/fultext_launch.ogg', vol = 50, vary = TRUE, extrarange = -3)
	animate(holder_obj, pixel_z = 1000, time = 3 SECONDS, flags = ANIMATION_RELATIVE)

	sleep(3 SECONDS)

	for(var/datum/uplink_item/traitor_item as anything in SStraitor.uplink_items)
		if(istype(item_thing, traitor_item.item))
			if(!(traitor_item.uplink_item_flags & SYNDIE_ITEM_SEC_FULTONABLE))
				return
			qdel(item_thing) // We remove the contraband
			item_thing = new traitor_item.wanted_item_result(holder_obj) // Then replace it with the reward

	holder_obj.appearance = item_thing.appearance // Be sure to update the appearance
	holder_obj.add_overlay(balloon) // ... and re-add the balloon visuals.
	animate(holder_obj, pixel_z = 1000, time = 0 SECONDS, flags = ANIMATION_RELATIVE) // Updating the appearance resets the location, send it back up.

	sleep(1 SECONDS)

	animate(holder_obj, pixel_z = -990, time = 5 SECONDS, flags = ANIMATION_RELATIVE)
	animate(pixel_z = 5, time = 0.5 SECONDS, flags = ANIMATION_RELATIVE)
	animate(pixel_z = -5, time = 0.5 SECONDS, flags = ANIMATION_RELATIVE)

	sleep(6 SECONDS)

	var/mutable_appearance/balloon3 = mutable_appearance('icons/effects/fulton_balloon.dmi', "fulton_retract", layer = VEHICLE_LAYER, appearance_flags = RESET_COLOR | RESET_ALPHA | RESET_TRANSFORM | KEEP_APART)
	balloon3.pixel_z = 10
	holder_obj.cut_overlay(balloon)
	holder_obj.add_overlay(balloon3)

	sleep(0.4 SECONDS)

	holder_obj.cut_overlay(balloon3)
	animate(holder_obj, pixel_z = -10, time = 0.5 SECONDS, flags = ANIMATION_RELATIVE)
	sleep(0.5 SECONDS)
	item_thing.forceMove(holder_obj.loc)
	qdel(holder_obj)

#undef ENERGY_TO_SPEAK
