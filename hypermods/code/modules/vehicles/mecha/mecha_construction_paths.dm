/datum/component/construction/unordered
	var/spawn_result_icon = 'icons/mob/rideables/mech_construction.dmi' // Used by me for icon replacements

//Justice
/datum/component/construction/unordered/mecha_chassis/justice
	spawn_result_icon = 'hypermods/icons/mob/rideables/mech_construction.dmi'
	result = /datum/component/construction/mecha/justice
	steps = list(
		/obj/item/mecha_parts/part/justice_torso,
		/obj/item/mecha_parts/part/justice_left_arm,
		/obj/item/mecha_parts/part/justice_right_arm,
		/obj/item/mecha_parts/part/justice_left_leg,
		/obj/item/mecha_parts/part/justice_right_leg
	)

/datum/component/construction/mecha/justice
	result = /obj/vehicle/sealed/mecha/justice
	base_icon = "justice"

	inner_plating = /obj/item/stack/telecrystal
	inner_plating_amount = 8

	outer_plating = /obj/item/mecha_parts/part/justice_armor
	outer_plating_amount = 1

/datum/component/construction/mecha/justice/get_circuit_steps()
	return list()

/datum/component/construction/mecha/justice/get_inner_plating_steps()
	return list(
		list(
			"key" = inner_plating,
			"amount" = inner_plating_amount,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured, and [inner_plating_amount] <b>telecrystals</b> can be added.",
			"forward_message" = "added telecrystal",
			"backward_message" = "unsecured power cell"
		)
	)
