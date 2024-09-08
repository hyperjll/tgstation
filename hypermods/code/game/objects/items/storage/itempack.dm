/obj/item/storage/box/itempack
	name = "item pack"
	desc = "A small paper-wrapped box containing a... thing."
	icon = 'hypermods/icons/obj/storage/itempack.dmi'
	icon_state = "null"

/obj/item/storage/box/itempack/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 1

/obj/item/storage/box/itempack/edagger
	name = "energy dagger box"
	desc = "A small paper-wrapped box containing a energy dagger."
	icon_state = "e_dagger"

/obj/item/storage/box/itempack/edagger/PopulateContents()
	new /obj/item/pen/edagger(src)

/obj/item/storage/box/itempack/bombpen
	name = "exploding pen box"
	desc = "A small paper-wrapped box containing a explosive pen."
	icon_state = "exploding_pen"

/obj/item/storage/box/itempack/bombpen/PopulateContents()
	new /obj/item/pen/explosive(src)

/obj/item/storage/box/itempack/hypopen
	name = "hypopen box"
	desc = "A small paper-wrapped box containing a hypo pen."
	icon_state = "hypopen"

/obj/item/storage/box/itempack/hypopen/PopulateContents()
	new /obj/item/pen/hypo(src)

/obj/item/storage/box/itempack/sleeppen
	name = "sleepy pen box"
	desc = "A small paper-wrapped box containing a sleepy pen."
	icon_state = "sleeppen"

/obj/item/storage/box/itempack/sleeppen/PopulateContents()
	new /obj/item/pen/sleepy(src)
