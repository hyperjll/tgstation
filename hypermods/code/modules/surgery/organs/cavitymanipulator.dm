/obj/item/cavitymanipulator
	name = "cavity manipulator"
	desc = "A device that automatically inserts an item into the chest cavity of those it's used upon. \
			Can also be used to extract any items within the chest cavity, should one exist."
	icon = 'icons/obj/devices/tool.dmi'
	icon_state = "autosurgeon_syndicate"
	inhand_icon_state = "nothing"
	w_class = WEIGHT_CLASS_SMALL
	/// How many times you can use the autosurgeon before it becomes useless
	var/uses = INFINITE
	/// What organ will the autosurgeon sub-type will start with. ie, CMO autosurgeon start with a medi-hud.
	var/starting_item
	/// The organ currently loaded in the autosurgeon, ready to be implanted.
	var/obj/item/stored_item
	/// The list of organs and their children we allow into the autosurgeon. An empty list means no whitelist.
	var/list/item_whitelist = list()
	/// The percentage modifier for how fast you can use the autosurgeon to implant other people.
	var/surgery_speed = 1
	/// The overlay that shows when the autosurgeon has an organ inside of it.
	var/loaded_overlay = "autosurgeon_syndicate_loaded_overlay"

/obj/item/cavitymanipulator/attack_self_tk(mob/user)
	return //stops TK fuckery

/obj/item/cavitymanipulator/Initialize(mapload)
	. = ..()
	if(starting_item)
		load_organ(new starting_item(src))

/obj/item/cavitymanipulator/update_overlays()
	. = ..()
	if(stored_item)
		. += loaded_overlay
		. += emissive_appearance(icon, loaded_overlay, src)

/obj/item/cavitymanipulator/proc/load_organ(obj/item/loaded_item, mob/living/user)
	if(user)
		if(stored_item)
			to_chat(user, span_alert("[src] already has an item stored."))
			return

		if(uses == 0)
			to_chat(user, span_alert("[src] is used up and cannot be loaded with more items."))
			return

		if(!user.transferItemToLoc(stored_item, src))
			to_chat(user, span_alert("[stored_item] is stuck to your hand!"))
			return

	stored_item = loaded_item
	loaded_item.forceMove(src)

	name = "[initial(name)] ([stored_item.name])"
	update_appearance()

/obj/item/cavitymanipulator/proc/use_autosurgeon(mob/living/target, mob/living/user, implant_time)
	if(!uses)
		to_chat(user, span_alert("[src] has already been used. The tools are dull and won't reactivate."))
		return

	if(implant_time)
		user.visible_message(
			span_notice("[user] leans over [target] omninously..."),
			span_notice("You begin to prepare to use [src] on [target]."),
		)
		if(!do_after(user, (implant_time * surgery_speed), target))
			return

	if(target != user)
		log_combat(user, target, "cavity manipulator implanted [stored_item] into", "[src]", "in [AREACOORD(target)]")
		user.visible_message(span_notice("[user] grins after leaning over [target]'s body."), span_notice("You press a button on [src] as it plunges into [target]'s body."))
	else
		user.visible_message(
			span_notice("[user] flinches after using a suspicious device upon [user.p_their()] body."),
			span_notice("You press a button on [src] as it plunges into your body."),
		)

	var/obj/item/item_for_cavity
	var/obj/item/bodypart/chest/target_chest = target.get_bodypart(BODY_ZONE_CHEST)
	item_for_cavity = target_chest.cavity_item

	if(item_for_cavity || ((stored_item.w_class > WEIGHT_CLASS_NORMAL) && !is_type_in_typecache(stored_item, GLOB.heavy_cavity_implants)) || HAS_TRAIT(stored_item, TRAIT_NODROP) || isorgan(stored_item))
		to_chat(user, span_warning("You can't seem to fit [stored_item] in [target]'s chest cavity!"))
		return FALSE

	user.transferItemToLoc(stored_item, target) //put that shit in
	//stored_item.forceMove(target)
	target_chest.cavity_item = stored_item
	// Note that this shit runtimes (Cannot execute null.do drop animation())
	stored_item = null
	name = initial(name) //get rid of the organ in the name
	playsound(target.loc, 'sound/weapons/circsawhit.ogg', 50, vary = TRUE)
	update_appearance()

	if(uses)
		uses--
	if(uses == 0)
		desc = "[initial(desc)] Looks like it's been used up."

/obj/item/cavitymanipulator/attack_self(mob/user)//when the object it used...
	use_autosurgeon(user, user)

/obj/item/cavitymanipulator/attack(mob/living/target, mob/living/user, params)
	add_fingerprint(user)
	use_autosurgeon(target, user, 4 SECONDS)

/obj/item/cavitymanipulator/attackby(obj/item/attacking_item, mob/user, params)
	if(isorgan(attacking_item))
		return ..()
	else
		load_organ(attacking_item, user)

/obj/item/cavitymanipulator/screwdriver_act(mob/living/user, obj/item/screwtool)
	if(..())
		return TRUE
	if(!stored_item)
		to_chat(user, span_warning("There's no item in [src] for you to remove!"))
	else
		var/atom/drop_loc = user.drop_location()
		//for(var/atom/movable/stored_implant as anything in src)
		stored_item.forceMove(drop_loc)
		to_chat(user, span_notice("You remove the [stored_item] from [src]."))
		stored_item = null

		screwtool.play_tool_sound(src)
		//if (uses)
		//	uses--
		//if(!uses)
		//	desc = "[initial(desc)] Looks like it's been used up."
		update_appearance(UPDATE_ICON)
	return TRUE
