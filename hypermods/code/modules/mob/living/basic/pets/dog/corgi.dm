/mob/living/basic/cerberus
	name = "cerberus"
	desc = "Now THAT'S a good dog... or is it?"
	icon = 'hypermods/icons/mob/simple/pets.dmi'
	icon_state = "cerberus"
	icon_living = "cerberus"
	icon_dead = "cerberus_dead"
	maxHealth = 100
	health = 100
	melee_damage_lower = 15
	melee_damage_upper = 30
	attack_sound = 'hypermods/sound/effects/cerberus.ogg'
	butcher_results = list(/obj/item/food/meat/slab/corgi = 3, /obj/item/stack/sheet/animalhide/corgi = 1)
	gold_core_spawnable = NO_SPAWN
	faction = list(FACTION_HOSTILE, ROLE_TRAITOR, ROLE_SPY)
	ai_controller = /datum/ai_controller/basic_controller/cerberus

/datum/ai_controller/basic_controller/cerberus
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

