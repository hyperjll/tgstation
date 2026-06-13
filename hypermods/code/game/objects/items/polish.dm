/obj/item/item_polish
	name = "armor polish"
	desc = "A small can containing a smooth, oily, metallic substance. A small inscryption on the back reads: 'Apply with care'."
	icon_state = "armor_polish"
	icon = 'hypermods/icons/obj/devices/tool.dmi'
	force = 0
	w_class = WEIGHT_CLASS_NORMAL
	throwforce = 1
	// How many uses before the item is used up?
	var/uses = 2
	// What kind of armor is gifted to the item it's used upon?
	var/target_armor_type = ACID
	// The minimum amount of armor we'll give, ignoring diminishing returns? 0.1 is bare minimum to prevent division by zero.
	var/armor_min = 0.1
	// How much armor must the target have before we decide we're cutting you off? This is a soft cap for now. Keep value low.
	var/armor_max = 40
	// The current armor is then multiplied by this value, the result is the amount of armor added.
	var/armor_multiplier = 0.25
	// Do we ignore the armor_type var above and instead grant ALL armor types?
	var/all_armor_types = FALSE

/obj/item/item_polish/examine(mob/user)
	. = ..()
	if(armor_type && !all_armor_types)
		. += "Near the label is the word: '[armor_type]'."
	if(uses)
		. += "[uses] left."

/obj/item/item_polish/interact_with_atom(atom/interacting_with, mob/living/user)
	if(!isitem(interacting_with))
		return

	if(!do_after(user, 3 SECONDS))
		return

	var/obj/item/our_item = interacting_with

	var/datum/armor/our_armor = our_item.get_armor()
	var/list/armorlist = our_armor.get_rating_list()

	if(!all_armor_types)
		if(armorlist[target_armor_type] < armor_max)
			armorlist[target_armor_type] += CEILING((100 - armorlist[target_armor_type]) * armor_multiplier, armor_min)
		else
			balloon_alert(user, "too sturdy to polish!")
			return
	else // NOTE: We're not including CONSUME armor types, as that's rarely used and super niche. Most armor types don't have it and it'll constantly waste our syndicate polish trying to improve it.
		var/armor_improved = FALSE // There's probably a better way to do all of this below, but I'm a lazy son of a bitch.
		if(armorlist[ACID] < armor_max)
			armorlist[ACID] += CEILING((100 - armorlist[ACID]) * armor_multiplier, armor_min)
			armor_improved = TRUE
		if(armorlist[BIO] < armor_max)
			armorlist[BIO] += CEILING((100 - armorlist[BIO]) * armor_multiplier, armor_min)
			armor_improved = TRUE
		if(armorlist[BOMB] < armor_max)
			armorlist[BOMB] += CEILING((100 - armorlist[BOMB]) * armor_multiplier, armor_min)
			armor_improved = TRUE
		if(armorlist[BULLET] < armor_max)
			armorlist[BULLET] += CEILING((100 - armorlist[BULLET]) * armor_multiplier, armor_min)
			armor_improved = TRUE
		if(armorlist[ENERGY] < armor_max)
			armorlist[ENERGY] += CEILING((100 - armorlist[ENERGY]) * armor_multiplier, armor_min)
			armor_improved = TRUE
		if(armorlist[FIRE] < armor_max)
			armorlist[FIRE] += CEILING((100 - armorlist[FIRE]) * armor_multiplier, armor_min)
			armor_improved = TRUE
		if(armorlist[LASER] < armor_max)
			armorlist[LASER] += CEILING((100 - armorlist[LASER]) * armor_multiplier, armor_min)
			armor_improved = TRUE
		if(armorlist[MELEE] < armor_max)
			armorlist[MELEE] += CEILING((100 - armorlist[MELEE]) * armor_multiplier, armor_min)
			armor_improved = TRUE
		if(armorlist[WOUND] < armor_max)
			armorlist[WOUND] += CEILING((100 - armorlist[WOUND]) * armor_multiplier, armor_min)
			armor_improved = TRUE
		if(!armor_improved)
			balloon_alert(user, "too sturdy to polish!")
			return

	our_item.set_armor(our_armor.generate_new_with_specific(armorlist))

	--uses
	balloon_alert(user, "polished [our_item.name], [uses] left")
	if(uses < 1)
		qdel(src)

/obj/item/item_polish/acid // I know the default is acid, but that might change.
	name = "durability polish"
	armor_type = ACID

/obj/item/item_polish/bio
	armor_type = BIO

/obj/item/item_polish/bomb
	armor_type = BOMB

/obj/item/item_polish/bullet
	armor_type = BULLET

/obj/item/item_polish/consume
	armor_type = CONSUME

/obj/item/item_polish/energy
	armor_type = ENERGY

/obj/item/item_polish/fire
	name = "durability polish"
	armor_type = FIRE

/obj/item/item_polish/laser
	armor_type = LASER

/obj/item/item_polish/melee
	armor_type = MELEE

/obj/item/item_polish/wound
	armor_type = WOUND

/obj/item/item_polish/syndicate
	icon_state = "armor_polish_s"
	all_armor_types = TRUE
