//Syndie ammo

/obj/projectile/bullet/shotgun/slug/syndie
	name = "12g syndicate shotgun slug"
	damage = 60

/obj/projectile/bullet/pellet/shotgun_buckshot/syndie
	name = "syndicate buckshot pellet"
	damage = 14.5 //3.5 more damage so it sucks less?
	wound_bonus = 2
	bare_wound_bonus = 2
	armour_penetration = 0 //So it doesn't suffer against armor (it's for nukies only)

// Close-range wounding shots

/obj/projectile/bullet/pellet/shotgun_flechette
	name = "flechette pellet"
	speed = 0.4 //You're special
	damage = 12
	wound_bonus = 4
	bare_wound_bonus = 4
	armour_penetration = 40
	wound_falloff_tile = -1

// Lethal energy shots

/obj/projectile/beam/laser/buckshot
	damage = 10

// Penetrative shots

/obj/projectile/bullet/shotgun/slug/uranium
	name = "depleted uranium slug"
	icon_state = "ubullet"
	damage = 35 //Most certainly to drop below 3-shot threshold because of damage falloff
	armour_penetration = 60 // he he funny round go through armor
	wound_bonus = -40
	demolition_mod = 3 // very good at smashing through stuff
	projectile_piercing = ALL

// Freezing shots

/obj/projectile/bullet/pellet/shotgun_cryoshot
	name = "cryoshot pellet"
	damage = 6
	var/temperature = 100

/obj/projectile/bullet/pellet/shotgun_cryoshot/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(isliving(target))
		var/mob/living/carbon/H = target
		H.adjust_bodytemperature((temperature - H.bodytemperature))
		H.reagents.add_reagent(/datum/reagent/inverse/cryostylane, 10)

// Lightning shots

/obj/projectile/bullet/pellet/shotgun_thundershot
	name = "thundershot pellet"
	damage = 3
	hitsound = 'sound/effects/magic/lightningbolt.ogg'
	var/zap_flags = ZAP_MOB_DAMAGE | ZAP_OBJ_DAMAGE | ZAP_LOW_POWER_GEN

/obj/projectile/bullet/pellet/shotgun_thundershot/on_hit(atom/target, blocked = 0, pierce_hit)
	..()
	tesla_zap(target, rand(2, 3), 17500, cutoff = 1e3, zap_flags = zap_flags)
	return BULLET_ACT_HIT

// Non-lethal Energy shots

/obj/projectile/bullet/pellet/hardlight
	name = "scattered hardlight beam"
	icon_state = "disabler_bullet"
	damage = 30
	armor_flag = ENERGY
	damage_type = STAMINA // Doesn't do "real" damage
	armour_penetration = -40

// Super slugs?

/obj/projectile/bullet/shotgun/slug/rip
	name = "ripslug"
	armour_penetration = -40 // aim for the legs :)
	damage =  50 //higher because two slugs at once, on par with syndi slugs but with negative AP out the whazoo, and more drop off

// Ricochet shells

/obj/projectile/bullet/pellet/shotgun_anarchy
	name = "anarchy pellet"
	damage = 4 // 4x10 at point blank
	ricochets_max = 3
	reflect_range_decrease = 1
	ricochet_chance = 100
	ricochet_auto_aim_range = 5
	ricochet_auto_aim_angle = 30
	ricochet_incidence_leeway = 0

/obj/projectile/bullet/pellet/shotgun_anarchy/check_ricochet(atom/A)
	if(istype(A, /turf/closed))
		return TRUE
	return FALSE

/obj/projectile/bullet/pellet/shotgun_anarchy/check_ricochet_flag(atom/A)
	return TRUE

// Prank shells

/obj/projectile/bullet/pellet/shotgun_clownshot
	name = "clownshot pellet"
	damage = 0
	hitsound = 'sound/items/bikehorn.ogg'
