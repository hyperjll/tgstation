//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Medical /////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/medical/chemicallab
	name = "Chemistry Lab Setup"
	desc = "Contains critical supplies to set up a chemistry lab, just in case the chemists blow themselves up."
	cost = 3000
	access = ACCESS_PHARMACY
	contains = list(/obj/item/circuitboard/machine/chem_dispenser,
					/obj/item/circuitboard/machine/chem_heater,
					/obj/item/circuitboard/machine/chem_master,
					/obj/item/circuitboard/machine/reagentgrinder)
	crate_name = "chemistry lab crate"

/datum/supply_pack/medical/syndichem
	name = "SyndiChem Vending Machine"
	desc = "Sponsored by the big dogs themselves, this vendor contains useful supplies in the hands of chemists everywhere!"
	contraband = TRUE
	cost = 2000
	access = ACCESS_PHARMACY
	contains = list(/obj/machinery/vending/syndichem)
	crate_name = "chemistry? crate"

/datum/supply_pack/medical/medicalvending
	name = "NanoMed Plus"
	desc = "Contains a NanoMed Plus vending machine."
	cost = 3000
	access = ACCESS_MEDICAL
	contains = list(/obj/machinery/vending/medical)
	crate_name = "nanomed plus crate"

/datum/supply_pack/medical/medicalsmallvending
	name = "NanoMed"
	desc = "Contains a NanoMed vending machine."
	cost = 1000
	access = ACCESS_MEDICAL
	contains = list(/obj/machinery/vending/wallmed)
	crate_name = "nanomed crate"

/datum/supply_pack/medical/medicalhypovending
	name = "HypoMed"
	desc = "Contains a HypoMed vending machine."
	cost = 2000
	access = ACCESS_MEDICAL
	contains = list(/obj/machinery/vending/wallhypo)
	crate_name = "hypomed crate"

/datum/supply_pack/medical/wallgenevending
	name = "NanoGene"
	desc = "Contains a NanoGene vending machine."
	cost = 2500
	access = ACCESS_MEDICAL
	contains = list(/obj/machinery/vending/wallgene)
	crate_name = "nanogene crate"

/datum/supply_pack/medical/medicalkiosk
	name = "Medical Kiosk"
	desc = "Contains a Medical Kiosk, for quickly assessing injuries and illness."
	cost = 1000
	access = ACCESS_MEDICAL
	contains = list(/obj/machinery/medical_kiosk)
	crate_name = "medical kiosk crate"
