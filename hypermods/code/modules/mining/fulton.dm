/obj/item/extraction_pack/non_contractor
	can_use_indoors = TRUE
	uses_left = 3
	beacon_networks = list("station", "syndicate")

/obj/item/extraction_pack/non_contractor/cyborg
	can_use_indoors = TRUE
	uses_left = -1
	beacon_networks = list("station", "syndicate")

/obj/item/fulton_core/syndicate
	name = "suspicious extraction beacon assembly kit"
	icon_state = "folded_extraction"

/obj/item/fulton_core/syndicate/attack_self(mob/user)
	if(do_after(user, 1.5 SECONDS, user) && !QDELETED(src))
		balloon_alert(user, "Beacon placed!")
		new /obj/structure/extraction_point/syndi(get_turf(user))
		qdel(src)

/obj/structure/extraction_point/syndi
	alpha = 0
	beacon_network = "syndicate"

/obj/item/fulton_core/syndicate/cyborg
	var/cost = 500

/obj/item/fulton_core/syndicate/cyborg/attack_self(mob/user)
	var/mob/living/silicon/robot/borgy = user
	if(borgy.cell)
		if(do_after(user, 1.5 SECONDS, user) && !QDELETED(src))
			balloon_alert(user, "Beacon placed!")
			borgy.cell.use(cost)
			new /obj/structure/extraction_point/syndi(get_turf(user))
