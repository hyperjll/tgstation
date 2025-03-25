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

/obj/item/toy/crayon/spraycan/syndicate/borg
	name = "cyborg hellcan"
	desc = "A metallic container containing shiny synthesised death."
	icon_state = "deathcan2_cap"
	icon_capped = "deathcan2_cap"
	icon_uncapped = "deathcan2"
	overlay_paint_colour = FALSE
	charges = -1
	volume_multiplier = 25
	reagent_contents = list(/datum/reagent/clf3 = 1, /datum/reagent/toxin/plasma = 2)
	actually_paints = FALSE
	expose_turfs = TRUE
	paint_color = COLOR_BLACK

/obj/item/toy/crayon/spraycan/syndicate/borg/interact_with_atom(atom/interacting_with,mob/user,proximity, params)
	var/diff = ..()
	if(!iscyborg(user))
		to_chat(user, span_notice("How did you get this?"))
		qdel(src)
		return FALSE

	var/mob/living/silicon/robot/borgy = user

	if(!diff)
		return
	// 25 is our cost per unit of paint, making it cost 25 energy per
	// normal tag, 50 per window, and 250 per attack
	var/cost = diff * 25
	// Cyborgs shouldn't be able to use modules without a cell. But if they do
	// it's free.
	if(borgy.cell)
		borgy.cell.use(cost)

