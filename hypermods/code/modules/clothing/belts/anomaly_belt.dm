/obj/item/anomaly_belt_shell
	name = "anomaly belt shell"
	desc = "A belt with built-in anomaly core integration. It's empty... for now."
	slot_flags = ITEM_SLOT_BELT
	icon = 'hypermods/icons/obj/clothing/belt.dmi'
	icon_state = "anombelt"
	inhand_icon_state = null
	worn_icon = 'hypermods/icons/mob/clothing/belt.dmi'
	worn_icon_state = "anombelt"
	item_flags = NOBLUDGEON
	armor_type = /datum/armor/anomaly_belt
	var/cooldowndur = 3 MINUTES

/obj/item/anomaly_belt_shell/examine(mob/user)
	. = ..()
	. += "[src] can only activate once every [cooldowndur]."

/datum/armor/anomaly_belt
	fire = 100
	acid = 100

/obj/item/anomaly_belt_shell/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	. = ..()
	var/static/list/anomaly_belt_types = list(
		/obj/effect/anomaly/pyro = /obj/item/anomaly_belt_shell/pyro,
		/obj/effect/anomaly/grav = /obj/item/anomaly_belt_shell/grav,
		/obj/effect/anomaly/flux = /obj/item/anomaly_belt_shell/flux,
		/obj/effect/anomaly/bluespace = /obj/item/anomaly_belt_shell/bluespace,
		/obj/effect/anomaly/bhole = /obj/item/anomaly_belt_shell/bhole,
		/obj/effect/anomaly/bioscrambler = /obj/item/anomaly_belt_shell/bioscrambler,
		/obj/effect/anomaly/hallucination = /obj/item/anomaly_belt_shell/hallucination,
		/obj/effect/anomaly/dimensional = /obj/item/anomaly_belt_shell/dimensional,
		/obj/effect/anomaly/ectoplasm = /obj/item/anomaly_belt_shell/ectoplasm,
		)

	if(istype(tool, /obj/item/assembly/signaler/anomaly))
		var/obj/item/assembly/signaler/anomaly/anomaly = tool
		var/armour_path = is_path_in_list(anomaly.anomaly_type, anomaly_belt_types, TRUE)
		if(!armour_path)
			armour_path = /obj/item/anomaly_belt_shell/pyro //Lets not cheat the player if an anomaly type doesnt have its own belt coded
		to_chat(user, span_notice("You insert [anomaly] into the core slot, and the belt gently hums to life."))
		new armour_path(get_turf(src))
		qdel(src)
		qdel(anomaly)
		return ITEM_INTERACT_SUCCESS

// Anomaly belts below

/obj/item/anomaly_belt_shell/pyro
	name = "pyro anomaly belt"
	desc = "A belt with built-in anomaly core integration. The core installed within it emits a soft warm glow."
	icon_state = "anombelt_pyro"
	inhand_icon_state = null
	worn_icon_state = "anombelt_pyro"
	actions_types = list(/datum/action/item_action/pyro_belt)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	COOLDOWN_DECLARE(anomaly_belt_pyro)
	var/effectrange = 6

/datum/action/item_action/pyro_belt/Trigger(trigger_flags)
	var/obj/item/anomaly_belt_shell/pyro/anom_belt = target
	if(istype(anom_belt))
		anom_belt.activate(owner)

/obj/item/anomaly_belt_shell/pyro/proc/activate(mob/living/carbon/human/owner)
	if(!COOLDOWN_FINISHED(src, anomaly_belt_pyro))
		balloon_alert(owner, "on cooldown!")
		return

	playsound(get_turf(owner),'sound/effects/magic/fireball.ogg', 80, 1)
	for(var/mob/living/carbon/C in range(effectrange, owner))
		if(C != owner)
			C.adjust_fire_stacks(2)
			C.ignite_mob()
	COOLDOWN_START(src, anomaly_belt_pyro, cooldowndur)


/obj/item/anomaly_belt_shell/grav
	name = "grav anomaly belt"
	desc = "A belt with built-in anomaly core integration. The core installed within it seems to bend and distort the light around it."
	icon_state = "anombelt_grav"
	inhand_icon_state = null
	worn_icon_state = "anombelt_grav"
	actions_types = list(/datum/action/item_action/grav_belt)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	COOLDOWN_DECLARE(anomaly_belt_grav)
	var/effectrange = 7
	var/forced_value = 0
	var/forced_value_alt = 3
	var/probofnonalt = 90
	var/duration = 30 SECONDS

/datum/action/item_action/grav_belt/Trigger(trigger_flags)
	var/obj/item/anomaly_belt_shell/grav/anom_belt = target
	if(istype(anom_belt))
		anom_belt.activate(owner)

/obj/item/anomaly_belt_shell/grav/proc/activate(mob/living/carbon/human/owner)
	if(!COOLDOWN_FINISHED(src, anomaly_belt_grav))
		balloon_alert(owner, "on cooldown!")
		return

	playsound(get_turf(owner),'sound/effects/alert.ogg', 60, 1)
	new /obj/effect/temp_visual/circle_wave/gravity(get_turf(owner))

	if(prob(probofnonalt))
		for(var/turf/near_turf as anything in range(effectrange, src))
			near_turf.AddElement(/datum/element/forced_gravity, forced_value)
			addtimer(CALLBACK(near_turf, TYPE_PROC_REF(/datum/, _RemoveElement), list(/datum/element/forced_gravity, forced_value)), duration)
	else
		for(var/turf/near_turf as anything in range(effectrange, src))
			near_turf.AddElement(/datum/element/forced_gravity, forced_value_alt)
			addtimer(CALLBACK(near_turf, TYPE_PROC_REF(/datum/, _RemoveElement), list(/datum/element/forced_gravity, forced_value_alt)), duration)

	COOLDOWN_START(src, anomaly_belt_grav, cooldowndur)


/obj/item/anomaly_belt_shell/flux
	name = "flux anomaly belt"
	desc = "A belt with built-in anomaly core integration. The core installed within it sparks with electricity."
	icon_state = "anombelt_flux"
	inhand_icon_state = null
	worn_icon_state = "anombelt_flux"
	actions_types = list(/datum/action/item_action/flux_belt)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	COOLDOWN_DECLARE(anomaly_belt_flux)
	var/effectrange = 6

/datum/action/item_action/flux_belt/Trigger(trigger_flags)
	var/obj/item/anomaly_belt_shell/flux/anom_belt = target
	if(istype(anom_belt))
		anom_belt.activate(owner)

/obj/item/anomaly_belt_shell/flux/proc/activate(mob/living/carbon/human/owner)
	if(!COOLDOWN_FINISHED(src, anomaly_belt_flux))
		balloon_alert(owner, "on cooldown!")
		return

	playsound(get_turf(owner),'sound/effects/magic/lightningbolt.ogg', 60, 1)
	new /obj/effect/particle_effect/sparks(get_turf(owner))

	for(var/mob/living/carbon/C in range(effectrange, owner))
		C.electrocute_act(rand(5, 20), "flux anomaly belt", 1, SHOCK_NOGLOVES)
	COOLDOWN_START(src, anomaly_belt_flux, cooldowndur)


/obj/item/anomaly_belt_shell/bluespace
	name = "bluespace anomaly belt"
	desc = "A belt with built-in anomaly core integration. The core installed within it twitches."
	icon_state = "anombelt_bluespace"
	inhand_icon_state = null
	worn_icon_state = "anombelt_bluespace"
	actions_types = list(/datum/action/item_action/bluespace_belt)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	COOLDOWN_DECLARE(anomaly_belt_bluespace)

/datum/action/item_action/bluespace_belt/Trigger(trigger_flags)
	var/obj/item/anomaly_belt_shell/bluespace/anom_belt = target
	if(istype(anom_belt))
		anom_belt.activate(owner)

/obj/item/anomaly_belt_shell/bluespace/proc/activate(mob/living/carbon/human/owner)
	if(!COOLDOWN_FINISHED(src, anomaly_belt_bluespace))
		balloon_alert(owner, "on cooldown!")
		return

	do_sparks(5,FALSE,owner)
	var/F = find_safe_turf(zlevel = owner.z, extended_safety_checks = TRUE)
	var/range = 0
	if(!F)
		F = get_turf(owner)
		range = 50
	if(do_teleport(owner, F, range, channel = TELEPORT_CHANNEL_BLUESPACE))
		do_sparks(5,FALSE,owner)

	COOLDOWN_START(src, anomaly_belt_bluespace, cooldowndur)


/obj/item/anomaly_belt_shell/bhole
	name = "black-hole anomaly belt"
	desc = "A belt with built-in anomaly core integration. The core installed within it is pulling in specks of dust."
	icon_state = "anombelt_bhole"
	inhand_icon_state = null
	worn_icon_state = "anombelt_bhole"
	actions_types = list(/datum/action/item_action/bhole_belt)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	COOLDOWN_DECLARE(anomaly_belt_bhole)
	cooldowndur = 1 MINUTES
	var/effectrange = 6

/datum/action/item_action/bhole_belt/Trigger(trigger_flags)
	var/obj/item/anomaly_belt_shell/bhole/anom_belt = target
	if(istype(anom_belt))
		anom_belt.activate(owner)

/obj/item/anomaly_belt_shell/bhole/proc/activate(mob/living/carbon/human/owner)
	if(!COOLDOWN_FINISHED(src, anomaly_belt_bhole))
		balloon_alert(owner, "on cooldown!")
		return

	playsound(get_turf(owner),'sound/effects/magic/repulse.ogg', 80, 1)
	new /obj/effect/temp_visual/circle_wave/vortex(get_turf(owner))

	var/turf/T = get_turf(owner)
	goonchem_vortex(T, 0, effectrange)

	COOLDOWN_START(src, anomaly_belt_bhole, cooldowndur)


/obj/item/anomaly_belt_shell/bioscrambler
	name = "bioscrambler anomaly belt"
	desc = "A belt with built-in anomaly core integration. The core installed within it seems to pulse erratically."
	icon_state = "anombelt_bioscrambler"
	inhand_icon_state = null
	worn_icon_state = "anombelt_bioscrambler"
	actions_types = list(/datum/action/item_action/bioscrambler_belt)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	COOLDOWN_DECLARE(anomaly_belt_bioscrambler)
	cooldowndur = 30 SECONDS
	var/effectrange = 6

/datum/action/item_action/bioscrambler_belt/Trigger(trigger_flags)
	var/obj/item/anomaly_belt_shell/bioscrambler/anom_belt = target
	if(istype(anom_belt))
		anom_belt.activate(owner)

/obj/item/anomaly_belt_shell/bioscrambler/proc/activate(mob/living/carbon/human/owner)
	if(!COOLDOWN_FINISHED(src, anomaly_belt_bioscrambler))
		balloon_alert(owner, "on cooldown!")
		return

	new /obj/effect/temp_visual/circle_wave/bioscrambler(get_turf(owner))
	playsound(src, 'sound/effects/magic/cosmic_energy.ogg', vol = 50, vary = TRUE)

	for(var/mob/living/carbon/C in range(effectrange, owner))
		C.bioscramble(name)

	COOLDOWN_START(src, anomaly_belt_bioscrambler, cooldowndur)


/obj/item/anomaly_belt_shell/hallucination
	name = "hallucination anomaly belt"
	desc = "A belt with built-in anomaly core integration. You can't seem to figure out what's been slotted within it."
	icon_state = "anombelt_hallucination"
	inhand_icon_state = null
	worn_icon_state = "anombelt_hallucination"
	actions_types = list(/datum/action/item_action/hallucination_belt)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	COOLDOWN_DECLARE(anomaly_belt_hallucination)
	var/effectrange = 6

/datum/action/item_action/hallucination_belt/Trigger(trigger_flags)
	var/obj/item/anomaly_belt_shell/hallucination/anom_belt = target
	if(istype(anom_belt))
		anom_belt.activate(owner)

/obj/item/anomaly_belt_shell/hallucination/proc/activate(mob/living/carbon/human/owner)
	if(!COOLDOWN_FINISHED(src, anomaly_belt_hallucination))
		balloon_alert(owner, "on cooldown!")
		return

	do_sparks(3, source = src)

	visible_hallucination_pulse(
		center = get_turf(owner),
		radius = 3,
		hallucination_duration = 30 SECONDS,
		hallucination_max_duration = 180 SECONDS,
	)

	COOLDOWN_START(src, anomaly_belt_hallucination, cooldowndur)


/obj/item/anomaly_belt_shell/dimensional
	name = "dimensional anomaly belt"
	desc = "A belt with built-in anomaly core integration. The core installed within is oddly... nevermind, everything is fine."
	icon_state = "anombelt_dimensional"
	inhand_icon_state = null
	worn_icon_state = "anombelt_dimensional"
	actions_types = list(/datum/action/item_action/dimensional_belt)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	COOLDOWN_DECLARE(anomaly_belt_dimensional)
	var/effectrange = 4

/datum/action/item_action/dimensional_belt/Trigger(trigger_flags)
	var/obj/item/anomaly_belt_shell/dimensional/anom_belt = target
	if(istype(anom_belt))
		anom_belt.activate(owner)

/obj/item/anomaly_belt_shell/dimensional/proc/activate(mob/living/carbon/human/owner)
	if(!COOLDOWN_FINISHED(src, anomaly_belt_dimensional))
		balloon_alert(owner, "on cooldown!")
		return

	var/list/affected_turfs = circle_range_turfs(src, effectrange)
	var/theme_count = length(SSmaterials.dimensional_themes)
	var/num_affected = 0
	for(var/turf/affected as anything in affected_turfs)
		var/datum/dimension_theme/theme_to_use
		theme_to_use = SSmaterials.dimensional_themes[SSmaterials.dimensional_themes[rand(1, theme_count)]]
		if(!theme_to_use.can_convert(affected))
			continue
		num_affected++
		var/skip_sound = TRUE
		if(num_affected % 5) //makes it play the sound more sparingly
			skip_sound = FALSE
		var/time_mult = round(get_dist_euclidean(get_turf(src), affected)) + 1
		addtimer(CALLBACK(theme_to_use, TYPE_PROC_REF(/datum/dimension_theme, apply_theme), affected, skip_sound, TRUE), 0.1 SECONDS * time_mult)

	COOLDOWN_START(src, anomaly_belt_dimensional, cooldowndur)


/obj/item/anomaly_belt_shell/ectoplasm
	name = "ectoplasm anomaly belt"
	desc = "A belt with built-in anomaly core integration. The core installed within it seems to phase in-and-out of reality."
	icon_state = "anombelt_ectoplasm"
	inhand_icon_state = null
	worn_icon_state = "anombelt_ectoplasm"
	actions_types = list(/datum/action/item_action/ectoplasm_belt)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	COOLDOWN_DECLARE(anomaly_belt_ectoplasm)

/datum/action/item_action/ectoplasm_belt/Trigger(trigger_flags)
	var/obj/item/anomaly_belt_shell/ectoplasm/anom_belt = target
	if(istype(anom_belt))
		anom_belt.activate(owner)

/obj/item/anomaly_belt_shell/ectoplasm/proc/activate(mob/living/carbon/human/owner)
	if(!COOLDOWN_FINISHED(src, anomaly_belt_ectoplasm))
		balloon_alert(owner, "on cooldown!")
		return

	new /obj/effect/temp_visual/revenant/cracks(get_turf(src))
	owner.apply_status_effect(/datum/status_effect/ectoplasm_belt)

	COOLDOWN_START(src, anomaly_belt_ectoplasm, cooldowndur)

/datum/status_effect/ectoplasm_belt
	id = "Ectoplasm Belt"
	status_type = STATUS_EFFECT_REFRESH
	duration = 10 SECONDS
	alert_type = null
	show_duration = TRUE

/datum/status_effect/ectoplasm_belt/on_apply()
	to_chat(owner,span_notice("You phase through reality!"))
	owner.alpha = 180
	owner.pass_flags |= PASSCLOSEDTURF | PASSGLASS | PASSGRILLE | PASSMACHINE | PASSSTRUCTURE | PASSTABLE | PASSMOB | PASSDOORS | PASSVEHICLE
	return TRUE

/datum/status_effect/ectoplasm_belt/on_remove()
	to_chat(owner,span_notice("You regain your physicality."))
	owner.alpha = initial(owner.alpha)
	owner.pass_flags &= ~(PASSCLOSEDTURF | PASSGLASS | PASSGRILLE | PASSMACHINE | PASSSTRUCTURE | PASSTABLE | PASSMOB | PASSDOORS | PASSVEHICLE)

/datum/status_effect/ectoplasm_belt/get_examine_text()
	return span_notice("[owner.p_They()] [owner.p_do()]n't seem to be all here.")
