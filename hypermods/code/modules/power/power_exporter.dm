#define DISCONNECTED 0
#define CLAMPED_OFF 1
#define OPERATING 2

#define PAY_INTERVAL_TIME 1 MINUTES

/obj/machinery/power/exporter
	name = "power exporter"
	desc = "Sell surplus power abroad using highly secretive experimental technology. The more power sold, the cheaper it becomes."
	icon = 'icons/obj/machines/dominator.dmi'
	icon_state = "dominator"
	circuit = /obj/item/circuitboard/machine/power_exporter
	density = 1
	anchored = FALSE
	verb_say = "states"
	STATIC_COOLDOWN_DECLARE(pay_interval)
	/// DISCONNECTED, CLAMPED_OFF, OPERATING
	var/mode = DISCONNECTED
	/// currently drained amount to payout for
	var/power_drained = 0
	/// How much power we've sold, goes into the final calculations to ensure diminishing returns on investment.
	var/total_power_drained = 0
	/// Basically, the maximum value we have our payout divided by: (power_drained / max(max_power_drain_coefficient, total_payout*0.2)), lower values = more money we could make after it's been paying out for a long time.
	var/max_power_drain_coefficient = 10000
	/// total amount of money generated, the more power you make the cheaper you have to sell it.
	var/static/total_payout = 0
	/// Cable node machine is attached to.
	var/obj/structure/cable/attached
	/// The estimated conversion rate from Kw to Credits, improved with better parts, diminished by total_power_drained. Penalty is lessened with better parts via coefficient.
	var/payout_multiplier = 0.25
	/// If true, we won't constantly announce our payout details.
	var/silent_mode = FALSE

/obj/machinery/power/exporter/Initialize()
	if(!COOLDOWN_STARTED(src, pay_interval))
		COOLDOWN_START(src, pay_interval, PAY_INTERVAL_TIME)
	. = ..()

/obj/machinery/power/exporter/examine(mob/user)
	. = ..()
	if(!anchored)
		. += span_notice("[src] isn't anchored")
	if(mode == OPERATING)
		var/payout = round(power_drained / max(1000, total_payout*0.2)) * payout_multiplier
		. += span_notice("[power_drained * 0.001] kW have been stored and will be sold next cycle for an estimated [payout] credits")
	if(!isnull(attached))
		var/datum/powernet/powernet = attached.powernet
		var/total_excess_power = (powernet.netexcess * 0.001)
		if(powernet && !(mode == OPERATING))
			. += "<span class='notice'>The powernet currently has an estimated [total_excess_power] KW in excess to pull from.</span>"
		if(!powernet)
			. += "<span class='notice'>[src] has to first be anchored onto exposed power lines to detect the powernet.</span>"

/obj/machinery/power/exporter/examine_more(mob/user)
	. = ..()
	. += "The power meter displays [total_power_drained* 0.001] KW."
	. += "The export meter displays a total of [total_payout] credits."

/obj/machinery/power/exporter/wrench_act(mob/living/user, obj/item/tool)
	. = TRUE
	if(mode == DISCONNECTED)
		var/turf/T = loc
		if(isturf(T) && T.underfloor_accessibility >= UNDERFLOOR_INTERACTABLE)
			attached = locate() in T
			if(!attached)
				to_chat(user, span_warning("\The [src] must be placed over an exposed, powered cable node!"))
			else
				set_mode(CLAMPED_OFF)
				user.visible_message( \
					"[user] attaches \the [src] to the cable.", \
					span_notice("You bolt \the [src] into the floor and connect it to the cable."),
					span_hear("You hear some wires being connected to something."))
		else
			to_chat(user, span_warning("\The [src] must be placed over an exposed, powered cable node!"))
	else
		set_mode(DISCONNECTED)
		user.visible_message( \
			"[user] detaches \the [src] from the cable.", \
			span_notice("You unbolt \the [src] from the floor and detach it from the cable."),
			span_hear("You hear some wires being disconnected from something."))
	tool.play_tool_sound(src, 50)

/obj/machinery/power/exporter/proc/set_mode(value)
	if(value == mode)
		return
	switch(value)
		if(DISCONNECTED)
			attached = null
			if(mode == OPERATING)
				STOP_PROCESSING(SSobj, src)
				icon_state = "dominator"
			set_anchored(FALSE)
		if(CLAMPED_OFF)
			if(!attached)
				return
			if(mode == OPERATING)
				STOP_PROCESSING(SSobj, src)
				icon_state = "dominator"
			set_anchored(TRUE)
		if(OPERATING)
			if(!attached)
				return
			START_PROCESSING(SSobj, src)
			icon_state = "dominator-Yellow"
			set_anchored(TRUE)

	mode = value
	update_appearance()

/obj/machinery/power/exporter/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	switch(mode)
		if(DISCONNECTED)
			..()
		if(CLAMPED_OFF)
			set_mode(OPERATING)
		if(OPERATING)
			say("Shutdown engaged.")
			set_mode(CLAMPED_OFF)

/obj/machinery/power/exporter/process()
	if(mode != OPERATING)
		return

	drain_power()
	if(COOLDOWN_FINISHED(src, pay_interval))
		pay()
		COOLDOWN_START(src, pay_interval, PAY_INTERVAL_TIME)

/obj/machinery/power/exporter/proc/drain_power()
	if(!attached)
		set_mode(DISCONNECTED)
		return

	var/power_drain_amount = round(attached.surplus())

	attached.add_load(power_drain_amount)
	power_drained += power_drain_amount

/obj/machinery/power/exporter/proc/pay()
	var/payout = (power_drained / max(max_power_drain_coefficient, total_payout*0.2))

	payout = payout * payout_multiplier
	total_payout += payout
	//70% goes straight to the engi budget. 30% of the money goes to cargo.
	var/datum/bank_account/engi_bank = SSeconomy.get_dep_account(ACCOUNT_ENG)
	var/engi_payout = round(payout * 0.7)
	engi_bank.adjust_money(engi_payout)
	var/datum/bank_account/cargo_bank = SSeconomy.get_dep_account(ACCOUNT_CAR)
	var/cargo_payout = round(payout - engi_payout)
	cargo_bank.adjust_money(cargo_payout)

	if(!silent_mode)
		say("Sold [power_drained * 0.001] KW! Engineering and cargo recieved [engi_payout] cr and [cargo_payout] cr.")
	total_power_drained += power_drained
	power_drained = 0

/obj/machinery/power/exporter/RefreshParts()
	. = ..()
	// Tier 2 and better parts improve both the coefficient and the ultimate payout. Leading to larger payments and less diminishing returns.
	for(var/datum/stock_part/capacitor/capacitor in component_parts)
		payout_multiplier = (capacitor.tier * 0.25)
		if(capacitor.tier >= 2)
			max_power_drain_coefficient = (10000 * (1 - (capacitor.tier / 10)))
		else
			max_power_drain_coefficient = 10000
	//incase someone makes tier 25 parts or some bs
	if(payout_multiplier > 1)
		WARNING("This needs to be rebalanced for higher tier parts.")

#undef PAY_INTERVAL_TIME
#undef DISCONNECTED
#undef CLAMPED_OFF
#undef OPERATING
