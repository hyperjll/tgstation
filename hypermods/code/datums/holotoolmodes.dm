/datum/holotool_mode
	var/name = "???"
	var/sound
	var/behavior
	var/sharpness
	var/speed = 0.4

/datum/holotool_mode/proc/can_be_used(obj/item/holotool/H)
	return TRUE

/datum/holotool_mode/proc/on_set(obj/item/holotool/H)
	H.usesound = sound ? sound : 'sound/items/pshoom/pshoom.ogg'
	H.toolspeed = speed ? speed : 1
	H.tool_behaviour = behavior ? behavior : null

/datum/holotool_mode/proc/on_unset(obj/item/holotool/H)
	H.usesound = initial(H.usesound)
	H.toolspeed = initial(H.toolspeed)
	H.tool_behaviour = initial(H.tool_behaviour)

////////////////////////////////////////////////

/datum/holotool_mode/off
	name = "off"
	sound = 'hypermods/sound/items/holotool.ogg'

/datum/holotool_mode/screwdriver
	name = "holo-screwdriver"
	sound = 'hypermods/sound/items/holotool.ogg'
	behavior = TOOL_SCREWDRIVER

/datum/holotool_mode/crowbar
	name = "holo-crowbar"
	sound = 'hypermods/sound/items/holotool.ogg'
	behavior = TOOL_CROWBAR

/datum/holotool_mode/multitool
	name = "holo-multitool"
	sound = 'hypermods/sound/items/holotool.ogg'
	behavior = TOOL_MULTITOOL

/datum/holotool_mode/wrench
	name = "holo-wrench"
	sound = 'hypermods/sound/items/holotool.ogg'
	behavior = TOOL_WRENCH

/datum/holotool_mode/wirecutters
	name = "holo-wirecutters"
	sound = 'hypermods/sound/items/holotool.ogg'
	behavior = TOOL_WIRECUTTER

/datum/holotool_mode/welder
	name = "holo-welder"
	sound = list('sound/items/tools/welder.ogg', 'sound/items/tools/welder2.ogg')//so it actually gives the expected feedback from welding
	behavior = TOOL_WELDER

////////////////////////////////////////////////

/datum/holotool_mode/knife
	name = "holo-knife"
	sound = 'sound/items/weapons/blade1.ogg'

/datum/embedding/holoknife
	embed_chance = 40
	fall_chance = 0
	pain_mult = 5

/datum/holotool_mode/knife/can_be_used(obj/item/holotool/H)
	return (H.obj_flags & EMAGGED)

/datum/holotool_mode/knife/on_set(obj/item/holotool/H)
	..()
	H.force = 17
	H.attack_verb_simple = list("sliced", "torn", "cut")
	H.armour_penetration = 45
	H.embed_type = /datum/embedding/holoknife
	H.hitsound = 'sound/items/weapons/blade1.ogg'

/datum/holotool_mode/knife/on_unset(obj/item/holotool/H)
	..()
	H.force = initial(H.force)
	H.attack_verb_simple = initial(H.attack_verb_simple)
	H.armour_penetration = initial(H.armour_penetration)
	H.embed_type = initial(H.embed_type)
	H.hitsound = initial(H.hitsound)
