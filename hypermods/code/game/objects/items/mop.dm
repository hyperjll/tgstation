/obj/item/mop/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/mop/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/mop/process(seconds_per_tick)
	for(var/datum/reagent/mop_reagents as anything in reagents.reagent_list)
		if(mop_reagents.type != /datum/reagent/water)
			reagents.remove_reagent(mop_reagents.type, 0.1 * seconds_per_tick)

/obj/item/mop/proc/attack_on_liquids_turf(obj/item/mop/the_mop, turf/target, mob/living/carbon/human/user, obj/effect/abstract/liquid_turf/liquids)
	if(!user.Adjacent(target))
		return FALSE
	var/free_space = max_reagent_volume - reagents.total_volume
	var/speed_mult = 1
	var/datum/liquid_group/targeted_group = target?.liquids?.liquid_group
	while(!isnull(targeted_group))
		if(speed_mult >= 0.2)
			speed_mult -= 0.05
		if(free_space <= 0)
			to_chat(user, "<span class='warning'>[src] can't absorb any more!")
			return TRUE
		if(!do_after(user, src.mopspeed * speed_mult, target = target))
			break
		if(the_mop.reagents.total_volume == the_mop.max_reagent_volume)
			to_chat(user, "<span class='warning'>[src] can't absorb any more!")
			break
		if(targeted_group?.reagents_per_turf)
			targeted_group?.trans_to_seperate_group(the_mop.reagents, min(targeted_group?.reagents_per_turf, 5))
			to_chat(user, "<span class='notice'>You soak up some liquids with \the [src].")
			var/sound_to_play = pick(list(
				'hypermods/sound/effects/water_wade1.ogg',
				'hypermods/sound/effects/water_wade2.ogg',
				'hypermods/sound/effects/water_wade3.ogg',
				'hypermods/sound/effects/water_wade4.ogg'
				))
			playsound(target, sound_to_play, 50, 0) // Immersive!
		else if(!isnull(target?.liquids?.liquid_group))
			targeted_group = target.liquids.liquid_group
		else
			break
	//user.changeNext_move(CLICK_CD_MELEE)
	return TRUE
