/obj/item/food/pie/cream/bluespace
	name = "bluespace banana cream pie"
	desc = "Just like back home, on clown planet! HONK!"
	icon = 'hypermods/icons/obj/food/piecake.dmi'
	icon_state = "bpie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/banana = 5,
		/datum/reagent/bluespace = 8,
	)
	tastes = list("pie" = 1, "bluespace" = 1, "instability" = 1)
	foodtypes = GRAIN | DAIRY | SUGAR
	stunning = TRUE
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/cream/bluespace/splat(atom/movable/hit_atom)
	do_teleport(hit_atom, get_turf(src), 5, asoundin = 'sound/effects/phasein.ogg', channel = TELEPORT_CHANNEL_BLUESPACE)
	..()
