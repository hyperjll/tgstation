/obj/item/gun/medbeam/harmful
	name = "Medical Beamgun"
	desc = "Don't cross the streams!"
	max_range = 12

/obj/item/gun/medbeam/harmful/on_beam_tick(mob/living/target)
	if(target.health != target.maxHealth)
		new /obj/effect/temp_visual/heal(get_turf(target), COLOR_HEALING_CYAN)
	var/need_mob_update
	need_mob_update = target.adjustBruteLoss(4, updating_health = FALSE, forced = TRUE)
	need_mob_update += target.adjustFireLoss(4, updating_health = FALSE, forced = TRUE)
	if(need_mob_update)
		target.updatehealth()
	return


