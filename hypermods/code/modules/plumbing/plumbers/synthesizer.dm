///A single machine that produces all basic chems. Can be used to suppliment an entire array is space is in short-supply.
/obj/machinery/plumbing/omni_synthesizer
	name = "omni chemical synthesizer"
	desc = "Produces a wide-variety of chemicals at a given volume. Must be plumbed. Reagents won't react within this machine."
	icon_state = "synthesizer"
	icon = 'icons/obj/pipes_n_cables/hydrochem/plumbers.dmi'
	reagent_flags = TRANSPARENT | NO_REACT
	buffer = 250

	///Amount we produce for every process by default.
	var/amount = 5
	///straight up copied from chem dispenser. Being a subtype would be extremely tedious and making it global would restrict potential subtypes using different dispensable_reagents
	var/static/list/default_reagents = list(
		/datum/reagent/aluminium,
		/datum/reagent/bromine,
		/datum/reagent/carbon,
		/datum/reagent/chlorine,
		/datum/reagent/copper,
		/datum/reagent/consumable/ethanol,
		/datum/reagent/fluorine,
		/datum/reagent/hydrogen,
		/datum/reagent/iodine,
		/datum/reagent/iron,
		/datum/reagent/lithium,
		/datum/reagent/mercury,
		/datum/reagent/nitrogen,
		/datum/reagent/oxygen,
		/datum/reagent/phosphorus,
		/datum/reagent/potassium,
		/datum/reagent/uranium/radium,
		/datum/reagent/silicon,
		/datum/reagent/sodium,
		/datum/reagent/stable_plasma,
		/datum/reagent/consumable/sugar,
		/datum/reagent/sulfur,
		/datum/reagent/toxin/acid,
		/datum/reagent/water,
		/datum/reagent/fuel,
	)
	//reagents this synthesizer can dispense
	var/list/dispensable_reagents

/obj/machinery/plumbing/omni_synthesizer/Initialize(mapload, layer)
	. = ..()
	AddComponent(/datum/component/plumbing/simple_supply, layer)
	dispensable_reagents = default_reagents

/obj/machinery/plumbing/omni_synthesizer/process(seconds_per_tick)
	if(!is_operational || !amount)
		return

	if(reagents.total_volume >= 125) // We're capped out here. It's up to you to filter out unnecessary chemicals.
		return

	for(var/type in dispensable_reagents)
		reagents.add_reagent(type, amount)

	use_energy(active_power_usage * seconds_per_tick)
