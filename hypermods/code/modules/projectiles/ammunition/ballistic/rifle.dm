// .310 Strilka (Sakhno Rifle)



// .223 (M-90gl Carbine)



// 40mm (Grenade Launcher)

/obj/item/ammo_casing/a40mm/shocker
	name = "40mm SH shell"
	desc = "A cased high explosive grenade that can only be activated once fired out of a grenade launcher. \
			In addition to exploding, it emits a highly concentrated tesla blast."
	caliber = CALIBER_40MM
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "40mmSH"
	projectile_type = /obj/projectile/bullet/a40mm/shocker

/obj/item/ammo_casing/a40mm/spread
	name = "40mm SP shell"
	desc = "A cased high explosive grenade that can only be activated once fired out of a grenade launcher. \
			It fires a spread of highly explosive pellets, a rarity now-a-days."
	caliber = CALIBER_40MM
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "40mmSP"
	projectile_type = /obj/projectile/bullet/a40mm/spread
	pellets = 3
	variance = 30

/obj/item/ammo_casing/a40mm/sucking
	name = "40mm SU shell"
	desc = "A cased high explosive grenade that can only be activated once fired out of a grenade launcher. \
			In addition to the explosion, it creates a short-lived gravitational vortex to suck-in everything nearby \
			for easy follow-ups."
	caliber = CALIBER_40MM
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "40mmSU"
	projectile_type = /obj/projectile/bullet/a40mm/sucking

/obj/item/ammo_casing/a40mm/nuke
	name = "40mm SL shell"
	desc = "A cased high explosive grenade that can only be activated once fired out of a grenade launcher. \
			These rounds remain suspended in the air for long periods of time, but have far greater yield than normal. \
			They're effectively air-mines."
	caliber = CALIBER_40MM
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "40mmSL"
	projectile_type = /obj/projectile/bullet/a40mm/nuke

// AKM bullets

/obj/item/ammo_casing/mm712x82
	name = "7.12x82mm bullet casing"
	desc = "A 7.12x82mm bullet casing."
	icon_state = "762-casing"
	caliber = CALIBER_712X82
	projectile_type = /obj/projectile/bullet/mm712x82

/obj/item/ammo_casing/mm712x82/ap
	name = "7.12x82mm armor-piercing bullet casing"
	desc = "A 7.12x82mm bullet casing designed with a hardened-tipped core to help penetrate armored targets."
	projectile_type = /obj/projectile/bullet/mm712x82/ap

/obj/item/ammo_casing/mm712x82/hollow
	name = "7.12x82mm hollow-point bullet casing"
	desc = "A 7.12x82mm bullet casing designed to cause more damage to unarmored targets."
	projectile_type = /obj/projectile/bullet/mm712x82/hp

/obj/item/ammo_casing/mm712x82/inc
	name = "7.12x82mm incendiary bullet casing"
	desc = "A 7.12x82mm bullet casing designed with a chemical-filled capsule on the tip that when bursted, reacts with the atmosphere to produce a fireball, engulfing the target in flames."
	projectile_type = /obj/projectile/bullet/incendiary/mm712x82

// 5.56mm (Lecter + Drozd)

/obj/item/ammo_casing/a556
	name = "5.56mm bullet casing"
	desc = "A 5.56mm bullet casing."
	icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	icon_state = "556-casing"
	caliber = CALIBER_556
	projectile_type = /obj/projectile/bullet/a556

/obj/item/ammo_casing/a556/ap
	name = "5.56mm armor-piercing bullet casing"
	desc = "A 5.56mm armor-piercing bullet casing."
	icon_state = "556ap-casing"
	projectile_type = /obj/projectile/bullet/a556/ap

/obj/item/ammo_casing/a556/inc
	name = "5.56mm incendiary bullet casing"
	desc = "A 5.56mm incendiary bullet casing."
	icon_state = "556i-casing"
	projectile_type = /obj/projectile/bullet/incendiary/a556

/obj/item/ammo_casing/a556/rubber
	name = "5.56mm rubber bullet casing"
	desc = "A 5.56mm rubber bullet casing."
	icon_state = "556r-casing"
	projectile_type = /obj/projectile/bullet/a556/rubber

// 7.62 (Hristov)

/obj/item/ammo_casing/a762
	name = "7.62mm bullet casing"
	desc = "A 7.62mm bullet casing."
	icon_state = "762-casing"
	caliber = CALIBER_N762
	projectile_type = /obj/projectile/bullet/a762

/obj/item/ammo_casing/a762/raze
	name = "7.62mm Raze bullet casing"
	desc = "A 7.62mm Raze bullet casing."
	projectile_type = /obj/projectile/bullet/a762/raze

/obj/item/ammo_casing/a762/pen
	name = "7.62mm anti-material bullet casing"
	desc = "A 7.62mm anti-material bullet casing."
	projectile_type = /obj/projectile/bullet/a762/pen

/obj/item/ammo_casing/a762/vulcan
	name = "7.62mm Vulcan bullet casing"
	desc = "A 7.62mm Vulcan bullet casing."
	projectile_type = /obj/projectile/bullet/a762/vulcan
