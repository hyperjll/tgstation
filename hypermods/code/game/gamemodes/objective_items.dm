/datum/objective_item/steal/ianmeat
	name = "a slab of prime-cut corgi meat."
	targetitem = /obj/item/food/meat/slab/corgi/ian
	excludefromjob = list(JOB_HEAD_OF_PERSONNEL)
	item_owner = list(JOB_HEAD_OF_PERSONNEL)
	exists_on_map = TRUE
	difficulty = 3
	steal_hint = "A single slab of meat primarily sourced by the HoP's personal corgi, Ian. \
		Often found within the HoP's office, but very rarely can be found wandering around the station. \
		Ian provides multiple slabs of meat when butchered."

/obj/item/food/meat/slab/corgi/ian/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/food/meat/slab/corgi/ian)
