/obj/item/light/tube/radiation
	name = "light tube"
	desc = "A replacement light tube."
	var/last_event = 0

/obj/item/light/tube/radiation/Initialize(mapload)
	. = ..()
	src.AddComponent(
		/datum/component/radioactive_emitter, \
		cooldown_time = 10 SECONDS, \
		range = 6, \
		threshold = RAD_MEDIUM_INSULATION, \
	)

/obj/item/light/tube/radiation/Destroy()
	. = ..()
	qdel(src.GetComponent(/datum/component/radioactive_emitter))
	STOP_PROCESSING(SSobj, src)

/obj/item/light/tube/radiation/process()
	if(prob(4))
		radiate()

/obj/item/light/tube/radiation/proc/radiate()
	if(world.time > last_event+15)
		radiation_pulse(src, 100, 2, TRUE)
		last_event = world.time
		return

/obj/item/light/tube/radiation/broken
	status = LIGHT_BROKEN


/obj/item/light/bulb/radiation
	name = "light bulb"
	desc = "A replacement light bulb."
	var/last_event = 0

/obj/item/light/bulb/radiation/Initialize(mapload)
	. = ..()
	src.AddComponent(
		/datum/component/radioactive_emitter, \
		cooldown_time = 10 SECONDS, \
		range = 6, \
		threshold = RAD_MEDIUM_INSULATION, \
	)

/obj/item/light/bulb/radiation/Destroy()
	. = ..()
	qdel(src.GetComponent(/datum/component/radioactive_emitter))

/obj/item/light/bulb/radiation/process()
	if(prob(4))
		radiate()

/obj/item/light/bulb/radiation/proc/radiate()
	if(world.time > last_event+15)
		radiation_pulse(src, 100, 2, TRUE)
		last_event = world.time
		return

/obj/item/light/bulb/radiation/broken
	status = LIGHT_BROKEN


/obj/item/light/tube/syndirig
	name = "light tube"
	var/syndicaterig = TRUE

/obj/item/light/bulb/syndirig
	name = "light bulb"
	var/syndicaterig = TRUE

/obj/item/light/tube/syndirig/shatter()
	if(status == LIGHT_OK || status == LIGHT_BURNED)
		visible_message(span_danger("[src] shatters."))
		status = LIGHT_BROKEN
		force = 5
		playsound(src.loc, 'sound/effects/glass/glasshit.ogg', 75, 1)
		if(syndicaterig)
			atmos_spawn_air("plasma=5") //5u of plasma are required to rig a light bulb/tube
			addtimer(CALLBACK(src, PROC_REF(syndiplode)), 60 SECONDS)
		update_appearance(UPDATE_DESC | UPDATE_ICON)

/obj/item/light/tube/syndirig/proc/syndiplode()
	explosion(src, 0, 2, 3, 4)
	qdel(src)

/obj/item/light/bulb/syndirig/shatter()
	if(status == LIGHT_OK || status == LIGHT_BURNED)
		visible_message(span_danger("[src] shatters."))
		status = LIGHT_BROKEN
		force = 5
		playsound(src.loc, 'sound/effects/glass/glasshit.ogg', 75, 1)
		if(syndicaterig)
			atmos_spawn_air("plasma=5") //5u of plasma are required to rig a light bulb/tube
			addtimer(CALLBACK(src, PROC_REF(syndiplode)), 60 SECONDS)
		update_appearance(UPDATE_DESC | UPDATE_ICON)

/obj/item/light/bulb/syndirig/proc/syndiplode()
	explosion(src, 0, 2, 3, 4)
	qdel(src)
