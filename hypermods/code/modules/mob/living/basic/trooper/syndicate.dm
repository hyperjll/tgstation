/mob/living/basic/trooper/syndicate/ranged/smg/space/tiny
	mob_size = MOB_SIZE_TINY
	held_w_class = WEIGHT_CLASS_TINY
	maxHealth = 70
	health = 70

/mob/living/basic/trooper/syndicate/ranged/smg/space/tiny/Initialize(mapload)
	. = ..()
	var/newsize = 0.3
	src.update_transform(newsize/current_size)
	//current_size = 0.3 // tiny mf

/mob/living/basic/trooper/syndicate/ranged/smg/space/tiny/death()
	explosion(src, 0, 1, 2, flame_range = 2)
	qdel(src)
