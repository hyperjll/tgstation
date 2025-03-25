/obj/item/clothing/suit/hooded/carp_costume/spaceproof/syndi
	name = "carp costume"
	desc = "A costume made from 'synthetic' carp scales, it smells."
	icon_state = "carp_casual"
	icon = 'icons/obj/clothing/suits/costume.dmi'
	worn_icon = 'icons/mob/clothing/suits/costume.dmi'
	inhand_icon_state = "labcoat"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	siemens_coefficient = 0.5
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL
	allowed = list(/obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/gun/ballistic/rifle/boltaction/harpoon)
	hoodtype = /obj/item/clothing/head/hooded/carp_hood/spaceproof/syndi
	armor_type = /datum/armor/carp_costume_spaceproof_syndi

/datum/armor/carp_costume_spaceproof_syndi
	bio = 100
	fire = 60
	acid = 75

/obj/item/clothing/head/hooded/carp_hood/spaceproof/syndi
	name = "carp hood"
	desc = "A hood attached to a carp costume."
	icon = 'icons/obj/clothing/head/costume.dmi'
	worn_icon = 'icons/mob/clothing/head/costume.dmi'
	icon_state = "carp_casual"
	body_parts_covered = HEAD
	cold_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	siemens_coefficient = 0.5
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEHAIR|HIDEEARS
	armor_type = /datum/armor/carp_hood_spaceproof_syndi

/datum/armor/carp_hood_spaceproof_syndi
	bio = 100
	fire = 60
	acid = 75


/obj/item/clothing/suit/hooded/bee_costume/spaceproof // It's Hip to F-
	name = "bee costume"
	desc = "Bee the true Queen!"
	icon_state = "bee"
	icon = 'icons/obj/clothing/suits/costume.dmi'
	worn_icon = 'icons/mob/clothing/suits/costume.dmi'
	inhand_icon_state = "labcoat"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL
	hoodtype = /obj/item/clothing/head/hooded/bee_hood/spaceproof

/obj/item/clothing/suit/hooded/bee_costume/spaceproof/nukie
	hoodtype = /obj/item/clothing/head/hooded/bee_hood/spaceproof/nukie
	armor_type = /datum/armor/bee_costume_spaceproof

/datum/armor/bee_costume_spaceproof
	bio = 100
	fire = 60
	acid = 75
	bullet = 15
	laser = 15
	energy = 15
	melee = 20

/obj/item/clothing/head/hooded/bee_hood/spaceproof
	name = "bee hood"
	desc = "A hood attached to a bee costume."
	icon = 'icons/obj/clothing/head/costume.dmi'
	worn_icon = 'icons/mob/clothing/head/costume.dmi'
	icon_state = "bee"
	body_parts_covered = HEAD
	cold_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL
	flags_inv = HIDEHAIR|HIDEEARS

/obj/item/clothing/head/hooded/bee_hood/spaceproof/nukie
	armor_type = /datum/armor/bee_hood_spaceproof

/datum/armor/bee_hood_spaceproof
	bio = 100
	fire = 60
	acid = 75
	bullet = 15
	laser = 15
	energy = 15
	melee = 20
