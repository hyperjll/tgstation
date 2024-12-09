/datum/map_template/shelter/syndicate
	name = "Shelter Syndicate"
	shelter_id = "shelter_syndicate"
	description = "A luxury shelter which holds an entire bar \
		along with several vending machines, a miniature medical suite, \
		a teleporter hub, and a restroom that also has a sink. \
		Also contains a medibot, firebot, and a secret hide-y hole! \
		Very useful as a distant base of operations."
	mappath = "_maps/templates/shelter_4.dmm"

/datum/map_template/shelter/syndicate/New()
	. = ..()
	blacklisted_turfs -= typesof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)

/datum/map_template/shelter/robot_factory
	name = "Shelter Syndicate"
	shelter_id = "shelter_robot_factory"
	description = "A secretive mini-base capable of surviving harsh environments. \
		Contains a miniature medical suite, a chemical dispensery, a small robotics lab, \
		a teleporter hub, some fulton equipment, and an automated cyborg conversion chamber! \
		The perfect 'shadow factory' to make your silicon army!"
	mappath = "_maps/templates/shelter_5.dmm"

/datum/map_template/shelter/syndicate/New()
	. = ..()
	blacklisted_turfs -= typesof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)
