/obj/item/lighter/hotbox
	name = "\improper Zippo lighter"
	desc = "The zippo."
	icon = 'hypermods/icons/obj/cigarettes.dmi'
	icon_state = "zippo"
	overlay_state = "syndi"
	maximum_fuel = 10
	var/smokeamt = 50

/obj/item/lighter/hotbox/interact_with_atom(atom/target, mob/living/user, proximity)
	. = ..()
	if(lit && istype(target, /obj/item/food/grown))
		use(0.5)
		message_admins("[ADMIN_LOOKUPFLW(user)] set [target] on fire with [src] at [AREACOORD(user)]")
		log_game("[key_name(user)] set [target] on fire with [src] at [AREACOORD(user)]")

		var/obj/item/food/grown/tohotbox = target

		var/location = get_turf(tohotbox)
		var/datum/effect_system/fluid_spread/smoke/chem/S = new
		S.attach(location)
		playsound(location, 'sound/effects/smoke.ogg', 50, TRUE, -3)
		if(S)
			S.set_up(amount = smokeamt, holder = tohotbox, location = location, carry = tohotbox.reagents, silent = FALSE)
			S.start(log = TRUE)
		qdel(tohotbox)
