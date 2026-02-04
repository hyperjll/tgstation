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

		var/turf_location = get_turf(tohotbox)
		do_chem_smoke(amount = smokeamt, holder = tohotbox, location = turf_location, carry = tohotbox.reagents, carry_limit = null, smoke_type = /datum/effect_system/fluid_spread/smoke/chem)

		playsound(turf_location, 'sound/effects/smoke.ogg', 50, TRUE, -3)
		qdel(tohotbox)
