/obj/projectile/beam/laser/rifle
	name = "laser"
	wound_bonus = -20
	damage = 22
	speed = 0.4 // try and out-run this shit.
	impact_effect_type = /obj/effect/temp_visual/impact_effect/red_laser
	light_color = LIGHT_COLOR_INTENSE_RED

/obj/projectile/beam/laser/rifle/hitscan
	icon_state = null
	hitscan = TRUE
	muzzle_type = /obj/effect/projectile/muzzle/laser
	tracer_type = /obj/effect/projectile/tracer/laser
	impact_type = /obj/effect/projectile/impact/laser
	impact_effect_type = null
	hitscan_light_intensity = 3
	hitscan_light_range = 0.75
	hitscan_light_color_override = COLOR_RED
	muzzle_flash_intensity = 6
	muzzle_flash_range = 2
	muzzle_flash_color_override = COLOR_RED
	impact_light_intensity = 7
	impact_light_range = 2.5
	impact_light_color_override = COLOR_RED

/obj/projectile/laser/plasma_gun //mostly just a reskin
	icon = 'hypermods/icons/obj/weapons/guns/projectiles.dmi'
	icon_state = "phaser_med"
	name = "plasma bolt"
	light_system = OVERLAY_LIGHT
	light_range = 2
	light_power = 1.4
	light_color = COLOR_MODERATE_BLUE
