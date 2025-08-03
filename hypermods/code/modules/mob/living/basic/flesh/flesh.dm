/mob/living/basic/flesh // Just a base to prevent a lot of copy & pasting.
	name = "flesh monster"
	desc = "A monstrosity consisting entirely of flesh-like tendrils. You don't even want to know where it came from or what happens if it gets close to you."
	icon = 'hypermods/icons/mob/simple/flesh.dmi'
	icon_state = "golem"
	icon_dead = "golem_dead"
	maxHealth = 40
	health = 40
	faction = list(FACTION_HOSTILE, FACTION_ANOMALY, FACTION_FLESH)
	mob_biotypes = MOB_ORGANIC
	ai_controller = /datum/ai_controller/basic_controller/flesh
	can_be_held = FALSE
	butcher_results = null

	melee_damage_lower = 5
	melee_damage_upper = 12

	response_help_continuous = "pokes"
	response_help_simple = "poke"
	response_disarm_continuous = "shoves aside"
	response_disarm_simple = "shove aside"
	response_harm_continuous = "assaults"
	response_harm_simple = "assault"

	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'sound/items/weapons/bite.ogg'

/mob/living/basic/flesh/Initialize(mapload, new_lifespan)
	. = ..()
	reagents = new(10)
	reagents.add_reagent(/datum/reagent/blood, 10)

/mob/living/basic/flesh/death()
	. = ..()
	var/turf/open/tile = get_turf(src)

	if(!tile)
		return

	tile.add_liquid_from_reagents(reagents)
	playsound(tile, 'sound/effects/splat.ogg', 50, 1)

	reagents.add_reagent(/datum/reagent/blood, 10) // Just in case we're gibbed/butchered after.

/mob/living/basic/flesh/gib()
	. = ..()
	var/turf/open/tile = get_turf(src)

	if(!tile)
		return

	tile.add_liquid_from_reagents(reagents)
	playsound(tile, 'sound/effects/splat.ogg', 50, 1)

/datum/ai_controller/basic_controller/flesh
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

/mob/living/basic/flesh/clump
	name = "flesh clump"
	icon_state = "clump"
	icon_dead = "clump_dead"
	maxHealth = 45
	health = 45
	melee_damage_lower = 4
	melee_damage_upper = 9

/mob/living/basic/flesh/jared
	icon_state = "jared"
	icon_dead = "jared_dead"
	melee_damage_lower = 3
	melee_damage_upper = 8

/mob/living/basic/flesh/lover
	name = "flesh heart"
	icon_state = "lover"
	icon_dead = "lover_dead"
	maxHealth = 30
	health = 30

/mob/living/basic/flesh/golem
	name = "flesh golem"
	maxHealth = 70
	health = 70
	attack_verb_continuous = "attacks"
	attack_verb_simple = "attack"
	attack_sound = 'sound/items/weapons/punch1.ogg'
