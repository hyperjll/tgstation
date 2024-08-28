#define EXOTIC_MEDICAL_REAGENTS list(\
		/datum/reagent/medicine/dexalin,\
		/datum/reagent/medicine/kelotane,\
		/datum/reagent/medicine/bicaridine,\
		/datum/reagent/medicine/dylovene,\
		/datum/reagent/medicine/barozine,\
		/datum/reagent/medicine/hyronalin,\
		/datum/reagent/medicine/coagulant/inaprovaline\
	)

#define EXOTIC_EXPANDED_MEDICAL_REAGENTS list(\
		/datum/reagent/medicine/dermaline,\
		/datum/reagent/medicine/teporone,\
		/datum/reagent/medicine/ultravasculine,\
		/datum/reagent/medicine/arithrazine,\
		/datum/reagent/medicine/coagulant/tranexamicacid\
	)

/obj/item/reagent_containers/borghypo/medical/exotic
	name = "exotic cyborg hypospray"
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	inhand_icon_state = "eborghypo"
	default_reagent_types = EXOTIC_MEDICAL_REAGENTS
	expanded_reagent_types = EXOTIC_EXPANDED_MEDICAL_REAGENTS

#undef EXOTIC_MEDICAL_REAGENTS
#undef EXOTIC_EXPANDED_MEDICAL_REAGENTS
