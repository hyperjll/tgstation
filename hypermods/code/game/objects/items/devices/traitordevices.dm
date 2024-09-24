/obj/item/mindbatterer
	name = "mind batterer"
	desc = "A strange device with twin antennas."
	icon = 'hypermods/icons/obj/devices/syndie_gadget.dmi'
	icon_state = "mindbatterer"
	throwforce = 5
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 7
	obj_flags = CONDUCTS_ELECTRICITY
	inhand_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'

	var/times_used = 0 //Number of times it's been used.
	var/max_uses = 3


/obj/item/mindbatterer/attack_self(mob/living/carbon/user, flag = 0, emp = 0)
	if(!user) return

	if(times_used >= max_uses)
		to_chat(user, span_danger("The [src] has been burnt out!"))
		return

	log_combat(user, null, "knocked down people in the area", src)

	for(var/mob/living/carbon/human/M in urange(10, user, 1))
		if(prob(75))

			M.Paralyze(rand(200,400))
			to_chat(M, span_userdanger("You feel a tremendous, paralyzing wave flood your mind."))

		else
			to_chat(M, span_userdanger("You feel a sudden, electric jolt travel through your head."))

	playsound(src.loc, 'sound/misc/interference.ogg', 50, TRUE)
	to_chat(user, span_notice("You trigger [src]."))
	times_used += 1
	if(times_used >= max_uses)
		icon_state = "battererburnt"


/obj/item/mindbatterer/mindshield
	name = "mindswitch"
	desc = "A strange device with quadrapole antennas."
	icon = 'hypermods/icons/obj/devices/syndie_gadget.dmi'
	icon_state = "mindswitch"
	throwforce = 5
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 7
	obj_flags = CONDUCTS_ELECTRICITY
	inhand_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'

	times_used = 0 //Number of times it's been used.
	max_uses = 3


/obj/item/mindbatterer/mindshield/attack_self(mob/living/carbon/user, flag = 0, emp = 0)
	if(!user) return

	if(times_used >= max_uses)
		to_chat(user, span_danger("The mind batterer has been burnt out!"))
		return

	log_combat(user, null, "sabotaged the mindshields of everyone nearby", src)

	for(var/mob/living/carbon/human/M in urange(10, user, 1))
		if(HAS_TRAIT(M, TRAIT_MINDSHIELD))

			M.Paralyze(rand(200,400))
			to_chat(M, span_userdanger("You hear a tremendously sound shock within your head as your limbs fall limp."))

		else
			to_chat(M, span_userdanger("You feel something akin to electricity hit your eyes, but nothing else happens."))

	playsound(src.loc, 'sound/misc/interference.ogg', 50, TRUE)
	to_chat(user, span_notice("You trigger [src]."))
	times_used += 1
	if(times_used >= max_uses)
		icon_state = "mindswitch_out"


/obj/item/stock_parts/power_store/cell/bluespace/syndirig
	rigged = TRUE

/obj/item/stock_parts/power_store/cell/bluespace/syndirig/explode()
	if (charge==0)
		return
	//explosion(T, 0, 1, 2, 2)
	addtimer(CALLBACK(src, PROC_REF(syndiplode)), 60 SECONDS)

/obj/item/stock_parts/power_store/cell/bluespace/syndirig/proc/syndiplode()
	explosion(src, -1, 4, 10, 0)
	qdel(src)


/obj/item/stack/telecrystal/trick
	item_flags = null

/obj/item/stack/telecrystal/trick/afterattack(obj/item/I, mob/user, proximity)
	to_chat(user, span_notice("[src] explodes violently!"))
	explosion(src, 1,2,0,0)
	qdel(src)


/obj/item/pinpointer/crew/syndicate //A modified pinpointer that tracks mobs with tracking implants and is disguised as a crew pinpointer
	name = "crew pinpointer"
	desc = "A handheld tracking device that points to crew suit sensors."
	icon_state = "pinpointer_crew"
	has_owner = FALSE
	pinpointer_owner = null
	ignore_suit_sensor_level = TRUE

/obj/item/pinpointer/crew/syndicate/proc/implanted(mob/living/IMP)
	var/turf/here = get_turf(src)
	if(!locate(/obj/item/implant/tracking) in IMP.implants)
		return FALSE

	if(IMP.z == 0 || IMP.z == here.z)
		var/turf/there = get_turf(IMP)
		return (IMP.z != 0 || (there && there.z == here.z))
	return FALSE

/obj/item/pinpointer/crew/syndicate/attack_self(mob/living/user)
	if(active)
		toggle_on()
		user.visible_message(span_notice("[user] deactivates [user.p_their()] pinpointer."), span_notice("You deactivate your pinpointer."))
		return

	if (has_owner && !pinpointer_owner)
		pinpointer_owner = user

	if (pinpointer_owner && pinpointer_owner != user)
		to_chat(user, span_notice("The pinpointer doesn't respond. It seems to only recognise its owner."))
		return

	var/list/name_counts = list()
	var/list/names = list()

	for(var/i in GLOB.human_list)
		var/mob/living/carbon/human/H = i
		if(!trackable(H))
			continue

		var/crewmember_name = "Unknown"
		if(H.wear_id)
			var/obj/item/card/id/I = H.wear_id.GetID()
			if(I?.registered_name)
				crewmember_name = I.registered_name

		while(crewmember_name in name_counts)
			name_counts[crewmember_name]++
			crewmember_name = "[crewmember_name] ([name_counts[crewmember_name]])"
		names[crewmember_name] = H
		name_counts[crewmember_name] = 1
//
	for(var/mob/living/IMP in GLOB.mob_list) // Tracking implants
		if(!implanted(IMP))
			continue

		var/creature_name = IMP.name

		while(creature_name in name_counts)
			name_counts[creature_name]++
			creature_name = text("[] ([])", creature_name, name_counts[creature_name])
		names[creature_name] = IMP
		name_counts[creature_name] = 1
//
	if(!length(names))
		user.visible_message(span_notice("[user]'s pinpointer fails to detect a signal."), span_notice("Your pinpointer fails to detect a signal."))
		return
	var/pinpoint_target = tgui_input_list(user, "Person to track", "Pinpoint", sort_list(names))
	if(isnull(pinpoint_target))
		return
	if(isnull(names[pinpoint_target]))
		return
	if(QDELETED(src) || !user || !user.is_holding(src) || user.incapacitated)
		return
	target = names[pinpoint_target]
	toggle_on()
	user.visible_message(span_notice("[user] activates [user.p_their()] pinpointer."), span_notice("You activate your pinpointer."))

/obj/item/pinpointer/crew/syndicate/scan_for_target()
	if(target)
		if(ishuman(target))
			var/mob/living/carbon/human/H = target
			var/mob/living/IMP = target
			if(!trackable(H) && !implanted(IMP))
				target = null
	if(!target) //target can be set to null from above code, or elsewhere
		active = FALSE


/obj/item/pinpointer/crew/omni
	name = "omni crew pinpointer"
	desc = "A handheld tracking device that points to crew suit sensors regardless of the level they're set too."
	icon_state = "pinpointer_crew"
	custom_price = 150
	has_owner = FALSE
	pinpointer_owner = null
	ignore_suit_sensor_level = TRUE


/obj/item/holodisguiser
	name = "holographic disguiser"
	desc = "A device used to change the user's name and appearance randomly."
	icon = 'hypermods/icons/obj/devices/syndie_gadget.dmi'
	icon_state = "enshield0"
	item_flags = NOBLUDGEON
	slot_flags = ITEM_SLOT_BELT
	inhand_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL
	var/is_active = FALSE
	var/datum/status_effect/linked_effect
	var/mob/living/owner

/obj/item/holodisguiser/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj,src)

/obj/item/holodisguiser/Destroy()
	STOP_PROCESSING(SSobj,src)
	qdel(linked_effect)
	return ..()

/obj/item/holodisguiser/process() // Stolen from green slime extract.
	var/humanfound = null
	if(ishuman(loc))
		humanfound = loc
	if(ishuman(loc.loc)) //Check if in backpack.
		humanfound = (loc.loc)
	if(!humanfound)
		icon_state = "enshield0"
		return
	var/mob/living/carbon/human/H = humanfound
	var/effectpath = /datum/status_effect/holodisguise
	if(!H.has_status_effect(effectpath))
		var/datum/status_effect/holodisguise/S = H.apply_status_effect(effectpath)
		owner = H
		S.linked_extract = src
		playsound(get_turf(src), 'sound/effects/pop.ogg', 100, TRUE, -6)
		to_chat(H, span_notice("[src] begins to hum softly."))
		icon_state = "enshield1"
		new /obj/effect/temp_visual/emp/pulse(get_turf(src))
		STOP_PROCESSING(SSobj,src)


/datum/status_effect/holodisguise
	id = "holodisguise"
	duration = -1
	alert_type = null
	var/datum/dna/originalDNA
	var/originalname
	var/obj/item/holodisguiser/linked_extract // was previously slimecross/stabilized/linked_extract -- test this later

/datum/status_effect/holodisguise/tick()
	if(!linked_extract || !linked_extract.loc) //Sanity checking
		qdel(src)
		return
	if(linked_extract && linked_extract.loc != owner && linked_extract.loc.loc != owner)
		linked_extract.linked_effect = null
		if(!QDELETED(linked_extract))
			linked_extract.owner = null
			START_PROCESSING(SSobj,linked_extract)
		qdel(src)
	return ..()

/datum/status_effect/holodisguise/on_apply()
	to_chat(owner, span_warning("You notice a hologram flicker just beyond your eyes..."))
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		originalDNA = new H.dna.type
		originalname = H.real_name
		H.dna.copy_dna(originalDNA)
		randomize_human(H)
		H.dna.update_dna_identity()
	return ..()

/datum/status_effect/holodisguise/on_remove()
	to_chat(owner, span_notice("You notice the hologram disappear."))
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		originalDNA.transfer_identity(H)
		H.real_name = originalname
		H.updateappearance(mutcolor_update=1)


/obj/item/lightbreaker
	name = "universal recorder"
	desc = "A device that can record to cassette tapes, and play them. It automatically translates the content in playback."
	icon = 'icons/obj/devices/voice.dmi'
	icon_state = "taperecorder_empty"
	inhand_icon_state = "analyzer"
	var/times_used = 0 //Number of times it's been used.
	var/max_uses = 4

/obj/item/lightbreaker/screwdriver_act(mob/living/user, obj/item/I)
	if(!IS_TRAITOR(user) || !IS_NUKE_OP(user))
		if(times_used >= max_uses)
			times_used -= max_uses
			max_uses -= 1
			to_chat(user, span_danger("You rewind [src]."))
		if(max_uses <= 1)
			explosion(src, 0,0,4,0)
		else
			return
	else
		return

/obj/item/lightbreaker/attack_self(mob/living/carbon/user)
	if(!user) return

	var/sonic_turf = get_turf(src)
	if(!sonic_turf)
		return

	if(times_used >= max_uses)
		if(!IS_TRAITOR(user) || !IS_NUKE_OP(user))
			to_chat(user, span_danger("The [src] does not have a tape inside."))
			return
		else
			to_chat(user, span_danger("The light breaker must be re-wound!"))
			return

	log_combat(user, null, "used a light breaker", src)
	times_used += 1

	for(var/mob/living/carbon/human/M in urange(10, user, 1))
		bang(get_turf(M), M)

	for(var/obj/machinery/light/L in urange(10, user, 1))
		L.break_light_tube()

	playsound(sonic_turf, 'hypermods/sound/effects/light_breaker.ogg', 35, TRUE)
	if(!IS_TRAITOR(user) || !IS_NUKE_OP(user))
		to_chat(user, span_notice("You trigger [src]."))
		return
	else
		to_chat(user, span_notice("You trigger light breaker."))
		return

/obj/item/lightbreaker/proc/bang(turf/T , mob/living/M)
	if(M.stat == DEAD)	//They're dead!
		return
	M.show_message(span_userdanger("SCREECH"), MSG_AUDIBLE)
	M.Stun(2 SECONDS)
	M.Knockdown(6 SECONDS)
	M.adjust_confusion(10 SECONDS)
	M.adjust_jitter(3 SECONDS)
	M.soundbang_act(1, 20, 10, 15)
	M.adjustOrganLoss(ORGAN_SLOT_EARS, -10)
	return

/obj/item/bone_gel_dangerous
	name = "bone gel"
	desc = "A potent medical gel that, when applied to a damaged bone in a proper surgical setting, triggers an intense melding reaction to repair the wound. Can be directly applied alongside surgical sticky tape to a broken bone in dire circumstances, though this is very harmful to the patient and not recommended."

	icon = 'icons/obj/medical/surgery_tools.dmi'
	icon_state = "bone-gel"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'

/obj/item/bone_gel_dangerous/attack(mob/living/M, mob/user)
	if(iscarbon(user))
		var/mob/living/carbon/C = M
		visible_message(span_warning("[M] is trying to apply [src] rather hastily to [C]!"), span_notice("You hastily begin applying the [src] to [C]."))
		if(do_after(user, 4 SECONDS))
			for(var/i in C.bodyparts)
				var/obj/item/bodypart/bone = i // fine to just, use these raw, its a meme anyway
				var/datum/wound/blunt/bone/severe/oof_ouch = new
				oof_ouch.apply_wound(bone, wound_source = "bone gel")
				var/datum/wound/blunt/bone/critical/oof_OUCH = new
				oof_OUCH.apply_wound(bone, wound_source = "bone gel")

			for(var/i in C.bodyparts)
				var/obj/item/bodypart/bone = i
				bone.receive_damage(brute=15)
			qdel(src)
			return BRUTELOSS
	return

/obj/item/camera/rewind/syndicate // Improved sepia camera courtesy of the syndicate.
	pictures_left = 10
	pictures_max = 10

/obj/item/batterer/cargoshuttle
	name = "cargo shuttle navigation corruptor"
	desc = "A strange device with twin antennas and a static-like touch."
	icon = 'hypermods/icons/obj/devices/syndie_gadget.dmi'
	icon_state = "cargoshuttlebatterer"
	throwforce = 5
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 7
	inhand_icon_state = "electronic"
	times_used = 0 //Number of times it's been used.
	max_uses = 1

/obj/item/batterer/cargoshuttle/attack_self(mob/living/carbon/user, flag = 0, emp = 0)
	if(!user) return

	SSshuttle.supply.callTime += (1 MINUTES)

	priority_announce("Attention, due to data corruption caused by unknown circumstances: The navigation protocols on the cargo shuttle has degraded in quality, the cargo shuttle will take another minute to depart and return. We apologize for the inconveinence.", "Cental Command - Cargo Shuttle Update", 'sound/announcer/notice/notice1.ogg')

	playsound(src.loc, 'sound/misc/interference.ogg', 50, TRUE)
	to_chat(user, span_danger("The cargo shuttle navigation corruptor self-destructs!"))
	qdel(src)
