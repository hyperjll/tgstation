/obj/item/grenade/spawnergrenade/bananapeel
	name = "banana grenade"
	desc = "It will unleash a bunch of banana peels directly onto the masses. Simply peel the banana to prime."
	icon = 'hypermods/icons/obj/weapons/grenade.dmi'
	icon_state = "banananew"
	spawner_type = /obj/item/grown/bananapeel
	deliveryamt = 10

/obj/item/grenade/spawnergrenade/bananapeel/super
	spawner_type = /obj/item/grown/bananapeel/super

/obj/item/grenade/spawnergrenade/minisyndies
	name = "pipebomb"
	desc = "An improvised explosive device. You can hear muffled tiny screams inside."
	icon = 'hypermods/icons/obj/weapons/grenade.dmi'
	icon_state = "pipebomb-minisyndi"
	spawner_type = /mob/living/basic/trooper/syndicate/ranged/smg/space/tiny
	deliveryamt = 5

/obj/item/grenade/spawnergrenade/darkness
	name = "flashbang"
	desc = "It has an adjustable timer. It looks kinda... off."
	icon_state = "flashbang"
	inhand_icon_state = "flashbang"
	lefthand_file = 'icons/mob/inhands/equipment/security_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/security_righthand.dmi'
	spawner_type = /obj/item/flashlight/spotlight/darkness
	deliveryamt = 1
