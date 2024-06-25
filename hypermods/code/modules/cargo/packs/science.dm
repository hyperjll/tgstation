//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Science /////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/science/advancedparts
	name = "Advanced Parts Crate"
	desc = "Contains one full set of Tier-2 Machine Parts and a fully-charged super power cell."
	cost = 2000
	access = ACCESS_RESEARCH
	access_view = ACCESS_RESEARCH
	contains = list(/obj/item/stock_parts/capacitor/adv,
					/obj/item/stock_parts/servo/nano,
					/obj/item/stock_parts/scanning_module/adv,
					/obj/item/stock_parts/micro_laser/high,
					/obj/item/stock_parts/matter_bin/adv,
					/obj/item/stock_parts/power_store/cell/super)
	crate_name = "advanced parts crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/superparts
	name = "Super Parts Crate"
	desc = "Contains one full set of Tier-3 Machine Parts and a fully-charged hyper power cell."
	cost = 5000
	access = ACCESS_RESEARCH
	access_view = ACCESS_RESEARCH
	contains = list(/obj/item/stock_parts/capacitor/super,
					/obj/item/stock_parts/servo/pico,
					/obj/item/stock_parts/scanning_module/phasic,
					/obj/item/stock_parts/micro_laser/ultra,
					/obj/item/stock_parts/matter_bin/super,
					/obj/item/stock_parts/power_store/cell/hyper)
	crate_name = "super parts crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/bluespaceparts
	name = "Bluespace Parts Crate"
	desc = "Contains one full set of Tier-4 Machine Parts and a fully-charged bluespace power cell."
	cost = 10000
	access = ACCESS_RESEARCH
	access_view = ACCESS_RESEARCH
	contains = list(/obj/item/stock_parts/capacitor/quadratic,
					/obj/item/stock_parts/servo/femto,
					/obj/item/stock_parts/scanning_module/triphasic,
					/obj/item/stock_parts/micro_laser/quadultra,
					/obj/item/stock_parts/matter_bin/bluespace,
					/obj/item/stock_parts/power_store/cell/bluespace)
	crate_name = "bluespace parts crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/tcommparts
	name = "Telecommunication Parts Crate"
	desc = "Contains one full set of Telecommunication Machine Parts."
	cost = 1000
	access = ACCESS_RESEARCH
	access_view = ACCESS_RESEARCH
	contains = list(/obj/item/stock_parts/subspace/transmitter,
					/obj/item/stock_parts/subspace/crystal,
					/obj/item/stock_parts/subspace/analyzer,
					/obj/item/stock_parts/subspace/treatment,
					/obj/item/stock_parts/subspace/amplifier,
					/obj/item/stock_parts/subspace/filter,
					/obj/item/stock_parts/subspace/ansible)
	crate_name = "tcomm parts crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/toximate
	name = "Toximate 3000"
	desc = "Contains one Toximate 3000, for all of your ordinance needs."
	cost = 3000
	access = ACCESS_RESEARCH
	access_view = ACCESS_RESEARCH
	contains = list(/obj/machinery/vending/plasmaresearch)
	crate_name = "toximate crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/cyborgassembly
	name = "Cyborg Assembly Crate"
	desc = "Contains all of the required parts to construct a cyborg, but doesn't contain any tools."
	cost = 2500
	access = ACCESS_RESEARCH
	access_view = ACCESS_RESEARCH
	contains = list(/obj/item/bodypart/chest/robot,
					/obj/item/bodypart/head/robot,
					/obj/item/bodypart/leg/left/robot,
					/obj/item/bodypart/leg/right/robot,
					/obj/item/bodypart/arm/left/robot,
					/obj/item/bodypart/arm/right/robot,
					/obj/item/robot_suit,
					/obj/item/mmi/posibrain,
					/obj/item/assembly/flash/handheld,
					/obj/item/assembly/flash/handheld,
					/obj/item/stock_parts/power_store/cell/high,
					/obj/item/stack/cable_coil)
	crate_name = "cyborg assembly crate"
	crate_type = /obj/structure/closet/crate/secure/science
/**
/datum/supply_pack/science/nanitelab
	name = "Nanite Lab Setup Crate"
	desc = "Contains a multitude of circuitry required for nanite labs as well as essential supplies for programming and monitoring nanites."
	cost = 2000
	access = ACCESS_RESEARCH
	access_view = ACCESS_RESEARCH
	contains = list(/obj/item/circuitboard/machine/public_nanite_chamber,
					/obj/item/circuitboard/computer/nanite_chamber_control,
					/obj/item/circuitboard/machine/nanite_chamber,
					/obj/item/circuitboard/computer/nanite_cloud_controller,
					/obj/item/circuitboard/machine/nanite_program_hub,
					/obj/item/circuitboard/machine/nanite_programmer ,
					/obj/item/nanite_scanner,
					/obj/item/nanite_remote,
					/obj/item/storage/box/disks_nanite)
	crate_name = "nanite lab crate"
	crate_type = /obj/structure/closet/crate/secure/science
**/
/datum/supply_pack/science/pyrocore
	name = "Refined Pyroclastic Anomaly Core Crate"
	desc = "Contains a single Pyroclastic anomaly core."
	cost = 10000
	access = ACCESS_RD
	access_view = ACCESS_RD
	contains = list(/obj/item/assembly/signaler/anomaly/pyro)
	crate_name = "pyroclastic anomaly core crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/gravcore
	name = "Refined Gravitational Anomaly Core Crate"
	desc = "Contains a single Gravitational anomaly core."
	cost = 10000
	access = ACCESS_RD
	access_view = ACCESS_RD
	contains = list(/obj/item/assembly/signaler/anomaly/grav)
	crate_name = "gravitational anomaly core crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/fluxcore
	name = "Refined Flux Anomaly Core Crate"
	desc = "Contains a single Flux anomaly core."
	cost = 10000
	access = ACCESS_RD
	access_view = ACCESS_RD
	contains = list(/obj/item/assembly/signaler/anomaly/flux)
	crate_name = "flux anomaly core crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/blspcore
	name = "Refined Bluespace Anomaly Core Crate"
	desc = "Contains a single Bluespace anomaly core."
	cost = 10000
	access = ACCESS_RD
	access_view = ACCESS_RD
	contains = list(/obj/item/assembly/signaler/anomaly/bluespace)
	crate_name = "bluespace anomaly core crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/vortcore
	name = "Refined Vortex Anomaly Core Crate"
	desc = "Contains a single Vortex anomaly core."
	cost = 10000
	access = ACCESS_RD
	access_view = ACCESS_RD
	contains = list(/obj/item/assembly/signaler/anomaly/vortex)
	crate_name = "vortex anomaly core crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/hallcore
	name = "Refined Hallucination Anomaly Core Crate"
	desc = "Contains a single Hallucination anomaly core."
	cost = 10000
	access = ACCESS_RD
	access_view = ACCESS_RD
	contains = list(/obj/item/assembly/signaler/anomaly/hallucination)
	crate_name = "hallucination anomaly core crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/biocore
	name = "Refined Bioscrambler Anomaly Core Crate"
	desc = "Contains a single Bioscrambler anomaly core."
	cost = 10000
	access = ACCESS_RD
	access_view = ACCESS_RD
	contains = list(/obj/item/assembly/signaler/anomaly/bioscrambler)
	crate_name = "bioscrambler anomaly core crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/dimencore
	name = "Refined Dimensional Anomaly Core Crate"
	desc = "Contains a single Dimensional anomaly core."
	cost = 10000
	access = ACCESS_RD
	access_view = ACCESS_RD
	contains = list(/obj/item/assembly/signaler/anomaly/dimensional)
	crate_name = "dimensional anomaly core crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/ectocore
	name = "Refined Ectoplasm Anomaly Core Crate"
	desc = "Contains a single Ectoplasm anomaly core."
	cost = 10000
	access = ACCESS_RD
	access_view = ACCESS_RD
	contains = list(/obj/item/assembly/signaler/anomaly/ectoplasm)
	crate_name = "ectoplasm anomaly core crate"
	crate_type = /obj/structure/closet/crate/secure/science

/**
/datum/supply_pack/science/radscore
	name = "Refined Radiation Anomaly Core Crate"
	desc = "Contains a single Radiation anomaly core."
	cost = 10000
	access = ACCESS_RD
	access_view = ACCESS_RD
	contains = list(/obj/item/assembly/signaler/anomaly/radiation)
	crate_name = "radiation anomaly core crate"
	crate_type = /obj/structure/closet/crate/secure/science
**/
