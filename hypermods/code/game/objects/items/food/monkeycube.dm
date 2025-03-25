/obj/item/food/monkeycube/mice
	name = "mice cube"
	desc = "A Waffle Co. brand mice cube. Now with extra cheese!"
	bite_consumption = 20
	food_reagents = list(
		/datum/reagent/carbon = 25,
		/datum/reagent/blood = 5,
		/datum/reagent/medicine/strange_reagent = 5,
	)
	tastes = list("cheese" = 1, "cartoon antics" = 1, "wire-munching critters" = 1)
	spawned_mob = /mob/living/basic/mouse

/obj/item/food/monkeycube/syndi
	name = "monkey cube"
	desc = "Just add water!"
	bite_consumption = 12
	food_reagents = list(
		/datum/reagent/carbon = 25,
		/datum/reagent/blood = 5,
		/datum/reagent/medicine/strange_reagent = 5,
	)
	tastes = list("the jungle" = 1, "bananas" = 1, "evil" = 1)
	spawned_mob = /mob/living/basic/trooper/syndicate/melee/space


/obj/item/food/monkeycube/biosponge
	name = "sponge capsule"
	desc = "Add water for some very interesting friends!"
	icon = 'hypermods/icons/obj/food/food.dmi'
	icon_state = "spongecapsule"
	bite_consumption = 12
	food_reagents = list(
		/datum/reagent/medicine/strange_reagent = 1,
		/datum/reagent/toxin/plasma = 5,
	)
	tastes = list("mystery" = 1, "an engima" = 1)
	foodtypes = MEAT | SUGAR
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_TINY
	faction = list(FACTION_NEUTRAL, ROLE_SYNDICATE)
	var/amount_to_spawn = 2
	var/random = TRUE

/obj/item/food/monkeycube/biosponge/Expand(mob_class = HOSTILE_SPAWN, mob_faction = FACTION_CHEMICAL_SUMMON)
	if(expanding)
		return

	expanding = TRUE

	var/mob/spammer = get_mob_by_key(fingerprintslast)
	var/mob/living/spawned_mob
	var/mob/holder = loc

	if(ismob(loc))
		holder.dropItemToGround(src)

	for(var/i in 1 to amount_to_spawn)
		if(random)
			spawned_mob = create_random_mob(get_turf(holder), mob_class)
		else
			spawned_mob = new mob_class(get_turf(holder))//Spawn our specific mob_class
		if(faction)
			spawned_mob.faction = faction // Ensuring that whatever spawns always gets the roles set via the var, then add whatever is innate.
		spawned_mob.faction |= mob_faction
		if(prob(50))
			for(var/j in 1 to rand(1, 3))
				step(spawned_mob, pick(NORTH,SOUTH,EAST,WEST))

	if (!QDELETED(spawned_mob))

		visible_message(span_notice("[src] expands!"))
		spawned_mob.log_message("spawned via [src], Last attached mob: [key_name(spammer)].", LOG_ATTACK)

		var/alpha_to = spawned_mob.alpha
		var/matrix/scale_to = matrix(spawned_mob.transform)
		spawned_mob.alpha = 0
		spawned_mob.transform = spawned_mob.transform.Scale(0.1)
		animate(spawned_mob, 0.5 SECONDS, alpha = alpha_to, transform = scale_to, easing = QUAD_EASING|EASE_OUT)

	else if (!spammer) // Visible message in case there are no fingerprints
		visible_message(span_notice("[src] fails to expand!"))
		return

	animate(src, 0.4 SECONDS, alpha = 0, transform = transform.Scale(0), easing = QUAD_EASING|EASE_IN)
	QDEL_IN(src, 0.5 SECONDS)
