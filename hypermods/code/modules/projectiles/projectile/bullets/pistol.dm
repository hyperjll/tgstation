// 9mm (Makarov and Stechkin APS)

/obj/projectile/bullet/c9mm
	name = "9mm bullet"
	damage = 30
	embed_type = /datum/embed_data/c9mm

/datum/embed_data/c9mm
	embed_chance = 15
	fall_chance = 3
	jostle_chance = 4
	ignore_throwspeed_threshold = TRUE
	pain_stam_pct = 0.4
	pain_mult = 5
	jostle_pain_mult = 6
	rip_time = 10

/obj/projectile/bullet/c9mm/ap
	name = "9mm armor-piercing bullet"
	damage = 27
	armour_penetration = 40
	embed_type = null
	shrapnel_type = null

/obj/projectile/bullet/c9mm/hp
	name = "9mm hollow-point bullet"
	damage = 40
	weak_against_armour = TRUE

/obj/projectile/bullet/incendiary/c9mm
	name = "9mm incendiary bullet"
	damage = 15
	fire_stacks = 2

/obj/projectile/bullet/c9mm/cs
	name = "9mm caseless bullet"
	damage = 17
	speed = 0.5

/obj/projectile/bullet/c9mm/emp
	name = "9mm EMP bullet"
	damage = 15

/obj/projectile/bullet/c9mm/emp/on_hit(atom/target, blocked = FALSE, pierce_hit)
	..()
	empulse(target, heavy_range = 1, light_range = 2) //Heavy EMP on target, light EMP in tiles around

/obj/projectile/bullet/c9mm/sp
	name = "9mm soporific bullet"
	damage = 4
	eyeblur = 20

/obj/projectile/bullet/c9mm/sp/on_hit(atom/target, blocked = FALSE, pierce_hit)
	if((blocked != 100) && isliving(target))
		var/mob/living/L = target
		L.adjustStaminaLoss(20)
		if(L.getStaminaLoss() >= 100)
			L.Sleeping(400)
	return ..()

/obj/projectile/bullet/c9mm/cryo
	name = "9mm cryogenic bullet"
	damage = 20

/obj/projectile/bullet/c9mm/cryo/on_hit(atom/target, blocked, pierce_hit)
	if(iscarbon(target))
		var/mob/living/carbon/victim = target
		victim.reagents.add_reagent(/datum/reagent/inverse/cryostylane, 10)
	return ..()

/obj/projectile/bullet/c9mm/richochet
	name = "9mm richochet bullet"
	damage = 20
	wound_bonus = -30
	wound_falloff_tile = -2.5
	bare_wound_bonus = 15
	ricochets_max = 2
	reflect_range_decrease = 1
	ricochet_chance = 100
	ricochet_auto_aim_range = 3
	ricochet_auto_aim_angle = 50
	ricochet_incidence_leeway = 0

/obj/projectile/bullet/c9mm/bomb
	name = "9mm explosive bullet"
	damage = 5

/obj/projectile/bullet/c9mm/bomb/on_hit(atom/target, blocked = FALSE, pierce_hit)
	..()
	explosion(target, 0, 0, 1, flame_range = 0)

/obj/projectile/bullet/c9mm/sonic
	name = "9mm sonic bullet"
	damage = 10
	var/base_damage = 8
	var/sonic_range = 3

/obj/projectile/bullet/c9mm/sonic/on_hit(atom/target, blocked = FALSE, pierce_hit)
	..()
	var/sonic_turf = get_turf(src)
	if(!sonic_turf)
		return

	playsound(sonic_turf, 'sound/effects/screech.ogg', 8, TRUE)

	for(var/mob/living/M in get_hearers_in_view(sonic_range, sonic_turf))
		bang(get_turf(M), M)

/obj/projectile/bullet/c9mm/sonic/proc/bang(turf/T , mob/living/M)
	if(M.stat == DEAD)	//They're dead!
		return
	M.Paralyze(1 SECONDS)
	M.Knockdown(3 SECONDS)
	M.adjust_confusion(5 SECONDS)
	M.adjust_jitter(5 SECONDS)
	M.soundbang_act(1, 20, 10, 15)
	M.adjustOrganLoss(ORGAN_SLOT_EARS, -base_damage)

/obj/projectile/bullet/c9mm/mutate
	name = "9mm mutation bullet"
	damage = 15

/obj/projectile/bullet/c9mm/mutate/on_hit(atom/target, blocked = FALSE, pierce_hit)
	if(iscarbon(target))
		var/mob/living/carbon/victim = target
		victim.easy_random_mutate(NEGATIVE | MINOR_NEGATIVE)
	return ..()

// 10mm

/obj/projectile/bullet/c10mm
	name = "10mm bullet"
	damage = 40

/obj/projectile/bullet/c10mm/ap
	name = "10mm armor-piercing bullet"
	damage = 35
	armour_penetration = 40

/obj/projectile/bullet/c10mm/hp
	name = "10mm hollow-point bullet"
	damage = 50
	weak_against_armour = TRUE

/obj/projectile/bullet/incendiary/c10mm
	name = "10mm incendiary bullet"
	damage = 20
	fire_stacks = 3

/obj/projectile/bullet/c10mm/reaper
	name = "10mm reaper pellet"
	damage = 50
	armour_penetration = 40
	tracer_type = /obj/effect/projectile/tracer/sniper
	impact_type = /obj/effect/projectile/impact/sniper
	muzzle_type = /obj/effect/projectile/muzzle/sniper
	hitscan = TRUE
	impact_effect_type = null
	hitscan_light_intensity = 3
	hitscan_light_range = 0.75
	hitscan_light_color_override = LIGHT_COLOR_DIM_YELLOW
	muzzle_flash_intensity = 5
	muzzle_flash_range = 1
	muzzle_flash_color_override = LIGHT_COLOR_DIM_YELLOW
	impact_light_intensity = 5
	impact_light_range = 1
	impact_light_color_override = LIGHT_COLOR_DIM_YELLOW

/obj/projectile/bullet/c10mm/cs
	name = "10mm caseless bullet"
	damage = 27
	speed = 0.5

/obj/projectile/bullet/c10mm/sp
	name = "10mm soporific bullet"
	damage = 5
	eyeblur = 20

/obj/projectile/bullet/c10mm/sp/on_hit(atom/target, blocked = FALSE, pierce_hit)
	if((blocked != 100) && isliving(target))
		var/mob/living/L = target
		L.adjustStaminaLoss(20)
		if(L.getStaminaLoss() >= 100)
			L.Sleeping(400)
	return ..()

/obj/projectile/bullet/c10mm/emp
	name = "10mm EMP bullet"
	damage = 25

/obj/projectile/bullet/c10mm/emp/on_hit(atom/target, blocked = FALSE, pierce_hit)
	..()
	empulse(target, heavy_range = 1, light_range = 2) //Heavy EMP on target, light EMP in tiles around

/obj/projectile/bullet/c10mm/bleedout
	name = "10mm bleedout bullet"
	damage = 25

/obj/projectile/bullet/c10mm/bleedout/on_hit(atom/target, blocked, pierce_hit)
	if(iscarbon(target))
		var/mob/living/carbon/victim = target
		victim.reagents.add_reagent(/datum/reagent/toxin/heparin, 5)
	return ..()

/obj/projectile/bullet/c10mm/rad
	name = "10mm radiation bullet"
	damage = 30

/obj/projectile/bullet/c10mm/rad/on_hit(atom/target, blocked, pierce_hit)
	if(iscarbon(target))
		var/mob/living/carbon/victim = target
		if (!HAS_TRAIT(victim, TRAIT_IRRADIATED) && SSradiation.can_irradiate_basic(victim))
			victim.AddComponent(/datum/component/irradiated)
	return ..()

/obj/projectile/bullet/pellet/c10mm
	name = "10mm fragmentation pellet"
	damage = 10 // potentially 50 damage if you point blank someone.

// .38

/obj/projectile/bullet/c38
	name = ".38 special bullet"
	damage = 21
	wound_bonus = -30
	wound_falloff_tile = -2.5
	bare_wound_bonus = 15
	ricochets_max = 2
	reflect_range_decrease = 1
	ricochet_chance = 45
	ricochet_auto_aim_range = 2
	ricochet_auto_aim_angle = 30
	ricochet_incidence_leeway = 0

/obj/projectile/bullet/c38/rubber
	name = ".38 rubber bullet"
	damage = 7
	stamina = 30
	armour_penetration = -30 //Armor hit by this is modified by x1.43.
	sharpness = NONE

/obj/projectile/bullet/c38/ap
	name = ".38 armor-piercing bullet"
	damage = 18
	armour_penetration = 15 //Not actually all that great against armor, but not *terrible*

/obj/projectile/bullet/c38/frost //Basically Iceblax 2
	name = ".38 frost bullet"
	armour_penetration = -45 //x1.81 vs x1.43 for how much more effective armor is
	var/temperature = 100

/obj/projectile/bullet/c38/frost/on_hit(atom/target, blocked = FALSE, pierce_hit)
	if(blocked != 100)
		if(isliving(target))
			var/mob/living/L = target
			L.adjust_bodytemperature(((100-blocked)/100)*(temperature - L.bodytemperature))
	return ..()

/obj/projectile/bullet/c38/talon
	name = ".38 talon bullet"
	damage = 8 // 8+20 rolls 21-38 wound dmg vs no armor
	wound_bonus = 20
	bare_wound_bonus = 0
	wound_falloff_tile = -1
	sharpness = SHARP_EDGED

/obj/projectile/bullet/c38/bluespace
	name = ".38 bluespace bullet"
	damage = 18
	speed = 0.2 //Very, very, very fast

// .22

/obj/projectile/bullet/c22mm
	name = ".22 bullet"
	damage = 20
	speed = 0.5
