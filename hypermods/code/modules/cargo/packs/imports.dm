/datum/supply_pack/imports/syndicate_mining
	name = "Syndicate Mining Equipment Crate"
	desc = "(*!&@#CARE NOT FOR NANOTRASEN'S SHODDY EQUIPMENT DESIGNS? BUY OUR SUPERIOR MINING EQUIPMENT TODAY! GUARENTEED TO SERVE ANY MINERS OUT THERE FAR BETTER THAN ANYTHING THOSE POSERS AT NANOTRASEN PROVIDES!!!#@*$"
	hidden = TRUE
	cost = CARGO_CRATE_VALUE * 10
	contains = list(
		/obj/item/clothing/suit/hooded/explorer/syndicate = 2,
		/obj/item/clothing/mask/gas/syndicate = 2,
		/obj/item/tank/internals/oxygen = 2,
		/obj/item/tank/internals/plasmaman/full,
	)
	crate_name = "syndicate explorer crate"
	crate_type = /obj/structure/closet/crate/secure/syndicate
