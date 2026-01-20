/obj/structure/closet/supplypod/smugglepod
	name = "Syndicate Smugglers Pod"
	desc = "A specialised, blood-red styled pod for extracting high-value items out of active mission areas. <b>Items must be manually stuffed inside the pod for proper delivery.</b>"
	specialised = TRUE
	style = /datum/pod_style/syndicate
	bluespace = TRUE
	explosionSize = list(0,0,1,2)
	delays = list(POD_TRANSIT = 25, POD_FALLING = 4, POD_OPENING = 30, POD_LEAVING = 30)
	reversing = TRUE
	stay_after_drop = TRUE
	leavingSound = 'sound/effects/podwoosh.ogg'
	reverse_option_list = list("Mobs"=FALSE,"Objects"=TRUE,"Anchored"=FALSE,"Underfloor"=FALSE,"Wallmounted"=FALSE,"Unanchored"=TRUE,"Floors"=FALSE,"Walls"=FALSE,"Mecha"=FALSE)

/obj/structure/closet/supplypod/smugglepod/close(atom/movable/holder) //Closes the supplypod and sends it back to centcom. Should only ever be called if the "reversing" variable is true
	if (!holder)
		return
	take_contents(holder)
	playsound(holder, close_sound, soundVolume*0.75, TRUE, -3)
	holder.set_closed()
	addtimer(CALLBACK(src, PROC_REF(pre_return), holder), delays[POD_LEAVING] * 0.2) //Start to leave a bit after closing for cinematic effect

/obj/structure/closet/supplypod/smugglepod/mouse_drop_receive(atom/movable/O, mob/living/user, params)
	if(!istype(O) || O.anchored || istype(O, /atom/movable/screen))
		return
	if(user == O) //try to climb onto it
		return ..()
	if(!opened)
		return
	if(!isturf(O.loc))
		return

	var/actuallyismob = 0
	if(isliving(O))
		actuallyismob = 1
	else if(!isitem(O))
		return
	var/turf/T = get_turf(src)
	add_fingerprint(user)
	user.visible_message(span_warning("[user] [actuallyismob ? "tries to ":""]stuff [O] into [src]."), \
		span_warning("You [actuallyismob ? "try to ":""]stuff [O] into [src]."), \
		span_hear("You hear clanging."))
	if(actuallyismob)
		if(do_after(user, 4 SECONDS, O))
			user.visible_message(span_notice("[user] stuffs [O] into [src]."), \
				span_notice("You stuff [O] into [src]."), \
				span_hear("You hear a loud metal bang."))
			var/mob/living/L = O
			if(!issilicon(L))
				L.Paralyze(40)
			if(istype(src, /obj/structure/closet/supplypod/smugglepod))
				O.forceMove(T) // prevent moving into src, we're smuggling ITEMS.
			else
				O.forceMove(T)
				//close() // We don't close here as this specific pod is used for items only.
			log_combat(user, O, "stuffed", addition = "inside of [src]")
	else
		O.forceMove(src)
		close()


/obj/structure/closet/supplypod/nuke_relocation
	name = "Syndicate Relocation Pod"
	desc = "A specalised, blood-red styled pod for relocating high-value assets in active mission areas."
	specialised = TRUE
	style = /datum/pod_style/syndicate
	bluespace = FALSE
	delays = list(POD_TRANSIT = 25, POD_FALLING = 4, POD_OPENING = 30, POD_LEAVING = 30)
	reversing = TRUE
	explosionSize = list(0,0,0,0)
	/// Turf we return to after exiting
	var/turf/return_to_turf
	stay_after_drop = TRUE
	leavingSound = 'sound/effects/podwoosh.ogg'
	reverse_option_list = list("Mobs"=TRUE,"Objects"=TRUE,"Anchored"=FALSE,"Underfloor"=FALSE,"Wallmounted"=FALSE,"Unanchored" = TRUE, "Floors"=FALSE,"Walls"=FALSE, "Mecha"=TRUE)

/obj/structure/closet/supplypod/nuke_relocation/pre_return(atom/movable/holder)
	if(return_to_turf)
		reverse_dropoff_coords = list(return_to_turf.x, return_to_turf.y, return_to_turf.z)
	return ..()
