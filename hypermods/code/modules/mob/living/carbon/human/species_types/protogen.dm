/datum/species/protogen
	name = "Protogen"
	id = SPECIES_PROTOGEN
	mutant_organs = list(
		/obj/item/organ/snout/protogen = "Bolted",
		/obj/item/organ/tail/protogen = "Shark",
		/obj/item/organ/protogen_antennae = "Default",
	)
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
		TRAIT_TACKLING_TAILED_DEFENDER
	)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID
	meat = /obj/item/food/meat/slab/human/mutant/lizard
	mutantbrain = /obj/item/organ/brain/cybernetic
	mutanttongue = /obj/item/organ/tongue/robot
	mutantstomach = /obj/item/organ/stomach/cybernetic/surplus
	mutantappendix = null
	mutantheart = /obj/item/organ/heart/cybernetic/surplus
	mutantliver = /obj/item/organ/liver/cybernetic/surplus
	mutantlungs = /obj/item/organ/lungs/cybernetic/surplus
	mutanteyes = /obj/item/organ/eyes/robotic
	mutantears = /obj/item/organ/ears/cybernetic
	species_language_holder = /datum/language_holder/synthetic
	damage_modifier = -25 // 25% More damage
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/robot/protogen,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/robot/protogen,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/robot/protogen,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/robot/protogen,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/robot/protogen,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/robot/protogen,
	)
	digitigrade_customization = DIGITIGRADE_OPTIONAL
	death_sound = 'sound/mobs/non-humanoids/cyborg/borg_deathsound.ogg'


/datum/species/protogen/check_roundstart_eligible()
	if(check_holidays(APRIL_FOOLS))
		return TRUE
	return ..()


/datum/species/protogen/prepare_human_for_preview(mob/living/carbon/human/human)
	human.dna.features["mcolor"] = "#b7b4ab"
	human.dna.features["snout_protogen"] = "Bolted"
	human.dna.features["antennae_protogen"] = "Default"
	human.eye_color_left = "#ffffff"
	human.eye_color_right = "#ffffff"
	human.update_body(is_creating = TRUE)

/datum/species/protogen/get_physical_attributes()
	return "Suited with a visor and a full set of robotic organs, these critters are useful for most, if not all, station jobs and can adapt to different workplaces efficiently. \
	That said, an EMP will devastate them if they come into contact with one."

/datum/species/protogen/get_species_description()
	return "The protogen are a cybernetically-augmented species meant for long space ventures,  \
		hired by Nanotrasen in a collaborative effort due to their workplace efficiency and \
		their main directive of obtaining knowledge through intergalactic exploration."
	return "The protogen are a cybernetically-augmented species optimized for long space ventures.  \
		They were hired by Nanotrasen in a collaborative effort thanks to their workplace efficiency and \
		their innate motivation to obtain knowledge through intergalactic exploration."

/datum/species/protogen/get_species_lore()
	return list(
		"Not much is known about this species, due to their very recent arrival on Nanotrasen vessels.",

		"Crewmembers have reported that these new coworkers have been very helpful and \"eager to assist\". \
		Their presence has alerted the remarks from technophobes, and although they raise some valid concerns due to the mysterious aura surrounding \
		the species and their origins, it is nonetheless a very debated topic if they should stay or not.",
		"Crewmembers have reported that their new coworkers have been very helpful and \"eager to assist\". \
		Despite this, the protogens' presence has garnered harsh criticism regarding the mysterious aura surrounding \
		the species and their origins. Their employment continues to be a hotly debated topic on Nanotrasen stations.",
	)


/obj/item/bodypart/head/robot/protogen
	icon_greyscale = 'hypermods/icons/mob/human/species/protogen/protogen_bodyparts.dmi'
	limb_id = SPECIES_PROTOGEN
	change_exempt_flags = NONE
	head_flags = HEAD_HAIR | HEAD_EYESPRITES | HEAD_EYECOLOR
	should_draw_greyscale = TRUE

/obj/item/bodypart/chest/robot/protogen
	icon_greyscale = 'hypermods/icons/mob/human/species/protogen/protogen_bodyparts.dmi'
	limb_id = SPECIES_PROTOGEN
	wing_types = NONE
	change_exempt_flags = NONE
	should_draw_greyscale = TRUE
	is_dimorphic = TRUE

/obj/item/bodypart/arm/left/robot/protogen
	icon_greyscale = 'hypermods/icons/mob/human/species/protogen/protogen_bodyparts.dmi'
	limb_id = SPECIES_PROTOGEN
	change_exempt_flags = NONE
	should_draw_greyscale = TRUE

/obj/item/bodypart/arm/right/robot/protogen
	icon_greyscale = 'hypermods/icons/mob/human/species/protogen/protogen_bodyparts.dmi'
	limb_id = SPECIES_PROTOGEN
	change_exempt_flags = NONE
	should_draw_greyscale = TRUE

/obj/item/bodypart/leg/left/robot/protogen
	icon_greyscale = 'hypermods/icons/mob/human/species/protogen/protogen_bodyparts.dmi'
	limb_id = SPECIES_PROTOGEN
	change_exempt_flags = NONE
	should_draw_greyscale = TRUE

/obj/item/bodypart/leg/right/robot/protogen
	icon_greyscale = 'hypermods/icons/mob/human/species/protogen/protogen_bodyparts.dmi'
	limb_id = SPECIES_PROTOGEN
	change_exempt_flags = NONE
	should_draw_greyscale = TRUE


//Organ
/obj/item/organ/snout/protogen
	name = "protogen snout"
	desc = "Take a closer look at that snout!"
	icon_state = "snout"
	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_SNOUT
	external_bodyshapes = BODYSHAPE_SNOUTED
	dna_block = /datum/dna_block/feature/accessory/protogen_snout
	restyle_flags = EXTERNAL_RESTYLE_FLESH
	bodypart_overlay = /datum/bodypart_overlay/mutant/snout/protogen

//Overlay
/datum/bodypart_overlay/mutant/snout/protogen
	feature_key = FEATURE_PROTOGEN_SNOUT

/datum/bodypart_overlay/mutant/snout/protogen/on_mob_insert(obj/item/organ/parent, mob/living/carbon/human/receiver)
	if(imprint_on_next_insertion && !receiver.dna.features[feature_key])
		receiver.dna.features[feature_key] = pick(SSaccessories.feature_list[feature_key])
		receiver.dna.update_uf_block(/datum/dna_block/feature/accessory/protogen_snout)

	return ..()

//Sprites
/datum/sprite_accessory/protogen

/datum/sprite_accessory/protogen/snout
	icon = 'hypermods/icons/mob/human/species/protogen/protogen_snouts.dmi'
	em_block = TRUE

/datum/sprite_accessory/protogen/snout/regular
	name = "Regular"
	icon_state = "regular"

/datum/sprite_accessory/protogen/snout/bolted
	name = "Bolted"
	icon_state = "withbolt"


//Organ
/obj/item/organ/protogen_antennae
	name = "protogen antennae"
	desc = "A protogen's metallic antennae."
	icon_state = "antennae"
	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_ANTENNAE
	dna_block = /datum/dna_block/feature/accessory/protogen_antennae
	bodypart_overlay = /datum/bodypart_overlay/mutant/protogen_antennae

//Overlay
/datum/bodypart_overlay/mutant/protogen_antennae
	feature_key = FEATURE_PROTOGEN_ANTENNAE
	layers = EXTERNAL_ADJACENT
	color_source = ORGAN_COLOR_HAIR

/datum/bodypart_overlay/mutant/protogen_antennae/on_mob_insert(obj/item/organ/parent, mob/living/carbon/human/receiver)
	if(imprint_on_next_insertion && !receiver.dna.features[feature_key])
		receiver.dna.features[feature_key] = pick(SSaccessories.feature_list[feature_key])
		receiver.dna.update_uf_block(/datum/dna_block/feature/accessory/protogen_antennae)

	return ..()

//Sprites
/datum/sprite_accessory/protogen/antennae
	icon = 'hypermods/icons/mob/human/species/protogen/protogen_antennas.dmi'

/datum/sprite_accessory/protogen/antennae/default
	name = "Default"
	icon_state = "default"

/datum/sprite_accessory/protogen/antennae/curled
	name = "Curled"
	icon_state = "curled"

/datum/sprite_accessory/protogen/antennae/thick
	name = "Thick"
	icon_state = "thick"

/datum/sprite_accessory/protogen/antennae/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/protogen/antennae/sharp
	name = "Sharp"
	icon_state = "sharp"

/datum/sprite_accessory/protogen/antennae/horns
	name = "Horns"
	icon_state = "horns"


//Organ
/obj/item/organ/tail/protogen
	name = "protogen tail"
	desc = "A severed protogen tail. Surprisingly sturdy."
	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/protogen
	wag_flags = WAG_ABLE
	dna_block = /datum/dna_block/feature/accessory/protogen_tail

//Overlay
/datum/bodypart_overlay/mutant/tail/protogen
	feature_key = FEATURE_PROTOGEN_TAIL
	color_source = ORGAN_COLOR_HAIR

/datum/bodypart_overlay/mutant/tail/protogen/on_mob_insert(obj/item/organ/parent, mob/living/carbon/human/receiver)
	if(imprint_on_next_insertion && !receiver.dna.features[feature_key])
		receiver.dna.features[feature_key] = pick(SSaccessories.feature_list[feature_key])
		receiver.dna.update_uf_block(/datum/dna_block/feature/accessory/protogen_tail)

	return ..()

//Sprites
/datum/sprite_accessory/tails/protogen
	icon = 'hypermods/icons/mob/human/species/protogen/protogen_tails.dmi'
	spine_key = "proto"

/datum/sprite_accessory/tails/protogen/synthliz
	name = "Synthliz"
	icon_state = "synthliz"

/datum/sprite_accessory/tails/protogen/shark
	name = "Shark"
	icon_state = "shark"

/datum/sprite_accessory/tails/protogen/wolf
	name = "Wolf"
	icon_state = "wolf"
