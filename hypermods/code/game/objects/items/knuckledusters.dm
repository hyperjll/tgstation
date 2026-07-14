/obj/item/melee/knuckleduster
	name = "knuckleduster"
	desc = "Simple metal punch enhancers, perfect for bar brawls."
	icon = 'hypermods/icons/obj/weapons/knuckleduster.dmi'
	icon_state = "knuckleduster"
	item_flags = CONDUCTS_ELECTRICITY
	force = 10
	throwforce = 3
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = FIRE_PROOF
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT* 5)
	attack_verb_simple = list("struck", "bludgeoned", "bashed", "smashed")
	attack_verb_continuous = list("stikes", "bludgeons", "bashes", "smashes")
	hitsound = null
	/// Is the weapon gripped or not?
	var/gripped = FALSE
	/// How much organ damage can the weapon do?
	var/organ_damage = 5
	/// Is this version of the knuckleduster picked up as contraband?
	var/contrabanded = TRUE

/obj/item/melee/knuckleduster/Initialize(mapload)
	. = ..()
	if(contrabanded)
		ADD_TRAIT(src, TRAIT_CONTRABAND, INNATE_TRAIT)

/obj/item/melee/knuckleduster/attack_self(mob/user)
	if(!gripped)
		gripped = TRUE
		to_chat(user, "You tighten your grip on [src], ensuring you won't drop it.")
		balloon_alert(user, "Knuckleduster Equipped!")
		ADD_TRAIT(src, TRAIT_NODROP, "knuckledusters")
	else
		gripped = FALSE
		to_chat(user, "You relax your grip on [src].")
		balloon_alert(user, "Knuckleduster Unequipped!")
		REMOVE_TRAIT(src, TRAIT_NODROP, "knuckledusters")

/obj/item/melee/knuckleduster/dropped(mob/user, silent)
	. = ..()
	gripped = FALSE
	REMOVE_TRAIT(src, TRAIT_NODROP, "knuckledusters")

/obj/item/melee/knuckleduster/afterattack(mob/living/target, mob/living/user)
	. = ..()
	hitsound = pick('sound/items/weapons/punch1.ogg', 'sound/items/weapons/punch2.ogg', 'sound/items/weapons/punch3.ogg', 'sound/items/weapons/punch4.ogg')
	if(!ishuman(target) || QDELETED(target))
		return

	var/obj/item/bodypart/punched = target.get_bodypart(check_zone(user.zone_selected))
	if(!length(punched.contents))
		return

	var/obj/item/organ/squishy = pick(punched.contents)
	if(!isnull(squishy))
		squishy.damage += organ_damage

/obj/item/melee/knuckleduster/syndie
	name = "syndicate knuckleduster"
	desc = "For feeling like a real Syndicate Elite when threatening to punch someone to death."
	icon_state = "knuckleduster_syndie"
	custom_materials = list(/datum/material/titanium=SMALL_MATERIAL_AMOUNT* 5)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	force = 12
	throwforce = 5
	organ_damage = 10

/obj/item/melee/knuckleduster/nanotrasen
	name = "engraved knuckleduster"
	desc = "Perfect for giving that Greytider a golden, painful lesson."
	icon_state = "knuckleduster_nt"
	throwforce = 5
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF // Steal objectives shouldnt be easy to destroy.
	custom_materials = list(/datum/material/gold=SMALL_MATERIAL_AMOUNT* 5, /datum/material/titanium=SMALL_MATERIAL_AMOUNT* 2, /datum/material/plasma=SMALL_MATERIAL_AMOUNT* 2)
	organ_damage = 10
	contrabanded = FALSE

/obj/item/melee/knuckleduster/nanotrasen/examine_more(mob/user)
	. = ..()
	. += "These engraved knuckledusters are crafted from 20 karat gold alloyed with plastitanium, all mined from Lavaland. A symbol of prestige and a reminder of the wealth under the feet of the miners working down there."
	. += "Why exactly Nanotrasen chose to make knuckledusters of all things as that prestige symbol is unclear, \
	but when all the quartermasters were issued them, no-one complained. Most of them got pretty good at using the knuckledusters, too..."
