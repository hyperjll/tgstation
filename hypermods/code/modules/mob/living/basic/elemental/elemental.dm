/mob/living/basic/elemental
	name = "reagent elemental"
	desc = "A monstrosity consisting entirely of liquid reagents."
	icon = 'hypermods/icons/mob/simple/elemental.dmi'
	icon_state = "elemental"
	icon_dead = "elemental_dead"
	maxHealth = 50
	health = 50
	faction = list(FACTION_HOSTILE)
	mob_biotypes = MOB_BEAST | MOB_AQUATIC
	ai_controller = /datum/ai_controller/basic_controller/elemental
	can_be_held = FALSE
	butcher_results = null

	melee_damage_lower = 10
	melee_damage_upper = 20

	response_help_continuous = "pokes"
	response_help_simple = "poke"
	response_disarm_continuous = "shoves aside"
	response_disarm_simple = "shove aside"
	response_harm_continuous = "slices"
	response_harm_simple = "slice"

	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'sound/items/weapons/bite.ogg'

	/// What reagent is this elemental based off of?
	var/elemental_reagent

/mob/living/basic/elemental/Initialize(mapload, new_lifespan)
	. = ..()
	reagents = new(10)

	if(!elemental_reagent)
		var/list/r_types = subtypesof(/datum/reagent/)
		for(var/i in 1 to 1)
			elemental_reagent = pick(r_types)

	reagents.add_reagent(elemental_reagent, 10)
	color = mix_color_from_reagents(reagents.reagent_list)

/mob/living/basic/elemental/death()
	. = ..()
	var/turf/open/tile = get_turf(src)

	if(!tile)
		return

	tile.add_liquid_from_reagents(reagents)
	playsound(tile, 'sound/effects/splat.ogg', 50, 1)

	reagents.add_reagent(elemental_reagent, 10)

/mob/living/basic/elemental/gib()
	. = ..()
	var/turf/open/tile = get_turf(src)

	if(!tile)
		return

	tile.add_liquid_from_reagents(reagents)
	playsound(tile, 'sound/effects/splat.ogg', 50, 1)

/datum/ai_controller/basic_controller/elemental
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
