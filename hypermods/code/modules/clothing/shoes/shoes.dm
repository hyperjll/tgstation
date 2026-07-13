/obj/item/clothing/shoes/bowling
	name = "bowling shoes"
	desc = "Made for use in only the finest bowling alleys."
	icon_state = "bowling_shoes"
	worn_icon_state = "bowling_shoes"
	inhand_icon_state = "sneakers_back"
	icon = 'hypermods/icons/obj/clothing/shoes.dmi'
	worn_icon = 'hypermods/icons/mob/clothing/feet.dmi'

/obj/item/clothing/shoes/bowling/real
	slowdown = -0.3

/obj/item/speed_shoes_inert
	name = "inert speed shoes"
	desc = "High-tech boots woven with quantum fibers, it's lacking the necessary anomalous flux core to function."
	icon_state = "speed_shoes"
	worn_icon_state = "speed_shoes"
	inhand_icon_state = "speed_shoes"
	icon = 'hypermods/icons/obj/clothing/shoes.dmi'
	worn_icon = 'hypermods/icons/mob/clothing/feet.dmi'
	lefthand_file = 'hypermods/icons/mob/inhands/clothing/shoes_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/clothing/shoes_righthand.dmi'
	w_class = WEIGHT_CLASS_HUGE
	resistance_flags = FIRE_PROOF
	item_flags = NO_MAT_REDEMPTION
	custom_materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 4, /datum/material/gold = SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/bluespace = SHEET_MATERIAL_AMOUNT, /datum/material/diamond = SHEET_MATERIAL_AMOUNT * 0.75, /datum/material/uranium = SMALL_MATERIAL_AMOUNT * 1.5)
	slot_flags = null

/obj/item/speed_shoes_inert/Initialize(mapload)
	. = ..()
	var/static/list/recipes = list(/datum/crafting_recipe/speed_shoes)
	AddElement(/datum/element/slapcrafting, recipes)

/obj/item/clothing/shoes/anom_speed_shoes
	name = "speed shoes"
	desc = "High-tech boots woven with quantum fibers, able to convert anomalous electricity into pure kinetic force!"
	icon_state = "speed_shoes_on"
	worn_icon_state = "speed_shoes"
	inhand_icon_state = "speed_shoes"
	icon = 'hypermods/icons/obj/clothing/shoes.dmi'
	worn_icon = 'hypermods/icons/mob/clothing/feet.dmi'
	lefthand_file = 'hypermods/icons/mob/inhands/clothing/shoes_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/clothing/shoes_righthand.dmi'
	slowdown = -0.25
	custom_materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 4, /datum/material/gold = SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/bluespace = SHEET_MATERIAL_AMOUNT, /datum/material/diamond = SHEET_MATERIAL_AMOUNT * 0.75, /datum/material/uranium = SMALL_MATERIAL_AMOUNT * 1.5)
	w_class = WEIGHT_CLASS_HUGE
	resistance_flags = FIRE_PROOF
	item_flags = NO_MAT_REDEMPTION
