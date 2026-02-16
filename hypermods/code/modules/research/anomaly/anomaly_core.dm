/obj/item/assembly/signaler/anomaly/ice
	name = "\improper cyrogenic anomaly core"
	desc = "The neutralized core of a cyrogenic anomaly. It feels cold to the touch. It'd probably be valuable for research."
	icon = 'hypermods/icons/obj/devices/new_assemblies.dmi'
	icon_state = "ice_core"
	anomaly_type = /obj/effect/anomaly/ice
	activation_cooldown = 10 SECONDS
	/// Area around wearer that is frozen.
	var/freezing_range = 1
	/// How long frozen tiles remain frozen?
	var/freeze_duration = 4 SECONDS

/obj/item/assembly/signaler/anomaly/ice/signal()
	for(var/any_turf in circle_range_turfs(center = get_turf(src), radius = freezing_range))
		if(!isopenturf(any_turf))
			continue
		var/turf/open/open_turf = any_turf
		open_turf.MakeSlippery(TURF_WET_PERMAFROST, freeze_duration, freeze_duration, freeze_duration)

/obj/item/assembly/signaler/anomaly/liquid
	name = "\improper liquid anomaly core"
	desc = "The neutralized core of a liquid anomaly. The faint sound of bubbling can be heard within it. It'd probably be valuable for research."
	icon = 'hypermods/icons/obj/devices/new_assemblies.dmi'
	icon_state = "liquid_core"
	anomaly_type = /obj/effect/anomaly/liquid
	activation_cooldown = 30 SECONDS

/obj/item/assembly/signaler/anomaly/liquid/Initialize(mapload)
	. = ..()
	reagents = new(30)

/obj/item/assembly/signaler/anomaly/liquid/signal(mob/living/carbon/human/owner)
	var/turf/open/tile = get_turf(src)
	if(!tile)
		return

	src.reagents.add_reagent(/datum/reagent/water, 30)

	tile.add_liquid_from_reagents(src.reagents)
	playsound(tile, 'sound/effects/splat.ogg', 50, 1)

/obj/item/assembly/signaler/anomaly/flesh
	name = "\improper flesh anomaly core"
	desc = "The neutralized core of a flesh anomaly. You can hear something gurgle when you shake it. It'd probably be valuable for research."
	icon = 'hypermods/icons/obj/devices/new_assemblies.dmi'
	icon_state = "flesh_core"
	anomaly_type = /obj/effect/anomaly/flesh
	activation_cooldown = 60 SECONDS
	var/meat_chance = 50

/obj/item/assembly/signaler/anomaly/flesh/Initialize(mapload)
	. = ..()
	reagents = new(10)

/obj/item/assembly/signaler/anomaly/flesh/signal(mob/living/carbon/human/owner)
	var/turf/open/tile = get_turf(src)
	if(!tile)
		return

	src.reagents.add_reagent(/datum/reagent/blood, 10)

	if(prob(meat_chance))
		new /obj/item/food/meat/slab(tile)

	tile.add_liquid_from_reagents(src.reagents)
	playsound(tile, 'sound/effects/splat.ogg', 50, 1)
