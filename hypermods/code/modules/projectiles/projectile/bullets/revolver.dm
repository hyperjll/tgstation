// .357 (Syndie Revolver)

/obj/projectile/bullet/pellet/a357_ironfeather
	name = ".357 Ironfeather pellet"
	damage = 8 //Total of 48 damage assuming PBS
	armour_penetration = 10 //In between normal pellets and flechette for AP
	wound_bonus = 7 //So it might be able to actually wound things
	bare_wound_bonus = 7
	damage_falloff_tile = 0.35 //Loses 0.05 damage less per tile than standard damaging pellets
	wound_falloff_tile = -1.5 //Still probably won't cause wounds at range

/obj/projectile/bullet/a357/nutcracker
	name = ".357 Nutcracker bullet"
	damage = 30
	demolition_mod = 20
/**
/obj/projectile/bullet/a357/nutcracker/on_hit(atom/target) //Basically breaching slug with 1.5x damage
	if(istype(target, /obj/structure/window) || istype(target, /obj/machinery/door) || istype(target, /obj/structure/door_assembly))
		damage = 750 //One shot to break a window, two shots for a door, three if reinforced
	..()
**/
/obj/projectile/bullet/a357/metalshock
	name = ".357 Metalshock bullet"
	damage = 15
	wound_bonus = -5
	var/zap_flags = ZAP_MOB_DAMAGE | ZAP_OBJ_DAMAGE | ZAP_LOW_POWER_GEN
	var/zap_range = 3
	var/power = 1e4

/obj/projectile/bullet/a357/metalshock/on_hit(atom/target, blocked = FALSE, pierce_hit)
	..()
	tesla_zap(source = src, zap_range = zap_range, power = power, cutoff = 1e3, zap_flags = zap_flags)
	return BULLET_ACT_HIT
// Lower AP than phasic, but it passes through everything.
/obj/projectile/bullet/a357/heartpiercer
	name = ".357 Heartpiercer bullet"
	damage = 35
	armour_penetration = 45
	projectile_piercing = ALL

/obj/projectile/bullet/a357/wallstake
	name = ".357 Wallstake bullet"
	damage = 36 //Almost entirely a meme round at this point. 36 damage barely four-shots standard armor
	wound_bonus = -35

/obj/projectile/bullet/a357/wallstake/on_hit(atom/target, blocked = FALSE, pierce_hit)
	. = ..()
	if(isliving(target)) //Unlike meteorslugs, these are smaller and meant to knock bodies around, not ANYTHING
		var/atom/movable/M = target
		var/atom/throw_target = get_edge_target_turf(M, get_dir(src, get_step_away(M, src)))
		M.safe_throw_at(throw_target, 2, 2) //Extra ten damage if they hit a wall, resolves against melee armor

// Below are .357 round version of the .38 stuff

/obj/projectile/bullet/a357/match/bouncy
	name = ".357 Rubber bullet"
	damage = 20
	stamina = 60
	weak_against_armour = TRUE
	ricochets_max = 6
	ricochet_incidence_leeway = 0
	ricochet_chance = 130
	ricochet_decay_damage = 0.8
	shrapnel_type = null
	sharpness = NONE
	embed_type = null

// weak against armor, lower base damage, but excellent at embedding and causing slice wounds at close range
/obj/projectile/bullet/a357/dumdum
	name = ".357 DumDum bullet"
	damage = 30
	weak_against_armour = TRUE
	ricochets_max = 0
	sharpness = SHARP_EDGED
	wound_bonus = 20
	bare_wound_bonus = 20
	embed_type = /datum/embed_data/a357dumdum
	wound_falloff_tile = -5
	embed_falloff_tile = -15

/datum/embed_data/a357dumdum
	embed_chance = 75
	fall_chance = 3
	jostle_chance = 4
	ignore_throwspeed_threshold = TRUE
	pain_stam_pct = 0.4
	pain_mult = 5
	jostle_pain_mult = 6
	rip_time = 1 SECONDS

/obj/projectile/bullet/a357/trac
	name = ".357 TRAC bullet"
	damage = 30
	ricochets_max = 0

/obj/projectile/bullet/a357/trac/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	var/mob/living/carbon/M = target
	if(!istype(M))
		return
	var/obj/item/implant/tracking/c38/imp
	for(var/obj/item/implant/tracking/c38/TI in M.implants) //checks if the target already contains a tracking implant
		imp = TI
		return
	if(!imp)
		imp = new /obj/item/implant/tracking/c38(M)
		imp.implant(M)

/obj/projectile/bullet/a357/hotshot //similar to incendiary bullets, but do not leave a flaming trail
	name = ".357 Hot Shot bullet"
	damage = 20
	ricochets_max = 0

/obj/projectile/bullet/a357/hotshot/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(6)
		M.ignite_mob()

/obj/projectile/bullet/a357/iceblox //see /obj/projectile/temp for the original code
	name = ".357 Iceblox bullet"
	damage = 20
	var/temperature = 500
	ricochets_max = 0

/obj/projectile/bullet/a357/iceblox/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(isliving(target))
		var/mob/living/M = target
		M.adjust_bodytemperature(((100-blocked)/100)*(temperature - M.bodytemperature))

// .50AE (Desert Eagle)

/obj/projectile/bullet/a50ae/ap
	name = ".50AE AP bullet"
	damage = 50
	armour_penetration = 40
	embed_type = null
	shrapnel_type = null

/obj/projectile/bullet/a50ae/hp
	name = ".50AE HP bullet"
	damage = 80
	weak_against_armour = TRUE

/obj/projectile/bullet/incendiary/a50ae
	name = ".50AE incendiary bullet"
	damage = 30
	fire_stacks = 2

/obj/projectile/bullet/a50ae/cs
	name = ".50AE caseless bullet"
	damage = 40
	speed = 0.5

/obj/projectile/bullet/a50ae/emp
	name = ".50AE EMP bullet"
	damage = 30

/obj/projectile/bullet/a50ae/emp/on_hit(atom/target, blocked = FALSE, pierce_hit)
	..()
	empulse(target, heavy_range = 1, light_range = 2) //Heavy EMP on target, light EMP in tiles around

/obj/projectile/bullet/a50ae/hi
	name = ".50AE hi-power bullet"
	damage = 120
	wound_bonus = -50

/obj/projectile/bullet/a50ae/demo
	name = ".50AE demolish bullet"
	damage = 40
	demolition_mod = 20

/obj/projectile/bullet/a50ae/rod
	name = ".50AE immovable bullet"
	damage = 240
	wound_bonus = -100
	speed = 100 // 100x slower

/obj/projectile/bullet/a50ae/bomb
	name = ".50AE ordinance bullet"
	damage = 30

/obj/projectile/bullet/a50ae/bomb/on_hit(atom/target, blocked = FALSE, pierce_hit)
	..()
	explosion(target, 0, 1, 3, flame_range = 2)

/obj/projectile/bullet/a50ae/rep
	name = ".50AE repulsive bullet"
	damage = 40
	var/repulse_force = MOVE_FORCE_EXTREMELY_STRONG

/obj/projectile/bullet/a50ae/rep/on_hit(atom/target, blocked = FALSE, pierce_hit)
	..()
	var/turf/T = get_turf(src)
	var/list/thrown_items = list()
	for(var/atom/movable/A in range(T, 7))
		if(A == src || A.anchored || thrown_items[A])
			continue
		var/throwtarget = get_edge_target_turf(T, get_dir(T, get_step_away(A, T)))
		A.safe_throw_at(throwtarget, 10, 1, force = repulse_force)
		thrown_items[A] = A
