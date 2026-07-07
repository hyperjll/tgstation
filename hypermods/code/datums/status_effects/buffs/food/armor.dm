/datum/status_effect/food/armor
	id = "food_armor"
	alert_type = /atom/movable/screen/alert/status_effect/food/armor
	// What kind of armor is gifted to the item it's used upon?
	var/target_armor_type = ACID
	// How much armor do we give? The complexity of the dish (1-5) is added afterward.
	var/armor_increase = 5

/atom/movable/screen/alert/status_effect/food/armor
	name = "Armor Shield"
	desc = "Grants resistance to damage."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "food_armor"

/datum/status_effect/food/armor/on_creation(mob/living/new_owner, timeout_mod = 1, strength = 1)
	armor_increase += strength
	. = ..()

/datum/status_effect/food/armor/on_apply()
	if(ishuman(owner))
		var/mob/living/our_mob = owner
		var/datum/armor/our_armor = our_mob.get_armor()
		var/list/armorlist = our_armor.get_rating_list()

		armorlist[target_armor_type] += armor_increase
		our_mob.set_armor(our_armor.generate_new_with_specific(armorlist))

	return ..()

/datum/status_effect/food/armor/on_remove()
	. = ..()
	if(ishuman(owner))
		var/mob/living/our_mob = owner
		var/datum/armor/our_armor = our_mob.get_armor()
		var/list/armorlist = our_armor.get_rating_list()

		armorlist[target_armor_type] -= armor_increase
		our_mob.set_armor(our_armor.generate_new_with_specific(armorlist))

/datum/status_effect/food/armor/be_replaced()
	if(ishuman(owner))
		var/mob/living/our_mob = owner
		var/datum/armor/our_armor = our_mob.get_armor()
		var/list/armorlist = our_armor.get_rating_list()

		armorlist[target_armor_type] -= armor_increase
		our_mob.set_armor(our_armor.generate_new_with_specific(armorlist))
	. = ..()

/datum/status_effect/food/armor/acid
	id = "food_acid_armor"
	alert_type = /atom/movable/screen/alert/status_effect/food/armor/acid
	target_armor_type = ACID

/atom/movable/screen/alert/status_effect/food/armor/acid
	name = "Acid Shield"
	desc = "Grants resistance to acidic damage."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "food_acid_armor"

/datum/status_effect/food/armor/bio
	id = "food_bio_armor"
	alert_type = /atom/movable/screen/alert/status_effect/food/armor/bio
	target_armor_type = BIO

/atom/movable/screen/alert/status_effect/food/armor/bio
	name = "Bio Shield"
	desc = "Grants resistance to biological attacks."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "food_bio_armor"

/datum/status_effect/food/armor/bomb
	id = "food_bomb_armor"
	alert_type = /atom/movable/screen/alert/status_effect/food/armor/bomb
	target_armor_type = BOMB

/atom/movable/screen/alert/status_effect/food/armor/bomb
	name = "Bomb Shield"
	desc = "Grants resistance to explosions."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "food_bomb_armor"

/datum/status_effect/food/armor/bullet
	id = "food_bullet_armor"
	alert_type = /atom/movable/screen/alert/status_effect/food/armor/bullet
	target_armor_type = BULLET

/atom/movable/screen/alert/status_effect/food/armor/bullet
	name = "Bullet Shield"
	desc = "Grants resistance to bullets."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "food_bullet_armor"

/datum/status_effect/food/armor/energy
	id = "food_energy_armor"
	alert_type = /atom/movable/screen/alert/status_effect/food/armor/energy
	target_armor_type = ENERGY

/atom/movable/screen/alert/status_effect/food/armor/energy
	name = "Energy Shield"
	desc = "Grants resistance to energy attacks."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "food_energy_armor"

/datum/status_effect/food/armor/fire
	id = "food_fire_armor"
	alert_type = /atom/movable/screen/alert/status_effect/food/armor/fire
	target_armor_type = FIRE

/atom/movable/screen/alert/status_effect/food/armor/fire
	name = "Fire Shield"
	desc = "Grants resistance to fire."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "food_fire_armor"

/datum/status_effect/food/armor/laser
	id = "food_laser_armor"
	alert_type = /atom/movable/screen/alert/status_effect/food/armor/laser
	target_armor_type = LASER

/atom/movable/screen/alert/status_effect/food/armor/laser
	name = "Laser Shield"
	desc = "Grants resistance to laser attacks."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "food_laser_armor"

/datum/status_effect/food/armor/melee
	id = "food_melee_armor"
	alert_type = /atom/movable/screen/alert/status_effect/food/armor/melee
	target_armor_type = MELEE

/atom/movable/screen/alert/status_effect/food/armor/melee
	name = "Melee Shield"
	desc = "Grants resistance to melee attacks."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "food_melee_armor"

/datum/status_effect/food/armor/wound
	id = "food_wound_armor"
	alert_type = /atom/movable/screen/alert/status_effect/food/armor/wound
	target_armor_type = WOUND

/atom/movable/screen/alert/status_effect/food/armor/wound
	name = "Wound Shield"
	desc = "Grants resistance to wounds."
	overlay_icon = 'hypermods/icons/hud/screen_alert.dmi'
	overlay_state = "food_wound_armor"
