/obj/structure/transit_tube/curved/crossing
	icon = 'hypermods/icons/obj/pipes_n_cables/transit_tube.dmi'
	icon_state = "curved_crossing0"
	tube_construction = /obj/structure/c_transit_tube/curved/crossing
	density = FALSE

/obj/structure/transit_tube/curved/crossing/init_tube_dirs()
	switch(dir)
		if(NORTH)
			tube_dirs = list(NORTH, SOUTHWEST)
		if(SOUTH)
			tube_dirs = list(SOUTH, NORTHEAST)
		if(EAST)
			tube_dirs = list(EAST, NORTHWEST)
		if(WEST)
			tube_dirs = list(SOUTHEAST, WEST)

/obj/structure/transit_tube/curved/crossing/flipped
	icon = 'hypermods/icons/obj/pipes_n_cables/transit_tube.dmi'
	icon_state = "curved_crossing1"
	tube_construction = /obj/structure/c_transit_tube/curved/crossing/flipped
	density = FALSE

/obj/structure/transit_tube/curved/crossing/flipped/init_tube_dirs()
	switch(dir)
		if(NORTH)
			tube_dirs = list(NORTH, SOUTHEAST)
		if(SOUTH)
			tube_dirs = list(SOUTH, NORTHWEST)
		if(EAST)
			tube_dirs = list(EAST, SOUTHWEST)
		if(WEST)
			tube_dirs = list(NORTHEAST, WEST)

/obj/structure/transit_tube/junction/crossing
	icon = 'hypermods/icons/obj/pipes_n_cables/transit_tube.dmi'
	icon_state = "junction_crossing0"
	tube_construction = /obj/structure/c_transit_tube/junction/crossing
	density = FALSE

/obj/structure/transit_tube/junction/crossing/init_tube_dirs()
	switch(dir)
		if(NORTH)
			tube_dirs = list(NORTH, SOUTHEAST, SOUTHWEST)
		if(SOUTH)
			tube_dirs = list(SOUTH, NORTHWEST, NORTHEAST)
		if(EAST)
			tube_dirs = list(EAST, SOUTHWEST, NORTHWEST)
		if(WEST)
			tube_dirs = list(WEST, NORTHEAST, SOUTHEAST)

/obj/structure/transit_tube/junction/crossing/flipped
	icon = 'hypermods/icons/obj/pipes_n_cables/transit_tube.dmi'
	icon_state = "junction_crossing1"
	tube_construction = /obj/structure/c_transit_tube/junction/crossing/flipped
	density = FALSE

/obj/structure/transit_tube/junction/crossing/flipped/init_tube_dirs()
	switch(dir)
		if(NORTH)
			tube_dirs = list(NORTH, SOUTHWEST, SOUTHEAST)
		if(SOUTH)
			tube_dirs = list(SOUTH, NORTHEAST, NORTHWEST)
		if(EAST)
			tube_dirs = list(EAST, NORTHWEST, SOUTHWEST)
		if(WEST)
			tube_dirs = list(WEST, SOUTHEAST, NORTHEAST)
