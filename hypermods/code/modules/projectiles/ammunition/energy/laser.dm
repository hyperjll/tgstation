/obj/item/ammo_casing/energy/laser/rifle
	projectile_type = /obj/projectile/beam/laser/rifle/hitscan
	e_cost = LASER_SHOTS(15, STANDARD_CELL_CHARGE)
	select_name = "kill"
	fire_sound = 'hypermods/sound/weapons/laserrifle.ogg'

/obj/item/ammo_casing/energy/laser/plasma_gun
	projectile_type = /obj/projectile/laser/plasma_gun
	e_cost = LASER_SHOTS(25, STANDARD_CELL_CHARGE)
	select_name = "kill"
	fire_sound = 'hypermods/sound/weapons/plasma_gun.ogg'

/obj/item/ammo_casing/energy/laser/fake_pulse
	projectile_type = /obj/projectile/beam/fake_pulse
	e_cost = LASER_SHOTS(200, STANDARD_CELL_CHARGE * 40)
	select_name = "DESTROY"
	fire_sound = 'sound/items/weapons/pulse.ogg'
	harmful = FALSE
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/blue
