/obj/item/gun/energy/syndicatelaserrifle
	name = "augmented laser rifle"
	desc = "A powerful laser rifle repurposed and maintained by foreign corporations. Originally based off old laser gun models created by Nanotrasen."
	icon = 'hypermods/icons/obj/weapons/guns/energy.dmi'
	icon_state = "oldrifle"
	inhand_icon_state = "arg"
	fire_delay = 2
	can_suppress = FALSE
	burst_size = 0
	actions_types = list()
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun)
	fire_sound = 'sound/items/weapons/laser.ogg'
	selfcharge = 1
	charge_delay = 4

/obj/item/gun/energy/laserrifle
	name = "laser rifle"
	desc = "An advanced energy-based laser gun that fires concentrated beams of light which pass through glass and thin metal at high velocities."
	icon = 'hypermods/icons/obj/weapons/guns/energy.dmi'
	icon_state = "laserrifle"
	inhand_icon_state = "laserrifle"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	custom_materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT)
	ammo_type = list(/obj/item/ammo_casing/energy/laser/rifle)
	ammo_x_offset = 1
	shaded_charge = 1
	fire_sound = 'hypermods/sound/weapons/laserrifle.ogg'

/obj/item/gun/energy/plasma_gun
	name = "plasma rifle"
	desc = "This advanced bullpup energy rifle contains an internal cell charging mechanism."
	icon_state = "bullpup"
	icon = 'hypermods/icons/obj/weapons/guns/energy.dmi'
	inhand_icon_state = "bullpup"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	force = 5
	shaded_charge = 1
	ammo_type = list(/obj/item/ammo_casing/energy/laser/plasma_gun)
	selfcharge = 1
	charge_delay = 6
	fire_sound = 'hypermods/sound/weapons/plasma_gun.ogg'


/obj/item/gun/energy/emitter
	name = "portable laser emitter"
	desc = "An emitter removed from its base, and attached to a laser cannon frame. It can be modified to utilize different emitter beams using diode disks."
	icon = 'hypermods/icons/obj/weapons/guns/energy.dmi'
	icon_state = "emittercannon"
	inhand_icon_state = "emittercannon"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	shaded_charge = 1
	ammo_type = list(/obj/item/ammo_casing/energy/emitter)
	ammo_x_offset = 3

/obj/item/gun/energy/emitter/examine()
	. = ..()
	. += "It's firing [chambered.loaded_projectile.name]s, attempting to install that projectile type again will reset the gun to default settings."

/obj/item/gun/energy/emitter/attackby(obj/item/emitter_disk/diode_disk, mob/user)
	if(HAS_TRAIT(diode_disk, TRAIT_NODROP))
		return
	if (chambered.projectile_type == diode_disk.stored_proj)
		user.balloon_alert(user, "Reset [src.name]'s projectile type")
		chambered.projectile_type = /obj/projectile/beam/emitter/hitscan
		chambered.loaded_projectile = null
		chambered.newshot()
	else
		user.balloon_alert(user, "Changed [src.name]'s projectile type using [diode_disk.name]")
		chambered.projectile_type = diode_disk.stored_proj
		chambered.loaded_projectile = null
		chambered.newshot()
	return ..()

/obj/item/gun/energy/emitter/cyborg
	name = "mounted laser emitter"
	desc = "A modified mobile laser emitter that draws power directly from your internal energy cell. draining charge from your cell. Time to void some warranties..."
	ammo_type = list(/obj/item/ammo_casing/energy/emitter/cyborg)
	use_cyborg_cell = TRUE
	can_charge = FALSE

/obj/item/gun/energy/emitter/cyborg/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/empprotection, EMP_PROTECT_ALL)
