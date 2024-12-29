/obj/item/minigunmount
	name = "back-mounted ammo manufactury"
	desc = "A massive external ammunition storage module with an in-built miniature autolathe that rapidly produces new ammunition."
	icon = 'hypermods/icons/obj/weapons/guns/minigun.dmi'
	icon_state = "holstered"
	inhand_icon_state = "backpack"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE

	var/obj/item/gun/energy/osprey/gun
	var/obj/item/stock_parts/power_store/cell/osprey/battery
	var/armed = FALSE //whether the gun is attached, FALSE is attached, TRUE is the gun is wielded.
	var/overheat = 0
	var/overheat_max = 100
	var/heat_diffusion = 0.5

/obj/item/minigunmount/Initialize(mapload)
	. = ..()
	gun = new(src)
	battery = new(src)
	START_PROCESSING(SSobj, src)

/obj/item/minigunmount/Destroy()
	if(!QDELETED(gun))
		qdel(gun)
	gun = null
	QDEL_NULL(battery)
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/minigunmount/process(seconds_per_tick)
	overheat = max(0, overheat - heat_diffusion * seconds_per_tick)

//ATTACK HAND IGNORING PARENT RETURN VALUE
/obj/item/minigunmount/attack_hand(mob/living/carbon/user, list/modifiers)
	if(src.loc == user)
		if(!armed)
			if(user.get_item_by_slot(ITEM_SLOT_BACK) == src)
				armed = TRUE
				if(!user.put_in_hands(gun))
					armed = FALSE
					to_chat(user, span_warning("You need a free hand to hold the gun!"))
					return
				update_appearance()
				user.update_worn_back()
		else
			to_chat(user, span_warning("You are already holding the gun!"))
	else
		..()

/obj/item/minigunmount/attackby(obj/item/W, mob/user, params)
	if(W == gun) //Don't need armed check, because if you have the gun assume its armed.
		user.dropItemToGround(gun, TRUE)
	else
		..()

/obj/item/minigunmount/dropped(mob/user)
	. = ..()
	if(armed)
		user.dropItemToGround(gun, TRUE)

/obj/item/minigunmount/mouse_drop_dragged(atom/over_object, mob/user)
	if(armed)
		return

	if(iscarbon(user))
		if(istype(over_object, /atom/movable/screen/inventory/hand))
			var/atom/movable/screen/inventory/hand/H = over_object
			user.putItemFromInventoryInHandIfPossible(src, H.held_index)

/obj/item/minigunmount/update_icon_state()
	icon_state = armed ? "notholstered" : "holstered"
	return ..()

/obj/item/minigunmount/proc/attach_gun(mob/user)
	if(!gun)
		gun = new(src)
	gun.forceMove(src)
	armed = FALSE
	if(user)
		to_chat(user, span_notice("You attach the [gun.name] to the [name]."))
	else
		src.visible_message(span_warning("The [gun.name] snaps back onto the [name]!"))
	update_appearance()
	user.update_worn_back()


/obj/item/gun/energy/osprey
	name = "/improper M-546 Osprey"
	desc = "An advanced minigun with an incredible rate of fire and safety overheating lock mechanism. Requires a bulky backpack to store all that ammo."
	icon = 'hypermods/icons/obj/weapons/guns/minigun.dmi'
	icon_state = "minigun_spin"
	lefthand_file = "icons/mob/inhands/weapons/guns_lefthand.dmi"
	righthand_file = "icons/mob/inhands/weapons/guns_righthand.dmi"
	inhand_icon_state = "minigun"
	slowdown = 2
	slot_flags = null
	w_class = WEIGHT_CLASS_HUGE
	custom_materials = null
	weapon_weight = WEAPON_HEAVY
	ammo_type = list(/obj/item/ammo_casing/energy/m7mm)
	cell_type = /obj/item/stock_parts/power_store/cell/crap
	item_flags = NEEDS_PERMIT | SLOWS_WHILE_IN_HAND
	can_charge = FALSE
	var/obj/item/minigunmount/ammo_pack

/obj/item/gun/energy/osprey/Initialize(mapload)
	if(!istype(loc, /obj/item/minigunmount)) //We should spawn inside an ammo pack so let's use that one.
		return INITIALIZE_HINT_QDEL //No pack, no gun
	ammo_pack = loc
	AddElement(/datum/element/update_icon_blocker)
	AddComponent(/datum/component/automatic_fire, 0.2 SECONDS)
	return ..()

/obj/item/gun/energy/osprey/Destroy()
	if(!QDELETED(ammo_pack))
		qdel(ammo_pack)
	ammo_pack = null
	return ..()

/obj/item/gun/energy/osprey/attack_self(mob/living/user)
	return

/obj/item/gun/energy/osprey/dropped(mob/user)
	SHOULD_CALL_PARENT(FALSE)
	if(ammo_pack)
		ammo_pack.attach_gun(user)
	else
		qdel(src)

/obj/item/gun/energy/osprey/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(ammo_pack && ammo_pack.overheat >= ammo_pack.overheat_max)
		to_chat(user, span_warning("The gun's heat sensor locked the trigger to prevent lens damage!"))
		return
	..()
	ammo_pack.overheat++
	if(ammo_pack.battery)
		var/transferred = ammo_pack.battery.use(cell.maxcharge - cell.charge, force = TRUE)
		cell.give(transferred)

/obj/item/gun/energy/osprey/try_fire_gun(atom/target, mob/living/user, params)
	if(!ammo_pack || ammo_pack.loc != user)
		to_chat(user, span_warning("You need the backpack power source to fire the gun!"))
		return FALSE
	return ..()


/obj/item/stock_parts/power_store/cell/osprey
	name = "osprey fusion core"
	desc = "Where did these come from?"
	maxcharge = 500 * STANDARD_CELL_CHARGE
	chargerate = 5 * STANDARD_CELL_CHARGE

