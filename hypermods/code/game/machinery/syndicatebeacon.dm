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
