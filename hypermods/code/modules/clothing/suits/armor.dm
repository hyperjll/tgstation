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
