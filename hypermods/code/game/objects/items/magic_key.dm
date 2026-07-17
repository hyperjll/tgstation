/obj/item/magic_key
	name = "magic key"
	desc = "A small purple key, when used, it'll unlock things around the user."
	icon = 'hypermods/icons/obj/card.dmi'
	icon_state = "magic_key"

/obj/item/magic_key/attack_self(mob/user)
	. = ..()
	for(var/turf/possible_turfs in oview(1, user))
		SEND_SIGNAL(possible_turfs, COMSIG_ATOM_MAGICALLY_UNLOCKED, src, user)
	qdel(src)
