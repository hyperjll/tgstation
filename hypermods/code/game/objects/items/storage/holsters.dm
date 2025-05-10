/obj/item/storage/belt/holster/nukie/clover
	desc = "A deep shoulder holster capable of holding almost any form of small firearm and its ammo. This one's specialized for handguns."
	storage_type = /datum/storage/holster/nukie/cowboy

/obj/item/storage/belt/holster/nukie/clover/full/PopulateContents()
	generate_items_inside(list(
		/obj/item/ammo_box/a357 = 2,
		/obj/item/gun/ballistic/revolver/syndicate/cowboy/wild = 1,
	), src)
