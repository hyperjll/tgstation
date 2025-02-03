/obj/item/seeds/magicmush
	name = "magic mushroom mycelium pack"
	desc = "This mycelium grows into mushrooms well-known for causing temporary growth in those who eat them."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "mycelium-magicmush"
	species = "magicmush"
	plantname = "Magic Mushrooms"
	product = /obj/item/food/grown/mushroom/magicmush
	lifespan = 20
	endurance = 20
	maturation = 15
	production = 10
	yield = 1
	instability = 50
	growthstages = 3
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_mushrooms.dmi'
	icon_grow = "magicmush-grow"
	icon_dead = "magicmush-dead"
	icon_harvest = "magicmush-harvest"
	mutatelist = list()
	reagents_add = list(/datum/reagent/consumable/nutriment = 0.1, /datum/reagent/growthserum = 0.2)
	graft_gene = /datum/plant_gene/trait/plant_type/fungal_metabolism

/obj/item/food/grown/mushroom/magicmush
	seed = /obj/item/seeds/magicmush
	name = "magic mushroom"
	desc = "A so called 'magic' mushroom. Though, it's only magical in it's name."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "magic_mush"


/obj/item/seeds/amanita/purple
	name = "purple amanita mycelium pack"
	desc = "This mycelium grows into a wonderful medicinal plant."
	icon = 'hypermods/icons/obj/service/hydroponics/seeds.dmi'
	icon_state = "mycelium-purple_amanita"
	species = "purpleamanita"
	plantname = "Purple Amanitas"
	product = /obj/item/food/grown/mushroom/amanita/purple
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	growing_icon = 'hypermods/icons/obj/service/hydroponics/growing_mushrooms.dmi'
	icon_grow = "purpleamanita-grow"
	icon_dead = "purpleamanita-dead"
	icon_harvest = "purpleamanita-harvest"
	mutatelist = list()
	reagents_add = list(/datum/reagent/medicine/omnizine = 0.05, /datum/reagent/medicine/tricordrazine = 0.05, /datum/reagent/consumable/nutriment = 0)
	graft_gene = /datum/plant_gene/trait/plant_type/fungal_metabolism

/obj/item/food/grown/mushroom/amanita/purple
	seed = /obj/item/seeds/amanita/purple
	name = "purple amanita"
	desc = "<I>Amanita Lavendula</I>: What was originally concieved as a varient of 'fly amanita' had somehow developed into a medicinal plant long ago, nobody knows why."
	icon = 'hypermods/icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "purple_amanita"
