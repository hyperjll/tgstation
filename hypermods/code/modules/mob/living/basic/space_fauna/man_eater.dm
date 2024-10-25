/*
* ## Man Eaters
*
* The syndicate botanist's personal killer tomato horde of death, now on steroids.
*/

/mob/living/basic/man_eater
	name = "Man Eater"
	desc = "It looks hungry..."
	icon = 'hypermods/icons/mob/simple/critter.dmi'
	icon_state = "maneater"
	icon_living = "maneater"
	icon_dead = "maneater-dead"
	mob_biotypes = MOB_ORGANIC | MOB_PLANT
	gender = NEUTER
	speed = 1 // if you wanna touch this, keep in mind we want to incentivize people growing really good botany plants in order to make these buggers faster.
	maxHealth = 100
	health = 100
	butcher_results = list(/obj/item/food/meat/slab/synthmeat = 2)
	response_help_continuous = "prods"
	response_help_simple = "prod"
	response_disarm_continuous = "pushes aside"
	response_disarm_simple = "push aside"
	response_harm_continuous = "punches"
	response_harm_simple = "punch"
	melee_damage_lower = 15
	melee_damage_upper = 25
	attack_verb_continuous = "bites into"
	attack_verb_simple = "bites"
	attack_sound = 'sound/items/weapons/bite.ogg'
	faction = list(FACTION_PLANTS)

	habitable_atmos = list("min_oxy" = 2, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minimum_survivable_temperature = T0C - 130
	maximum_survivable_temperature = T0C + 230
	gold_core_spawnable = HOSTILE_SPAWN

	ai_controller = /datum/ai_controller/basic_controller/man_eater

	var/list/man_eater_commands = list(
		/datum/pet_command/idle,
		/datum/pet_command/free,
		/datum/pet_command/follow,
		/datum/pet_command/point_targeting/attack,
	)

/mob/living/basic/man_eater/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)
	AddComponent(/datum/component/obeys_commands, man_eater_commands)

/datum/ai_controller/basic_controller/man_eater
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
