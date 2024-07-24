/obj/item/storage/box/syringes/sedative
	name = "box of sedative syringes"
	desc = "A box full of syringes filled with syringes."
	illustration = "syringe"

/obj/item/storage/box/syringes/sedative/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/syringe/sedative(src)
