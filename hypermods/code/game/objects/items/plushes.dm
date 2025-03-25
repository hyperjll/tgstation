/obj/item/toy/plush/goatplushie/angry
	var/mob/living/carbon/target
	throwforce = 6
	var/cooldown = 0
	var/cooldown_modifier = 20

/obj/item/toy/plush/goatplushie/angry/syndicate
	throwforce = 12
	cooldown = 0
	cooldown_modifier = 10

/obj/item/toy/plush/goatplushie/angry/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSprocessing, src)

/obj/item/toy/plush/goatplushie/angry/process()
	if (prob(25) && !target)
		var/list/targets_to_pick_from = list()
		for(var/mob/living/carbon/C in view(7, src))
			if(considered_alive(C.mind))
				targets_to_pick_from += C
		if (!targets_to_pick_from.len)
			return
		target = pick(targets_to_pick_from)
		visible_message(span_notice("[src] stares at [target]."))
	if (world.time > cooldown && target)
		ram()

/obj/item/toy/plush/goatplushie/angry/proc/ram()
	if(prob((obj_flags & EMAGGED) ? 98:90) && isturf(loc) && considered_alive(target.mind))
		throw_at(target, 10, 10)
		visible_message(span_danger("[src] rams [target]!"))
		cooldown = world.time + cooldown_modifier
	target = null
	visible_message(span_notice("[src] looks disinterested."))

/obj/item/toy/plush/goatplushie/angry/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(obj_flags & EMAGGED)
		visible_message(span_notice("[src] already looks angry enough, you shouldn't anger it more."))
		return FALSE
	cooldown_modifier = 5
	throwforce = 20
	obj_flags |= EMAGGED
	visible_message(span_danger("[src] stares at [user] angrily before going docile."))
	return TRUE

/obj/item/toy/plush/goatplushie/angry/Destroy()
	STOP_PROCESSING(SSprocessing, src)
	return ..()

/obj/item/toy/plush/goatplushie/angry/syndicate/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(obj_flags & EMAGGED)
		visible_message(span_notice("[src] already looks angry enough, you shouldn't anger it more."))
		return FALSE
	cooldown_modifier = 5
	throwforce = 24
	obj_flags |= EMAGGED
	visible_message(span_danger("[src] stares at [user] angrily before going docile."))
	return TRUE
