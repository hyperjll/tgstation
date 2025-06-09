/datum/element/clockwork_tiles
	element_flags = ELEMENT_BESPOKE | ELEMENT_DETACH_ON_HOST_DESTROY // Detach for turfs
	argument_hash_start_idx = 2


/datum/element/clockwork_tiles/Attach(atom/target, rust_icon, rust_icon_state)
	. = ..()
	if(!isatom(target))
		return ELEMENT_INCOMPATIBLE
	RegisterSignal(target, COMSIG_ATOM_ENTERED, PROC_REF(on_entered))
	RegisterSignal(target, COMSIG_ATOM_EXITED, PROC_REF(on_exited))

/datum/element/clockwork_tiles/Detach(atom/source)
	. = ..()
	UnregisterSignal(source, COMSIG_ATOM_ENTERED)
	UnregisterSignal(source, COMSIG_ATOM_EXITED)
	for(var/mob/living/victim in source)
		victim.remove_status_effect(/datum/status_effect/clockwork_tile)

/datum/element/clockwork_tiles/proc/on_entered(turf/source, atom/movable/entered, ...)
	SIGNAL_HANDLER

	if(!isliving(entered))
		return
	var/mob/living/victim = entered
	if(!IS_CLOCK(victim))
		return
	victim.apply_status_effect(/datum/status_effect/clockwork_tile)

/datum/element/clockwork_tiles/proc/on_exited(turf/source, atom/movable/gone)
	SIGNAL_HANDLER
	if(!isliving(gone))
		return
	var/mob/living/leaver = gone
	leaver.remove_status_effect(/datum/status_effect/clockwork_tile)

