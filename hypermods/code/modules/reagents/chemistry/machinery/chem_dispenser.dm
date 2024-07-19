/obj/machinery/chem_dispenser/psych
	name = "drug dispenser"
	desc = "Creates and dispenses certain drugs for psychological treatment."
	circuit = /obj/item/circuitboard/machine/chem_dispenser/psych
	/// The default list of dispensable_reagents
	var/static/list/drug_dispensable_reagents = list(
		/datum/reagent/drug/happiness,
		/datum/reagent/medicine/antihol,
		/datum/reagent/medicine/mannitol,
		/datum/reagent/drug/pumpup
	)
	/// The default list of reagents upgrade_reagents tier 2
	var/static/list/drug_upgrade_reagents_t2 = list(
		/datum/reagent/medicine/psicodine,
		/datum/reagent/medicine/haloperidol,
		/datum/reagent/drug/space_drugs,
		/datum/reagent/medicine/neurine
	)
	/// The default list of reagents upgrade_reagents tier 3
	var/static/list/drug_upgrade_reagents_t3 = list(
		/datum/reagent/drug/krokodil,
		/datum/reagent/drug/aranesp,
		/datum/reagent/drug/nicotine,
		/datum/reagent/medicine/morphine
	)
	/// The default list of reagents upgrade_reagents tier 4
	var/static/list/drug_upgrade_reagents_t4 = list(
		/datum/reagent/kronkus_extract,
		/datum/reagent/drug/bath_salts,
		/datum/reagent/medicine/omnizine/protozine,
		/datum/reagent/medicine/modafinil
	)
	/// The default list of reagents emagged_reagents
	var/static/list/drug_emagged_reagents = list(
		/datum/reagent/toxin/leadacetate,
		/datum/reagent/toxin/sodium_thiopental,
		/datum/reagent/toxin/norepinephricacid,
		/datum/reagent/medicine/coagulant/proconvertin
	)

/obj/machinery/chem_dispenser/psych/Initialize(mapload)
	dispensable_reagents = drug_dispensable_reagents

	if(upgrade_reagents2 != null && !upgrade_reagents2.len)
		upgrade_reagents2 = drug_upgrade_reagents_t2
	if(upgrade_reagents2)
		upgrade_reagents2 = sort_list(upgrade_reagents2, GLOBAL_PROC_REF(cmp_reagents_asc))

	if(upgrade_reagents3 != null && !upgrade_reagents3.len)
		upgrade_reagents3 = drug_upgrade_reagents_t3
	if(upgrade_reagents3)
		upgrade_reagents3 = sort_list(upgrade_reagents3, GLOBAL_PROC_REF(cmp_reagents_asc))

	if(upgrade_reagents4 != null && !upgrade_reagents4.len)
		upgrade_reagents4 = drug_upgrade_reagents_t4
	if(upgrade_reagents4)
		upgrade_reagents4 = sort_list(upgrade_reagents4, GLOBAL_PROC_REF(cmp_reagents_asc))

	emagged_reagents = drug_emagged_reagents
	. = ..()
