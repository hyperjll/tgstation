/obj/item/clockwork/trap_placer/freeze
	name = "freeze tile"
	desc = "A tile with a lightly blue hue."
	icon_state = "freeze"
	result_path = /obj/structure/destructible/clockwork/trap/freeze
	clockwork_desc = "A tile capable of freezing people solid when they're above it when it's been triggered."

/obj/structure/destructible/clockwork/trap/freeze
	name = "freeze tile"
	desc = "A tile with a lightly blue hue."
	icon_state = "freeze"
	component_datum = /datum/component/clockwork_trap/freeze
	unwrench_path = /obj/item/clockwork/trap_placer/freeze
	clockwork_desc = "A tile capable of freezing people solid when they're above it when it's been triggered."
	COOLDOWN_DECLARE(freeze_cooldown)
	/// Time between freezes
	var/freeze_cd_time = 30 SECONDS

/obj/structure/destructible/clockwork/trap/freeze/examine(mob/user)
	. = ..()

	if(!COOLDOWN_FINISHED(src, freeze_cooldown) && IS_CLOCK(user))
		. += span_brass("It's not ready to activate again yet!")

/// Freeze all living mobs above us.
/obj/structure/destructible/clockwork/trap/freeze/proc/super_suit()
	if(!COOLDOWN_FINISHED(src, freeze_cooldown))
		return

	for(var/mob/living/intruding_mob in get_turf(src))
		if(intruding_mob.incorporeal_move || (intruding_mob.movement_type & (FLOATING|FLYING)))
			continue

		if(IS_CLOCK(intruding_mob))
			to_chat(intruding_mob, span_warning("You dodge out of the way of [src]!"))
			continue

		//playsound(src, 'sound/machines/clockcult/brass_skewer.ogg', 50, TRUE)
		icon_state = "freeze_on"

		if(HAS_TRAIT(intruding_mob, TRAIT_RESISTCOLD))
			return
		to_chat(intruding_mob, span_bolddanger("You're frozen solid!"))
		intruding_mob.Paralyze(2 SECONDS)
		intruding_mob.adjust_bodytemperature(-300)
		intruding_mob.apply_status_effect(/datum/status_effect/freon)

	COOLDOWN_START(src, freeze_cooldown, freeze_cd_time)
	addtimer(CALLBACK(src, PROC_REF(revert_icon)), 1 SECONDS)


/obj/structure/destructible/clockwork/trap/freeze/proc/revert_icon()
	icon_state = initial(icon_state)

/datum/component/clockwork_trap/freeze
	takes_input = TRUE

/datum/component/clockwork_trap/freeze/trigger()
	if(!..())
		return

	var/obj/structure/destructible/clockwork/trap/freeze/freeze_parent = parent
	freeze_parent.super_suit()
