//Tail
/datum/preference/choiced/species_feature/protogen_tail
	savefile_key = "feature_protogen_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_organ = /obj/item/organ/tail/protogen

/datum/preference/choiced/species_feature/protogen_tail/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tail_protogen"] = value

/datum/preference/choiced/species_feature/protogen_tail/create_default_value()
	var/datum/sprite_accessory/tails/protogen/synthliz/tail = /datum/sprite_accessory/tails/protogen/synthliz
	return initial(tail.name)

//Snout
/datum/preference/choiced/species_feature/protogen_snout
	savefile_key = "feature_protogen_snout"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_organ = /obj/item/organ/snout/protogen

/datum/preference/choiced/species_feature/protogen_snout/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["snout_protogen"] = value

/datum/preference/choiced/species_feature/protogen_snout/create_default_value()
	var/datum/sprite_accessory/protogen/snout/snout = /datum/sprite_accessory/protogen/snout
	return initial(snout.name)

//Antennae
/datum/preference/choiced/species_feature/protogen_antennae
	savefile_key = "feature_protogen_antennae"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_organ = /obj/item/organ/protogen_antennae

/datum/preference/choiced/species_feature/protogen_antennae/icon_for(value)
	var/static/datum/universal_icon/protogen_head

	if (isnull(protogen_head))
		protogen_head = uni_icon('hypermods/icons/mob/human/species/protogen/protogen_bodyparts.dmi', "protogen_head")
		protogen_head.blend_icon(uni_icon(/obj/item/organ/eyes/robotic::eye_icon, "[/obj/item/organ/eyes/robotic::eye_icon_state]_l"), ICON_OVERLAY)
		protogen_head.blend_icon(uni_icon(/obj/item/organ/eyes/robotic::eye_icon, "[/obj/item/organ/eyes/robotic::eye_icon_state]_r"), ICON_OVERLAY)

	var/datum/sprite_accessory/protogen/antennae = get_accessory_for_value(value)

	var/datum/universal_icon/icon_with_antennae = protogen_head.copy()
	icon_with_antennae.blend_icon(uni_icon(antennae.icon, "m_antennae_protogen_[antennae.icon_state]_ADJ"), ICON_OVERLAY)
	icon_with_antennae.scale(64, 64)
	icon_with_antennae.crop(15, 64 - 31, 15 + 31, 64)

	return icon_with_antennae

/datum/preference/choiced/species_feature/protogen_antennae/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["antennae_protogen"] = value

/datum/preference/choiced/species_feature/protogen_antennae/create_default_value()
	var/datum/sprite_accessory/protogen/antennae/default/antennae = /datum/sprite_accessory/protogen/antennae/default
	return initial(antennae.name)
