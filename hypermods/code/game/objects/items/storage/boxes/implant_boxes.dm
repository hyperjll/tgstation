/obj/item/storage/box/deathrattle
	name = "boxed deathrattle implant kit"
	desc = "For realizing that your coworkers are dead instead of actively ignoring comms. Requires manual setup."
	illustration = "implant"

/obj/item/storage/box/deathrattle/PopulateContents()
	var/static/items_inside = list(
		/obj/item/implantcase/deathrattle = 5,
		/obj/item/implanter = 1,
		/obj/item/implantpad = 1,
	)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/biosignaller
	name = "boxed biosignaller implant kit"
	desc = "For realizing that your coworkers are dead instead of actively ignoring comms, requires telecommunications to be online. No setup required."
	illustration = "implant"

/obj/item/storage/box/biosignaller/PopulateContents()
	var/static/items_inside = list(
		/obj/item/implantcase/biosig = 5,
		/obj/item/implanter = 1,
		/obj/item/implantpad = 1,
	)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/biosignaller/security
	name = "boxed security biosignaller implant kit"
	desc = "For realizing that your coworkers are dead instead of actively ignoring comms, requires telecommunications to be online. No setup required. \
			Reports deaths over security communications"

/obj/item/storage/box/biosignaller/security/PopulateContents()
	var/static/items_inside = list(
		/obj/item/implantcase/biosig/security = 5,
		/obj/item/implanter = 1,
		/obj/item/implantpad = 1,
	)
	generate_items_inside(items_inside,src)
