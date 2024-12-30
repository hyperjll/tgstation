// 40mm (Grenade Launcher

/obj/projectile/bullet/a40mm/shocker
	name ="40mm grenade"
	damage = 40
	var/zap_flags = ZAP_MOB_DAMAGE | ZAP_OBJ_DAMAGE | ZAP_LOW_POWER_GEN
	var/zap_range = 12
	var/power = 3e8

/obj/projectile/bullet/a40mm/shocker/on_hit(atom/target, blocked = 0, pierce_hit)
	..()
	tesla_zap(source = src, zap_range = zap_range, power = power, cutoff = 3e8, zap_flags = zap_flags)
	return BULLET_ACT_HIT

/obj/projectile/bullet/a40mm/spread
	name ="40mm grenade"
	damage = 10

/obj/projectile/bullet/a40mm/sucking
	name ="40mm grenade"
	damage = 40
	var/repulse_force = MOVE_FORCE_EXTREMELY_STRONG

/obj/projectile/bullet/a40mm/sucking/on_hit(atom/target, blocked = 0, pierce_hit)
	..()
	var/turf/T = get_turf(src)
	var/list/thrown_items = list()
	for(var/atom/movable/A in range(T, 7))
		if(A == src || A.anchored || thrown_items[A])
			continue
		A.safe_throw_at(T, 10, 1, force = repulse_force)
		thrown_items[A] = A
	return BULLET_ACT_HIT

/obj/projectile/bullet/a40mm/nuke
	name ="40mm grenade"
	damage = 10
	speed = 0.01 // 100x slower

/obj/projectile/bullet/a40mm/nuke/on_hit(atom/target, blocked = 0, pierce_hit)
	..()
	explosion(target, 1, 6, 12, flame_range = 12, flash_range = 12, adminlog = FALSE, explosion_cause = src)
	return BULLET_ACT_HIT

// China lake stuff

/obj/projectile/bullet/clblastnade
	name ="Blast Grenade"
	desc = "Do a barrel roll!"
	icon_state = "bolter"
	damage = 80

/obj/projectile/bullet/clblastnade/on_hit(atom/target, blocked = 0, pierce_hit)
	..()
	explosion(target, -1, 4, 6, 8, 0, flame_range = 10)
	return BULLET_ACT_HIT


/obj/projectile/bullet/clhighexplo
	name ="Frag Grenade"
	desc = "Press 'A' to shoot!"
	icon_state = "bolter"
	damage = 20

/obj/projectile/bullet/clhighexplo/on_hit(atom/target, blocked = 0, pierce_hit)
	..()
	explosion(target, -1, 7, 12, 16, 0, flame_range = 16)
	return BULLET_ACT_HIT
