/datum/status_effect/food/sweaty
	id = "food_sweaty"
	alert_type = /atom/movable/screen/alert/status_effect/food/sweaty
	var/list/sweat = list(/datum/reagent/water = 4, /datum/reagent/sodium = 1.25)
	var/metabolism_increase = 0.5

/atom/movable/screen/alert/status_effect/food/sweaty
	name = "Sweaty"
	desc = "You're feeling rather sweaty"
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "sweaty"

/datum/status_effect/food/sweaty/wacky
	id = "food_sweaty_wacky"
	alert_type = /atom/movable/screen/alert/status_effect/food/sweaty_wacky
	sweat = list(/datum/reagent/lube = 5)

/atom/movable/screen/alert/status_effect/food/sweaty_wacky
	name = "Wacky Sweat"
	desc = "You're feeling rather sweaty, and incredibly wacky?"
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "sweaty"

/datum/status_effect/food/sweaty/on_apply()
	if(ishuman(owner))
		owner.metabolism_efficiency += metabolism_increase
	return ..()

/datum/status_effect/food/sweaty/on_remove()
	. = ..()
	owner.metabolism_efficiency -= metabolism_increase

/datum/status_effect/food/sweaty/tick()
	. = ..()
	if(prob(5))
		var/turf/puddle_location = get_turf(owner)
		puddle_location.add_liquid_list(sweat, FALSE, 300)
