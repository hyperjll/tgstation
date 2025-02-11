/obj/item/clothing/shoes/magboots/syndie/advanced
	name = "advanced blood-red magboots"
	desc = "Reverse-engineered magnetic boots that have a heavy rotating magnetic pull. Property of Gorlex Marauders and Cybersun Industries."
	icon = 'hypermods/icons/obj/clothing/shoes.dmi'
	icon_state = "syndiemag0"
	base_icon_state = "syndiemag"
	worn_icon = 'hypermods/icons/mob/clothing/feet.dmi'
	worn_icon_state = "syndiemag0"
	slowdown_active = SHOES_SLOWDOWN // ZERO active slowdown
	var/gravmode = 0
	var/gravmodetext = "disabled" // This feels like cheating.

/obj/item/clothing/shoes/magboots/syndie/advanced/attack_self(mob/user)
	if(gravmode == 2) // Just flipping through modes.
		gravmode = 0
	else
		gravmode += 1

	if(gravmode == 0)
		detach_clothing_traits(active_traits)
		slowdown = max(initial(slowdown), slowdown - slowdown_active)
		user.RemoveElement(/datum/element/forced_gravity, 0) // Likely switching here from inverted
		balloon_alert(user, "Magnetics disabled")
		gravmodetext = "disabled"
	else if(gravmode == 1)
		attach_clothing_traits(active_traits)
		slowdown += slowdown_active
		balloon_alert(user, "Magnetics activated")
		gravmodetext = "enabled"
	else
		detach_clothing_traits(active_traits)
		slowdown = max(initial(slowdown), slowdown - slowdown_active)
		user.AddElement(/datum/element/forced_gravity, 0) // Likely switched off by the time you get to it.
		balloon_alert(user, "Magnetics inverted")
		gravmodetext = "inverted"

	update_appearance()
	//we want to update our speed so we arent running at max speed in regular magboots
	user.update_equipment_speed_mods()

/obj/item/clothing/shoes/magboots/syndie/advanced/examine(mob/user)
	. = ..()
	. += "Its mag-pulse systems appears to be [gravmodetext]."

/obj/item/clothing/shoes/magboots/syndie/advanced/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state][gravmode]"


/obj/item/clothing/shoes/magboots/crushing
	desc = "Normal looking magboots that are altered to increase magnetic pull to crush anything underfoot."

/obj/item/clothing/shoes/magboots/crushing/proc/crush(mob/living/user)
	SIGNAL_HANDLER

	if (!isturf(user.loc) || !magpulse)
		return
	var/turf/T = user.loc
	for (var/mob/living/A in T)
		if (A != user && A.lying_angle)
			A.adjustBruteLoss(rand(10,13))
			A.Knockdown(1 SECONDS) // The thing that makes these magboots powerful af
			to_chat(A,"<span class='userdanger'>[user]'s magboots press down on you, crushing you!</span>")
			INVOKE_ASYNC(A, /mob.proc/emote, "scream")

/obj/item/clothing/shoes/magboots/crushing/attack_self(mob/user)
	. = ..()
	if (magpulse)
		RegisterSignal(user, COMSIG_MOVABLE_MOVED,.proc/crush)
	else
		UnregisterSignal(user,COMSIG_MOVABLE_MOVED)

/obj/item/clothing/shoes/magboots/crushing/equipped(mob/user,slot)
	. = ..()
	if (slot == ITEM_SLOT_FEET && magpulse)
		RegisterSignal(user, COMSIG_MOVABLE_MOVED,.proc/crush)

/obj/item/clothing/shoes/magboots/crushing/dropped(mob/user)
	..()
	UnregisterSignal(user,COMSIG_MOVABLE_MOVED)
