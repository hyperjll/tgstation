// All the code below makes it so you can shock someone if they're pulling you whilst you're cuffed
/datum/action/cooldown/spell/touch/shock/IsAvailable(feedback = FALSE)
	if(!owner || owner.stat != CONSCIOUS || !owner.pulledby || (next_use_time > world.time))
		return ..()

	var/mob/living/carbon/human = owner
	if(istype(human) && !isnull(human.handcuffed))
		return TRUE

	return ..()

/datum/action/cooldown/spell/touch/shock/cast(mob/living/carbon/cast_on)
	if(isnull(cast_on.handcuffed) || !cast_on.pulledby)
		return ..()

	do_hand_hit(null, cast_on.pulledby, cast_on)
	return TRUE
