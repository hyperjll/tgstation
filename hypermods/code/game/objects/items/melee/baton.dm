/obj/item/melee/baton/donkbat
	name = "toy baseball bat"
	desc = "A colorful foam baseball bat. The label on the handle reads Donksoft. Feels...heavy."
	icon = 'hypermods/icons/obj/weapons/bat.dmi'
	icon_state = "baseball_bat_donk"
	inhand_icon_state = "baseball_bat_donk"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/melee_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	force = 10
	stamina_damage = 40
	hitsound = 'hypermods/sound/weapons/bat_hit.ogg'
	on_stun_sound = 'hypermods/sound/weapons/bat_hit.ogg' // Grass grows, birds fly, sun shines, and brudda, i hurt people.
	on_stun_volume = 75

/obj/item/melee/baton/telescopic/sleep_baton
	name = "Incapacitation Baton"
	desc = "A compact, specialised baton once assigned to Syndicate contractors until being scrapped. The micro-injectors along the end will quickly inject knock-out drugs into targets."
	icon = 'icons/obj/weapons/baton.dmi'
	icon_state = "contractor_baton"
	worn_icon_state = "contractor_baton"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	item_flags = NONE
	force = 5
	stamina_damage = 45
	cooldown = 30 SECONDS
	affect_cyborg = FALSE
	on_stun_sound = 'sound/items/weapons/contractor_baton/contractorbatonhit.ogg'

	on_inhand_icon_state = "contractor_baton_on"
	on_sound = 'sound/items/weapons/contractorbatonextend.ogg'
	active_force = 16

/obj/item/melee/baton/telescopic/sleep_baton/additional_effects_non_cyborg(mob/living/target, mob/living/user)
	target.set_jitter_if_lower(20 SECONDS)
	target.set_stutter_if_lower(20 SECONDS)
	target.reagents.add_reagent(/datum/reagent/toxin/sodium_thiopental, 10)

/obj/item/melee/baton/telescopic/sleep_baton/get_wait_description()
	return span_danger("The baton is still charging!")
