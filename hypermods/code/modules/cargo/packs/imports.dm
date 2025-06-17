/datum/supply_pack/imports/syndicate_mining
	name = "Syndicate Mining Equipment Crate"
	desc = "(*!&@#CARE NOT FOR NANOTRASEN'S SHODDY EQUIPMENT DESIGNS? BUY OUR SUPERIOR MINING EQUIPMENT TODAY! GUARENTEED TO SERVE ANY MINERS OUT THERE FAR BETTER THAN ANYTHING THOSE POSERS AT NANOTRASEN PROVIDES!!!#@*$"
	hidden = TRUE
	contraband = TRUE
	cost = CARGO_CRATE_VALUE * 10
	contains = list(
		/obj/item/clothing/suit/hooded/explorer/syndicate = 2,
		/obj/item/clothing/mask/gas/syndicate = 2,
		/obj/item/tank/internals/oxygen = 2,
		/obj/item/tank/internals/plasmaman/full,
	)
	crate_name = "syndicate explorer crate"
	crate_type = /obj/structure/closet/crate/secure/syndicate

/datum/supply_pack/imports/empty_syndimodsuit
	name = "Factory-New Syndicate MODsuit"
	desc = "(*!&@#LOOKING TO COSPLAY? WANTING TO PLAY A PRANK? OR PERHAPS YOU'RE IN NEED OF SOME SUPERIOR TACTICAL GEAR? ORDER NOW, AND WE'LL SHIP OVER ONE OF OUR FRESHLY MANUFACTURED MODSUITS. NO STRINGS (OR MODULES) ATTACHED!!!#@*$"
	hidden = TRUE
	contraband = TRUE
	cost = CARGO_CRATE_VALUE * 50
	contains = list(
		/obj/item/mod/control/pre_equipped/empty/syndicate = 1,
	)
	crate_name = "syndicate modsuit crate"
	crate_type = /obj/structure/closet/crate/secure/syndicate
