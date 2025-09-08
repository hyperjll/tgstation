/**
 * Adjusts seed production seed up or down according to adjustamt. (Max 10)
 */
/obj/item/seeds/proc/adjust_maturation(adjustamt)
	if(yield == -1)
		return
	maturation = clamp(maturation + adjustamt, 1, MAX_PLANT_MATURATION)
