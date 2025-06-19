/obj/structure/destructible/clockwork/gear_base/powered/tinkerers_cache
	name = "tinkerer's cache"
	desc = "A bronze store filled with parts and components."
	icon_state = "tinkerers_cache"
	base_icon_state = "tinkerers_cache"
	clockwork_desc = "Can be used to forge powerful Ratvarian items and traps at the cost of power and time."
	reebe_desc = "It's connection to the physical realm is weakened from being on reebe, restricting its ability to make certain items."
	anchored = TRUE
	break_message = span_warning("The tinkerer's cache melts into a pile of brass.")
	has_on_icon = FALSE
	has_off_icon = FALSE
	has_power_toggle = FALSE

/obj/structure/destructible/clockwork/gear_base/powered/tinkerers_cache/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return

	if(!IS_CLOCK(user))
		to_chat(user, span_warning("You try to put your hand into [src], but almost burn yourself!"))
		return

	if(!anchored)
		to_chat(user, span_brass("[src] needs to be anchored to the floor first."))
		return

	if(depowered)
		to_chat(user, span_brass("[src] isn't connected to power!"))
		return

	if(!COOLDOWN_FINISHED(src, use_cooldown))
		to_chat(user, span_brass("[src] is still warming up, it will be ready in [DisplayTimeText(COOLDOWN_TIMELEFT(src, use_cooldown))]."))
		return


	var/list/all_item_choices = list()
	if(!length(all_item_choices))
		for(var/datum/tinker_cache_item/item_type_name as anything in subtypesof(/datum/tinker_cache_item))
			all_item_choices[initial(item_type_name.name)] = item_type_name

	var/datum/tinker_cache_item/item_choice = tgui_input_list(user, "Select an item to create at the forge.", "Forging", all_item_choices)

	var/datum/tinker_cache_item/item_type_data
	for(var/datum/tinker_cache_item/item_getter as anything in subtypesof(/datum/tinker_cache_item))
		if(initial(item_getter.name) == item_choice)
			item_type_data = item_getter


	if(!item_type_data)
		balloon_alert(user, "But you refrained...")
		return

	//chosen_item = station_craftable[chosen_item]
	if(!can_interact(user) || !anchored || depowered || !COOLDOWN_FINISHED(src, use_cooldown))
		return

	if(on_reebe(src) && !(item_type_data.allowed_on_reebe))
		balloon_alert(user, "Can't be made on Reebe!")
		return

	if(!length(transmission_sigils))
		to_chat(user, span_brass("This needs to be connected to a transmission sigil!"))
		return

	var/amount_to_create = 1
	if(!item_type_data.time_delay_mult)
		amount_to_create = tgui_input_number(user, "How many would you like to create?", "Tinkerers Cache", max_value = 10, min_value = 1)

	if(!use_power(item_type_data.power_use * amount_to_create))
		to_chat(user, span_brass("You need more power to forge this item."))
		return

	if(item_type_data.time_delay_mult)
		COOLDOWN_START(src, use_cooldown, 4 MINUTES * item_type_data.time_delay_mult)

	var/crafting_item = item_type_data.item_path
	for(var/i in 1 to amount_to_create)
		new crafting_item(get_turf(src))
	playsound(src, 'sound/machines/clockcult/steam_whoosh.ogg', 50)

	to_chat(user, span_brass("You craft [item_type_data.name] to near perfection, \the [src] cooling down. \
			[item_type_data.time_delay_mult ? "It will be available in [DisplayTimeText(COOLDOWN_TIMELEFT(src, use_cooldown))]." : "It is ready to use again."]"))


// This used to be a hardcoded list
/datum/tinker_cache_item
	/// Name of the item
	var/name = "abstract parent"
	/// Path to the object that this will create
	var/item_path
	/// Amount of power this will consume to create
	var/power_use = 0
	/// Multiplier for time delay (default 4m) after producing this item
	var/time_delay_mult = 1
	/// Is this item able to be fabricated on reebe
	var/allowed_on_reebe = TRUE

/datum/tinker_cache_item/speed_robes
	name = "Robes Of Divinity"
	item_path = /obj/item/clothing/suit/clockwork/speed
	power_use = 200
	allowed_on_reebe = FALSE

/datum/tinker_cache_item/invis_cloak
	name = "Shrouding Cloak"
	item_path = /obj/item/clothing/suit/clockwork/cloak
	power_use = 200
	allowed_on_reebe = FALSE

/datum/tinker_cache_item/sight_goggles
	name = "Wraith Spectacles"
	item_path = /obj/item/clothing/glasses/clockwork/wraith_spectacles
	power_use = 500
	allowed_on_reebe = FALSE

/datum/tinker_cache_item/hud_visor
	name = "Judicial Visor"
	item_path = /obj/item/clothing/glasses/clockwork/judicial_visor
	power_use = 400
	allowed_on_reebe = FALSE

/datum/tinker_cache_item/replica_fabricator
	name = "Replica Fabricator"
	item_path = /obj/item/clockwork/replica_fabricator
	power_use = 400

/datum/tinker_cache_item/clockwork_slab
	name = "Clockwork Slab"
	item_path = /obj/item/clockwork/clockwork_slab
	power_use = 100
	time_delay_mult = 0.5

/datum/tinker_cache_item/tools
	name = "Equipped Toolbelt"
	item_path = /obj/item/storage/belt/utility/clock
	power_use = 300
	time_delay_mult = 0.75

/datum/tinker_cache_item/trap
	name = "Flipper (Trap)"
	item_path = /obj/item/clockwork/trap_placer/flipper
	power_use = 75
	time_delay_mult = 0

/datum/tinker_cache_item/trap/skewer
	name = "Skewer (Trap)"
	power_use = 100
	item_path = /obj/item/clockwork/trap_placer/skewer

/datum/tinker_cache_item/trap/steam_vent
	name = "Steam Vent (Trap)"
	item_path = /obj/item/clockwork/trap_placer/steam_vent

/datum/tinker_cache_item/trap/spike_trap
	name = "Spike Tile (Trap)"
	power_use = 100
	item_path = /obj/item/clockwork/trap_placer/spike_trap

/datum/tinker_cache_item/trap/flame_trap
	name = "Flame Jets (Trap)"
	power_use = 100
	item_path = /obj/item/clockwork/trap_placer/flame_trap

/datum/tinker_cache_item/trap/delay
	name = "Delayer (Trigger)"
	item_path = /obj/item/wallframe/clocktrap/delay

/datum/tinker_cache_item/trap/lever
	name = "Lever (Trigger)"
	item_path = /obj/item/wallframe/clocktrap/lever

/datum/tinker_cache_item/trap/pressure
	name = "Pressure Sensor (Trigger)"
	item_path = /obj/item/clockwork/trap_placer/pressure_sensor
