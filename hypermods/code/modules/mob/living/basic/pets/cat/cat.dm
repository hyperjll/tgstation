/mob/living/basic/syndicat
	name = "syndicat"
	desc = "A cat wearing a custom-made blood-red modsuit. It's still adorable, even now."
	icon = 'hypermods/icons/mob/simple/pets.dmi'
	icon_state = "syndicat"
	icon_living = "syndicat"
	icon_dead = "syndicat_dead"
	speak_emote = list("purrs", "meows")
	pass_flags = PASSTABLE
	mob_size = MOB_SIZE_SMALL
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 0
	melee_damage_lower = 15
	melee_damage_upper = 18
	butcher_results = list(
		/obj/item/food/meat/slab = 1,
		/obj/item/organ/ears/cat = 1,
		/obj/item/organ/tail/cat = 1,
		/obj/item/stack/sheet/animalhide/cat = 1
	)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	mobility_flags = MOBILITY_FLAGS_REST_CAPABLE_DEFAULT
	gold_core_spawnable = NO_SPAWN // Probably for the best.
	can_be_held = TRUE
	faction = list(FACTION_HOSTILE, ROLE_SYNDICATE)
	ai_controller = /datum/ai_controller/basic_controller/syndicat
	held_state = "cat2"
	attack_verb_continuous = "claws"
	attack_verb_simple = "claw"
	attack_sound = 'sound/items/weapons/slash.ogg'
	attack_vis_effect = ATTACK_EFFECT_CLAW

/mob/living/basic/syndicat/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)

/mob/living/basic/syndicat/death()
	var/bomb_beeps_until_boom = 3
	while(bomb_beeps_until_boom > 0)
		//for extra spice
		var/beep_volume = 40
		playsound(loc, 'sound/items/timer.ogg', beep_volume, vary = FALSE)
		sleep(1 SECONDS)
		bomb_beeps_until_boom--
		beep_volume += 20
	if(bomb_beeps_until_boom == 0)
		explosion(src, 0, 3, 6, flame_range = 4)
		qdel(src)

/datum/ai_controller/basic_controller/syndicat
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)

	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
	)
