/// Illegal modules

/obj/item/borg/upgrade/illegalweapons
	name = "illegal weapons module"
	desc = "Installs deadly weapons into a cyborg and unlocks hidden modules."
	icon_state = "module_illegal"
	items_to_add = list(/obj/item/gun/energy/viper, /obj/item/pen/edagger)
	require_model = FALSE // Alows syndicate borgs to use it

/obj/item/borg/upgrade/illegalweapons/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_CONTRABAND, INNATE_TRAIT)

/obj/item/borg/upgrade/illegalweapons/action(mob/living/silicon/robot/borg, mob/living/user = usr)
	. = ..()
	if(!.)
		return .
	if(!borg.emagged)
		borg.SetEmagged(TRUE)
	borg.logevent("WARN: hardware installed with missing security certificate!") //A bit of fluff to hint it was an illegal tech item
	borg.logevent("WARN: root privleges granted to PID [num2hex(rand(1,65535), -1)][num2hex(rand(1,65535), -1)].") //random eight digit hex value. Two are used because rand(1,4294967295) throws an error

	return TRUE

/obj/item/borg/upgrade/illegalweapons/deactivate(mob/living/silicon/robot/borg, mob/living/user = usr)
	. = ..()
	if(!.)
		return .
	borg.SetEmagged(FALSE)


/obj/item/borg/upgrade/martyr
	name = "illegal martyr module"
	desc = "Installs a high-end explosive into a cyborg and unlocks hidden modules."
	icon = 'hypermods/icons/mob/silicon/robot_items.dmi'
	icon_state = "module_illegal_bomb"
	items_to_add = list(/obj/item/grenade/syndieminibomb/cyborg)
	require_model = FALSE // Alows syndicate borgs to use it

/obj/item/borg/upgrade/martyr/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_CONTRABAND, INNATE_TRAIT)

/obj/item/borg/upgrade/martyr/action(mob/living/silicon/robot/borg, mob/living/user = usr)
	. = ..()
	if(!.)
		return .
	if(!borg.emagged)
		borg.SetEmagged(TRUE)
	borg.logevent("WARN: hardware installed with missing security certificate!") //A bit of fluff to hint it was an illegal tech item
	borg.logevent("WARN: root privleges granted to PID [num2hex(rand(1,65535), -1)][num2hex(rand(1,65535), -1)].") //random eight digit hex value. Two are used because rand(1,4294967295) throws an error

	return TRUE

/obj/item/borg/upgrade/martyr/deactivate(mob/living/silicon/robot/borg, mob/living/user = usr)
	. = ..()
	if(!.)
		return .
	borg.SetEmagged(FALSE)


/obj/item/borg/upgrade/illegalrescue
	name = "illegal rescue module"
	desc = "Installs fulton capabilities within a cyborg, allowing for quick transport of items, agents and themself. Also unlocks hidden modules."
	icon = 'hypermods/icons/mob/silicon/robot_items.dmi'
	icon_state = "module_illegal_rescue"
	items_to_add = list(/obj/item/extraction_pack/non_contractor/cyborg, /obj/item/fulton_core/syndicate/cyborg)
	require_model = FALSE // Alows syndicate borgs to use it

/obj/item/borg/upgrade/illegalrescue/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_CONTRABAND, INNATE_TRAIT)

/obj/item/borg/upgrade/illegalrescue/action(mob/living/silicon/robot/borg, mob/living/user = usr)
	. = ..()
	if(!.)
		return .
	if(!borg.emagged)
		borg.SetEmagged(TRUE)
	borg.logevent("WARN: hardware installed with missing security certificate!") //A bit of fluff to hint it was an illegal tech item
	borg.logevent("WARN: root privleges granted to PID [num2hex(rand(1,65535), -1)][num2hex(rand(1,65535), -1)].") //random eight digit hex value. Two are used because rand(1,4294967295) throws an error

	return TRUE

/obj/item/borg/upgrade/illegalrescue/deactivate(mob/living/silicon/robot/borg, mob/living/user = usr)
	. = ..()
	if(!.)
		return .
	borg.SetEmagged(FALSE)

/// Universal modules

/obj/item/borg/upgrade/unistorage
	name = "universal apparatus"
	desc = "A module capable of being installed into any cyborg, granting them a means of interacting with anything they come across."
	items_to_add = list(/obj/item/borg/apparatus/universal)
	require_model = TRUE

/// Security cyborgs



/// Peacekeeper cyborgs



/// Engineer cyborgs

/obj/item/borg/upgrade/arcd
	name = "engineering cyborg ARCD"
	desc = "An advanced bluespace construction device for the engineering cyborg."
	icon_state = "module_engineer"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/engineering, /obj/item/robot_model/saboteur)
	model_flags = BORG_MODEL_ENGINEERING
	items_to_add = list(/obj/item/construction/rcd/borg/arcd)
	items_to_remove = list(/obj/item/construction/rcd/borg)

/obj/item/borg/upgrade/advancedmats
	name = "cyborg advanced materials"
	desc = "An upgrade for engineering cyborgs which grants them stronger material variants."
	icon_state = "module_engineer"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/engineering, /obj/item/robot_model/saboteur)
	model_flags = BORG_MODEL_ENGINEERING
	items_to_add = list(/obj/item/stack/sheet/plasteel, /obj/item/stack/sheet/plasmaglass)

/// Medical cyborgs

/obj/item/borg/upgrade/medreagentgun
	name = "cyborg reagent gun"
	desc = "An upgrade for medical cyborgs which grants them long-ranged reagent application method."
	icon_state = "module_medical"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/medical)
	model_flags = BORG_MODEL_MEDICAL
	items_to_add = list(/obj/item/gun/chembudget/cyborg)

/obj/item/borg/upgrade/medimplanter
	name = "medical cyborg implanter"
	desc = "An upgrade for medical cyborgs which grants them long-ranged reagent application method."
	icon_state = "module_medical"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/medical)
	model_flags = BORG_MODEL_MEDICAL
	items_to_add = list(/obj/item/implanter)

/obj/item/borg/upgrade/borghypoexotic
	name = "medical cyborg exotic hypospray"
	desc = "An upgrade for medical cyborgs which grants them a hypospray with a completely different set of chemicals."
	icon_state = "module_medical"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/medical)
	model_flags = BORG_MODEL_MEDICAL
	items_to_add = list(/obj/item/reagent_containers/borghypo/medical/exotic)

/// Service cyborgs

/obj/item/borg/upgrade/advbotanytools
	name = "advanced cyborg botany upgrade"
	desc = "An upgrade for service cyborgs which grants them the ability to tend to plants."
	icon_state = "module_service"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/service)
	model_flags = BORG_MODEL_SERVICE
	items_to_add = list(/obj/item/scythe, /obj/item/gun/energy/floragun/cyborg, /obj/item/geneshears)

/obj/item/borg/upgrade/rapidlightingdevice
	name = "cyborg rapid lighting device upgrade"
	desc = "An upgrade for service cyborgs which grants them an in-built rapid lighting device."
	icon_state = "module_service"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/service)
	model_flags = BORG_MODEL_SERVICE
	items_to_add = list(/obj/item/construction/rld/borg)

/// Mining cyborgs



/// Janitorial cyborgs

/obj/item/borg/upgrade/janisprayer
	name = "janitorial sprayer"
	desc = "An upgrade for janitorial cyborgs which grants them a chemical cannon filled with space cleaner."
	icon_state = "module_janitor"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/janitor)
	model_flags = BORG_MODEL_JANITOR
	items_to_add = list(/obj/item/reagent_containers/spray/chemsprayer/janitor)
