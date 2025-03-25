/obj/item/storage/box/emergencypizza
	name = "emergency pizza delivery"

/obj/item/storage/box/emergencypizza/PopulateContents()
	var/list/item_list = list(
		/obj/item/pizzabox/margherita,
		/obj/item/pizzabox/mushroom,
		/obj/item/pizzabox/meat,
		/obj/item/pizzabox/vegetable,
		/obj/item/pizzabox/pineapple
	)

	for(var/i in 1 to 3)
		var/item = pick(item_list)
		new item(src)

/obj/item/storage/box/archerypackage
	name = "archery package"

/obj/item/storage/box/archerypackage/PopulateContents()
	new /obj/item/gun/ballistic/bow(src)
	new /obj/item/storage/bag/quiver(src)
