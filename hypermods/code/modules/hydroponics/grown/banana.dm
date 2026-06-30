/obj/item/grown/bananapeel/super
	name = "super banana peel"
	desc = "This one looks so slippery, you'd probabl- WOAH! SHIT! *glass table shatter sfx*"
	var/launch_distance = 15
	var/launch_speed = 10

/obj/item/grown/bananapeel/super/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_MOVABLE_MOVED, PROC_REF(on_peel_moved))
	if (src.loc)
		RegisterSignal(src.loc, COMSIG_ATOM_ENTERED, PROC_REF(on_obj_entered))
		RegisterSignal(src.loc, COMSIG_ATOM_AFTER_SUCCESSFUL_INITIALIZED_ON, PROC_REF(on_atom_initialized_on))

/obj/item/grown/bananapeel/super/proc/on_peel_moved(atom/movable/source, atom/old_loc, dir, forced)
	SIGNAL_HANDLER
	if(old_loc)
		UnregisterSignal(old_loc, list(COMSIG_ATOM_ENTERED, COMSIG_ATOM_AFTER_SUCCESSFUL_INITIALIZED_ON))

	if(src.loc)
		RegisterSignal(src.loc, COMSIG_ATOM_ENTERED, PROC_REF(on_obj_entered))
		RegisterSignal(src.loc, COMSIG_ATOM_AFTER_SUCCESSFUL_INITIALIZED_ON, PROC_REF(on_atom_initialized_on))

/obj/item/grown/bananapeel/super/proc/on_obj_entered(atom/new_loc, atom/movable/arrived, atom/old_loc)
	SIGNAL_HANDLER
	if(istype(arrived, /mob/living) && old_loc != src)
		var/mob/living/our_living_mob = arrived
		var/direction = pick(GLOB.cardinals)
		our_living_mob.throw_at(get_edge_target_turf(src, direction), launch_distance, launch_speed)
		qdel(src)

/obj/item/grown/bananapeel/super/proc/on_atom_initialized_on(atom/loc, atom/new_atom)
	SIGNAL_HANDLER
	if(is_type_in_list(new_atom, /mob/living))
		var/mob/living/our_living_mob = new_atom
		var/direction = pick(GLOB.cardinals)
		our_living_mob.throw_at(get_edge_target_turf(src, direction), launch_distance, launch_speed)
		qdel(src)

/obj/item/grown/bananapeel/super/equipped(mob/living/user, slot)
	. = ..()
	var/mob/living/our_living_mob = user
	var/direction = pick(GLOB.cardinals)
	our_living_mob.throw_at(get_edge_target_turf(src, direction), launch_distance, launch_speed)
	qdel(src)

/obj/item/grown/bananapeel/super/Destroy(force)
	UnregisterSignal(src, list(COMSIG_MOVABLE_MOVED, COMSIG_ATOM_ENTERED, COMSIG_ATOM_AFTER_SUCCESSFUL_INITIALIZED_ON))
	. = ..()
