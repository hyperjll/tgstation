/obj/item/grown/log/glass
	seed = /obj/item/seeds/tower/glass
	name = "glass-cap log"
	desc = "It's made of glass."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "glasslogs"
	plank_type = /obj/item/stack/sheet/glass
	plank_name = "glass"

/obj/item/grown/log/glass/CheckAccepted(obj/item/I)
	return FALSE

/obj/item/grown/log/plasteel
	seed = /obj/item/seeds/tower/plasteel
	name = "plasteel-cap log"
	desc = "It's made of plasteel."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "plasteellogs"
	plank_type = /obj/item/stack/sheet/plasteel
	plank_name = "plasteel"

/obj/item/grown/log/plasteel/CheckAccepted(obj/item/I)
	return FALSE

/obj/item/grown/log/silver
	seed = /obj/item/seeds/tower/silver
	name = "silver-cap log"
	desc = "It's made of silver."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "silverlogs"
	plank_type = /obj/item/stack/sheet/mineral/silver
	plank_name = "silver"

/obj/item/grown/log/silver/CheckAccepted(obj/item/I)
	return FALSE

/obj/item/grown/log/diamond
	seed = /obj/item/seeds/tower/diamond
	name = "diamond-cap log"
	desc = "It's made of diamond."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "diamondlogs"
	plank_type = /obj/item/stack/sheet/mineral/diamond
	plank_name = "diamond"

/obj/item/grown/log/diamond/CheckAccepted(obj/item/I)
	return FALSE

/obj/item/grown/log/uranium
	seed = /obj/item/seeds/tower/uranium
	name = "uranium-cap log"
	desc = "It's made of uranium."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "uraniumlogs"
	plank_type = /obj/item/stack/sheet/mineral/uranium
	plank_name = "uranium"

/obj/item/grown/log/uranium/CheckAccepted(obj/item/I)
	return FALSE

/obj/item/grown/log/titanium
	seed = /obj/item/seeds/tower/titanium
	name = "titanium-cap log"
	desc = "It's made of titanium."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "titaniumlogs"
	plank_type = /obj/item/stack/sheet/mineral/titanium
	plank_name = "titanium"

/obj/item/grown/log/titanium/CheckAccepted(obj/item/I)
	return FALSE

/obj/item/grown/log/gold
	seed = /obj/item/seeds/tower/gold
	name = "gold-cap log"
	desc = "It's made of gold."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "goldlogs"
	plank_type = /obj/item/stack/sheet/mineral/gold
	plank_name = "gold"

/obj/item/grown/log/gold/CheckAccepted(obj/item/I)
	return FALSE

/obj/item/grown/log/bluespace
	seed = /obj/item/seeds/tower/bluespace
	name = "bluespace-cap log"
	desc = "It's made of bluespace crystals."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "bluespacelogs"
	plank_type = /obj/item/stack/sheet/bluespace_crystal
	plank_name = "bluespace crystal"

/obj/item/grown/log/bluespace/CheckAccepted(obj/item/I)
	return FALSE

/// New shit below

/obj/item/seeds/tower/glass
	name = "glass-cap mycelium pack"
	desc = "This mycelium grows into glass logs."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "mycelium-glasscap"
	species = "glasscap"
	plantname = "Glass Caps"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_mushrooms.dmi'
	product = /obj/item/grown/log/glass
	mutatelist = list(/obj/item/seeds/tower/diamond, /obj/item/seeds/tower/uranium)
	reagents_add = list(/datum/reagent/silicon = 0.5, /datum/reagent/oxygen = 0.25)
	rarity = 20
//Mutates from Steel
/obj/item/seeds/tower/plasteel
	name = "plasteel-cap mycelium pack"
	desc = "This mycelium grows into plasteel logs."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "mycelium-plasteelcap"
	species = "plasteelcap"
	plantname = "Plasteel Caps"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_mushrooms.dmi'
	product = /obj/item/grown/log/plasteel
	mutatelist = list(/obj/item/seeds/tower/titanium)
	reagents_add = list(/datum/reagent/stable_plasma = 0.5)
	rarity = 40
//Mutates from Steel
/obj/item/seeds/tower/silver
	name = "silver-cap mycelium pack"
	desc = "This mycelium grows into silver logs."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "mycelium-silvercap"
	species = "silvercap"
	plantname = "Silver Caps"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_mushrooms.dmi'
	product = /obj/item/grown/log/silver
	mutatelist = list(/obj/item/seeds/tower/gold)
	reagents_add = list(/datum/reagent/silver = 0.5)
	rarity = 40
///Mutates from glass
/obj/item/seeds/tower/diamond
	name = "diamond-cap mycelium pack"
	desc = "This mycelium grows into diamond logs."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "mycelium-diamondcap"
	species = "diamondcap"
	plantname = "Diamond Caps"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_mushrooms.dmi'
	product = /obj/item/grown/log/diamond
	mutatelist = list(/obj/item/seeds/tower/bluespace)
	reagents_add = list(/datum/reagent/carbon = 1)
	rarity = 40

/obj/item/seeds/tower/uranium
	name = "uranium-cap mycelium pack"
	desc = "This mycelium grows into uranium logs."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "mycelium-uraniumcap"
	species = "uraniumcap"
	plantname = "Uranium Caps"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_mushrooms.dmi'
	product = /obj/item/grown/log/uranium
	mutatelist = null
	reagents_add = list(/datum/reagent/uranium = 0.5)
	rarity = 40
//Mutates from Plasteel
/obj/item/seeds/tower/titanium
	name = "titanium-cap mycelium pack"
	desc = "This mycelium grows into titanium logs."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "mycelium-titaniumcap"
	species = "titaniumcap"
	plantname = "Titanium Caps"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_mushrooms.dmi'
	product = /obj/item/grown/log/titanium
	mutatelist = list()
	reagents_add = list(/datum/reagent/iron = 2)
	rarity = 80
//Mutates from Silver
/obj/item/seeds/tower/gold
	name = "gold-cap mycelium pack"
	desc = "This mycelium grows into gold logs."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "mycelium-goldcap"
	species = "goldcap"
	plantname = "Gold Caps"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_mushrooms.dmi'
	product = /obj/item/grown/log/gold
	mutatelist = list()
	reagents_add = list(/datum/reagent/gold = 0.5)
	rarity = 80
//Mutates from Diamond
/obj/item/seeds/tower/bluespace
	name = "bluespace-cap mycelium pack"
	desc = "This mycelium grows into bluespace crystal logs."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "mycelium-bluespacecap"
	species = "bluespacecap"
	plantname = "Bluespace Crystal Caps"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_mushrooms.dmi'
	product = /obj/item/grown/log/bluespace
	mutatelist = list()
	reagents_add = list(/datum/reagent/bluespace = 0.5)
	rarity = 80
