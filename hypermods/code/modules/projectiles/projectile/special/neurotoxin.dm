/obj/projectile/energy/xenoglob
	name = "glob of acidic neurotoxin"
	icon = 'icons/obj/weapons/guns/projectiles.dmi'
	icon_state = "xenoshot0"
	damage = 10
	damage_type = STAMINA
	armour_penetration = 0
	reflectable = NONE
	wound_bonus = 0
	exposed_wound_bonus = 0
	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser

/obj/projectile/energy/xenoglob/on_hit(atom/target, blocked, pierce_hit)
	if((blocked != 100) && iscarbon(target))
		var/mob/living/carbon/victim = target
		victim.reagents.add_reagent(/datum/reagent/toxin/acid, 3)
		victim.reagents.add_reagent(/datum/reagent/toxin/staminatoxin/neurotoxin_alien, 2)
	return ..()
