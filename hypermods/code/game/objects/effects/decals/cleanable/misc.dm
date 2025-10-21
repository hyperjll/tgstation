//-----------
// Nuke Gibs
//-----------
/obj/effect/decal/cleanable/nuke_debris
	name = "nuke debris"
	desc = "Glad that's finally over with."
	icon = 'hypermods/icons/obj/machines/nuke.dmi'
	icon_state = "debris2"
	random_icon_states = null

/obj/effect/decal/cleanable/nuke_debris/proc/streak(list/directions, mapload=FALSE)
	var/direction = pick(directions)
	var/range = pick(1, 200; 2, 150; 3, 50; 4, 17; 50) //the 3% chance of 50 steps is intentional and played for laughs.
	if(!step_to(src, get_step(src, direction), 0))
		return
	if(mapload)
		for (var/i in 1 to range)
			if (!step_to(src, get_step(src, direction), 0))
				break
		return

/obj/effect/decal/cleanable/nuke_debris/timer
	icon_state = "debris1"

/obj/effect/decal/cleanable/nuke_debris/main
	icon_state = "debris4"

/obj/effect/decal/cleanable/nuke_debris/slot
	icon_state = "debris3"
