/obj/item/melee/energy/blade/hadar
	name = "Hadar heavy power-sword"
	desc = "A heavy-duty energy sword variant, builds offensive power when used in combat & provides great defense. \
			The offensive potential of this weapon is lost should it be unequipped."
	icon = 'hypermods/icons/obj/weapons/heavy_power_sword.dmi'
	icon_state = "hadar_sword2_low"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/heavy_power_sword_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/heavy_power_sword_righthand.dmi'
	inhand_icon_state = "hadar_sword2"
	worn_icon = 'hypermods/icons/mob/clothing/back.dmi'
	worn_icon_state = "hadar_sword2_low"
	base_icon_state = "hadar_sword2"
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	force = 25
	armour_penetration = 25
	block_chance = 30
	// Current power built by attacking living targets
	var/charge_state = 0

/obj/item/melee/energy/blade/hadar/Initialize(mapload)
	. = ..()
	apply_components()

/obj/item/melee/energy/blade/hadar/proc/apply_components()
	AddComponent(/datum/component/two_handed, require_twohands = TRUE)

/**
/obj/item/melee/energy/blade/hadar/proc/on_wield(obj/item/source, mob/living/carbon/user)

**/

/obj/item/melee/energy/blade/hadar/dropped(obj/item/source, mob/living/carbon/user)
	force = 25
	charge_state = 0
	icon_state = "[base_icon_state]_low"
	inhand_icon_state = "[base_icon_state]"
	worn_icon_state = "[base_icon_state]_low"

/obj/item/melee/energy/blade/hadar/attack(mob/living/carbon/victim, mob/living/carbon/user)
	if(!isliving(victim))
		return ..()

	if(charge_state < 20)
		force = (force + 2.5)
		charge_state++

	switch(charge_state)
		if(0 to 9)
			icon_state = "[base_icon_state]_low"
			worn_icon_state = "[base_icon_state]_low"
		if(10 to 19)
			icon_state = "[base_icon_state]_med"
			worn_icon_state = "[base_icon_state]_med"
		if(20)
			icon_state = "[base_icon_state]_high"
			worn_icon_state = "[base_icon_state]_high"

	return ..()


/obj/item/melee/energy/blade/hadar/red
	icon_state = "hadar_sword1_low"
	inhand_icon_state = "hadar_sword1"
	worn_icon_state = "hadar_sword1_low"
	base_icon_state = "hadar_sword1"
