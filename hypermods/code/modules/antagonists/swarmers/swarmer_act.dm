/**
 * Determines what happens to an atom when a swarmer interacts with it
 *
 * Determines behavior upon being interacted on by a swarmer.
 * Arguments:
 * * S - A reference to the swarmer doing the interaction
 */
#define DANGEROUS_DELTA_P 250 //Value in kPa where swarmers arent allowed to break a wall or window with this difference in pressure.

/atom/proc/swarmer_act(mob/living/basic/swarmer/actor)
	actor.dis_integrate(src)
	return TRUE //return TRUE/FALSE whether or not an AI swarmer should try this swarmer_act() again, NOT whether it succeeded.

/obj/swarmer_act(mob/living/basic/swarmer/actor)
	if(resistance_flags & INDESTRUCTIBLE)
		return FALSE
	for(var/mob/living/living_content in contents)
		if(issilicon(living_content) || isbrain(living_content))
			continue
		to_chat(actor, span_warning("An organism has been detected inside this object. Aborting."))
		return FALSE
	return ..()

/obj/item/swarmer_act(mob/living/basic/swarmer/actor)
	return actor.Integrate(src)

/**
 * Return used to determine how many resources a swarmer gains when consuming an object
 */
/obj/proc/integrate_amount()
	return 0

/obj/item/integrate_amount() //returns the amount of resources gained when eating this item
	var/list/mats = get_material_composition(ALL) // Ensures that items made from plasteel, and plas/titanium/plastitaniumglass get integrated correctly.
	if(length(mats) && (mats[GET_MATERIAL_REF(/datum/material/iron)] || mats[GET_MATERIAL_REF(/datum/material/glass)]))
		return 1
	return ..()

/obj/item/gun/swarmer_act()//Stops you from eating the entire armory
	return FALSE

/turf/open/swarmer_act()//ex_act() on turf calls it on its contents, this is to prevent attacking mobs by DisIntegrate()'ing the floor
	return FALSE

/obj/effect/swarmer_act()
	return FALSE

/obj/effect/decal/cleanable/robot_debris/swarmer_act(mob/living/basic/swarmer/actor)
	actor.dis_integrate(src)
	qdel(src)
	return TRUE

/obj/structure/swarmer_beacon/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("This machine is required for further reproduction of swarmers. Aborting."))
	return FALSE

/obj/structure/flora/swarmer_act()
	return FALSE

/obj/machinery/atmospherics/swarmer_act()
	return FALSE

/obj/structure/disposalpipe/swarmer_act()
	return FALSE

/obj/machinery/swarmer_act(mob/living/basic/swarmer/actor)
	actor.dismantle_machine(src)
	return TRUE

/obj/machinery/light/swarmer_act(mob/living/basic/swarmer/actor)
	actor.dis_integrate(src)
	return TRUE

/obj/machinery/door/swarmer_act(mob/living/basic/swarmer/actor)
	var/isonshuttle = istype(get_area(src), /area/shuttle)
	for(var/turf/turf_in_range as anything in RANGE_TURFS(1, src))
		var/area/turf_area = get_area(turf_in_range)
		//Check for dangerous pressure differences
		if (turf_in_range.return_turf_delta_p() > DANGEROUS_DELTA_P)
			to_chat(actor, span_warning("Destroying this object has the potential to cause an explosive pressure release. Aborting."))
			return TRUE
		//Check if breaking this door will expose the station to space/planetary atmos
		else if(turf_in_range.is_nearby_planetary_atmos() || isspaceturf(turf_in_range) || (!isonshuttle && (istype(turf_area, /area/shuttle) || istype(turf_area, /area/space))) || (isonshuttle && !istype(turf_area, /area/shuttle)))
			to_chat(actor, span_warning("Destroying this object has the potential to cause a hull breach. Aborting."))
			return FALSE
		//Check if this door is important in supermatter containment
		else if(istype(turf_area, /area/station/engineering/supermatter))
			to_chat(actor, span_warning("Disrupting the containment of a supermatter crystal would not be to our benefit. Aborting."))
			return FALSE
	actor.dis_integrate(src)
	return TRUE

/obj/machinery/camera/swarmer_act(mob/living/basic/swarmer/actor)
	actor.dis_integrate(src)
	if(!QDELETED(actor)) //If it got blown up no need to turn it off.
		toggle_cam(actor, FALSE)
	return TRUE

/obj/machinery/field/generator/swarmer_act(mob/living/basic/swarmer/actor)
	actor.dis_integrate(src)
	return TRUE

/obj/machinery/gravity_generator/swarmer_act(mob/living/basic/swarmer/actor)
	actor.dis_integrate(src)
	return TRUE

/obj/machinery/vending/swarmer_act(mob/living/basic/swarmer/actor)//It's more visually interesting than dismantling the machine
	actor.dis_integrate(src)
	return TRUE

/obj/machinery/turretid/swarmer_act(mob/living/basic/swarmer/actor)
	actor.dis_integrate(src)
	return TRUE

/obj/machinery/chem_dispenser/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("The volatile chemicals in this machine would destroy us. Aborting."))
	return FALSE

/obj/machinery/nuclearbomb/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("This device's destruction would result in the extermination of everything in the area. Aborting."))
	return FALSE

/obj/effect/rune/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("Searching... sensor malfunction! Target lost. Aborting."))
	return FALSE

/obj/structure/reagent_dispensers/fueltank/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("Destroying this object could cause a chain reaction. Aborting."))
	return FALSE

/obj/structure/cable/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("Disrupting the power grid would bring no benefit to us. Aborting."))
	return FALSE

/obj/machinery/portable_atmospherics/canister/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("An inhospitable area may be created as a result of destroying this object. Aborting."))
	return FALSE

/obj/structure/shuttle/engine/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("Destroying this object has the potential to cause a hull breach. Aborting."))
	return FALSE

/obj/machinery/telecomms/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("This communications relay should be preserved, it will be a useful resource to our masters in the future. Aborting."))
	return FALSE

/obj/machinery/deepfryer/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("This kitchen appliance should be preserved, it will make delicious unhealthy snacks for our masters in the future. Aborting."))
	return FALSE

/obj/machinery/power/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("Disrupting the power grid would bring no benefit to us. Aborting."))
	return FALSE

/obj/machinery/gateway/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("This bluespace source will be important to us later. Aborting."))
	return FALSE

/turf/closed/wall/swarmer_act(mob/living/basic/swarmer/actor)
	var/isonshuttle = istype(loc, /area/shuttle)
	for(var/turf/turf_in_range as anything in RANGE_TURFS(1, src))
		var/area/turf_area = get_area(turf_in_range)
		if (turf_in_range.return_turf_delta_p() > DANGEROUS_DELTA_P)
			to_chat(actor, span_warning("Destroying this object has the potential to cause an explosive pressure release. Aborting."))
			return TRUE
		else if(turf_in_range.is_nearby_planetary_atmos() || isspaceturf(turf_area) || (!isonshuttle && (istype(turf_area, /area/shuttle) || istype(turf_area, /area/space))) || (isonshuttle && !istype(turf_area, /area/shuttle) ))
			to_chat(actor, span_warning("Destroying this object has the potential to cause a hull breach. Aborting."))
			return TRUE
		else if(istype(turf_area, /area/station/engineering/supermatter))
			to_chat(actor, span_warning("Disrupting the containment of a supermatter crystal would not be to our benefit. Aborting."))
			return TRUE
	return ..()

/obj/structure/window/swarmer_act(mob/living/basic/swarmer/actor)
	var/is_on_shuttle = istype(get_area(src), /area/shuttle)
	for(var/t in RANGE_TURFS(1, src))
		var/turf/turf_in_range = t
		var/area/turf_area = get_area(turf_in_range)
		if (turf_in_range.return_turf_delta_p() > DANGEROUS_DELTA_P)
			to_chat(actor, span_warning("Destroying this object has the potential to cause an explosive pressure release. Aborting."))
			return TRUE
		else if(turf_in_range.is_nearby_planetary_atmos() || isspaceturf(turf_in_range) || (!is_on_shuttle && (istype(turf_area, /area/shuttle) || istype(turf_area, /area/space))) || (is_on_shuttle && !istype(turf_area, /area/shuttle)))
			to_chat(actor, span_warning("Destroying this object has the potential to cause a hull breach. Aborting."))
			return TRUE
		else if(istype(turf_area, /area/station/engineering/supermatter))
			to_chat(actor, span_warning("Disrupting the containment of a supermatter crystal would not be to our benefit. Aborting."))
			return TRUE
	return ..()

/obj/item/stack/cable_coil/swarmer_act(mob/living/basic/swarmer/actor)//Wiring would be too effective as a resource
	to_chat(actor, span_warning("This object does not contain enough materials to work with."))
	return FALSE

/obj/machinery/porta_turret/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("Attempting to dismantle this machine would result in an immediate counterattack. Aborting."))
	return FALSE

/obj/machinery/porta_turret_cover/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("Attempting to dismantle this machine would result in an immediate counterattack. Aborting."))
	return FALSE

/obj/structure/lattice/catwalk/swarmer_act(mob/living/basic/swarmer/actor)
	var/turf/here = get_turf(src)
	for(var/a in here.contents)
		if(istype(a, /obj/structure/cable))
			to_chat(actor, span_warning("Disrupting the power grid would bring no benefit to us. Aborting."))
			return FALSE
	return ..()

/obj/machinery/hydroponics/soil/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("This object does not contain enough materials to work with."))
	return FALSE

/obj/machinery/field/generator/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("Destroying this object would cause a catastrophic chain reaction. Aborting."))
	return FALSE

/obj/machinery/field/containment/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("This object does not contain solid matter. Aborting."))
	return FALSE

/obj/machinery/power/shieldwallgen/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("Destroying this object would have an unpredictable effect on structure integrity. Aborting."))
	return FALSE

/obj/machinery/shieldwall/swarmer_act(mob/living/basic/swarmer/actor)
	to_chat(actor, span_warning("This object does not contain solid matter. Aborting."))
	return FALSE

#undef DANGEROUS_DELTA_P
