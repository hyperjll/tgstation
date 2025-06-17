/datum/infuser_entry/sheep
	name = "Sheep"
	infuse_mob_name = "sheep"
	desc = "Skittish and fluffy creatures, most psychologists warn that infusing yourself with sheep DNA may make one more prone to manipulation tactics."
	threshold_desc = "their flesh will develop a certain fluffiness and texture similiar to wool. Such changes provide great insulation against all extreme temperatures."
	qualities = list(
		"skittish",
		"fluffy",
		"loves to eat grass",
		"hops when happy",
	)
	input_obj_or_mob = list(
		/mob/living/basic/sheep,
	)
	output_organs = list(
		/obj/item/organ/heart/sheep,
		/obj/item/organ/liver/sheep,
	)
	infusion_desc = "skittish"
	tier = DNA_MUTANT_TIER_ONE
	status_effect_type = /datum/status_effect/organ_set_bonus/sheep
