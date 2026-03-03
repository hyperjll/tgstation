/datum/ai_module/construction
	name = "Remote Rapid Construction"
	description = "A rare prototype program which branched off long ago from early RCD technology.."
	one_purchase = TRUE
	power_type = /datum/action/innate/ai/ranged/construction
	unlock_sound = 'sound/items/tools/rped.ogg'

/datum/action/innate/ai/ranged/construction // Be warned, the following below is some of the most god-awful hacky code i think i've ever made.
	name = "Remote Rapid Construction"
	desc = "Engage your experimental remote construction device to build one of several types of objects. Building objects this way cost large quantities of your internal battery."
	button_icon = 'icons/obj/tools.dmi'
	button_icon_state = "rcd"
	ranged_mousepointer = 'icons/effects/mouse_pointers/supplypod_target.dmi'
	enable_text = span_notice("You engage your remote-use R.C.D.")
	disable_text = span_notice("You disengage your remote-use R.C.D.")
	var/build_delay = 5 SECONDS
	var/battery_cost = 100
	// Adding things to this list via other upgrades or admin varedits will allow the AI to build more stuff.
	var/list/possible_objects = list(
		/obj/structure/bed,
		/obj/structure/table,
		/obj/structure/rack,
		/obj/structure/closet,
		/obj/structure/window/fulltile,
		/obj/structure/girder,
	)
	// I'm putting the discounted lists here for potential upgrades and admin varedit stuff.
	var/list/eighty_off = list(
		/obj/structure/bed,
		/obj/structure/table,
		/obj/structure/rack,
		/obj/structure/closet,
	)
	var/list/sixty_off = list(
		/obj/structure/window/fulltile,
		/obj/structure/girder,
	)
	var/list/fourty_off = list()
	var/list/twenty_off = list()

/datum/action/innate/ai/ranged/construction/proc/generate_display_names()
	var/static/list/objects
	if(!objects)
		objects = list()
		for(var/obj/buildable_obj as anything in possible_objects)
			objects[initial(buildable_obj.name)] = buildable_obj
	return objects

/datum/action/innate/ai/ranged/construction/proc/get_possible_discount(obj/obj_to_make) // Used by the proc below to determine if what we selects costs more or less.
	var/discount = 1 // acts as a multiplier for the battery_cost
	if(length(eighty_off))
		for(var/obj/buildable_obj as anything in eighty_off)
			if(obj_to_make == buildable_obj)
				discount = 0.2 // 20% of the 100 battery cost, making these cost 20 battery.
				return discount
	if(length(sixty_off))
		for(var/obj/buildable_obj as anything in sixty_off)
			if(obj_to_make == buildable_obj)
				discount = 0.4 // 40% of the 100 battery cost, making these cost 40 battery.
				return discount
	if(length(fourty_off))
		for(var/obj/buildable_obj as anything in fourty_off)
			if(obj_to_make == buildable_obj)
				discount = 0.6 // 60% of the 100 battery cost, making these cost 60 battery.
				return discount
	if(length(twenty_off))
		for(var/obj/buildable_obj as anything in twenty_off)
			if(obj_to_make == buildable_obj)
				discount = 0.8 // 80% of the 100 battery cost, making these cost 80 battery.
				return discount
	return discount

/datum/action/innate/ai/ranged/construction/do_ability(mob/living/clicker, atom/clicked_on)
	if (!isAI(clicker))
		return FALSE
	var/mob/living/silicon/ai/ai_clicker = clicker

	if(clicker.incapacitated)
		unset_ranged_ability(clicker)
		return FALSE

	if(isopenturf(clicked_on))
		var/turf/open/open = clicked_on
		if(!open.CanBuildHere())
			return FALSE

	var/list/display_names = generate_display_names()
	if(!length(display_names))
		return
	var/obj_to_make = tgui_input_list(clicker, "What do you want to build here?", "Construction Menu", display_names)
	if(isnull(obj_to_make) || isnull(display_names[obj_to_make]))
		return

	obj_to_make = display_names[obj_to_make]
	var/obj_discount = get_possible_discount(obj_to_make)

	if(ai_clicker.battery - (battery_cost * obj_discount) <= 0)
		to_chat(ai_clicker, span_warning("You do not have the battery to build this!"))
		return FALSE

	var/obj/effect/constructing_effect/rcd_effect = new(get_turf(clicked_on), build_delay, obj_to_make, NONE)

	var/beam
	beam = clicker.Beam(clicked_on, icon_state = "rped_upgrade", time = build_delay)

	if(!do_after(clicker, build_delay, target = clicked_on))
		qdel(rcd_effect)
		if(!isnull(beam))
			qdel(beam)
		return FALSE

	if (QDELETED(rcd_effect))
		return FALSE

	new obj_to_make(get_turf(clicked_on))

	playsound(get_turf(clicked_on), 'sound/machines/click.ogg', 50, TRUE)
	rcd_effect.end_animation()

	ai_clicker.battery -= (battery_cost * obj_discount)

/obj/item/ai_construction_upgrade
	name = "remote construction upgrade"
	desc = "An upgrade for A.I's with the remote construction upgrade installed. It grants them new things to construct."
	icon = 'icons/obj/devices/floppy_disks.dmi'
	icon_state = "datadisk1"
	/// Actual new stuff we can build, requires a typepath.
	var/list/new_constructions = list()
	/// If any new stuff should be discounted, add it to one of these for the appropriate discount amount.
	var/list/new_eighty_off = list()
	var/list/new_sixty_off = list()
	var/list/new_fourty_off = list()
	var/list/new_twenty_off = list()

/obj/item/ai_construction_upgrade/pre_attack(atom/A, mob/living/user, proximity)
	if(!proximity)
		return ..()
	if(!isAI(A))
		return ..()
	var/mob/living/silicon/ai/AI = A
	var/datum/action/innate/ai/ranged/construction/action = locate(/datum/action/innate/ai/ranged/construction) in AI.actions
	if(!action)
		to_chat(user, "[AI] doesn't have the appropriate upgrade(s) installed!")
		return FALSE
	if(length(new_constructions))
		action.possible_objects |= new_constructions
	if(length(new_eighty_off))
		action.eighty_off |= new_eighty_off
	if(length(new_sixty_off))
		action.sixty_off |= new_sixty_off
	if(length(new_fourty_off))
		action.fourty_off |= new_fourty_off
	if(length(new_twenty_off))
		action.twenty_off |= new_twenty_off
	log_silicon("[key_name(user)] has upgraded [key_name(AI)] with a [src].")
	message_admins("[ADMIN_LOOKUPFLW(user)] has upgraded [ADMIN_LOOKUPFLW(AI)] with a [src].")
	to_chat(user, span_notice("You install [src], allowing for turret construction if it didn't already."))
	qdel(src)
	return TRUE

/obj/item/ai_construction_upgrade/turrets
	name = "turret construction upgrade"
	desc = "A illegal upgrade for A.I's with the remote construction upgrade installed. This particular variant allows A.I's to build new turrets."
	new_constructions = list(
		/obj/machinery/porta_turret/ai,
	)
