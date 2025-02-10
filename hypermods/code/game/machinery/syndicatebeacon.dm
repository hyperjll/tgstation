/obj/item/sbeacondrop/grenadepenguin
	desc = "A label on it reads: <i>Warning: Activating this device will send a live grenade-bearing penguin to your location.</i>"
	droptype = /mob/living/basic/grenadepenguin // Just for show?

/obj/item/sbeacondrop/grenadepenguin/attack_self(mob/user)
	if(user)
		to_chat(user, span_notice("Locked In."))
		var/mob/living/basic/grenadepenguin/penguin = new(get_turf(loc))
		//new droptype( user.loc )
		set_faction(penguin, user)
		playsound(src, 'sound/effects/pop.ogg', 100, TRUE, TRUE)
		qdel(src)
	return

/obj/item/sbeacondrop/grenadepenguin/proc/set_faction(mob/living/basic/grenadepenguin/penguin, mob/user)
	penguin.faction = list("[REF(user)]", ROLE_SYNDICATE, FACTION_HOSTILE)

/obj/item/sbeacondrop/superbomb
	droptype = /obj/machinery/syndicatebomb/super

/obj/item/sbeacondrop/decoybomb
	droptype = /obj/machinery/syndicatebomb/decoy

/obj/item/sbeacondrop/dimensionalbomb
	droptype = /obj/machinery/syndicatebomb/dimensional

/obj/item/sbeacondrop/meteor_shield
	droptype = /obj/machinery/satellite/meteor_shield

/obj/item/sbeacondrop/semiautoturret
	desc = "A label on it reads: <i>Warning: Activating this device will send a semi-auto turret to your location</i>."
	droptype = /obj/machinery/porta_turret/syndicate/pod // this is handled below

/obj/item/sbeacondrop/semiautoturret/attack_self(mob/user)
	if(user)
		to_chat(user, span_notice("Locked In."))
		var/obj/machinery/porta_turret/syndicate/pod/newturret = new(get_turf(loc))
		//new droptype( user.loc )
		set_faction(newturret, user)
		playsound(src, 'sound/effects/pop.ogg', 100, TRUE, TRUE)
		qdel(src)
	return

/obj/item/sbeacondrop/semiautoturret/proc/set_faction(obj/machinery/porta_turret/syndicate/pod/newturret, mob/user)
	newturret.faction = list("[REF(user)]", ROLE_SYNDICATE)

/obj/item/sbeacondrop/heavylaserturret
	desc = "A label on it reads: <i>Warning: Activating this device will send a heavy laser turret to your location</i>."
	droptype = /obj/machinery/porta_turret/syndicate/energy/heavy // this is handled below

/obj/item/sbeacondrop/heavylaserturret/attack_self(mob/user)
	if(user)
		to_chat(user, span_notice("Locked In."))
		var/obj/machinery/porta_turret/syndicate/energy/heavy/newturret = new(get_turf(loc))
		//new droptype( user.loc )
		set_faction(newturret, user)
		playsound(src, 'sound/effects/pop.ogg', 100, TRUE, TRUE)
		qdel(src)
	return

/obj/item/sbeacondrop/heavylaserturret/proc/set_faction(obj/machinery/porta_turret/syndicate/energy/heavy/newturret, mob/user)
	newturret.faction = list("[REF(user)]", ROLE_SYNDICATE)

/obj/item/sbeacondrop/penetratorturret
	desc = "A label on it reads: <i>Warning: Activating this device will send a penetrator turret to your location</i>."
	droptype = /obj/machinery/porta_turret/syndicate/shuttle
