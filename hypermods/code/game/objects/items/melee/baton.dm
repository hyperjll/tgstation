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

/obj/item/melee/baton/donkbat/toy
	force = 0
	stamina_damage = 4
	knockdown_time = 0 SECONDS


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


/obj/item/melee/baton/security/antaglocked
	name = "stun baton"
	security_lock = TRUE

/obj/item/melee/baton/security/antaglocked/examine(mob/user)
	. = ..()
	. += "This stun baton has a A.N.T.A.G Locker installed."

/obj/item/melee/baton/security/antaglocked/dropped()
	if(active)
		turn_off()

/obj/item/melee/baton/security/antaglocked/emag_act()
	if(security_lock)
		playsound(src, SFX_SPARKS, 15, TRUE)
		if(active)
			turn_off()
		security_lock = FALSE

/obj/item/antaglocker
	name = "A.N.T.A.G Lock"
	desc = "The Anti-Non-Trained-Assignee-Gate (or ANTAG) is an electronic upgrade for NT's stun baton design. It connects directly to Nanotrasen's Security Database to verify the neural patterns of the user. "
	icon = 'hypermods/icons/obj/devices/circuitry_n_data.dmi'
	icon_state = "antaglocker"
	custom_price = PAYCHECK_COMMAND * 8
