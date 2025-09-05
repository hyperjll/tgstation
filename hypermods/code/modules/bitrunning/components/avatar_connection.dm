/// We died while trapped, rejuvenate.
/datum/component/avatar_connection/proc/on_trapped_death(mob/living/carbon/source, gibbed)
	SIGNAL_HANDLER
	source.revive(HEAL_ALL, force_grab_ghost = TRUE)
	source.balloon_alert(source, "death is not an escape!")
