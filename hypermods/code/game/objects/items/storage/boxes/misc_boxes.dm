/obj/item/storage/box/lights/mixed/radiation/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/light/tube/radiation(src)
	for(var/i in 1 to 6)
		new /obj/item/light/bulb/radiation(src)

/obj/item/storage/box/randomjunk
	name = "Random Junk Package"

/obj/item/storage/box/randomjunk/PopulateContents()
	new /obj/effect/spawner/random/maintenance/eight(src)

/obj/item/storage/box/randomextractfull
	name = "extract box"
	icon = 'hypermods/icons/obj/storage/storage.dmi'
	icon_state = "box"
	illustration = "extract"
	desc = "The label on this box was damaged."

/obj/item/storage/box/randomextractfull/PopulateContents()
	new /obj/item/slime_extract/grey(src)
	new /obj/item/slime_extract/gold(src)
	new /obj/item/slime_extract/silver(src)
	new /obj/item/slime_extract/metal(src)
	new /obj/item/slime_extract/purple(src)
	new /obj/item/slime_extract/darkpurple(src)
	new /obj/item/slime_extract/orange(src)
	new /obj/item/slime_extract/yellow(src)
	new /obj/item/slime_extract/red(src)
	new /obj/item/slime_extract/blue(src)
	new /obj/item/slime_extract/darkblue(src)
	new /obj/item/slime_extract/pink(src)
	new /obj/item/slime_extract/green(src)
	new /obj/item/slime_extract/lightpink(src)
	new /obj/item/slime_extract/black(src)
	new /obj/item/slime_extract/oil(src)
	new /obj/item/slime_extract/adamantine(src)
	new /obj/item/slime_extract/bluespace(src)
	new /obj/item/slime_extract/pyrite(src)
	new /obj/item/slime_extract/cerulean(src)
	new /obj/item/slime_extract/sepia(src)
	new /obj/item/slime_extract/rainbow(src)

/obj/item/storage/box/randomextract
	name = "extract box"
	icon = 'hypermods/icons/obj/storage/storage.dmi'
	icon_state = "box"
	illustration = "extract"
	desc = "The label on this box was damaged."

/obj/item/storage/box/randomextract/PopulateContents()
	var/list/types = subtypesof(/obj/item/slime_extract/)
	for(var/i in 1 to 3)
		var/type = pick(types)
		new type(src)

/obj/item/storage/box/randomextractcross
	name = "slimecross box"
	icon = 'hypermods/icons/obj/storage/storage.dmi'
	icon_state = "box"
	illustration = "extract"
	desc = "The label on this box was greatly damaged."

/obj/item/storage/box/randomextractcross/PopulateContents()
	var/list/types = subtypesof(/obj/item/slimecross/)
	for(var/i in 1 to 1)
		var/type = pick(types)
		new type(src)
