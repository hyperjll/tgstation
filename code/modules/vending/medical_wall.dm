/obj/machinery/vending/wallmed
	name = "\improper NanoMed"
	desc = "Wall-mounted Medical Equipment dispenser."
	icon = 'hypermods/icons/obj/machines/vending.dmi'
	icon_state = "wallmed"
	icon_deny = "wallmed-deny"
	panel_type = "wallmed-panel"
	density = FALSE
	products = list(
		/obj/item/reagent_containers/syringe = 3,
		/obj/item/reagent_containers/applicator/patch/libital = 5,
		/obj/item/reagent_containers/applicator/patch/aiuri = 5,
		/obj/item/reagent_containers/applicator/pill/multiver = 2,
		/obj/item/reagent_containers/applicator/pill/antiviral = 3,
		/obj/item/reagent_containers/medigel/libital = 2,
		/obj/item/reagent_containers/medigel/aiuri = 2,
		/obj/item/reagent_containers/medigel/sterilizine = 1,
		/obj/item/healthanalyzer/simple = 2,
		/obj/item/stack/medical/bone_gel = 2,
		/obj/item/storage/box/bandages = 1,
		/obj/item/stack/medical/wrap/gauze = 3,
		/obj/item/reagent_containers/applicator/pill/iron = 5,
		/obj/item/storage/pill_bottle/painkillers = 3,
		/obj/item/reagent_containers/cup/bottle/salglu_solution = 2,
		/obj/item/reagent_containers/cup/bottle/oculine = 1,
		/obj/item/reagent_containers/cup/bottle/inacusiate = 1,
	)
	contraband = list(
		/obj/item/reagent_containers/applicator/pill/tox = 2,
		/obj/item/reagent_containers/applicator/pill/morphine = 2,
		/obj/item/storage/box/gum/happiness = 1,
		/obj/item/reagent_containers/hypospray/medipen/formaldehyde = 1,
	)
	premium = list(
		/obj/item/reagent_containers/medigel/synthflesh = 1,
		/obj/item/reagent_containers/hypospray/medipen/blood_loss = 1,
		/obj/item/reagent_containers/hypospray/medipen/ekit = 1,
	)
	refill_canister = /obj/item/vending_refill/wallmed
	default_price = PAYCHECK_CREW * 0.3 // Cheap since crew should be able to affort it in emergency situations
	extra_price = PAYCHECK_COMMAND
	payment_department = ACCOUNT_MED
	tiltable = FALSE
	light_mask = "wallmed-light-mask"

/obj/machinery/vending/wallmed/directional
	allow_custom = FALSE

	emagvendorreplace = TRUE
	replacewith = /obj/machinery/vending/emagged/wallmed

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/vending/wallmed, 32)

/obj/item/vending_refill/wallmed
	machine_name = "Emergency NanoMed"
	icon_state = "refill_medical"
