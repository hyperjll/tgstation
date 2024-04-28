/obj/item/clothing/head/helmet/webhelmet
	name = "web helmet"
	desc = "A sturdy helmet outfitted with extensive webbing and armor plating. It's strangely light-weight and easy to take off and on."
	icon = 'hypermods/icons/obj/clothing/head/helmet.dmi'
	icon_state = "webhelmet"
	worn_icon = 'hypermods/icons/mob/clothing/head/helmet.dmi'
	worn_icon_state = "webhelmet"
	inhand_icon_state = "helmet"
	armor_type = /datum/armor/webhelmet
	dog_fashion = null

/datum/armor/webhelmet
	melee = 35
	bullet = 65
	laser = 35
	energy = 35
	bomb = 60
	bio = 15
	fire = 60
	acid = 60
	wound = 45

/obj/item/clothing/head/helmet/webhelmet/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/seclite_attachable, light_icon_state = "flight")
