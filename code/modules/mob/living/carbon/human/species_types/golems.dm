/// Animated beings of stone. They have increased defenses, and do not need to breathe. They must eat minerals to live, which give additional buffs.
/datum/species/golem
	name = "Golem"
	id = SPECIES_GOLEM
	inherent_traits = list(
		TRAIT_GENELESS,
		TRAIT_LAVA_IMMUNE,
		TRAIT_NEVER_WOUNDED,
		TRAIT_NOBLOOD,
		TRAIT_NOBREATH,
		TRAIT_NODISMEMBER,
		TRAIT_NOFIRE,
		TRAIT_NO_AUGMENTS,
		TRAIT_NO_DNA_COPY,
		TRAIT_NO_PLASMA_TRANSFORM,
		TRAIT_NO_UNDERWEAR,
		TRAIT_PIERCEIMMUNE,
		TRAIT_RADIMMUNE,
		TRAIT_SNOWSTORM_IMMUNE, // Shared with plasma river... but I guess if you can survive a plasma river a blizzard isn't a big deal
		TRAIT_UNHUSKABLE,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_RESISTHEAT,
		TRAIT_ASHSTORM_IMMUNE,
	)
	mutantheart = null
	mutantlungs = null
	inherent_biotypes = MOB_HUMANOID|MOB_MINERAL
	damage_modifier = 55 //golem is stronk
	payday_modifier = 1.0
	siemens_coeff = 0
	no_equip_flags = ITEM_SLOT_MASK | ITEM_SLOT_OCLOTHING | ITEM_SLOT_GLOVES | ITEM_SLOT_FEET | ITEM_SLOT_ICLOTHING | ITEM_SLOT_SUITSTORE
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC
	sexes = FALSE
	meat = /obj/item/food/meat/slab/human/mutant/golem
	species_language_holder = /datum/language_holder/golem

	bodytemp_heat_damage_limit = BODYTEMP_HEAT_LAVALAND_SAFE
	bodytemp_cold_damage_limit = BODYTEMP_COLD_ICEBOX_SAFE

	mutant_organs = list(/obj/item/organ/adamantine_resonator)
	mutanteyes = /obj/item/organ/eyes/golem
	mutantbrain = /obj/item/organ/brain/golem
	mutanttongue = /obj/item/organ/tongue/golem
	mutantstomach = /obj/item/organ/stomach/golem
	mutantliver = /obj/item/organ/liver/golem
	mutantappendix = /obj/item/organ/appendix/golem
	bodypart_overrides = list(
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/golem,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/golem,
		BODY_ZONE_HEAD = /obj/item/bodypart/head/golem,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/golem,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/golem,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/golem,
	)
	//How much to slow golems down by
	var/golem_speed_mod = 1.5
	//Innate golem buff purge ability
	var/datum/action/cooldown/golem_purge/golem_purge

/datum/species/golem/get_physical_attributes()
	return "Golems are hardy creatures made out of stone, which are thus naturally resistant to many dangers, including asphyxiation, fire, radiation, electricity, and viruses.\
		They gain special abilities depending on the type of material consumed, but they need to consume material to keep their body animated."

/datum/species/golem/get_species_description()
	return "Golems are lithoid creatures who eat rocks and minerals to survive and adapt."

/datum/species/golem/get_species_lore()
	return list(
		"While Golems have long been commonly found on frontier worlds, peacefully mining and otherwise living in harmony with the environment, \
		it is believed they were originally constructed in Nanotrasen laboratories as a form of cheap labor. Whatever happened up to this point is unknown, \
		but they have since gained freedom and are now a rare sight in the galaxy.",
	)

/datum/species/golem/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
		SPECIES_PERK_ICON = "user-shield",
		SPECIES_PERK_NAME = "Lithoid",
		SPECIES_PERK_DESC = "Lithoids are creatures made out of minerals instead of \
			blood and flesh. They are strong and immune to many environmental and personal dangers \
			such as fire, radiation, lack of air, lava, viruses, and dismemberment.",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
		SPECIES_PERK_ICON = "gem",
		SPECIES_PERK_NAME = "Metamorphic Rock",
		SPECIES_PERK_DESC = "Consuming minerals can grant Lithoids temporary benefits based on the type consumed.",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
		SPECIES_PERK_ICON = "tools",
		SPECIES_PERK_NAME = "Natural Miners",
		SPECIES_PERK_DESC = "Golems can see dimly in the dark, sense minerals, break boulders, and mine stone with their bare hands. \
			They can even smelt ores in an internal furnace, if their surrounding environment is hot enough.",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
		SPECIES_PERK_ICON = "bolt",
		SPECIES_PERK_NAME = "Anima",
		SPECIES_PERK_DESC = "Maintaining the force animating stone is taxing. Lithoids must eat frequently \
			in order to avoid returning to inanimate statues, and only derive nutrition from eating minerals.",
	))

	return to_add

/datum/species/golem/on_species_gain(mob/living/carbon/new_golem, datum/species/old_species, pref_load, regenerate_icons)
	. = ..()
	new_golem.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/golem, multiplicative_slowdown = golem_speed_mod)
	if(ishuman(new_golem))
		golem_purge = new
		golem_purge.Grant(new_golem)

/datum/species/golem/on_species_loss(mob/living/carbon/former_golem, datum/species/new_species, pref_load)
	. = ..()
	former_golem.remove_movespeed_modifier(/datum/movespeed_modifier/golem)
	if(golem_purge)
		golem_purge.Remove(former_golem)

/// Send an ore detection pulse on a cooldown
/datum/action/cooldown/golem_purge
	name = "Ore Purge"
	desc = "Removes the current buff from your body, allowing you to gain a new one."
	button_icon = 'icons/obj/stack_objects.dmi'
	button_icon_state = "sheet-plasma"
	check_flags = AB_CHECK_CONSCIOUS
	cooldown_time = 2 MINUTES

/datum/action/cooldown/golem_purge/Activate(atom/target)
	. = ..()
	var/mob/living/carbon/golem = target
	golem.remove_status_effect(/datum/status_effect/golem)
	to_chat(owner, span_notice("You purge the ore from your body, making yourself adaptable again."))
