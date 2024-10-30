/datum/mod_theme/raid
	name = "syndicate raid"
	desc = "A suit designed by Donk Co. and manufactured by Cybersun Industries. Provides great defense in urban situations."
	extended_desc = "A lightweight yet durable MODsuit produced by Donk Co. \
		Both 'Donk Co.' and 'Cybersun Industries' logos can be seen in tiny letters near the waist. \
		Capable only in non-space faring battles, and fairs exceptionally well in those scenarios."
	default_skin = "raid"
	armor_type = /datum/armor/mod_theme_raid
	atom_flags = PREVENT_CONTENTS_EXPLOSION_1
	complexity_max = DEFAULT_MAX_COMPLEXITY + 15
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	siemens_coefficient = 0
	slowdown_inactive = 0.25
	slowdown_active = 0.1
	ui_theme = "syndicate"
	resistance_flags = FIRE_PROOF
	inbuilt_modules = list(/obj/item/mod/module/armor_booster)
	allowed_suit_storage = list(
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
		/obj/item/melee/energy/sword,
		/obj/item/shield/energy,
	)
	variants = list(
		"raid" = list(
			/obj/item/clothing/head/mod = list(
				UNSEALED_LAYER = NECK_LAYER,
				UNSEALED_CLOTHING = SNUG_FIT,
				SEALED_CLOTHING = THICKMATERIAL|HEADINTERNALS,
				UNSEALED_INVISIBILITY = null,
				SEALED_INVISIBILITY = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT,
				SEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = SNUG_FIT,
				SEALED_CLOTHING = THICKMATERIAL,
				SEALED_INVISIBILITY = null,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = SNUG_FIT,
				SEALED_CLOTHING = THICKMATERIAL,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = SNUG_FIT,
				SEALED_CLOTHING = THICKMATERIAL,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
	)

/datum/armor/mod_theme_raid
	melee = 50
	bullet = 50
	laser = 40
	energy = 50
	bomb = 40
	fire = 100
	acid = 100
	wound = 35

/datum/mod_theme/raid/set_skin(obj/item/mod/control/mod, skin)
	mod.skin = skin
	var/list/used_skin = variants[skin]
	var/list/parts = mod.get_parts()
	for(var/obj/item/clothing/part as anything in parts)
		var/list/category = used_skin[part.type]
		var/datum/mod_part/part_datum = mod.get_part_datum(part)
		part_datum.unsealed_layer = category[UNSEALED_LAYER]
		part_datum.sealed_layer = category[SEALED_LAYER]
		part_datum.unsealed_message = category[UNSEALED_MESSAGE] || "No unseal message set! Tell a coder!"
		part_datum.sealed_message = category[SEALED_MESSAGE] || "No seal message set! Tell a coder!"
		part_datum.can_overslot = category[CAN_OVERSLOT] || FALSE
		part.clothing_flags = category[UNSEALED_CLOTHING] || NONE
		part.visor_flags = category[SEALED_CLOTHING] || NONE
		part.flags_inv = category[UNSEALED_INVISIBILITY] || NONE
		part.visor_flags_inv = category[SEALED_INVISIBILITY] || NONE
		part.flags_cover = category[UNSEALED_COVER] || NONE
		part.visor_flags_cover = category[SEALED_COVER] || NONE
		if(mod.get_part_datum(part).sealed)
			part.clothing_flags |= part.visor_flags
			part.flags_inv |= part.visor_flags_inv
			part.flags_cover |= part.visor_flags_cover
			part.alternate_worn_layer = part_datum.sealed_layer
		else
			part.alternate_worn_layer = part_datum.unsealed_layer
		if(!part_datum.can_overslot && part_datum.overslotting)
			var/obj/item/overslot = part_datum.overslotting
			overslot.forceMove(mod.drop_location())
	for(var/obj/item/part as anything in parts + mod)
		part.icon = used_skin[MOD_ICON_OVERRIDE] || 'hypermods/icons/obj/clothing/modsuit/mod_clothing.dmi'
		part.worn_icon = used_skin[MOD_WORN_ICON_OVERRIDE] || 'hypermods/icons/mob/clothing/modsuit/mod_clothing.dmi'
		part.icon_state = "[skin]-[part.base_icon_state][mod.get_part_datum(part).sealed ? "-sealed" : ""]"
		mod.wearer?.update_clothing(part.slot_flags)


/datum/mod_theme/juggernaut
	name = "juggernaut"
	desc = "A suit designed and manufactured by Cybersun Industries, offering armor ruled illegal in most of Spinward Stellar."
	extended_desc = "A highly engineered MODsuit designed and manufactured by Cybersun Industries. \
		It's been manufactured with as many layers of armor plating possible. \
		This MODsuit must cost a pretty penny for the manufacturer just from the material alone."
	default_skin = "juggernaut"
	armor_type = /datum/armor/mod_theme_juggernaut
	atom_flags = PREVENT_CONTENTS_EXPLOSION_1
	complexity_max = DEFAULT_MAX_COMPLEXITY + 10
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	siemens_coefficient = 0
	slowdown_inactive = 3
	slowdown_active = 1.5
	ui_theme = "syndicate"
	resistance_flags = FIRE_PROOF
	inbuilt_modules = list(/obj/item/mod/module/armor_booster)
	allowed_suit_storage = list(
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
		/obj/item/melee/energy/sword,
		/obj/item/shield/energy,
	)
	variants = list(
		"juggernaut" = list(
			/obj/item/clothing/head/mod = list(
				UNSEALED_LAYER = NECK_LAYER,
				UNSEALED_CLOTHING = SNUG_FIT,
				SEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE|HEADINTERNALS,
				UNSEALED_INVISIBILITY = HIDEFACIALHAIR,
				SEALED_INVISIBILITY = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT,
				SEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
	)

/datum/armor/mod_theme_juggernaut
	melee = 60
	bullet = 60
	laser = 65
	energy = 65
	bomb = 90
	bio = 100
	fire = 100
	acid = 100
	wound = 75

/datum/mod_theme/juggernaut/set_skin(obj/item/mod/control/mod, skin)
	mod.skin = skin
	var/list/used_skin = variants[skin]
	var/list/parts = mod.get_parts()
	for(var/obj/item/clothing/part as anything in parts)
		var/list/category = used_skin[part.type]
		var/datum/mod_part/part_datum = mod.get_part_datum(part)
		part_datum.unsealed_layer = category[UNSEALED_LAYER]
		part_datum.sealed_layer = category[SEALED_LAYER]
		part_datum.unsealed_message = category[UNSEALED_MESSAGE] || "No unseal message set! Tell a coder!"
		part_datum.sealed_message = category[SEALED_MESSAGE] || "No seal message set! Tell a coder!"
		part_datum.can_overslot = category[CAN_OVERSLOT] || FALSE
		part.clothing_flags = category[UNSEALED_CLOTHING] || NONE
		part.visor_flags = category[SEALED_CLOTHING] || NONE
		part.flags_inv = category[UNSEALED_INVISIBILITY] || NONE
		part.visor_flags_inv = category[SEALED_INVISIBILITY] || NONE
		part.flags_cover = category[UNSEALED_COVER] || NONE
		part.visor_flags_cover = category[SEALED_COVER] || NONE
		if(mod.get_part_datum(part).sealed)
			part.clothing_flags |= part.visor_flags
			part.flags_inv |= part.visor_flags_inv
			part.flags_cover |= part.visor_flags_cover
			part.alternate_worn_layer = part_datum.sealed_layer
		else
			part.alternate_worn_layer = part_datum.unsealed_layer
		if(!part_datum.can_overslot && part_datum.overslotting)
			var/obj/item/overslot = part_datum.overslotting
			overslot.forceMove(mod.drop_location())
	for(var/obj/item/part as anything in parts + mod)
		part.icon = used_skin[MOD_ICON_OVERRIDE] || 'hypermods/icons/obj/clothing/modsuit/mod_clothing.dmi'
		part.worn_icon = used_skin[MOD_WORN_ICON_OVERRIDE] || 'hypermods/icons/mob/clothing/modsuit/mod_clothing.dmi'
		part.icon_state = "[skin]-[part.base_icon_state][mod.get_part_datum(part).sealed ? "-sealed" : ""]"
		mod.wearer?.update_clothing(part.slot_flags)

/datum/mod_theme/interdyne/traitor
	complexity_max = DEFAULT_MAX_COMPLEXITY + 15

/datum/mod_theme/responsory/traitor/super
	complexity_max = DEFAULT_MAX_COMPLEXITY + 10
	allowed_suit_storage = list(
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
		/obj/item/melee/energy/sword,
		/obj/item/shield/energy,
	)


/datum/mod_theme/civilian/traitor
	desc = "A civilian class suit developed by Cybersun Industries as a flag-ship product, doesn't offer much other than quicker movement and spacefaring capabilities."
	extended_desc = "An advanced, protective and insulated, modular civilian class suit by Cybersun Industries, \
		this suit is a well-known product on Sol's planet Earth. These suits are oxygenated, \
		spaceworthy, resistant to fire and chemical threats, and are immunized against everything between \
		a sneeze and a bioweapon. However, their combat applications are incredibly minimal to avoid lawsuits. \
		Their freeform and lightweight design allow for more specialization than normal civilian class suits, and allow near unimpeded movement while active."
	siemens_coefficient = 0
	slowdown_inactive = 0.8
	slowdown_active = 0
	ui_theme = "syndicate"
	complexity_max = DEFAULT_MAX_COMPLEXITY + 10
	default_skin = "scivilian"
	armor_type = /datum/armor/mod_theme/civilian/traitor
	var/icon = 'hypermods/icons/obj/clothing/modsuit/mod_clothing.dmi' // For some reason,
	var/worn_icon = 'hypermods/icons/mob/clothing/modsuit/mod_clothing.dmi' // These are necessary while the jugg and raid dont need this. Why?
	variants = list(
		"scivilian" = list(
			/obj/item/clothing/head/mod = list(
				UNSEALED_LAYER = NECK_LAYER,
				UNSEALED_CLOTHING = SNUG_FIT,
				SEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE|HEADINTERNALS,
				SEALED_INVISIBILITY = HIDEFACIALHAIR|HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT,
				SEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
	)

/datum/armor/mod_theme/civilian/traitor
	melee = 10
	bullet = 15
	laser = 10
	energy = 10
	bomb = 25
	bio = 100
	fire = 40
	acid = 60
	wound = 15

/datum/mod_theme/civilian/traitor/set_skin(obj/item/mod/control/mod, skin)
	mod.skin = skin
	var/list/used_skin = variants[skin]
	var/list/parts = mod.get_parts()
	for(var/obj/item/clothing/part as anything in parts)
		var/list/category = used_skin[part.type]
		var/datum/mod_part/part_datum = mod.get_part_datum(part)
		part_datum.unsealed_layer = category[UNSEALED_LAYER]
		part_datum.sealed_layer = category[SEALED_LAYER]
		part_datum.unsealed_message = category[UNSEALED_MESSAGE] || "No unseal message set! Tell a coder!"
		part_datum.sealed_message = category[SEALED_MESSAGE] || "No seal message set! Tell a coder!"
		part_datum.can_overslot = category[CAN_OVERSLOT] || FALSE
		part.clothing_flags = category[UNSEALED_CLOTHING] || NONE
		part.visor_flags = category[SEALED_CLOTHING] || NONE
		part.flags_inv = category[UNSEALED_INVISIBILITY] || NONE
		part.visor_flags_inv = category[SEALED_INVISIBILITY] || NONE
		part.flags_cover = category[UNSEALED_COVER] || NONE
		part.visor_flags_cover = category[SEALED_COVER] || NONE
		if(mod.get_part_datum(part).sealed)
			part.clothing_flags |= part.visor_flags
			part.flags_inv |= part.visor_flags_inv
			part.flags_cover |= part.visor_flags_cover
			part.alternate_worn_layer = part_datum.sealed_layer
		else
			part.alternate_worn_layer = part_datum.unsealed_layer
		if(!part_datum.can_overslot && part_datum.overslotting)
			var/obj/item/overslot = part_datum.overslotting
			overslot.forceMove(mod.drop_location())
	for(var/obj/item/part as anything in parts + mod)
		part.icon = used_skin[MOD_ICON_OVERRIDE] || 'hypermods/icons/obj/clothing/modsuit/mod_clothing.dmi'
		part.worn_icon = used_skin[MOD_WORN_ICON_OVERRIDE] || 'hypermods/icons/mob/clothing/modsuit/mod_clothing.dmi'
		part.icon_state = "[skin]-[part.base_icon_state][mod.get_part_datum(part).sealed ? "-sealed" : ""]"
		mod.wearer?.update_clothing(part.slot_flags)

/datum/mod_theme/engineering/traitor
	complexity_max = DEFAULT_MAX_COMPLEXITY + 10
	ui_theme = "syndicate"

/datum/mod_theme/atmospheric/traitor
	complexity_max = DEFAULT_MAX_COMPLEXITY + 10
	ui_theme = "syndicate"

/datum/mod_theme/loader/traitor
	complexity_max = DEFAULT_MAX_COMPLEXITY + 10
	ui_theme = "syndicate"

/datum/mod_theme/mining/traitor
	complexity_max = DEFAULT_MAX_COMPLEXITY + 10
	ui_theme = "syndicate"
	inbuilt_modules = list(/obj/item/mod/module/ash_accretion, /obj/item/mod/module/death_sphere)

/datum/mod_theme/medical/traitor
	complexity_max = DEFAULT_MAX_COMPLEXITY + 10
	ui_theme = "syndicate"

/datum/mod_theme/medical/traitor2
	complexity_max = DEFAULT_MAX_COMPLEXITY + 10
	ui_theme = "syndicate"
	default_skin = "corpsman"

/datum/mod_theme/cosmohonk/traitor
	complexity_max = DEFAULT_MAX_COMPLEXITY + 10
	ui_theme = "syndicate"

/datum/mod_theme/prototype/traitor
	complexity_max = DEFAULT_MAX_COMPLEXITY + 10
	ui_theme = "syndicate"

/datum/mod_theme/ninja/traitor
	complexity_max = DEFAULT_MAX_COMPLEXITY + 10
	inbuilt_modules = list(/obj/item/mod/module/welding/camera_vision, /obj/item/mod/module/hacker/electricpalm, /obj/item/mod/module/synditeleporter, /obj/item/mod/module/adrenaline_boost/syndicate, /obj/item/mod/module/energy_net)
	allowed_suit_storage = list(
		/obj/item/gun,
		/obj/item/melee/baton,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/energy/sword,
		/obj/item/shield/energy,
	)
