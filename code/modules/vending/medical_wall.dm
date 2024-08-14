/obj/machinery/vending/wallmed
	name = "\improper NanoMed"
	desc = "Wall-mounted Medical Equipment dispenser."
	icon_state = "wallmed"
	icon_deny = "wallmed-deny"
	panel_type = "wallmed-panel"
	density = FALSE
	products = list(
		/obj/item/reagent_containers/syringe = 3,
		/obj/item/reagent_containers/pill/patch/libital = 5,
		/obj/item/reagent_containers/pill/patch/aiuri = 5,
		/obj/item/reagent_containers/pill/multiver = 2,
		/obj/item/reagent_containers/pill/antiviral = 3,
		/obj/item/reagent_containers/medigel/libital = 2,
		/obj/item/reagent_containers/medigel/aiuri = 2,
		/obj/item/reagent_containers/medigel/sterilizine = 1,
		/obj/item/healthanalyzer/simple = 2,
		/obj/item/stack/medical/bone_gel = 2,
		/obj/item/storage/box/bandages = 1,
		/obj/item/stack/medical/gauze = 3,
		/obj/item/reagent_containers/pill/iron = 5,
		/obj/item/reagent_containers/pill/antiviral = 5,
		/obj/item/reagent_containers/cup/bottle/salglu_solution = 2,
		/obj/item/reagent_containers/cup/bottle/oculine = 1,
		/obj/item/reagent_containers/cup/bottle/inacusiate = 1,
	)
	contraband = list(
		/obj/item/reagent_containers/pill/tox = 2,
		/obj/item/reagent_containers/pill/morphine = 2,
		/obj/item/storage/box/gum/happiness = 1,
		/obj/item/reagent_containers/hypospray/medipen/ekit = 1,
		/obj/item/reagent_containers/hypospray/medipen/formaldehyde = 1,
		/obj/item/reagent_containers/hypospray/medipen/blood_loss = 1,
	)
	premium = list(
		/obj/item/reagent_containers/medigel/synthflesh = 1,
		/obj/item/reagent_containers/pill/bicaridine = 5,
		/obj/item/reagent_containers/pill/kelotane = 5,
		/obj/item/reagent_containers/pill/antitoxin = 5,
		/obj/item/reagent_containers/pill/dexalin = 5,
		/obj/item/reagent_containers/pill/inaprovaline = 5,
		/obj/item/reagent_containers/pill/coagulant = 5,
	)
	refill_canister = /obj/item/vending_refill/wallmed
	default_price = PAYCHECK_COMMAND //Double the medical price due to being meant for public consumption, not player specfic
	extra_price = PAYCHECK_COMMAND * 1.5
	payment_department = ACCOUNT_MED
	tiltable = FALSE
	light_mask = "wallmed-light-mask"

/obj/machinery/vending/wallmed/Initialize(mapload)
	. = ..()
	find_and_hang_on_wall()

WALL_MOUNT_DIRECTIONAL_HELPERS(/obj/machinery/vending/wallmed)

/obj/item/vending_refill/wallmed
	machine_name = "NanoMed"
	icon_state = "refill_medical"
