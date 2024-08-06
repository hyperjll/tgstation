/obj/structure/flora/tree/random

/obj/structure/flora/tree/random/Initialize(mapload)
	var/random_tree = pick(subtypesof(/obj/structure/flora/tree) - (/obj/structure/flora/tree/random && /obj/structure/flora/tree/pine/xmas/presents/unlimited))
	new random_tree(loc)
	qdel(src)
