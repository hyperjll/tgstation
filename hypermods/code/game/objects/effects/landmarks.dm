/obj/effect/landmark/start/commando_nukeop
	name = "commando nukeop"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "snukeop_spawn"

/obj/effect/landmark/start/commando_nukeop/Initialize(mapload)
	..()
	GLOB.commando_nukeop_start += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/start/commando_nukeop_leader
	name = "commando nukeop leader"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "snukeop_leader_spawn"

/obj/effect/landmark/start/commando_nukeop_leader/Initialize(mapload)
	..()
	GLOB.commando_nukeop_leader_start += loc
	return INITIALIZE_HINT_QDEL
