/obj/item/clothing/shoes/boomboots
	name = "boomboots"
	desc = "They call me Cuban Pete."
	icon_state = "jackboots"
	inhand_icon_state = "jackboots"
	/// Each step, this is the chance we fire a shot
	var/boom_prob = 5

/obj/item/clothing/shoes/boomboots/Initialize(mapload)
	. = ..()

	create_storage(storage_type = /datum/storage/pockets/shoes)

	RegisterSignal(src, COMSIG_SHOES_STEP_ACTION, PROC_REF(check_step))
/**
/obj/item/clothing/shoes/boomboots/equipped(mob/user, slot)
	. = ..()
	if(slot & ITEM_SLOT_FEET)
		RegisterSignal(user, COMSIG_LIVING_UNARMED_ATTACK, PROC_REF(check_kick))
	else
		UnregisterSignal(user, COMSIG_LIVING_UNARMED_ATTACK)
**/
/obj/item/clothing/shoes/boomboots/dropped(mob/user)
	if(user)
		UnregisterSignal(user, COMSIG_LIVING_UNARMED_ATTACK)
	return ..()

/// After each step, check if we randomly fire a shot
/obj/item/clothing/shoes/boomboots/proc/check_step(mob/user)
	SIGNAL_HANDLER
	if(!prob(boom_prob))
		return

	INVOKE_ASYNC(src, PROC_REF(fire_shot))

/// Actually fire a shot. If no target is provided, just fire off in a random direction
/obj/item/clothing/shoes/boomboots/proc/fire_shot(atom/target)
	if(!isliving(loc))
		return

	var/mob/living/wearer = loc
	for(var/obj/machinery/randomachine in urange(12, wearer, 1))
		explosion(randomachine.loc,0,0,1,flame_range = 1)
		return
