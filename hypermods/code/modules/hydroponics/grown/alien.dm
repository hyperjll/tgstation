/obj/item/seeds/maneater
	name = "man eater seed pack"
	desc = "These seeds grow into man eaters."
	icon = 'hypermods/icons/obj/service/hydroponics/goon/seeds.dmi'
	icon_state = "seed-maneater"
	species = "maneater"
	plantname = "Man Eater"
	growing_icon = 'hypermods/icons/obj/service/hydroponics/goon/growing_alien.dmi'
	icon_harvest = "Maneater-harvest"
	icon_grow = "Maneater-G"
	icon_dead = "Maneater-dead"
	genes = list(/datum/plant_gene/trait/mob_transformation/man_eater)
	product = /obj/item/food/grown/maneater
	maturation = 30
	production = 20
	growthstages = 3
	mutatelist = list()
	reagents_add = null
	rarity = 60 // actual syndicate shit
	/// Used to offset the plant sprite so that it appears at proper height in the tray
	plant_icon_offset = 0 // Was 8 but goon sprites are shifted upwards
	/// Spawned mob's health = this multiplier * seed endurance.
	var/mob_health_multiplier = 1.5
	/// Spawned mob's melee damage = this multiplier * seed potency.
	var/mob_melee_multiplier = 1.5
	/// Spawned mob's move delay = this multiplier * seed potency.
	var/mob_speed_multiplier = 1.5
	/// The typepath to what mob spawns from this plant.
	var/man_eater

/obj/item/food/grown/maneater
	seed = /obj/item/seeds/maneater
	name = "dormant man eater"
	desc = "It's just a little guy..."
	icon = 'hypermods/icons/obj/service/hydroponics/goon/items_hydroponics.dmi'
	icon_state = "Maneater"
	filling_color = "#ea1c8e"
	distill_reagent = null
	bite_consumption_mod = 1
	wine_power = 5

/**
/obj/item/seeds/
	name = " seed pack"
	desc = ""
	icon = 'hypermods/icons/obj/service/hydroponics/goon/seeds.dmi'
	icon_state = "seed-"
	species = ""
	plantname = ""
	growing_icon = 'hypermods/icons/obj/service/hydroponics/goon/.dmi'
	icon_harvest = "-harvest"
	icon_grow = "-G"
	icon_dead = "-dead"
	//genes = null
	product = /obj/item/food/grown/
	maturation =
	production =
	growthstages =
	mutatelist = list()
	reagents_add = list(/datum/reagent/ = 0)
	rarity =
	/// Used to offset the plant sprite so that it appears at proper height in the tray
	plant_icon_offset = 0 // Was 8 but goon sprites are shifted upwards

/obj/item/food/grown/
	seed = /obj/item/seeds/
	name = ""
	desc = ""
	icon = 'hypermods/icons/obj/service/hydroponics/goon/items_hydroponics.dmi'
	icon_state = ""
	filling_color = "#"
	distill_reagent = null
	bite_consumption_mod = 1
	wine_power =
**/
