/datum/ai_module/sniper
	name = "Fire Bluespace Bullet"
	description = "Allow remote damage output in the form of Brute damage."
	one_purchase = TRUE
	power_type = /datum/action/innate/ai/ranged/sniper
	unlock_text = span_notice("Access to Anti-Personnel Bluespace Bullets acquired.")

/datum/action/innate/ai/ranged/sniper
	name = "Fire Bluespace Bullet"
	desc = "Use to remotely harm a human for minor brute damage. Keeps the rabble in line. Uses 50 battery."
	button_icon = 'hypermods/icons/obj/weapons/guns/ammo.dmi'
	button_icon_state = "556l-casing-live"
	ranged_mousepointer = 'icons/effects/mouse_pointers/supplypod_target.dmi'
	enable_text = span_notice("You prepare to shoot someone.")
	disable_text = span_notice("You holster your definitely-not-a-sniper-rifle.")

/datum/action/innate/ai/ranged/sniper/do_ability(mob/living/clicker, atom/clicked_on)
	if(!isAI(clicker))
		return FALSE
	var/mob/living/silicon/ai/ai_clicker = clicker

	if(clicker.incapacitated)
		unset_ranged_ability(clicker)
		return FALSE

	if(!ishuman(clicked_on))
		clicked_on.balloon_alert(ai_clicker, "not a human!")
		return FALSE

	if(ai_clicker.battery - 50 <= 0)
		to_chat(ai_clicker, span_warning("You do not have the battery to take the shot!"))
		return FALSE

	if(isliving(clicked_on))
		if(ishuman(clicked_on))
			var/mob/living/carbon/human/human_mob = clicked_on
			var/target_bodypart = human_mob.get_random_valid_zone(pick(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_R_ARM, BODY_ZONE_R_LEG, BODY_ZONE_L_ARM, BODY_ZONE_L_LEG))
			human_mob.apply_damage(10, BRUTE, target_bodypart, wound_bonus = 0, sharpness = TRUE)
			playsound(human_mob, 'hypermods/sound/weapons/rifleshot.ogg', 70, TRUE)
			ai_clicker.battery -= 50
			return TRUE
		var/mob/living/carbon/human/nonhuman_mob = clicked_on
		nonhuman_mob.adjust_brute_loss(10)
		playsound(nonhuman_mob, 'hypermods/sound/weapons/rifleshot.ogg', 70, TRUE)
		ai_clicker.battery -= 50
		return TRUE
