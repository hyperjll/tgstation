/obj/item/t_scanner/adv_mining_scanner/gibrefinery/examine(mob/user)
	. = ..()
	if(IS_TRAITOR(user)) //helpful to other syndicates and for keeping track of which one is which
		. += "This is a gibtonite refiner in disguise!"

/obj/item/t_scanner/adv_mining_scanner/gibrefinery/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(!IS_TRAITOR(user))
		return
	if(istype(target, /obj/item/gibtonite))
		playsound(target, 'sound/machines/mining/refinery.ogg', 30, FALSE)
		if(!do_after(user, 10 SECONDS, target))
			balloon_alert(user, "interrupted!")
			playsound(target, 'sound/machines/buzz-two.ogg', 30, FALSE)
			return
		var/obj/item/gibtonite/gibore = target
		var/turf/target_turf = get_turf(gibore)
		playsound(target, 'sound/machines/chime.ogg', 30, FALSE)
		qdel(gibore)
		new /obj/item/grenade/c4/x4/gibtonite(get_turf(target_turf))
