// Viper

/obj/item/ammo_box/magazine/m10mm/cs
	name = "pistol magazine (10mm caseless)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "9x19p"
	base_icon_state = "9x19p"
	desc = "A 10mm pistol magazine. Loaded with rounds which are engineered without casings, but suffer damage and speed as a result."
	ammo_type = /obj/item/ammo_casing/caseless/c10mm

/obj/item/ammo_box/magazine/m10mm/sp
	name = "pistol magazine (10mm soporific)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "9x19pS"
	base_icon_state = "9x19pS"
	desc= "A 10mm pistol magazine. Loaded with rounds which administer a small dose of tranquilizer on hit."
	ammo_type = /obj/item/ammo_casing/c10mm/sp

/obj/item/ammo_box/magazine/m10mm/emp
	name = "pistol magazine (10mm EMP)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "9x19pE"
	base_icon_state = "9x19pE"
	desc = "A 10mm pistol magazine. Loaded with rounds which release a small EMP pulse upon hitting a target."
	ammo_type = /obj/item/ammo_casing/c10mm/emp

/obj/item/ammo_box/magazine/m10mm/bleedout
	name = "pistol magazine (10mm bleedout)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "9x19pH"
	base_icon_state = "9x19pH"
	desc = "A 10mm pistol magazine. Loaded with rounds which make bleeding wounds significantly worse."
	ammo_type = /obj/item/ammo_casing/c10mm/bleedout

/obj/item/ammo_box/magazine/m10mm/rad
	name = "pistol magazine (10mm radiation)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "9x19pU"
	base_icon_state = "9x19pU"
	desc = "A 10mm pistol magazine. Loaded with rounds which irradiate their target."
	ammo_type = /obj/item/ammo_casing/c10mm/rad

/obj/item/ammo_box/magazine/m10mm/fragment
	name = "pistol magazine (10mm fragmentation)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "9x19pF"
	base_icon_state = "9x19pF"
	desc = "A 10mm pistol magazine. Loaded with rounds which explode into tiner pellets."
	ammo_type = /obj/item/ammo_casing/c10mm/fragment

// Makarov

/obj/item/ammo_box/magazine/m9mm/caseless
	name = "pistol magazine (9mm caseless)"
	icon_state = "9x19p"
	base_icon_state = "9x19p"
	desc = "A gun magazine. Loaded with rounds that leave behind no casings."
	ammo_type = /obj/item/ammo_casing/caseless/c9mm

/obj/item/ammo_box/magazine/m9mm/emp
	name = "pistol magazine (9mm EMP)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "9x19pE"
	base_icon_state = "9x19pE"
	desc = "A gun magazine. Loaded with rounds which release a small EMP pulse upon hitting a target."
	ammo_type = /obj/item/ammo_casing/c9mm/emp

/obj/item/ammo_box/magazine/m9mm/cryo
	name = "pistol magazine (9mm cryogenic)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "9x19pC"
	base_icon_state = "9x19pC"
	desc = "A gun magazine. Loaded with rounds which deploy a cyrogenic chemical that freezes the target solid briefly."
	ammo_type = /obj/item/ammo_casing/c9mm/cryo

/obj/item/ammo_box/magazine/m9mm/richochet
	name = "pistol magazine (9mm richochet)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "9x19pR"
	base_icon_state = "9x19pR"
	desc = "A gun magazine. Loaded with rounds capable of bouncing around multiple times."
	ammo_type = /obj/item/ammo_casing/c9mm/richochet

/obj/item/ammo_box/magazine/m9mm/bomb
	name = "pistol magazine (9mm explosive)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "9x19pEX"
	base_icon_state = "9x19pEX"
	desc = "A gun magazine. Loaded with rounds which deliver small explosions where they land."
	ammo_type = /obj/item/ammo_casing/c9mm/bomb

/obj/item/ammo_box/magazine/m9mm/sonic
	name = "pistol magazine (9mm sonic)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "9x19pSO"
	base_icon_state = "9x19pSO"
	desc = "A gun magazine. Loaded with rounds capable of delivering tiny auditory shockwaves."
	ammo_type = /obj/item/ammo_casing/c9mm/sonic

/obj/item/ammo_box/magazine/m9mm/mutate
	name = "pistol magazine (9mm mutation)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "9x19pM"
	base_icon_state = "9x19pM"
	desc = "A gun magazine. Loaded with rounds which activates negative mutations in its victims."
	ammo_type = /obj/item/ammo_casing/c9mm/mutate

// Cobra

/obj/item/ammo_box/magazine/m45/ap
	name = "handgun magazine (.45 AP)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "ap45-8"
	base_icon_state = "ap45"
	ammo_type = /obj/item/ammo_casing/c45/ap
	caliber = CALIBER_45
	max_ammo = 8

/obj/item/ammo_box/magazine/m45/hp
	name = "handgun magazine (.45 HP)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "hp45-8"
	base_icon_state = "hp45"
	ammo_type = /obj/item/ammo_casing/c45/hp
	caliber = CALIBER_45
	max_ammo = 8

/obj/item/ammo_box/magazine/m45/inc
	name = "handgun magazine (.45 incendiary)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "inc45-8"
	base_icon_state = "inc45"
	ammo_type = /obj/item/ammo_casing/c45/inc
	caliber = CALIBER_45
	max_ammo = 8

/obj/item/ammo_box/magazine/m45/cs
	name = "handgun magazine (.45 caseless)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "cs45-8"
	base_icon_state = "cs45"
	ammo_type = /obj/item/ammo_casing/caseless/c45
	caliber = CALIBER_45
	max_ammo = 8
	multiple_sprites = AMMO_BOX_PER_BULLET
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/m45/sp
	name = "handgun magazine (.45 soporific)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "sleep45-8"
	base_icon_state = "sleep45"
	ammo_type = /obj/item/ammo_casing/c45/sp
	caliber = CALIBER_45
	max_ammo = 8

/obj/item/ammo_box/magazine/m45/emp
	name = "handgun magazine (.45 EMP)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "emp45-8"
	base_icon_state = "emp45"
	ammo_type = /obj/item/ammo_casing/c45/emp
	caliber = CALIBER_45
	max_ammo = 8

/obj/item/ammo_box/magazine/m45/venom
	name = "handgun magazine (.45 venom)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "venom45-8"
	base_icon_state = "venom45"
	ammo_type = /obj/item/ammo_casing/c45/venom
	caliber = CALIBER_45
	max_ammo = 8

/obj/item/ammo_box/magazine/m45/pacify
	name = "handgun magazine (.45 pacification)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "pacify45-8"
	base_icon_state = "pacify45"
	ammo_type = /obj/item/ammo_casing/c45/pacify
	caliber = CALIBER_45
	max_ammo = 8

/obj/item/ammo_box/magazine/m45/delay
	name = "handgun magazine (.45 delayed)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "delay45-8"
	base_icon_state = "delay45"
	ammo_type = /obj/item/ammo_casing/c45/delay
	caliber = CALIBER_45
	max_ammo = 8

/obj/item/ammo_box/magazine/m45/tranq
	name = "handgun magazine (.45 tranquilizer)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "tranq45-8"
	base_icon_state = "tranq45"
	ammo_type = /obj/item/ammo_casing/c45/tranq
	caliber = CALIBER_45
	max_ammo = 8

// Mk58

/obj/item/ammo_box/magazine/v38
	name = "handgun magazine (.38 special)"
	desc = "A 8-round .38 special magazine designed for the Mk58 pistol."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "v38-8"
	base_icon_state = "v38"
	ammo_type = /obj/item/ammo_casing/c38
	caliber = CALIBER_38
	max_ammo = 8
	multiple_sprites = AMMO_BOX_PER_BULLET
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/v38/rubber
	name = "handgun magazine (.38 rubber)"
	desc = "A 8-round .38 rubber magazine designed for the Mk58 pistol. Not great against armor."
	icon_state = "v38R-8"
	base_icon_state = "v38R"
	ammo_type = /obj/item/ammo_casing/c38/rubber

/obj/item/ammo_box/magazine/v38/ap
	name = "handgun magazine (.38 armor-piercing)"
	desc = "A 8-round .38 armor-piercing magazine designed for the Mk58 pistol. Less damaging, but doesn't suffer against armor."
	icon_state = "v38A-8"
	base_icon_state = "v38A"
	ammo_type = /obj/item/ammo_casing/c38/ap

/obj/item/ammo_box/magazine/v38/frost
	name = "handgun magazine (.38 frost)"
	desc = "A 8-round .38 frost magazine designed for the Mk58 pistol. Less effective against armor, but chills bodies."
	icon_state = "v38F-8"
	base_icon_state = "v38F"
	ammo_type = /obj/item/ammo_casing/c38/frost

/obj/item/ammo_box/magazine/v38/talon
	name = "handgun magazine (.38 talon)"
	desc = "A 8-round .38 talon magazine designed for the Mk58 pistol. Not as directly lethal, but painful while causing blood loss."
	icon_state = "v38T-8"
	base_icon_state = "v38T"
	ammo_type = /obj/item/ammo_casing/c38/talon

/obj/item/ammo_box/magazine/v38/bluespace
	name = "handgun magazine (.38 bluespace)"
	desc = "A 8-round .38 bluespace magazine designed for the Mk58 pistol. Less damaging, but incredibly fast."
	icon_state = "v38B-8"
	base_icon_state = "v38B"
	ammo_type = /obj/item/ammo_casing/c38/bluespace

// Desert Eagle

/obj/item/ammo_box/magazine/m50/ap
	name = "handgun magazine (.50ae AP)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "ap50ae"
	ammo_type = /obj/item/ammo_casing/a50ae/ap

/obj/item/ammo_box/magazine/m50/hp
	name = "handgun magazine (.50ae HP)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "hp50ae"
	ammo_type = /obj/item/ammo_casing/a50ae/hp

/obj/item/ammo_box/magazine/m50/inc
	name = "handgun magazine (.50ae Incendiary)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "inc50ae"
	ammo_type = /obj/item/ammo_casing/a50ae/inc

/obj/item/ammo_box/magazine/m50/cs
	name = "handgun magazine (.50ae Caseless)"
	ammo_type = /obj/item/ammo_casing/caseless/a50ae

/obj/item/ammo_box/magazine/m50/emp
	name = "handgun magazine (.50ae EMP)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "emp50ae"
	ammo_type = /obj/item/ammo_casing/a50ae/emp

/obj/item/ammo_box/magazine/m50/hi
	name = "handgun magazine (.50ae Hi-Power)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "hi50ae"
	ammo_type = /obj/item/ammo_casing/a50ae/hi

/obj/item/ammo_box/magazine/m50/demo
	name = "handgun magazine (.50ae Demolish)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "demo50ae"
	ammo_type = /obj/item/ammo_casing/a50ae/demo

/obj/item/ammo_box/magazine/m50/rod
	name = "handgun magazine (.50ae Immovable)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "rod50ae"
	ammo_type = /obj/item/ammo_casing/a50ae/rod

/obj/item/ammo_box/magazine/m50/bomb
	name = "handgun magazine (.50ae Ordinance)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "bomb50ae"
	ammo_type = /obj/item/ammo_casing/a50ae/bomb

/obj/item/ammo_box/magazine/m50/rep
	name = "handgun magazine (.50ae Repulsive)"
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "rep50ae"
	ammo_type = /obj/item/ammo_casing/a50ae/rep
