//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Engineering /////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/engineering/rcds
	name = "RCD Crate"
	desc = "Any engineer worth their salt uses their trusty Rapid Construction Device. Contains two RCD's and six compressed matter cartridges."
	cost = CARGO_CRATE_VALUE * 15
	access_view = ACCESS_ENGINE_EQUIP
	access = ACCESS_ENGINE_EQUIP
	contains = list(/obj/item/construction/rcd,
					/obj/item/construction/rcd,
					/obj/item/rcd_ammo,
					/obj/item/rcd_ammo,
					/obj/item/rcd_ammo,
					/obj/item/rcd_ammo,
					/obj/item/rcd_ammo,
					/obj/item/rcd_ammo)
	crate_name = "rcd crate"

/datum/supply_pack/engineering/rpds
	name = "RPD Crate"
	desc = "Need to setup some pipework? Repair the station? Setup transportation? Use a Rapid Pipe Dispenser. Contains two RPD's."
	cost = CARGO_CRATE_VALUE * 5
	access_view = ACCESS_ENGINE_EQUIP
	contains = list(/obj/item/pipe_dispenser,
					/obj/item/pipe_dispenser)
	crate_name = "rpds crate"

/datum/supply_pack/engineering/autolathe
	name = "Autolathe Crate"
	desc = "Need to get your hands on something you shouldn't normally have? Buy an autolathe today! Contains a fully functional autolathe."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/machinery/autolathe)
	crate_name = "autolathe crate"

/datum/supply_pack/engineering/supergenerator
	name = "S.U.P.E.R.P.A.C.M.A.N Portable Generator"
	desc = "Need something better than a normal plasma-eating generator? Buy a S.U.P.E.R.P.A.C.M.A.N generator! It eats uranium instead of plasma! Doesn't come with any fuel."
	cost = CARGO_CRATE_VALUE * 30
	contains = list(/obj/machinery/power/port_gen/pacman/superpacman)
	crate_name = "super pacman generator crate"

/datum/supply_pack/engineering/hypergenerator
	name = "M.R.S.P.A.C.M.A.N Portable Generator"
	desc = "The ultimate portable generator, which can now be in your loving hands. The M.R.S.P.A.C.M.A.N generator eats diamonds to provide an absurd amount of power."
	cost = CARGO_CRATE_VALUE * 60
	contains = list(/obj/machinery/power/port_gen/pacman/mrs)
	crate_name = "mrs pacman generator crate"

/datum/supply_pack/engineering/rtggenerator
	name = "RTG Generator"
	desc = "A near-immortal RTG generator. Produces a single Kw of power, but requires little to no maintenance. Lovely when you're on a budget."
	cost = CARGO_CRATE_VALUE * 2.5
	contains = list(/obj/machinery/power/rtg)
	crate_name = "rtg generator crate"

/datum/supply_pack/engineering/engimodsuit
	name = "Engineering MODsuit Crate"
	desc = "Contains a single MODsuit designed for Engineering Personnel."
	cost = CARGO_CRATE_VALUE * 20
	access = ACCESS_ENGINE_EQUIP
	contains = list(/obj/item/mod/control/pre_equipped/engineering)
	crate_name = "engineering modsuit crate"

/datum/supply_pack/engineering/atmosmodsuit
	name = "Atmospherics MODsuit Crate"
	desc = "Contains a single MODsuit designed for Atmospheric Personnel."
	cost = CARGO_CRATE_VALUE * 30
	access = ACCESS_ATMOSPHERICS
	contains = list(/obj/item/mod/control/pre_equipped/atmospheric)
	crate_name = "atmospherics modsuit crate"

//////////////////////////////////////////////////////////////////////////////
//////////////////////// Engine Construction /////////////////////////////////
//////////////////////////////////////////////////////////////////////////////


