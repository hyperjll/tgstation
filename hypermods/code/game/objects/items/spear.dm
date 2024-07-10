/*
 * Energy Spear
 */

/obj/item/spear/energy
	icon = 'hypermods/icons/obj/weapons/transforming_energy.dmi'
	icon_state = "espearred0"
	base_icon_state = "espearred"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/polearms_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/polearms_righthand.dmi'
	name = "energy spear"
	desc = "A robust and deadly weapon of ancient design fitted with hardlight technology."
	force = 8
	force_unwielded = 8
	force_wielded = 40
	max_integrity = 2500
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	throwforce = 80
	throw_speed = 4
	throw_range = 10
	embed_type = /datum/embed_data/espear
	armour_penetration = 60
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb_continuous = list("attacks", "pokes", "jabs", "tears", "lacerates", "gores")
	attack_verb_simple = list("attack", "poke", "jab", "tear", "lacerate", "gore")
	sharpness = SHARP_EDGED
	armor_type = /datum/armor/item_energyspear
	wound_bonus = 10
	bare_wound_bonus = 25
	block_chance = 20

/datum/embed_data/espear
	embed_chance = 100
	impact_pain_mult = 2
	remove_pain_mult = 4
	jostle_chance = 2.5

/datum/armor/item_energyspear
	fire = 100
	acid = 50

/obj/item/spear/energy/red
	icon_state = "espearred0"
	base_icon_state = "espearred"
	icon_prefix = "espearred"

/obj/item/spear/energy/blue
	icon_state = "espearblue0"
	base_icon_state = "espearblue"
	icon_prefix = "espearblue"

/obj/item/spear/energy/green
	icon_state = "espeargreen0"
	base_icon_state = "espeargreen"
	icon_prefix = "espeargreen"

/obj/item/spear/energy/purple
	icon_state = "espearpurple0"
	base_icon_state = "espearpurple"
	icon_prefix = "espearpurple"
