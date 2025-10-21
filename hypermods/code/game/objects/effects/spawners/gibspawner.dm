/obj/effect/gibspawner/nuke
	sound_to_play = 'sound/items/weapons/smash.ogg'
	gibtypes = list(/obj/effect/decal/cleanable/nuke_debris, /obj/effect/decal/cleanable/nuke_debris/timer, /obj/effect/decal/cleanable/nuke_debris/slot)

/obj/effect/gibspawner/nuke/Initialize(mapload)
	if(!gibdirections.len)
		gibdirections = list(list(NORTH, NORTHWEST),list(SOUTH, SOUTHEAST, SOUTHWEST),list(EAST, NORTHEAST, WEST))
	return ..()
