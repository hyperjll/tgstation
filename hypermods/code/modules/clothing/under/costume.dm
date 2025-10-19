/obj/item/clothing/under/costume/kimono/blue
	name = "blue kimono"
	desc = "A luxurious blue silk kimono with traditional flair, originally procured after many complaints of a certain employee who kept dying their kimono's blue."
	icon = 'hypermods/icons/obj/clothing/under/costume.dmi'
	icon_state = "kimono4"
	lefthand_file = "hypermods/icons/mob/inhands/clothing/suits_lefthand.dmi"
	righthand_file = "hypermods/icons/mob/inhands/clothing/suits_righthand.dmi"
	inhand_icon_state = "kimono4"
	worn_icon = 'hypermods/icons/mob/clothing/under/costume.dmi'


/obj/item/clothing/under/syndicate/syndimaid
	name = "'Tactical' maid outfit?"
	desc = "A 'tactical' turtleneck fashioned to the likeness of a maid outfit. Tailored by a assistant out to mock fallen syndicate agents whose bomb have failed to explode. You have a feeling these aren't very protective..."
	icon = 'hypermods/icons/obj/clothing/under/costume.dmi'
	worn_icon = 'hypermods/icons/mob/clothing/under/costume.dmi'
	icon_state = "syndimaid"
	has_sensor = HAS_SENSORS
	can_adjust = FALSE

/obj/item/clothing/under/syndicate/syndimaid/real
	name = "'Tactical maid outfit"
	desc = "A 'tactical' turtleneck fashioned to the likeness of a maid outfit. Why the Syndicate has these, you'll never know."
	armor_type = /datum/armor/syndimaid_arms

/datum/armor/syndimaid_arms
	melee = 10
	bio = 10
	fire = 50
	acid = 40
