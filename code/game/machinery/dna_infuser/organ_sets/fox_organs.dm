/obj/item/organ/ears/fox
	name = "fox ears"
	icon = 'icons/obj/clothing/head/costume.dmi'
	worn_icon = 'icons/mob/clothing/head/costume.dmi'
	icon_state = "kitty"
	visual = TRUE
	damage_multiplier = 2

	dna_block = /datum/dna_block/feature/accessory/ears
	bodypart_overlay = /datum/bodypart_overlay/mutant/cat_ears
	sprite_accessory_override = /datum/sprite_accessory/ears/fox

/obj/item/organ/tail/fox
	name = "fox tail"
	desc = "A severed fox tail. It's wonderfully fluffy."
	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/fox
	wag_flags = WAG_ABLE
	dna_block = /datum/dna_block/feature/accessory/fox_tail

/datum/bodypart_overlay/mutant/tail/fox
	feature_key = FEATURE_FOX_TAIL
	color_source = ORGAN_COLOR_HAIR

/datum/bodypart_overlay/mutant/tail/fox/on_mob_insert(obj/item/organ/parent, mob/living/carbon/receiver)
	if(imprint_on_next_insertion && !receiver.dna.features[feature_key])
		receiver.dna.features[feature_key] = pick(SSaccessories.feature_list[feature_key])
		receiver.dna.update_uf_block(/datum/dna_block/feature/accessory/fox_tail)

	return ..()
