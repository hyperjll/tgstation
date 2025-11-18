
/obj/item/rubber_chicken
	name = "rubber chicken"
	desc = "A robust rubber chicken the size of a Louisiana broiler."
	icon = 'surfshack13/icons/obj/toys/toy.dmi'
	icon_state = "rubber_chicken"
	lefthand_file = 'surfshack13/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'surfshack13/icons/mob/inhands/weapons/melee_righthand.dmi'
	inhand_icon_state = "rubber_chicken"
	force_string = "hilarious"
	force = 10
	damtype = STAMINA
	hitsound = 'surfshack13/sound/items/rubber_chicken/rubber_chicken.ogg'
	attack_verb_continuous = list("slaps", "smacks", "gahonks")
	attack_verb_simple = list("slap", "smack", "gahonk")

/obj/item/rubber_chicken/examine(mob/user)
	. = ..()
	. += span_notice("It looks somewhat clammy and exudes somewhat of a rubbery smell.\n\nA small peeling sticker on the chicken's left thigh reads: 'made by Waffle Co.'")

/obj/item/rubber_chicken/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!isliving(target))
		return
	var/mob/living/slapped = target
	slapped.apply_status_effect(/datum/status_effect/pranked)

/obj/item/rubber_chicken/attack_secondary(mob/living/victim, mob/living/user, params)
	. = ..()

	if(HAS_TRAIT(user, TRAIT_CLUMSY) || is_clown_job(user.mind?.assigned_role))
		return SECONDARY_ATTACK_CALL_NORMAL

	var/datum/status_effect/pranked/victim_pranked = victim.has_status_effect(/datum/status_effect/pranked)
	if(!victim_pranked)
		return SECONDARY_ATTACK_CALL_NORMAL

	if(victim.has_status_effect(/datum/status_effect/slapped_silly))
		return SECONDARY_ATTACK_CALL_NORMAL

	var/slap_power = victim_pranked.prank_counter

	playsound(user, 'surfshack13/sound/items/rubber_chicken/rubber_chicken.ogg', min(slap_power * 10, 80))
	user.do_attack_animation(src)
	var/honk_block = victim.run_armor_check(
			def_zone = BODY_ZONE_HEAD,
			attack_flag = MELEE,
			absorb_text = span_nicegreen("Your helmet has protected your dignity from the clown!"),
			soften_text = span_warning("Your helmet has softened the impact from the [name]!"),
			armour_penetration = armour_penetration,
			weak_against_armour = weak_against_armour)

	victim.apply_damage(force * 0.7 * slap_power, STAMINA, BODY_ZONE_HEAD, blocked = honk_block)
	victim.apply_status_effect(min(/datum/status_effect/slapped_silly, slap_power * 2 SECONDS, 30 SECONDS))
	victim.remove_status_effect(/datum/status_effect/pranked)
	user.visible_message(span_danger("[user] knocks [victim] silly with [src]!"))
	return SECONDARY_ATTACK_CONTINUE_CHAIN

/obj/item/rubber_chicken/suicide_act(mob/living/user)
	if(!iscarbon(user))
		return ..()
	var/mob/living/carbon/C = user
	var/obj/item/organ/lungs = C.get_organ_slot(ORGAN_SLOT_LUNGS)
	var/obj/chest = C.get_bodypart(BODY_ZONE_CHEST)
	if(!lungs || !chest)
		return ..()

	visible_message(span_suicide("[user] forces \the [src] down [user.p_their()] windpipe, and tries to laugh! [user.p_Their()] lungs get forced out of [user.p_their()] chest cavity"))
	src.forceMove(chest)
	chest.contents |= src
	user.emote("tries to laugh")
	playsound(user, 'surfshack13/sound/items/rubber_chicken/rubber_chicken_long.ogg', 100)
	lungs.Remove(user)
	lungs.forceMove(get_turf(user))
	return OXYLOSS
