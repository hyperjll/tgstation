/obj/item/gun/syringe/security
	name = "syringe syringe pistol"
	desc = "A small spring-loaded sidearm that functions identically to a syringe gun. Specifcally designed for security forces for quick administering of sedatives."
	icon = 'hypermods/icons/obj/weapons/guns/syringegun.dmi'
	icon_state = "secsyringegun"
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	inhand_icon_state = "syringegun"
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	worn_icon_state = "gun"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT
	base_pixel_x = 0
	pixel_x = 0
	force = 1 //Very weak to prevent lethalling.
	suppressed = FALSE
	can_unsuppress = FALSE //Permanently silenced
	syringes = list(new /obj/item/reagent_containers/syringe())

/obj/item/gun/syringe/pblowgun
	name = "professional blowgun"
	desc = "Fires syringe at a short distance. Has a secondary chamber which replaces the fired syringe."
	icon = 'hypermods/icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "pblowgun"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/guns_righthand.dmi'
	inhand_icon_state = "pblowgun"
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	worn_icon_state = "gun"
	has_syringe_overlay = FALSE
	fire_sound = 'sound/items/syringeproj.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	base_pixel_x = 0
	pixel_x = 0
	force = 4
	max_syringes = 2
	trigger_guard = TRIGGER_GUARD_ALLOW_ALL

/obj/item/gun/syringe/pblowgun/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	user.adjustStaminaLoss(10, updating_stamina = FALSE)
	user.adjustOxyLoss(10)
	return ..()
