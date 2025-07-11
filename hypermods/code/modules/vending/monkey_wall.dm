/obj/machinery/vending/wallgene
	name = "\improper NanoGene"
	desc = "Wall-mounted Medical Equipment dispenser."
	icon = 'hypermods/icons/obj/machines/vending.dmi'
	icon_state = "wallgene"
	icon_deny = "wallgene-deny"
	panel_type = "wallmed-panel"
	density = FALSE
	tiltable = FALSE
	products = list(/obj/item/storage/pill_bottle/mannitol = 2,
		            /obj/item/storage/pill_bottle/mutadone = 2,
		            /obj/item/reagent_containers/applicator/pill/multiver = 6,
					/obj/item/clothing/glasses/regular = 5,
					/obj/item/disk/data = 2,
					/obj/item/food/monkeycube = 10)
	contraband = list(/obj/item/reagent_containers/cup/bottle/radium = 1,
					  /obj/item/reagent_containers/cup/bottle/mutagen = 2,
	                  /obj/item/food/monkeycube/gorilla = 1)
	refill_canister = /obj/item/vending_refill/wallgene
	default_price = 25
	extra_price = 100
	payment_department = ACCOUNT_MED

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/vending/wallgene, 32)

/obj/item/vending_refill/wallgene
	machine_name = "NanoGene"
	icon = 'hypermods/icons/obj/vending_restock.dmi'
	icon_state = "refill_wallgene"

