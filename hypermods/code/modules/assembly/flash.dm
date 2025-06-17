/obj/item/assembly/flash/lantern
	name = "suspicious lantern"
	desc = "A suspicious looking lantern."
	icon = 'icons/obj/lighting.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/mining_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/mining_righthand.dmi'
	icon_state = "syndilantern"
	inhand_icon_state = "syndilantern"
	flashing_overlay = "syndilantern-on"
	worn_icon_state = "flashlight"
	pickup_sound = null
	drop_sound = null
	burnout_resistance = 1
	cooldown = 5 SECONDS

/obj/item/assembly/flash/handheld/upgraded
	name = "security flash"
	desc = "A powerful and versatile flashbulb device, with applications ranging from disorienting attackers to acting as visual receptors in robot production. This one has extended range and a more powerful bulb."
	icon = 'hypermods/icons/obj/devices/flash.dmi'
	icon_state = "secflash"
	flashing_overlay = "secflash-f"
	burnout_resistance = 0.3
	aoerange = 5
	aoeconfusiondur = 8 SECONDS
	/// Can an A.N.T.A.G Locker be installed to prevent people from picking this thing up?
	var/antag_lockable = TRUE
	/// Has an A.N.T.A.G Locker already been installed?
	var/antag_locked = FALSE

/obj/item/assembly/flash/handheld/upgraded/examine(mob/user)
	if(antag_locked)
		. += "[src] has a A.N.T.A.G Locker installed."

/obj/item/assembly/flash/handheld/upgraded/attackby(obj/item/attacking_item, mob/user, list/modifiers, list/attack_modifiers)
	if(istype(attacking_item, /obj/item/antaglocker) && antag_lockable && !antag_locked)
		balloon_alert(user, "Anti-Theft System Installed!")
		AddElement(/datum/element/anti_pickup)
		antag_locked = TRUE
		qdel(attacking_item)

	return ..()

/obj/item/assembly/flash/handheld/upgraded/emag_act()
	if(antag_locked)
		playsound(src, SFX_SPARKS, 15, TRUE)
		RemoveElement(/datum/element/anti_pickup)
		antag_locked = FALSE


/obj/item/assembly/flash/handheld/bomb/try_use_flash(mob/user = null)
	. = ..()
	if(!burnt_out)
		explosion(src, -1, 1, 3, 4)
		burn_out()