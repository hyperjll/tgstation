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


/obj/item/clothing/suit/hooded/syndicommand
	name = "\improper Syndicate command armor"
	desc = "An armored space suit, not for your average expendable chumps. No sir."
	icon_state = "indusred"
	icon = 'hypermods/icons/obj/clothing/suits/suit.dmi'
	worn_icon = 'hypermods/icons/mob/clothing/suits/suit.dmi'
	worn_icon_state = "indusred"
	lefthand_file = 'hypermods/icons/mob/inhands/clothing/suit_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/clothing/suit_righthand.dmi'
	inhand_icon_state = "indusred"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	siemens_coefficient = 0.1
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL
	allowed = list(/obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	hoodtype = /obj/item/clothing/head/hooded/syndicommand
	armor_type = /datum/armor/suit_syndicommand

/datum/armor/suit_syndicommand
	melee = 25
	bullet = 25
	laser = 25
	energy = 25
	bomb = 35
	bio = 100
	fire = 50
	acid = 90
	wound = 25

/obj/item/clothing/head/hooded/syndicommand
	name = "\improper Syndicate Command Helmet"
	desc = "Ooh, fancy."
	icon_state = "indusred"
	icon = 'hypermods/icons/obj/clothing/head/spacehelm.dmi'
	worn_icon = 'hypermods/icons/mob/clothing/head/spacehelm.dmi'
	worn_icon_state = "indusred"
	body_parts_covered = HEAD
	cold_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	siemens_coefficient = 0.1
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEHAIR|HIDEEARS
	armor_type = /datum/armor/hood_syndicommand

/datum/armor/hood_syndicommand
	melee = 25
	bullet = 25
	laser = 25
	energy = 25
	bomb = 35
	bio = 100
	fire = 50
	acid = 90
	wound = 25


/obj/item/clothing/suit/armor/suicide
	name = "suicide vest"
	desc = "A bulletproof vest that has been fitted with high-end explosive charges. Some kind of mechanical mechanism locks into one's flesh to prevent removal."
	icon = 'hypermods/icons/obj/clothing/suits/armor.dmi'
	icon_state = "suicide"
	worn_icon = 'hypermods/icons/mob/clothing/suits/armor.dmi'
	worn_icon_state = "suicide"
	blood_overlay_type = "armor"
	actions_types = list(/datum/action/item_action/suicidevest)
	var/vestprimed = FALSE // Are we already about to explode?
	var/delay = 1 SECONDS // Delay between beeps
	var/bomb_beeps_until_boom = 10 // How many beeps till we explode? This * delay = time
	var/equipped // are we equipped?

/datum/action/item_action/suicidevest
	name = "Suicide Bomb"
	desc = "Prime the suicide vest and take those bastards with you."
	button_icon = 'hypermods/icons/obj/clothing/suits/armor.dmi'
	button_icon_state = "suicide"

/obj/item/clothing/suit/armor/suicide/equipped(mob/user, slot)
	. = ..()
	if(slot_flags & slot)
		ADD_TRAIT(src, TRAIT_NODROP, STICKY_CLOTHING_TRAIT)
		equipped = TRUE

/obj/item/clothing/suit/armor/suicide/ui_action_click(mob/user, action)
	if(!isliving(user))
		return

	if(vestprimed)
		to_chat(user, span_warning("It's too late to regret your decisions."))
		return

	if(!equipped)
		to_chat(user, span_warning("[src] must be worn to activate."))
		return

	vestprimed = TRUE

	while(bomb_beeps_until_boom > 0)
		//for extra spice
		var/beep_volume = 35
		playsound(loc, 'sound/items/timer.ogg', beep_volume, vary = FALSE)
		sleep(delay)
		bomb_beeps_until_boom--
		beep_volume += 5
	explosion(src,3,6,12, flame_range = 9) // pretty massive.
	qdel(src)

/obj/item/clothing/suit/armor/suicide/wirecutter_act(mob/living/user, obj/item/tool)
	if(!isliving(user)) // Just checking.
		return

	balloon_alert(user, "picking a wire to snip...")

	if(!do_after(user, 10 SECONDS))
		balloon_alert(user, "interrupted!")
		return

	if(prob(75))
		explosion(src,1,3,8, flame_range = 5) // not as bad as a manual detonation
		qdel(src)
	else
		to_chat(user, span_notice("You snip a wire, and the vest harmlessly falls apart!"))
		qdel(src)
