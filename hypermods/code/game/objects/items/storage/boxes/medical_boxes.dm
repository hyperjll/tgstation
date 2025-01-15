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


/obj/item/storage/box/nadecasings
	name = "grenade casing box"
	icon = 'hypermods/icons/obj/storage/box.dmi'
	icon_state = "nadecasing"
	desc = "A box designed to fit a large quantity of grenade casings."

/obj/item/storage/box/nadecasings/PopulateContents()
	new /obj/item/storage/box/nadecasings/large(src)
	new /obj/item/storage/box/nadecasings/pyro(src)
	new /obj/item/storage/box/nadecasings/cryo(src)
	new /obj/item/storage/box/nadecasings/adv(src)
	for(var/i in 1 to 3)
		new /obj/item/grenade/chem_grenade(src)

/obj/item/storage/box/nadecasings/large
	name = "large grenade casing box"
	icon_state = "nadecasing"

/obj/item/storage/box/nadecasings/large/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/grenade/chem_grenade/large(src)

/obj/item/storage/box/nadecasings/pyro
	name = "pyro grenade casing box"
	icon_state = "pyrocasing"

/obj/item/storage/box/nadecasings/pyro/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/grenade/chem_grenade/pyro(src)

/obj/item/storage/box/nadecasings/cryo
	name = "cryo grenade casing box"
	icon_state = "cryocasing"

/obj/item/storage/box/nadecasings/cryo/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/grenade/chem_grenade/cryo(src)

/obj/item/storage/box/nadecasings/adv
	name = "advanced grenade casing box"
	icon_state = "advcasing"

/obj/item/storage/box/nadecasings/adv/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/grenade/chem_grenade/adv_release(src)
