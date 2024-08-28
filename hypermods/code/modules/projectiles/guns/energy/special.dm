/obj/item/gun/energy/decloner/syndicate
	name = "biological demolecularisor"
	desc = "A gun that discharges high amounts of controlled radiation to slowly break a target into component elements."
	icon_state = "decloner"
	ammo_type = list(/obj/item/ammo_casing/energy/radiation/balanced)
	pin = /obj/item/firing_pin
	ammo_x_offset = 1
	selfcharge = 1
	charge_delay = 10

/obj/item/gun/energy/mindflayer/syndicate
	name = "mind flayer"
	desc = "A vicious weapon with the ability to lock up the motor neurons of the respiratory system and take advantage of the increasing suffocation of the brain to destroy it."
	icon = 'hypermods/icons/obj/weapons/guns/energy.dmi'
	icon_state = "mindflayer"
	inhand_icon_state = "mindflayer"
	w_class = WEIGHT_CLASS_SMALL
	ammo_type = list(/obj/item/ammo_casing/energy/mindflayer)
	pin = /obj/item/firing_pin
	ammo_x_offset = 2
	selfcharge = 1
	charge_delay = 10

/obj/item/gun/energy/floragun/syndicate
	name = "floral somatoray"
	desc = "A tool that discharges controlled radiation which induces mutation in plant cells."
	icon_state = "flora"
	inhand_icon_state = "gun"
	ammo_type = list(/obj/item/ammo_casing/energy/flora/yield, /obj/item/ammo_casing/energy/flora/mut, /obj/item/ammo_casing/energy/flora/revolution, /obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/lasergun/old)
	modifystate = 1
	ammo_x_offset = 1
	selfcharge = 1

/obj/item/gun/energy/floragun/cyborg
	name = "cyborg floral somatoray"
	desc = "A tool that discharges controlled radiation which induces mutation in plant cells."
	icon_state = "flora"
	inhand_icon_state = "gun"
	ammo_type = list(/obj/item/ammo_casing/energy/flora/yield, /obj/item/ammo_casing/energy/flora/mut)
	modifystate = 1
	ammo_x_offset = 1
	selfcharge = 1
	charge_delay = 5

/obj/item/gun/energy/xenospitter //xenomorph acid gun?
	name = "xenomorphic pistol"
	icon = 'hypermods/icons/obj/weapons/guns/energy.dmi'
	icon_state = "xenopistol"
	inhand_icon_state = "gun"
	shaded_charge = 1
	desc = "A reagent pistol modeled to look after the alien species it was originally inspired by. \
			Fires globs of a highly acidic reagent as well as a small amount of neurotoxin."
	ammo_type = list(/obj/item/ammo_casing/energy/xenoglob)
	selfcharge = 1
	charge_delay = 20
	pin = /obj/item/firing_pin/dna

/obj/item/gun/energy/disabler/syndicate
	name = "disabler"
	desc = "A self-defense weapon that exhausts organic targets, weakening them until they collapse."
	icon_state = "disabler"
	inhand_icon_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/lasergun)
	selfcharge = 1
	ammo_x_offset = 2

/obj/item/gun/energy/gravity_gun/withcore
	firing_core = TRUE

/obj/item/gun/energy/printer/flamethrower // from yog
	name = "cyborg flame projector"
	desc = "Originally intended for cyborgs to assist in atmospherics projects, was soon scrapped due to safety concerns."
	icon = 'icons/obj/weapons/flamethrower.dmi'
	icon_state = "flamethrower1"
	ammo_type = list(/obj/item/ammo_casing/energy/flamethrower)
	can_charge = FALSE
	use_cyborg_cell = TRUE

/obj/item/gun/energy/plasmacutter/adv/malf
	name = "cyborg malfunctioning plasma cutter"
	desc = "A mining tool capable o=#9v@3-M!a%R=KILLING AND MURDERING ORGANICS."
	force = 15
	selfcharge = 1
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/adv/cyborg/malf)
	can_charge = FALSE
	use_cyborg_cell = TRUE
