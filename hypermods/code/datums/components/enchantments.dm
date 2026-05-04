/datum/component/enchantment
	//Examine text
	var/examine_description
	//Maximum enchantment level
	var/max_level = 1
	//Current enchantment level
	var/level
	//The source of this specific enchantment, used to determine where it can be recieved from and other things!
	//Possible sources include:
	//Universal -- Any and all enchantment givers can grant this enchantment.
	//Clockwork -- Only the clockwork cult's Stargazer can grant this particular enchantment.
	//Wizard -- Only certain wizard items/spells can grant this particular enchantment.
	var/enchantment_type = "Universal"
	//What type of item (typepath) does this enchantment require?
	var/required_item_type
	//Do we wish to forbid any particular type of item from recieving an enchantment?
	var/forbidden_item_type
	//If this item gets equipped (leave empty for anything, including being picked up), only activate if equipped in a particular slot.
	var/list/equip_slots = list()

/datum/component/enchantment/Initialize()
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE
	if(!check_requirements(parent))
		return COMPONENT_REDUNDANT

	if(on_reebe(parent))
		max_level = 1
	//Get random level
	level = rand(1, max_level)
	//Apply effect
	apply_effect(parent)
	//Add in examine effect
	RegisterSignal(parent, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine))
	//Putting this here for ease of use, a proc for when an enchanted item is used to attack.
	RegisterSignal(parent, COMSIG_ITEM_ATTACK, PROC_REF(on_attack))
	//A proc for when this item is equipped.
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(on_equip))

/datum/component/enchantment/Destroy()
	UnregisterSignal(parent, COMSIG_ATOM_EXAMINE)
	REMOVE_TRAIT(parent, TRAIT_ENCHANTED, STARGAZER_TRAIT) // Add other enchanted sources here...
	return ..()

/datum/component/enchantment/proc/check_requirements(obj/item/target)
	if(!isnull(required_item_type) && (!istype(target, required_item_type)))
		return FALSE
	if(!isnull(forbidden_item_type) && (istype(target, forbidden_item_type)))
		return FALSE
	return TRUE

/datum/component/enchantment/proc/apply_effect(obj/item/target)
	return

/datum/component/enchantment/proc/on_attack(obj/item/source, mob/living/target, mob/living/user)
	SIGNAL_HANDLER

	return

/datum/component/enchantment/proc/on_equip(obj/item/source, mob/equipper, slot)
	SIGNAL_HANDLER

	if(!isliving(equipper) || (length(equip_slots) && !(slot in equip_slots)))
		return
	var/mob/living/equipper_living = equipper

	to_chat(equipper_living, span_notice("As you [slot == ITEM_SLOT_HANDS ? "touch" : "equip"] [source], it's enchantment activates!"))

	return

/datum/component/enchantment/proc/on_examine(datum/source, mob/user, list/examine_list)
	SIGNAL_HANDLER

	if(!examine_description)
		return
	if(!IS_CLOCK(user) && !IS_CULTIST(user) && !IS_HERETIC(user) && !IS_WIZARD(user) && !isobserver(user))
		var/mob/living/living_user = user
		if(istype(living_user.get_item_by_slot(ITEM_SLOT_EYES), /obj/item/clothing/glasses/science))
			examine_list += "[examine_description]"
			examine_list += "It emits a readable EMF factor of [level]."
		else
			examine_list += "It is glowing slightly!"
	else
		if(IS_CLOCK(user))
			examine_list += span_brass("[examine_description]")
			examine_list += span_brass("It's blessing has a power level of [level]!")
		if(IS_CULTIST(user))
			examine_list += span_cult("[examine_description]")
			examine_list += span_cult("It's blessing has a power level of [level]!")
		if(IS_HERETIC(user))
			examine_list += span_green("[examine_description]")
			examine_list += span_green("It's blessing has a power level of [level]!")
		if(IS_WIZARD(user) || isobserver(user))
			examine_list += span_notice("[examine_description]")
			examine_list += span_notice("It's enchantment has a power level of [level]!")
