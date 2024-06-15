//////////////////////////////////////////////////////////////////////////////
/////////////////////////////// Service //////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/service/monkeycubes
	name = "Monkey Cube Crate"
	desc = "A crate containing a box filled with monkey cubes. Your xenobiologists would love you for purchasing this."
	cost = 300
	contains = list(/obj/item/storage/box/monkeycubes)
	crate_name = "monkey cube crate"
/**
/datum/supply_pack/service/clerkbeacons
	name = "Clerk Beacon Crate"
	desc = "A crate containing a implanter for a clerk beacon as well as a handheld beacon."
	cost = 10000
	contains = list(/obj/item/implanter/clerksignaller,
					/obj/item/choice_beacon_cooldown)
	crate_name = "clerk beacon crate"
**/
/datum/supply_pack/service/mysterysoda
	name = "Mystery Fizz Twelve-Pack"
	desc = "A crate containing twelve mystery soda's. You'll never know what you'll get!"
	cost = 800
	contains = list(/obj/item/reagent_containers/cup/soda_cans/mystery,
					/obj/item/reagent_containers/cup/soda_cans/mystery,
					/obj/item/reagent_containers/cup/soda_cans/mystery,
					/obj/item/reagent_containers/cup/soda_cans/mystery,
					/obj/item/reagent_containers/cup/soda_cans/mystery,
					/obj/item/reagent_containers/cup/soda_cans/mystery,
					/obj/item/reagent_containers/cup/soda_cans/mystery,
					/obj/item/reagent_containers/cup/soda_cans/mystery,
					/obj/item/reagent_containers/cup/soda_cans/mystery,
					/obj/item/reagent_containers/cup/soda_cans/mystery,
					/obj/item/reagent_containers/cup/soda_cans/mystery,
					/obj/item/reagent_containers/cup/soda_cans/mystery)
	crate_name = "mystery fizz crate"

//////////////////////////////////////////////////////////////////////////////
/////////////////////////////// Vending Machines //////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/vendingmachines
	group = "Vending Machines"

/datum/supply_pack/vendingmachines/assistvending
	name = "Vendomat"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 1500
	contains = list(/obj/machinery/vending/assist)
	crate_name = "vendomat vending crate"

/datum/supply_pack/vendingmachines/autodrobevending
	name = "Autodrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 1500
	contains = list(/obj/machinery/vending/autodrobe)
	crate_name = "autodrobe vending crate"

/datum/supply_pack/vendingmachines/boozeomatvending
	name = "Booze-O-Mat"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 2000
	contains = list(/obj/machinery/vending/boozeomat)
	crate_name = "boozeomat vending crate"

/datum/supply_pack/vendingmachines/cartvending
	name = "PTech"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 1500
	contains = list(/obj/machinery/vending/cart)
	crate_name = "ptech vending crate"

/datum/supply_pack/vendingmachines/cigarettevending
	name = "ShadyCigs Deluxe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 2000
	contains = list(/obj/machinery/vending/cigarette)
	crate_name = "cigarette vending crate"

/datum/supply_pack/vendingmachines/clothingvending
	name = "ClothesMate"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 2000
	contains = list(/obj/machinery/vending/clothing)
	crate_name = "clothing vending crate"

/datum/supply_pack/vendingmachines/coffeevending
	name = "Solar's Best Hot Drinks"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 2000
	contains = list(/obj/machinery/vending/coffee)
	crate_name = "coffee vending crate"

/datum/supply_pack/vendingmachines/colavending
	name = "Cola Vending Machine"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 2000
	contains = list(/obj/machinery/vending/cola/random)
	crate_name = "cola vending crate"
/**
/datum/supply_pack/vendingmachines/prisoncolavending
	name = "Prison-Approved Shambler's Cola Vendor"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 1500
	contains = list(/obj/machinery/vending/cola/shamblers/prison)
	crate_name = "prison cola vending crate"
**/
/datum/supply_pack/vendingmachines/dinnerwarevending
	name = "Plasteel Chef's Dinnerware Vendor"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 2000
	contains = list(/obj/machinery/vending/dinnerware)
	crate_name = "dinnerware vending crate"

/datum/supply_pack/vendingmachines/engineeringvending
	name = "Robco Tool Maker"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 5000
	contains = list(/obj/machinery/vending/engineering)
	crate_name = "engineering vending crate"

/datum/supply_pack/vendingmachines/engivendvending
	name = "Engi-Vend"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 2500
	contains = list(/obj/machinery/vending/engivend)
	crate_name = "engivend vending crate"

/datum/supply_pack/vendingmachines/gamesvending
	name = "Good Clean Fun"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 1500
	contains = list(/obj/machinery/vending/games)
	crate_name = "games vending crate"
/**
/datum/supply_pack/vendingmachines/giftsvending
	name = "Gift Vendor"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 1500
	contains = list(/obj/machinery/vending/gifts)
	crate_name = "gifts vending crate"
**/
/datum/supply_pack/vendingmachines/hydroseedsvending
	name = "MegaSeed Vendor"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 1500
	contains = list(/obj/machinery/vending/hydroseeds)
	crate_name = "hydroseeds vending crate"
/**
/datum/supply_pack/vendingmachines/weakhydroseedsvending
	name = "Prison-Approved Seed Vendor"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 1250
	contains = list(/obj/machinery/vending/hydroseeds/weak)
	crate_name = "prison hydroseeds vending crate"
**/
/datum/supply_pack/vendingmachines/modularpcvending
	name = "Deluxe Silicate Selections"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 1250
	contains = list(/obj/machinery/vending/modularpc)
	crate_name = "modularpc vending crate"

/datum/supply_pack/vendingmachines/hydronutrientsvending
	name = "NutriMax"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 2000
	contains = list(/obj/machinery/vending/hydronutrients)
	crate_name = "hydronutrients vending crate"

/datum/supply_pack/vendingmachines/roboticsvending
	name = "Robotech Deluxe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 2500
	contains = list(/obj/machinery/vending/robotics)
	crate_name = "robotics vending crate"

/datum/supply_pack/vendingmachines/securityvending
	name = "SecTech"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 5000
	access = ACCESS_SECURITY
	contains = list(/obj/machinery/vending/security)
	crate_name = "security vending crate"
/**
/datum/supply_pack/vendingmachines/randomsnackvending
	name = "Snack Vending Machine"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 1500
	contains = list(/obj/machinery/vending/snack/random)
	crate_name = "snack vending crate"
**/
/datum/supply_pack/vendingmachines/sovietsodavending
	name = "BODA Vending Machine"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 800
	contains = list(/obj/machinery/vending/sovietsoda)
	crate_name = "soviet soda vending crate"

/datum/supply_pack/vendingmachines/sustenancevending
	name = "Prison-Approved Sustenance Vendor"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 1000
	contains = list(/obj/machinery/vending/sustenance)
	crate_name = "sustenance vending crate"

/datum/supply_pack/vendingmachines/toolvending
	name = "YouTool"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 2500
	contains = list(/obj/machinery/vending/tool)
	crate_name = "tool vending crate"
/**
/datum/supply_pack/vendingmachines/fishingvending
	name = "Tackle Box 2000"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 1000
	contains = list(/obj/machinery/vending/fishing)
	crate_name = "fishing vending crate"
**/
/datum/supply_pack/vendingmachines/sec_wardrobe
	name = "SecDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/sec_wardrobe)
	crate_name = "sec wardrobe crate"

/datum/supply_pack/vendingmachines/medi_wardrobe
	name = "MediDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/medi_wardrobe)
	crate_name = "medi wardrobe crate"

/datum/supply_pack/vendingmachines/engi_wardrobe
	name = "EngiDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/engi_wardrobe)
	crate_name = "engi wardrobe crate"

/datum/supply_pack/vendingmachines/atmos_wardrobe
	name = "AtmosDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/atmos_wardrobe)
	crate_name = "atmos wardrobe crate"

/datum/supply_pack/vendingmachines/cargo_wardrobe
	name = "CargoDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/cargo_wardrobe)
	crate_name = "cargo wardrobe crate"

/datum/supply_pack/vendingmachines/robo_wardrobe
	name = "RoboDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/robo_wardrobe)
	crate_name = "robo wardrobe crate"

/datum/supply_pack/vendingmachines/science_wardrobe
	name = "SciDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/science_wardrobe)
	crate_name = "sci wardrobe crate"

/datum/supply_pack/vendingmachines/hydro_wardrobe
	name = "Hydrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/hydro_wardrobe)
	crate_name = "botany wardrobe crate"

/datum/supply_pack/vendingmachines/curator_wardrobe
	name = "CuraDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/curator_wardrobe)
	crate_name = "curator wardrobe crate"

/datum/supply_pack/vendingmachines/bar_wardrobe
	name = "BarDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/bar_wardrobe)
	crate_name = "bar wardrobe crate"

/datum/supply_pack/vendingmachines/chef_wardrobe
	name = "ChefDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/chef_wardrobe)
	crate_name = "chef wardrobe crate"

/datum/supply_pack/vendingmachines/jani_wardrobe
	name = "JaniDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/jani_wardrobe)
	crate_name = "janitor wardrobe crate"

/datum/supply_pack/vendingmachines/law_wardrobe
	name = "LawDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/law_wardrobe)
	crate_name = "law wardrobe crate"

/datum/supply_pack/vendingmachines/chap_wardrobe
	name = "ChapDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/chap_wardrobe)
	crate_name = "chaplain wardrobe crate"

/datum/supply_pack/vendingmachines/chem_wardrobe
	name = "ChemDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/chem_wardrobe)
	crate_name = "chemistry wardrobe crate"

/datum/supply_pack/vendingmachines/gene_wardrobe
	name = "GeneDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/gene_wardrobe)
	crate_name = "gene wardrobe crate"

/datum/supply_pack/vendingmachines/viro_wardrobe
	name = "ViroDrobe"
	desc = "A crate containing a fully assembled vending machine, be sure to delay opening the crate until it's where you want the vending machine to be."
	cost = 3000
	contains = list(/obj/machinery/vending/wardrobe/viro_wardrobe)
	crate_name = "virologist wardrobe crate"
