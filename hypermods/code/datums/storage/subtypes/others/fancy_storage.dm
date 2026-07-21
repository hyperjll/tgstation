/// Jars of Gumballs
/datum/storage/gumballs_jar
	max_slots = 14
	max_total_storage = WEIGHT_CLASS_SMALL * 14
	screen_max_columns = 3

/datum/storage/gumballs_jar/New(atom/parent, max_slots, max_specific_storage, max_total_storage, rustle_sound, remove_rustle_sound)
	. = ..()
	set_holdable(/obj/item/food/gumball)
