/obj/machinery/vending/wallhypo
	name = "\improper HypoMed"
	desc = "Wall-mounted Hypospray Equipment dispenser."
	icon = 'hypermods/icons/obj/vending.dmi'
	icon_state = "wallhypo"
	icon_deny = "wallhypo-deny"
	tiltable = FALSE
	density = FALSE
	products = list(/obj/item/reagent_containers/hypospray/buyable = 5,
					/obj/item/reagent_containers/cup/bottle/libital = 2,
					/obj/item/reagent_containers/cup/bottle/aiuri = 2,
					/obj/item/reagent_containers/cup/bottle/multiver = 2,
					/obj/item/reagent_containers/cup/bottle/syriniver = 2,
					/obj/item/reagent_containers/cup/bottle/convermol = 2,
					/obj/item/reagent_containers/cup/bottle/epinephrine = 2,
					/obj/item/reagent_containers/cup/bottle/coagulant = 2)
	contraband = list(/obj/item/reagent_containers/cup/bottle/omnizine = 1)
	premium = list(/obj/item/reagent_containers/cup/bottle/sal_acid = 2,
					/obj/item/reagent_containers/cup/bottle/oxandrolone = 2,
					/obj/item/reagent_containers/cup/bottle/calomel = 2,
					/obj/item/reagent_containers/cup/bottle/salbutamol = 2,
					/obj/item/reagent_containers/cup/bottle/lavaland = 1)
	default_price = 50
	extra_price = 50
	armor = list(MELEE = 100, BULLET = 100, LASER = 100, ENERGY = 100, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF
	refill_canister = /obj/item/vending_refill/wallhypo
	payment_department = ACCOUNT_MED

/obj/item/vending_refill/wallhypo
	machine_name = "HypoMed"
	icon_state = "refill_medical"
