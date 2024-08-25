// 10mm

/obj/item/ammo_casing/caseless/c10mm/cs
	name = "10mm caseless bullet casing"
	desc = "Huh? But i thought..."
	caliber = CALIBER_10MM
	projectile_type = /obj/projectile/bullet/c10mm/cs

/obj/item/ammo_casing/c10mm/sp
	name = "10mm soporific bullet casing"
	desc = "A 10mm soporific bullet casing."
	projectile_type = /obj/projectile/bullet/c10mm/sp
	harmful = FALSE

/obj/item/ammo_casing/c10mm/emp
	name = "10mm EMP bullet casing"
	desc = "A 10mm EMP bullet casing."
	projectile_type = /obj/projectile/bullet/c10mm/emp

/obj/item/ammo_casing/energy/c10mm // 10mm bullet for cyborg viper
	projectile_type = /obj/projectile/bullet/c10mm
	select_name = "lethal"
	fire_sound = 'sound/weapons/gun/pistol/shot_alt.ogg'
	e_cost = LASER_SHOTS(30, STANDARD_CELL_CHARGE * 0.6)
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect

// 9mm (Makarov, Stechkin APS, PP-95)



// .50AE (Desert Eagle)



// .38 (MK58 Pistol)

/obj/item/ammo_casing/c38
	name = ".38 special bullet casing"
	desc = "A .38 special bullet casing."
	caliber = CALIBER_38
	projectile_type = /obj/projectile/bullet/c38

/obj/item/ammo_casing/c38/rubber
	name = ".38 rubber bullet casing"
	desc = "A .38 rubber bullet casing."
	projectile_type = /obj/projectile/bullet/c38/rubber

/obj/item/ammo_casing/c38/ap
	name = ".38 armor-piercing bullet casing"
	desc = "A .38 armor-piercing bullet casing."
	projectile_type = /obj/projectile/bullet/c38/ap

/obj/item/ammo_casing/c38/frost
	name = ".38 frost bullet casing"
	desc = "A .38 frost bullet casing."
	projectile_type = /obj/projectile/bullet/c38/frost

/obj/item/ammo_casing/c38/talon
	name = ".38 talon bullet casing"
	desc = "A .38 talon bullet casing."
	projectile_type = /obj/projectile/bullet/c38/talon

/obj/item/ammo_casing/c38/bluespace
	name = ".38 bluespace bullet casing"
	desc = "A .38 bluespace bullet casing."
	projectile_type = /obj/projectile/bullet/c38/bluespace
