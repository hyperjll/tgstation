/obj/structure/fermenting_barrel/moonshine
	name = "moonshine barrel"
	desc = "A large wooden barrel for holding quality moonshine. It's time to party."
	can_open = FALSE

/obj/structure/fermenting_barrel/moonshine/Initialize(mapload)
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/moonshine, 500)
