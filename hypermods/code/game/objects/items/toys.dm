/obj/item/toy/balloon/explosive/Destroy()
	playsound(src, 'sound/effects/cartoon_sfx/cartoon_pop.ogg', 50, vary = TRUE)
	explosion(src, 0, 0, 2, 0)
	. = ..()