/**
 * # Energy Net
 *
 * Energy net which ensnares prey until it is destroyed.  Used by space ninjas.
 *
 * Energy net which keeps its target from moving until it is destroyed.  Used to send
 * players to a holding area in which they could never leave, but such feature has since
 * been removed.
 */
/obj/structure/energy_net/syndicate
	name = "energy net"
	desc = "It's a net made of green energy."
	icon = 'hypermods/icons/effects/effects.dmi'
	icon_state = "energynet"
	max_integrity = 30 //30 health weaker than the ninja version

/obj/structure/energy_net/syndicate/Initialize(mapload)
	. = ..()
	var/image/underlay = image(icon, "energynet_underlay")
	underlay.layer = BELOW_MOB_LAYER
	SET_PLANE_EXPLICIT(underlay, GAME_PLANE, src)
	add_overlay(underlay)
