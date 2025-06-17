/obj/item/grenade/cryogenic
	name = "cryogenic grenade"
	desc = "Used for making certain areas unreliable for travel."
	icon = 'hypermods/icons/obj/weapons/grenade.dmi'
	icon_state = "cryo"
	base_icon_state = "cryo"
	var/base_damage = 16
	var/freezing_range = 7 //how many tiles away the mob will be stunned.
	var/freeze_duration = 1 MINUTES

/obj/item/grenade/cryogenic/detonate()
	update_mob()

	var/freezing_turf = get_turf(src)
	if(!freezing_turf)
		return

	playsound(freezing_turf, 'sound/effects/magic/ethereal_exit.ogg', 50, 1)

	for(var/any_turf in circle_range_turfs(center = get_turf(freezing_turf), radius = freezing_range))
		if(!isopenturf(any_turf))
			continue
		var/turf/open/open_turf = any_turf
		open_turf.MakeSlippery(TURF_WET_PERMAFROST, freeze_duration, freeze_duration, freeze_duration)
		//open_turf.temperature = temp -- not necessary.

	qdel(src)
	return
