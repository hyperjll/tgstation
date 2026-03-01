/datum/ai_module/repair_turrets
	name = "AI Turret Repair"
	description = "Repairs all available turrets by a moderate amount. Uses 30 battery."
	one_purchase = TRUE
	power_type = /datum/action/innate/ai/repair_turrets
	unlock_sound = 'sound/items/tools/rped.ogg'
	var/battery_per_use = 10

/datum/action/innate/ai/repair_turrets
	name = "AI Turret Repair"
	desc = "Repairs all available turrets by a moderate amount. Uses 30 battery."
	button_icon = 'icons/obj/weapons/turrets.dmi'
	button_icon_state = "standard_off"
	uses = INFINITY

/datum/action/innate/ai/repair_turrets/Trigger(mob/clicker, trigger_flags)
	. = ..()
	var/mob/living/silicon/ai/AI = clicker

	if(AI.battery - 30 <= 0)
		to_chat(AI, span_warning("You do not have the battery power to perform this action!"))
		return FALSE

	for(var/obj/machinery/porta_turret/ai/turret as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/porta_turret/ai))
		turret.repair_damage(20)

	to_chat(AI, span_notice("Maintenance routine completed! All available turrets have been repaired moderately."))

	AI.battery -= 30
