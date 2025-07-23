/obj/item/reagent_containers/proc/on_reagents_del(datum/reagents/reagents)
	SIGNAL_HANDLER
	UnregisterSignal(reagents, list(COMSIG_REAGENTS_DEL_REAGENT, COMSIG_REAGENTS_HOLDER_UPDATED))
	return NONE

/obj/item/reagent_containers/proc/attack_on_liquids_turf(obj/item/reagent_containers/my_beaker, turf/T, mob/living/user, obj/effect/abstract/liquid_turf/liquids)
	var/obj/effect/abstract/liquid_turf/liquids_to_modify = T.liquids
	if(!user.Adjacent(T))
		return FALSE
	if(!my_beaker.spillable)
		return FALSE
	if(!user.Adjacent(T))
		return FALSE
	if(user.combat_mode)
		return FALSE
	if(!liquids_to_modify || isnull(liquids_to_modify))
		return FALSE
	if(liquids_to_modify.fire_state) //Use an extinguisher first
		to_chat(user, "<span class='warning'>You can't scoop up anything while it's on fire!</span>")
		return TRUE
	if(liquids_to_modify.liquid_group.expected_turf_height == 1)
		to_chat(user, "<span class='warning'>The puddle is too shallow to scoop anything up!</span>")
		return TRUE
	var/free_space = my_beaker.reagents.maximum_volume - my_beaker.reagents.total_volume
	if(free_space <= 0)
		to_chat(user, "<span class='warning'>You can't fit any more liquids inside [my_beaker]!</span>")
		return TRUE
	var/desired_transfer = my_beaker.amount_per_transfer_from_this
	if(desired_transfer > free_space)
		desired_transfer = free_space
	if(desired_transfer > liquids_to_modify.liquid_group.reagents_per_turf)
		desired_transfer = liquids_to_modify.liquid_group.reagents_per_turf
	liquids_to_modify.liquid_group.trans_to_seperate_group(my_beaker.reagents, desired_transfer, liquids_to_modify)
	to_chat(user, "<span class='notice'>You scoop up around [round(desired_transfer)] units of liquids with [my_beaker].</span>")
	user.changeNext_move(CLICK_CD_MELEE)
	return TRUE
