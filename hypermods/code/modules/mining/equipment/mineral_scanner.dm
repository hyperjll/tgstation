/obj/item/t_scanner/adv_mining_scanner/gibrefinery/examine(mob/user)
	. = ..()
	if(IS_TRAITOR(user)) //helpful to other syndicates and for keeping track of which one is which
		. += "This is a gibtonite refiner in disguise!"

/obj/item/t_scanner/adv_mining_scanner/gibrefinery/interact_with_atom(atom/interacting_with, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(!IS_TRAITOR(user))
		return
	if(istype(interacting_with, /obj/item/gibtonite))
		playsound(interacting_with, 'sound/machines/mining/refinery.ogg', 30, FALSE)
		if(!do_after(user, 10 SECONDS, interacting_with))
			balloon_alert(user, "interrupted!")
			playsound(interacting_with, 'sound/machines/buzz-two.ogg', 30, FALSE)
			return
		var/obj/item/gibtonite/gibore = interacting_with
		var/turf/target_turf = get_turf(gibore)
		playsound(interacting_with, 'sound/machines/chime.ogg', 30, FALSE)
		qdel(gibore)
		new /obj/item/grenade/c4/x4/gibtonite(get_turf(target_turf))


/obj/item/t_scanner/adv_mining_scanner/gibrefinery/cyborg
	name = "gibtonite refiner"
	desc = "A labeled gibtonite refiner installed within an advanced mining scanner. Used to refine chunks of gibtonite into explosives, likely for a carbon-based ally."

/obj/item/t_scanner/adv_mining_scanner/gibrefinery/cyborg/interact_with_atom(atom/interacting_with, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(istype(interacting_with, /obj/item/gibtonite))
		playsound(interacting_with, 'sound/machines/mining/refinery.ogg', 30, FALSE)
		if(!do_after(user, 10 SECONDS, interacting_with))
			balloon_alert(user, "interrupted!")
			playsound(interacting_with, 'sound/machines/buzz-two.ogg', 30, FALSE)
			return
		var/obj/item/gibtonite/gibore = interacting_with
		var/turf/target_turf = get_turf(gibore)
		playsound(interacting_with, 'sound/machines/chime.ogg', 30, FALSE)
		qdel(gibore)
		new /obj/item/grenade/c4/x4/gibtonite(get_turf(target_turf))

