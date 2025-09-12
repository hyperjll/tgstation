/datum/traitor_objective_category/power_siphon
	name = "Siphon energy from the station"
	objectives = list(
		/datum/traitor_objective/power_siphon = 1,
	)

/datum/traitor_objective/power_siphon
	name = "Siphon energy from the station"
	description = "Siphon energy away from the station using a reverse-inducer until it's internal battery is full."

	progression_reward = list(5 MINUTES, 10 MINUTES)
	telecrystal_reward = 1

	duplicate_type = /datum/traitor_objective/power_siphon

	/// Have we sent a inducer yet?
	var/inducer_sent = FALSE

/datum/traitor_objective/power_siphon/generate_ui_buttons(mob/user)
	var/list/buttons = list()
	if(!inducer_sent)
		buttons += add_ui_button("", "Pressing this will materialize a Revserse Inducer into your hand, which you must use to steal energy from the station", "globe", "summon_inducer")
	return buttons

/datum/traitor_objective/power_siphon/ui_perform_action(mob/living/user, action)
	. = ..()
	switch(action)
		if("summon_inducer")
			if(inducer_sent)
				return
			inducer_sent = TRUE
			var/obj/item/inducer/reverse/our_inducer = new(user.drop_location())
			user.put_in_hands(our_inducer)
			our_inducer.balloon_alert(user, "the reverse inducer materializes in your hand")
			RegisterSignal(our_inducer, COMSIG_REVERSE_INDUCER_CHARGED, PROC_REF(on_full_charge))
			AddComponent(/datum/component/traitor_objective_register, our_inducer, \
				succeed_signals = null, \
				fail_signals = list(COMSIG_QDELETING), \
				penalty = TRUE)

/datum/traitor_objective/power_siphon/proc/on_full_charge(datum/source, mob/living/user, mob/living/injected)
	SIGNAL_HANDLER

	succeed_objective() // no need for checks here.
	return

/datum/traitor_objective/power_siphon/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	AddComponent(/datum/component/traitor_objective_mind_tracker, generating_for, \
		signals = list(COMSIG_REVERSE_INDUCER_CHARGED = PROC_REF(on_full_charge)))
	return TRUE


/obj/item/inducer/reverse
	name = "reverse inducer"
	icon_state = "inducer-syndi"
	inhand_icon_state = "inducer-syndi"
	desc = "A tool used to quickly siphon energy from electrical storage units like apc's. It's suspicious colour scheme betrays who manufactured it."
	powerdevice = /obj/item/stock_parts/power_store/battery/hyper/empty

/obj/item/inducer/reverse/screwdriver_act(mob/living/user, obj/item/tool)
	. = NONE

	if(!tool.use_tool(src, user, delay = 0))
		return

	to_chat(user, span_notice("You attempt to use [tool] on [src], but can't find the battery compartment."))

	return ITEM_INTERACT_BLOCKING

/obj/item/inducer/reverse/interact_with_atom(atom/movable/interacting_with, mob/living/user, list/modifiers)
	. = NONE

	if(HAS_TRAIT(interacting_with, TRAIT_COMBAT_MODE_SKIP_INTERACTION))
		return

	if(user.combat_mode || !istype(interacting_with) || interacting_with.flags_1 & HOLOGRAM_1)
		return ITEM_INTERACT_SKIP_TO_ATTACK

	//basic checks
	if(opened)
		balloon_alert(user, "close first!")
		return ITEM_INTERACT_FAILURE

	if(recharging || (!isturf(interacting_with) && user.loc == interacting_with))
		return ITEM_INTERACT_FAILURE

	if(!ISADVANCEDTOOLUSER(user))
		to_chat(user, span_warning("You don't have the dexterity to use [src]!"))
		return ITEM_INTERACT_FAILURE

	var/obj/item/stock_parts/power_store/our_cell = get_cell(src, user)

	if(QDELETED(our_cell))
		balloon_alert(user, "no cell installed!")
		return ITEM_INTERACT_FAILURE

	var/obj/item/stock_parts/power_store/target_cell = interacting_with.get_cell(src, user)

	if(QDELETED(target_cell))
		return ITEM_INTERACT_FAILURE

	if(!our_cell.used_charge())
		balloon_alert(user, "Inducer cell fully charged!")
		SEND_SIGNAL(src, COMSIG_REVERSE_INDUCER_CHARGED, user)
		return ITEM_INTERACT_FAILURE

	//begin recharging
	recharging = TRUE
	user.visible_message(span_notice("[user] starts recharging [interacting_with] with [src]."), span_notice("You start siphoning energy from [interacting_with] with [src]."))

	var/done_any = FALSE
	while(target_cell.charge >= 1)
		if(!do_after(user, 1 SECONDS, target = user))
			break

		//transfer of charge
		var/transferred = min(target_cell.charge, our_cell.used_charge(), our_cell.rating_base * our_cell.rating * power_transfer_multiplier)
		if(!transferred)
			break
		target_cell.use(our_cell.give(transferred))

		//update all appearances
		our_cell.update_appearance()
		target_cell.update_appearance()
		interacting_with.update_appearance()

		//sparks & update
		do_sparks(1, FALSE, interacting_with)
		done_any = TRUE

	recharging = FALSE

	// Only show a message if we succeeded at least once
	if(done_any)
		user.visible_message(span_notice("[user] recharges [interacting_with]!"), span_notice("You stealthily steal energy from [interacting_with]!"))

	return ITEM_INTERACT_SUCCESS
