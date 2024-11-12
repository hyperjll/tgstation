/obj/item/clothing/suit/armor/webvest
	name = "web vest"
	desc = "A bulletproof vest that has been fitted with additional webbing and armor plates for additional protection. It's strangely light-weight and easy to take off and on."
	icon = 'hypermods/icons/obj/clothing/suits/armor.dmi'
	icon_state = "webvest"
	inhand_icon_state = "webvest"
	worn_icon = 'hypermods/icons/mob/clothing/suits/armor.dmi'
	worn_icon_state = "webvest"
	blood_overlay_type = "armor"
	armor_type = /datum/armor/armor_webvest
	strip_delay = 120
	equip_delay_other = 80
	allowed = list(
		/obj/item/gun,
		/obj/item/gun/ballistic/shotgun,
		/obj/item/gun/ballistic/automatic,
		/obj/item/gun/ballistic/rifle,
		/obj/item/gun/ballistic/rocketlauncher,
		/obj/item/gun/energy/laser,
		/obj/item/gun/energy/e_gun,
		)

/datum/armor/armor_webvest
	melee = 35
	bullet = 65
	laser = 35
	energy = 35
	bomb = 60
	bio = 15
	fire = 60
	acid = 60
	wound = 45


/obj/item/clothing/suit/hooded/syndicommand
	name = "\improper Syndicate command armor"
	desc = "An armored space suit, not for your average expendable chumps. No sir."
	icon_state = "indusred"
	icon = 'hypermods/icons/obj/clothing/suits/suit.dmi'
	worn_icon = 'hypermods/icons/mob/clothing/suits/suit.dmi'
	worn_icon_state = "indusred"
	lefthand_file = 'hypermods/icons/mob/inhands/clothing/suit_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/clothing/suit_righthand.dmi'
	inhand_icon_state = "indusred"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	siemens_coefficient = 0.1
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL
	allowed = list(/obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	hoodtype = /obj/item/clothing/head/hooded/syndicommand
	armor_type = /datum/armor/suit_syndicommand

/datum/armor/suit_syndicommand
	melee = 25
	bullet = 25
	laser = 25
	energy = 25
	bomb = 35
	bio = 100
	fire = 50
	acid = 90
	wound = 25

/obj/item/clothing/head/hooded/syndicommand
	name = "\improper Syndicate Command Helmet"
	desc = "Ooh, fancy."
	icon_state = "indusred"
	icon = 'hypermods/icons/obj/clothing/head/spacehelm.dmi'
	worn_icon = 'hypermods/icons/mob/clothing/head/spacehelm.dmi'
	worn_icon_state = "indusred"
	body_parts_covered = HEAD
	cold_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	siemens_coefficient = 0.1
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEHAIR|HIDEEARS
	armor_type = /datum/armor/hood_syndicommand

/datum/armor/hood_syndicommand
	melee = 25
	bullet = 25
	laser = 25
	energy = 25
	bomb = 35
	bio = 100
	fire = 50
	acid = 90
	wound = 25
