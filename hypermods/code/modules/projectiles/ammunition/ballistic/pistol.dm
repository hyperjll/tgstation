// 10mm

/obj/item/ammo_casing/caseless/c10mm
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
	fire_sound = 'sound/items/weapons/gun/pistol/shot_alt.ogg'
	e_cost = LASER_SHOTS(30, STANDARD_CELL_CHARGE * 0.6)
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect

/obj/item/ammo_casing/c10mm/bleedout
	name = "10mm bleedout bullet casing"
	desc = "A 10mm bleedout bullet casing."
	projectile_type = /obj/projectile/bullet/c10mm/bleedout

/obj/item/ammo_casing/c10mm/rad
	name = "10mm radiation bullet casing"
	desc = "A 10mm radiation bullet casing."
	projectile_type = /obj/projectile/bullet/c10mm/rad

/obj/item/ammo_casing/c10mm/fragment
	name = "10mm fragmentation bullet casing"
	desc = "A 10mm fragmentation bullet casing."
	projectile_type = /obj/projectile/bullet/pellet/c10mm
	pellets = 5
	variance = 10 //Half spread and 1 less pellet than buckshot

// 9mm (Makarov, Stechkin APS, PP-95)

/obj/item/ammo_casing/caseless/c9mm
	name = "9mm caseless bullet casing"
	desc = "Huh? But i thought..."
	caliber = CALIBER_9MM
	projectile_type = /obj/projectile/bullet/c9mm/cs

/obj/item/ammo_casing/c9mm/emp
	name = "9mm EMP bullet casing"
	desc = "A 9mm EMP bullet casing."
	projectile_type = /obj/projectile/bullet/c9mm/emp

/obj/item/ammo_casing/c9mm/cryo
	name = "9mm cryogenic bullet casing"
	desc = "A 9mm cryogenic bullet casing."
	projectile_type = /obj/projectile/bullet/c9mm/cryo

/obj/item/ammo_casing/c9mm/richochet
	name = "9mm richochet bullet casing"
	desc = "A 9mm richochet bullet casing."
	projectile_type = /obj/projectile/bullet/c9mm/richochet

/obj/item/ammo_casing/c9mm/bomb
	name = "9mm explosive bullet casing"
	desc = "A 9mm explosive bullet casing."
	projectile_type = /obj/projectile/bullet/c9mm/bomb

/obj/item/ammo_casing/c9mm/sonic
	name = "9mm sonic bullet casing"
	desc = "A 9mm sonic bullet casing."
	projectile_type = /obj/projectile/bullet/c9mm/sonic

/obj/item/ammo_casing/c9mm/mutate
	name = "9mm mutation bullet casing"
	desc = "A 9mm mutation bullet casing."
	projectile_type = /obj/projectile/bullet/c9mm/mutate

// .50AE (Desert Eagle)

/obj/item/ammo_casing/a50ae/ap
	name = ".50AE AP bullet casing"
	desc = "A .50AE armor piercing bullet casing."
	projectile_type = /obj/projectile/bullet/a50ae/ap

/obj/item/ammo_casing/a50ae/hp
	name = ".50AE HP bullet casing"
	desc = "A .50AE hollow point bullet casing."
	projectile_type = /obj/projectile/bullet/a50ae/hp

/obj/item/ammo_casing/a50ae/inc
	name = ".50AE incendiary bullet casing"
	desc = "A .50AE incendiary bullet casing."
	projectile_type = /obj/projectile/bullet/incendiary/a50ae

/obj/item/ammo_casing/caseless/a50ae
	name = ".50AE caseless bullet casing"
	desc = "Huh? But i thought..."
	projectile_type = /obj/projectile/bullet/a50ae/cs

/obj/item/ammo_casing/a50ae/emp
	name = ".50AE EMP bullet casing"
	desc = "A .50AE EMP bullet casing."
	projectile_type = /obj/projectile/bullet/a50ae/emp

/obj/item/ammo_casing/a50ae/hi
	name = ".50AE hi-power bullet casing"
	desc = "A .50AE high-power bullet casing."
	projectile_type = /obj/projectile/bullet/a50ae/hi
	integrity_damage = 5

/obj/item/ammo_casing/a50ae/demo
	name = ".50AE demolishing bullet casing"
	desc = "A .50AE demolishing bullet casing."
	projectile_type = /obj/projectile/bullet/a50ae/demo

/obj/item/ammo_casing/a50ae/rod
	name = ".50AE immovable bullet casing"
	desc = "A .50AE immovable bullet casing."
	projectile_type = /obj/projectile/bullet/a50ae/rod

/obj/item/ammo_casing/a50ae/bomb
	name = ".50AE ordinance bullet casing"
	desc = "A .50AE ordinance bullet casing."
	projectile_type = /obj/projectile/bullet/a50ae/bomb
	integrity_damage = 10

/obj/item/ammo_casing/a50ae/rep
	name = ".50AE repulsive bullet casing"
	desc = "A .50AE repulsive bullet casing."
	projectile_type = /obj/projectile/bullet/a50ae/rep

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
