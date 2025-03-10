/obj/item/grenade/c4/x4/gibtonite
	name = "gibtonite charge"
	desc = "A refined chunk of Gibtonite. It's designed to detonate shortly after being stuck against an object or person."
	icon = 'hypermods/icons/obj/weapons/grenade.dmi'
	icon_state = "plasticgib0"
	inhand_icon_state = "plasticgib"

/obj/item/grenade/c4/breaching
	name = "breaching charge"
	desc = "A timed device that releases a relatively strong concussive force, strong enough to destroy rock and metal."
	icon = 'hypermods/icons/obj/weapons/grenade.dmi'
	icon_state = "bcharge0"
	boom_sizes = list(0, 0, 1)

/obj/item/grenade/c4/breaching/Initialize(mapload)
	. = ..()
	plastic_overlay = mutable_appearance(icon, "bcharge2", HIGH_OBJ_LAYER)


/obj/item/grenade/c4/vortex
	name = "vortex charge"
	desc = "A peculiar charge that looks identical to a regular c4 charge. Though, the warning labels on the back beg to differ."
	boom_sizes = list(0, 0, 0)
	///The place that wiLL be used to summon the wormhole
	var/area/bombing_zone
	///the terrorist in question
	var/datum/weakref/bomber

/obj/item/grenade/c4/vortex/proc/set_bombing_zone()
	for(var/sanity in 1 to 100)
		var/area/selected_area = pick(get_sorted_areas())
		if(!is_station_level(selected_area.z) || !(selected_area.area_flags & VALID_TERRITORY))
			continue
		bombing_zone = selected_area
		break

/obj/item/grenade/c4/vortex/interact_with_atom(atom/movable/bombed, mob/user, flag)
	if(!isfloorturf(bombed))
		to_chat(user, span_notice("This vortex charge must be planted on a floor!"))
		return
	if((get_area(target) != bombing_zone) && (get_area(src) != bombing_zone))
		if (!active)
			to_chat(user, span_notice("This isn't the location you're supposed to use this!"))
			return
	bomber = WEAKREF(user)
	return ..()

/obj/item/grenade/c4/vortex/detonate(mob/living/lanced_by)
	if(!bomber)
		return
	var/turf/location
	location = get_turf(target)
	. = ..()
	var/obj/effect/anomaly/bhole/vortex_anom = new /obj/effect/anomaly/bhole(location)
	playsound(vortex_anom, 'sound/vehicles/rocketlaunch.ogg', 100, TRUE)
	notify_ghosts(
		"Someone created a Vortex Anomaly!",
		source = vortex_anom,
		header = "Vortex Anomaly Created",
		notify_flags = NOTIFY_CATEGORY_NOFLASH,
	)

/obj/item/grenade/c4/vortex/Destroy()
	bombing_zone = null
	bomber = null
	return ..()
