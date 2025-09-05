/obj/effect/mapping_helpers/atom_injector/bloody_my_shit_up
	name = "Blood Injector"
	target_type = /obj/item
	// mappers can customize what blood is on it
	var/list/blood_dna

/obj/effect/mapping_helpers/atom_injector/bloody_my_shit_up/inject(atom/target)
	if(!blood_dna)
		blood_dna = list("Unknown DNA" = BLOOD_TYPE_O_MINUS)
	target.add_blood_DNA(blood_dna)


/obj/effect/mapping_helpers/do_not_path_hint
	name = "do not path hint"
	layer = ABOVE_NORMAL_TURF_LAYER
	late = TRUE

/obj/effect/mapping_helpers/do_not_path_hint/LateInitialize()
	var/turf/turf_found = get_turf(src)
	turf_found.jps_heuristic_cost = 65000
	qdel(src)
