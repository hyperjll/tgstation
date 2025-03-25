/obj/item/clothing/under/chameleon/armored
	armor_type = /datum/armor/clothing_under/chameleon/armored

/datum/armor/clothing_under/chameleon/armored
	melee = 25
	bullet = 25
	laser = 25
	energy = 25
	bomb = 30
	bio = 5
	fire = 60
	acid = 60
	wound = 20

// Cham suit / armor
/datum/armor/suit_chameleon
	melee = 10
	bullet = 10
	laser = 10
	fire = 50
	acid = 50

/obj/item/clothing/gloves/chameleon/armored
	siemens_coefficient = 0
	armor_type = /datum/armor/gloves_chameleon/armored

/datum/armor/gloves_chameleon/armored
	melee = 25
	bullet = 25
	laser = 20
	energy = 10
	bomb = 20
	bio = 10
	fire = 70
	acid = 70

/obj/item/clothing/neck/chameleon/armored
	armor_type = /datum/armor/neck_chameleon/armored

/obj/item/clothing/gloves/chameleon/conductive
	desc = "These gloves provide protection against electric shock. The thickness of the rubber makes your fingers seem bigger."
	name = "insulated gloves"
	icon_state = "yellow"
	siemens_coefficient = 4 // The catch, if you will.
	inhand_icon_state = "ygloves"
	armor_type = /datum/armor/color_yellow
	resistance_flags = NONE
	custom_price = PAYCHECK_CREW * 10
	custom_premium_price = PAYCHECK_COMMAND * 6
	clothing_traits = list(TRAIT_CHUNKYFINGERS)

/datum/armor/neck_chameleon/armored
	melee = 15
	bullet = 15
	laser = 15
	energy = 15
	bomb = 15
	bio = 30
	fire = 50
	acid = 50
	wound = 10
