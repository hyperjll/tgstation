/obj/item/toy/crayon/spraycan/syndicate
	name = "hellcan"
	desc = "This spraycan doesn't seem to be filled with paint..."
	icon_state = "deathcan2_cap"
	icon_capped = "deathcan2_cap"
	icon_uncapped = "deathcan2"
	overlay_paint_colour = FALSE

	volume_multiplier = 25
	actually_paints = FALSE
	expose_turfs = TRUE
	charges = 100
	reagent_contents = list(/datum/reagent/clf3 = 1, /datum/reagent/toxin/plasma = 2)
	paint_color = COLOR_BLACK

/obj/item/toy/crayon/spraycan/syndicate/isValidSurface(surface)
	return isfloorturf(surface)
