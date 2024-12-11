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


/obj/item/gun/energy/pickpocket
	name = "\improper Super! Grapple Friend"
	desc = "A complicated, camoflaged claw device on a tether capable of complex and stealthy interactions. It's definitely not just a repurposed janky toy that steals shit."
	icon = 'hypermods/icons/obj/weapons/guns/energy.dmi'
	icon_state = "pickpocket"
	w_class = WEIGHT_CLASS_SMALL
	inhand_icon_state = "pickpocket"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/pickpocket, /obj/item/ammo_casing/energy/pickpocket/plant)
	suppressed = TRUE
	suppressed_volume = 20
	force = 4
	throw_speed = 3
	throw_range = 10
	selfcharge = 1
	charge_delay = 16
	var/obj/item/heldItem = null

/obj/item/gun/energy/pickpocket/examine()
	..()
	if (src.heldItem)
		. += "It's currently holding a [src.heldItem]."
	else
		. += "It's not holding anything."

/obj/item/gun/energy/pickpocket/attackby(obj/item/I, mob/user)
	if(HAS_TRAIT(I, TRAIT_NODROP))
		return
	if (heldItem)
		to_chat(user, "You remove the [heldItem.name] from the gun.")
		user.put_in_hands(heldItem)
		heldItem = null
	else
		heldItem = I
		user.transferItemToLoc(I, src)
		I = null
		to_chat(user, "You insert the [heldItem.name] into the gun's gripper.")
	return ..()

/obj/item/gun/energy/pickpocket/attack_self(mob/target, mob/user, def_zone, is_special = FALSE, params = null)
	if (istype(ammo_type, /obj/item/ammo_casing/energy/pickpocket) && heldItem)
		to_chat(user, "Cannot steal while gun is holding something!")
		return
	if (istype(ammo_type, /obj/item/ammo_casing/energy/pickpocket/plant) && !heldItem)
		to_chat(user, "Cannot plant item if gun is not holding anything!")
		return
	return ..(target, user)

/obj/item/gun/energy/pickpocket/fire_gun(atom/target, mob/living/user, flag, params)
	if (istype(ammo_type, /obj/item/ammo_casing/energy/pickpocket) && heldItem)
		to_chat(user, "Cannot steal items while gun is holding something!")
		return
	if (istype(ammo_type, /obj/item/ammo_casing/energy/pickpocket/plant) && !heldItem)
		to_chat(user, "Cannot plant item if gun is not holding anything!")
		return
	return ..(target, user)


/obj/item/gun/energy/teleport
	name = "teleport gun"
	desc = "A hacked together combination of a taser and a handheld teleportation unit."
	icon = 'hypermods/icons/obj/weapons/guns/energy.dmi'
	icon_state = "teleport"
	w_class = WEIGHT_CLASS_NORMAL
	inhand_icon_state = "gun"
	shaded_charge = 1
	force = 10
	throw_speed = 2
	throw_range = 10
	ammo_type = list(/obj/item/ammo_casing/energy/teleport)
	var/obj/item/our_target = null
	var/targetarea = null // just for the examine

/obj/item/gun/energy/teleport/examine()
	..()
	if(src.our_target)
		. += "It's currently locked onto [src.targetarea]."
	else
		. += "It's not locked onto anything, and thus cannot fire."

/obj/item/gun/energy/teleport/attack_self(mob/user)
	if (!can_teleport_notifies(user))
		return

	var/list/L = list()

	for(var/obj/item/beacon/W in GLOB.teleportbeacons)
		if(!W.renamed)
			var/area/A = get_area(W)
			W.name = A.name
		L += W

	var/t1 = tgui_input_list(user, "Please select a destination to lock in on.", "Destination Selection", L)

	var/turf/there = get_turf(t1)

	our_target = there
	targetarea = get_area(our_target)

	to_chat(user, span_notice("You set [src]'s destination to [t1]."))

	var/obj/item/ammo_casing/energy/teleport/TP = ammo_type[select]
	var/obj/projectile/energy/teleport/TPproj = TP.loaded_projectile

	TPproj.target = our_target

/obj/item/gun/energy/teleport/handle_chamber() // Refresh the target every shot, cuz it doesn't do so automatically.
	. = ..()
	var/obj/item/ammo_casing/energy/teleport/TP = ammo_type[select]
	var/obj/projectile/energy/teleport/TPproj = TP.loaded_projectile
	TPproj.target = our_target

/obj/item/gun/energy/teleport/can_shoot() // No targets? :(
	. = ..()
	if(!our_target)
		return FALSE
	return ..()

/obj/item/gun/energy/teleport/proc/can_teleport_notifies(mob/user)
	var/turf/current_location = get_turf(user)
	var/area/current_area = current_location.loc
	if (!current_location || (current_area.area_flags & NOTELEPORT) || is_away_level(current_location.z) || !isturf(user.loc))
		to_chat(user, span_notice("[src] is malfunctioning."))
		return FALSE

	return TRUE
