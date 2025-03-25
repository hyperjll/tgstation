/obj/item/storage/box/monkeycubes/syndicate
	desc = "Waffle Co. brand monkey cubes. Just add water and a dash of subterfuge!"
	cube_type = /obj/item/food/monkeycube/syndicate

/obj/item/storage/box/monkeycubes/syndicate/mice
	cube_type = /obj/item/food/monkeycube/mice

/obj/item/storage/box/monkeycubes/syndicate/mice/PopulateContents()
	for(var/i in 1 to 24)
		new cube_type(src)

/obj/item/storage/box/monkeycubes/syndicate/syndis
	cube_type = /obj/item/food/monkeycube/syndi
