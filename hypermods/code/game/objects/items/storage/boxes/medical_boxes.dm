/obj/item/storage/box/syringes/sedative
	name = "box of sedative syringes"
	desc = "A box full of syringes filled with sedatives."
	illustration = "syringe"

/obj/item/storage/box/syringes/sedative/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/syringe/sedative(src)

/obj/item/storage/box/syringes/sedative/piercing
	name = "box of sedative piercing syringes"
	desc = "A box full of piercing syringes filled with sedatives."

/obj/item/storage/box/syringes/sedative/piercing/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/syringe/piercing/sedative(src)
