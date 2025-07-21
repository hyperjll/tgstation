/obj/projectile/ice_anomaly
	name = "ice shard"
	icon = 'hypermods/icons/effects/anomalies.dmi'
	icon_state = "ice_crystal_proj"
	damage = 8
	var/temperature = 100

/obj/projectile/ice_anomaly/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(!isliving(target))
		return ..()

	if(HAS_TRAIT(target, TRAIT_RESISTCOLD))
		return ..()

	if(blocked != 100)
		var/mob/living/carbon/human/human_hit = target
		human_hit.apply_status_effect(/datum/status_effect/freon)
		human_hit.adjust_bodytemperature(((100-blocked)/100)*(temperature - human_hit.bodytemperature))
	return ..()
