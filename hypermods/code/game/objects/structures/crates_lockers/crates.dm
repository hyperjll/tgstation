/obj/structure/closet/crate/trashcart/gibber
	var/goingtogib = FALSE
	var/timetogib = 1 MINUTES

/obj/structure/closet/crate/trashcart/gibber/open(mob/living/user)
	. = ..()
	goingtogib = FALSE

/obj/structure/closet/crate/trashcart/gibber/close(mob/living/user)
	. = ..()
	goingtogib = TRUE
	addtimer(CALLBACK(src, PROC_REF(gibhumans)), timetogib)

/obj/structure/closet/crate/trashcart/gibber/proc/gibhumans(mob/living/user)
	if(goingtogib) // Just checking if this is open or not.
		for(var/mob/living/carbon/human/HUMAN in contents)
			playsound(loc, 'sound/machines/hiss.ogg', 20, TRUE)
			HUMAN.gib(DROP_ALL_REMAINS)
