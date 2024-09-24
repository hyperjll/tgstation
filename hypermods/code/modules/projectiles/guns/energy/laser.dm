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
