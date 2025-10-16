// Time
// Slowly restore's the wearer's youth.
/obj/item/clothing/suit/hooded/cultrobes/eldritch/time
	name = "\improper Clockwork Cloak"
	desc = "Caked in gold, ivory marble a singular clock sits ticking. Neither light nor shadow escapes the clock. \
		Another countdown to the universe's expire."
	icon = 'hypermods/icons/obj/clothing/suits/armor.dmi'
	worn_icon = 'hypermods/icons/mob/clothing/suits/armor.dmi'
	icon_state = "time_armor"
	hoodtype = /obj/item/clothing/head/hooded/cult_hoodie/eldritch/time
	armor_type = /datum/armor/eldritch_armor/time
	slowdown = -0.05

/obj/item/clothing/suit/hooded/cultrobes/eldritch/time/on_robes_gained(mob/living/user)
	if(!isliving(user))
		return
	START_PROCESSING(SSobj, src)

/obj/item/clothing/suit/hooded/cultrobes/eldritch/time/on_robes_lost(mob/living/user)
	if(!isliving(user))
		return
	STOP_PROCESSING(SSobj, src)

/obj/item/clothing/suit/hooded/cultrobes/eldritch/time/robes_side_effect(mob/living/user)
	if(!iscarbon(user))
		return
	var/mob/living/carbon/human/victim = user
	victim.age += 0.2

	if(!victim.has_status_effect(/datum/status_effect/rapidaging))
		victim.apply_status_effect(/datum/status_effect/rapidaging/lesser)

/obj/item/clothing/suit/hooded/cultrobes/eldritch/time/process(seconds_per_tick)
	var/mob/living/carbon/human/wearer = loc
	if(iscarbon(wearer) && wearer.age >= 18)
		wearer.age -= 0.1

/obj/item/clothing/head/hooded/cult_hoodie/eldritch/time
	name = "\improper Clockwork Cloak"
	desc = "Caked in gold, ivory marble a singular clock sits ticking. Neither light nor shadow escapes the clock. \
		Another countdown to the universe's expire."
	icon = 'hypermods/icons/obj/clothing/head/helmet.dmi'
	worn_icon = 'hypermods/icons/mob/clothing/head/helmet.dmi'
	icon_state = "time_armor"
	armor_type = /datum/armor/eldritch_armor/time
	slowdown = -0.05

/datum/armor/eldritch_armor/time
	melee = 50
	bullet = 50
	laser = 50
	energy = 50
	bomb = 35
	bio = 20
	fire = 20
	acid = 20
	wound = 20
