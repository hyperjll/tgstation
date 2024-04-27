/datum/action/vehicle/ridden/wheelchair/kaboom
	name = "Ding!"
	desc = "Ring the bell with malicious intent." // Last chance to look at me, hector.
	button_icon = 'icons/obj/service/bureaucracy.dmi'
	button_icon_state = "desk_bell"
	var/exploding = FALSE
	var/explode_delay = 2 SECONDS

/datum/action/vehicle/ridden/wheelchair/kaboom/Trigger(trigger_flags)
	playsound(vehicle_target, 'hypermods/sound/items/bell.ogg', 40, FALSE)
	if(exploding)
		return
	vehicle_target.visible_message(span_boldwarning("The bell on [vehicle_target] dings loudly!"))
	exploding = TRUE
	sleep(explode_delay)
	vehicle_target.visible_message(span_boldwarning("[vehicle_target] explodes!!"))
	explosion(vehicle_target, 0, 2, 3, 5)
	qdel(vehicle_target)
