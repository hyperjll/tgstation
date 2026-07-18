/mob/living/basic/grenadepenguin
	name = "penguin"
	desc = "This one doesn't look nearly as cute and friendly."
	icon = 'hypermods/icons/mob/simple/penguins.dmi'
	icon_state = "grenadepenguin"
	maxHealth = 70
	health = 70
	gold_core_spawnable = NO_SPAWN // Probably for the best.
	faction = list(FACTION_HOSTILE, ROLE_TRAITOR, ROLE_SPY, ROLE_SYNDICATE)
	ai_controller = /datum/ai_controller/basic_controller/grenadepenguin

	melee_damage_lower = 10
	melee_damage_upper = 15

	response_help_continuous = "prods"
	response_help_simple = "prod"
	response_disarm_continuous = "pushes aside"
	response_disarm_simple = "push aside"
	response_harm_continuous = "smacks"
	response_harm_simple = "smack"

	attack_verb_continuous = "pecks"
	attack_verb_simple = "peck"
	attack_sound = 'sound/items/weapons/punch1.ogg'

/mob/living/basic/grenadepenguin/death()
	explosion(src, 0, 2, 4, flame_range = 3)
	qdel(src)

/datum/ai_controller/basic_controller/grenadepenguin
	behavior_tree_json = "hypermods/code/modules/mob/living/basic/pets/grenadepenguin.bt.json"
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)

	ai_movement = /datum/ai_movement/basic_avoidance
