/obj/item/clothing/gloves/fingerless/bigboss
	siemens_coefficient = 0
	clothing_traits = list(TRAIT_QUICKER_CARRY, TRAIT_FAST_CUFFING, TRAIT_PLANT_SAFE, TRAIT_FASTMED, TRAIT_QUICK_BUILD, TRAIT_CAN_SIGN_ON_COMMS, TRAIT_DOUBLE_TAP)


/obj/item/clothing/gloves/syndimaid_arms
	name = "''Combat'' maid sleeves"
	desc = "That's some ''Combat'' maid sleeves. These ''tactical'' gloves and sleeves while looking nice, seems to be made with the cheapest materials maintenance could provide. You have a feeling these aren't very protective..."
	icon = 'hypermods/icons/obj/clothing/gloves.dmi'
	worn_icon = 'hypermods/icons/mob/clothing/hands.dmi'
	icon_state = "syndimaid_arms"
	inhand_icon_state = null
	greyscale_colors = null

/obj/item/clothing/gloves/syndimaid_arms/real
	name = "Combat maid sleeves"
	desc = "These 'tactical' gloves and sleeves are fireproof and electrically insulated. Warm to boot."
	greyscale_colors = null
	siemens_coefficient = 0
	strip_delay = 80
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	armor_type = /datum/armor/syndimaid_arms

/datum/armor/syndimaid_arms
	bio = 90
	fire = 80
	acid = 50
