/obj/item/surplus_teleporter
	name = "surplus teleporter"
	desc = "An outdated reverse-engineered version of the Nanotrasen handheld teleporter. It's only capable of precise-teleportation in a pinch."
	icon = 'hypermods/icons/obj/devices/tracker.dmi'
	icon_state = "surplus-tele"
	throwforce = 5
	w_class = WEIGHT_CLASS_SMALL
	throw_speed = 4
	throw_range = 10
	obj_flags = CONDUCTS_ELECTRICITY
	inhand_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	//Uses of the device left
	var/charges = 5
	//The maximum number of stored uses
	var/max_charges = 5
	///Minimum distance to teleport user around
	var/minimum_teleport_distance = 4
	///Maximum distance to teleport user around
	var/maximum_teleport_distance = 8
	// How much blood lost per teleport (out of base 560 blood)
	var/bleed_amount = 50
	// Chance upon upon to self-destruct
	var/self_destruct_chance = 1

/obj/item/surplus_teleporter/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/surplus_teleporter/Destroy(force)
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/surplus_teleporter/examine(mob/user)
	. = ..()
	. += span_notice("[src] has <b>[charges]</b> out of [max_charges] charges left.")

/obj/item/surplus_teleporter/attack_self(mob/user)
	. = ..()
	if(.)
		return
	attempt_teleport(user = user)
	return TRUE

/obj/item/surplus_teleporter/process(seconds_per_tick, times_fired)
	if(SPT_PROB(10, seconds_per_tick) && charges < max_charges)
		charges++
		if(ishuman(loc))
			var/mob/living/carbon/human/holder = loc
			balloon_alert(holder, "surplus teleporter beeps")
		playsound(src, 'sound/machines/beep/twobeep.ogg', 10, TRUE, extrarange = SILENCED_SOUND_EXTRARANGE, falloff_distance = 0)

/obj/item/surplus_teleporter/proc/attempt_teleport(mob/living/user, not_holding_tele = FALSE)
	if(!charges)
		balloon_alert(user, "recharging!")
		return

	var/turf/current_location = get_turf(user)

	var/teleport_distance = rand(minimum_teleport_distance, maximum_teleport_distance)
	var/turf/destination = get_teleport_loc(current_location, user, teleport_distance)

	var/healthlossed = 0
	healthlossed = (user.getBruteLoss() + user.getFireLoss() + user.getToxLoss())

	if((user.getMaxHealth() / 4) < healthlossed) // Do you have a quarter of your health left or under?
		do_sparks(5,FALSE,user)
		var/F = find_safe_turf(zlevel = user.z, extended_safety_checks = TRUE)
		var/range = 0
		if(!F)
			do_sparks(5,FALSE,user)
			do_teleport(user, get_turf(user), teleport_distance, asoundin = 'sound/effects/phasein.ogg', channel = TELEPORT_CHANNEL_BLUESPACE) // Double the range if no safe turf
			to_chat(user, span_warning("You feel reality warp erratically as you're displaced!"))
		if(F)
			do_sparks(5,FALSE,user)
			to_chat(user, span_warning("You feel reality warp around you as you're teleported somewhere safe!"))
			do_teleport(user, F, range, channel = TELEPORT_CHANNEL_BLUESPACE)
	else
		do_sparks(5,FALSE,user)
		to_chat(user, span_notice("You feel reality warp around you as you're teleported!"))
		do_teleport(user, get_turf(user), teleport_distance, asoundin = 'sound/effects/phasein.ogg', channel = TELEPORT_CHANNEL_BLUESPACE)

	charges = max(charges - 1, 0)
	new /obj/effect/temp_visual/teleport_abductor/syndi_teleporter(current_location)
	new /obj/effect/temp_visual/teleport_abductor/syndi_teleporter(destination)
	if(make_bloods(current_location, destination, user))
		new /obj/effect/temp_visual/circle_wave/syndi_teleporter/bloody(destination)
	else
		new /obj/effect/temp_visual/circle_wave/syndi_teleporter(destination)
	playsound(current_location, SFX_PORTAL_ENTER, 50, 1, SHORT_RANGE_SOUND_EXTRARANGE)
	playsound(destination, 'sound/effects/phasein.ogg', 25, 1, SHORT_RANGE_SOUND_EXTRARANGE)
	playsound(destination, SFX_PORTAL_ENTER, 50, 1, SHORT_RANGE_SOUND_EXTRARANGE)

	if(prob(self_destruct_chance))
		explosion(src, 0, 0, 4, flame_range = 0)
		qdel(src)

///Bleed and make blood splatters at tele start and end points
/obj/item/surplus_teleporter/proc/make_bloods(turf/old_location, turf/new_location, mob/living/user)
	if(HAS_TRAIT(user, TRAIT_NOBLOOD))
		return FALSE
	user.add_splatter_floor(old_location)
	user.add_splatter_floor(new_location)
	if(!iscarbon(user))
		return FALSE
	var/mob/living/carbon/carbon_user = user

	// always lose a bit
	carbon_user.bleed(bleed_amount * 0.25)
	// sometimes lose a lot
	// average evens out to 10 per teleport, but the randomness spices things up
	if(prob(25) && bleed_amount)
		playsound(src, 'sound/effects/wounds/pierce1.ogg', 40, vary = TRUE)
		visible_message(span_warning("Blood visibly spurts out of [user] as [src] fails to teleport [user.p_their()] body properly!"), \
			span_boldwarning("Blood visibly spurts out of you as [src] fails to teleport your body properly!"))
		carbon_user.bleed(bleed_amount * 0.75)
		carbon_user.spray_blood(pick(GLOB.alldirs), rand(1, 3))
		return TRUE

	return FALSE
	// retval used for picking wave type
