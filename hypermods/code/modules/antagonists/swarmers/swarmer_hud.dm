/atom/movable/screen/swarmer_resource_counter
	icon = 'icons/hud/screen_alien.dmi'
	icon_state = "power_display"
	name = "resources"
	screen_loc = ui_alienplasmadisplay

/datum/hud/living/swarmer/New(mob/living/basic/swarmer/owner)
	..()

	add_screen_object(/atom/movable/screen/swarmer_resource_counter, HUD_SWARMER_RESOURCES, HUD_GROUP_INFO, update_screen = TRUE)
