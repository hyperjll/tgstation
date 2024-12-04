/obj/item/storage/cans/sixmystery
	name = "soda bottle ring"
	desc = "Holds six soda cans. Remember to recycle when you're done!"

/obj/item/storage/cans/sixmystery/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/cup/soda_cans/mystery(src)
