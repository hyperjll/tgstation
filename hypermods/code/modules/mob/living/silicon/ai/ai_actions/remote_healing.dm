/datum/ai_module/heal_brute
	name = "Launch Bluespace Brutepack"
	description = "Allow remote medical care of brute damage."
	one_purchase = TRUE
	power_type = /datum/action/innate/ai/ranged/heal_brute
	unlock_text = span_notice("Access to Brute Healing Bluespace Capsules acquired.")

/datum/action/innate/ai/ranged/heal_brute
	name = "bluespace brutepack capsule"
	desc = "Use to remotely heal a human's brute damage. Uses 50 battery."
	button_icon = 'icons/obj/storage/medkit.dmi'
	button_icon_state = "oldbrute"
	ranged_mousepointer = 'icons/effects/mouse_pointers/supplypod_target.dmi'
	enable_text = span_notice("You prepare to remotely heal a human's brute damage.")
	disable_text = span_notice("You stop focusing on remote brute healing.")

/datum/action/innate/ai/ranged/heal_brute/do_ability(mob/living/clicker, atom/clicked_on)

	if (!isAI(clicker))
		return FALSE
	var/mob/living/silicon/ai/ai_clicker = clicker

	if(clicker.incapacitated)
		unset_ranged_ability(clicker)
		return FALSE

	if(!ishuman(clicked_on))
		clicked_on.balloon_alert(ai_clicker, "not an human!")
		return FALSE

	if(ai_clicker.battery - 50 <= 0)
		to_chat(ai_clicker, span_warning("You do not have the battery to launch a bluespace capsule!"))
		return FALSE

	var/mob/living/carbon/human/human_mob = clicked_on
	human_mob.adjustBruteLoss(-10)
	new /obj/effect/temp_visual/heal(get_turf(human_mob), COLOR_RED)
	playsound(human_mob, 'sound/items/syringeproj.ogg', 70, TRUE)

	ai_clicker.battery -= 50

/datum/ai_module/heal_burn
	name = "Launch Bluespace Burnpack"
	description = "Allow remote medical care of burn damage."
	one_purchase = TRUE
	power_type = /datum/action/innate/ai/ranged/heal_burn
	unlock_text = span_notice("Access to Brute Healing Bluespace Capsules acquired.")

/datum/action/innate/ai/ranged/heal_burn
	name = "bluespace burnpack capsule"
	desc = "Use to remotely heal a human's burn damage. Uses 50 battery."
	button_icon = 'icons/obj/storage/medkit.dmi'
	button_icon_state = "oldointment"
	ranged_mousepointer = 'icons/effects/mouse_pointers/supplypod_target.dmi'
	enable_text = span_notice("You prepare to remotely heal a human's burn damage.")
	disable_text = span_notice("You stop focusing on remote burn healing.")

/datum/action/innate/ai/ranged/heal_burn/do_ability(mob/living/clicker, atom/clicked_on)

	if (!isAI(clicker))
		return FALSE
	var/mob/living/silicon/ai/ai_clicker = clicker

	if(clicker.incapacitated)
		unset_ranged_ability(clicker)
		return FALSE

	if(!ishuman(clicked_on))
		clicked_on.balloon_alert(ai_clicker, "not an human!")
		return FALSE

	if(ai_clicker.battery - 50 <= 0)
		to_chat(ai_clicker, span_warning("You do not have the battery to launch a bluespace capsule!"))
		return FALSE

	var/mob/living/carbon/human/human_mob = clicked_on
	human_mob.adjustFireLoss(-10)
	new /obj/effect/temp_visual/heal(get_turf(human_mob), COLOR_ORANGE)
	playsound(human_mob, 'sound/items/syringeproj.ogg', 70, TRUE)

	ai_clicker.battery -= 50

/datum/ai_module/heal_tox
	name = "Launch Bluespace Toxpack"
	description = "Allow remote medical care of toxin damage."
	one_purchase = TRUE
	power_type = /datum/action/innate/ai/ranged/heal_tox
	unlock_text = span_notice("Access to Brute Healing Bluespace Capsules acquired.")

/datum/action/innate/ai/ranged/heal_tox
	name = "bluespace toxpack capsule"
	desc = "Use to remotely heal a human's toxin damage. Uses 50 battery."
	button_icon = 'icons/obj/storage/medkit.dmi'
	button_icon_state = "oldantitoxin"
	ranged_mousepointer = 'icons/effects/mouse_pointers/supplypod_target.dmi'
	enable_text = span_notice("You prepare to remotely heal a human's toxin damage.")
	disable_text = span_notice("You stop focusing on remote toxin healing.")

/datum/action/innate/ai/ranged/heal_tox/do_ability(mob/living/clicker, atom/clicked_on)

	if (!isAI(clicker))
		return FALSE
	var/mob/living/silicon/ai/ai_clicker = clicker

	if(clicker.incapacitated)
		unset_ranged_ability(clicker)
		return FALSE

	if(!ishuman(clicked_on))
		clicked_on.balloon_alert(ai_clicker, "not an human!")
		return FALSE

	if(ai_clicker.battery - 50 <= 0)
		to_chat(ai_clicker, span_warning("You do not have the battery to launch a bluespace capsule!"))
		return FALSE

	var/mob/living/carbon/human/human_mob = clicked_on
	human_mob.adjustToxLoss(-10)
	new /obj/effect/temp_visual/heal(get_turf(human_mob), COLOR_GREEN)
	playsound(human_mob, 'sound/items/syringeproj.ogg', 70, TRUE)

	ai_clicker.battery -= 50

/datum/ai_module/heal_oxy
	name = "Launch Bluespace Oxypack"
	description = "Allow remote medical care of oxygen damage."
	one_purchase = TRUE
	power_type = /datum/action/innate/ai/ranged/heal_oxy
	unlock_text = span_notice("Access to Brute Healing Bluespace Capsules acquired.")

/datum/action/innate/ai/ranged/heal_oxy
	name = "bluespace oxypack capsule"
	desc = "Use to remotely heal a human's oxygen damage. Uses 50 battery."
	button_icon = 'icons/obj/storage/medkit.dmi'
	button_icon_state = "oldo2"
	ranged_mousepointer = 'icons/effects/mouse_pointers/supplypod_target.dmi'
	enable_text = span_notice("You prepare to remotely heal a human's oxygen damage.")
	disable_text = span_notice("You stop focusing on remote oxygen healing.")

/datum/action/innate/ai/ranged/heal_oxy/do_ability(mob/living/clicker, atom/clicked_on)

	if (!isAI(clicker))
		return FALSE
	var/mob/living/silicon/ai/ai_clicker = clicker

	if(clicker.incapacitated)
		unset_ranged_ability(clicker)
		return FALSE

	if(!ishuman(clicked_on))
		clicked_on.balloon_alert(ai_clicker, "not an human!")
		return FALSE

	if(ai_clicker.battery - 50 <= 0)
		to_chat(ai_clicker, span_warning("You do not have the battery to launch a bluespace capsule!"))
		return FALSE

	var/mob/living/carbon/human/human_mob = clicked_on
	human_mob.adjustOxyLoss(-30)
	new /obj/effect/temp_visual/heal(get_turf(human_mob), COLOR_BLUE)
	playsound(human_mob, 'sound/items/syringeproj.ogg', 70, TRUE)

	ai_clicker.battery -= 50
