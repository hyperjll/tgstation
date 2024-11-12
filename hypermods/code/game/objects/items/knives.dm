/obj/item/knife/combat/survival/chemical
	name = "survival knife"
	var/chemicalinuse = null
	var/chemicalamount = 1
	var/chemicalexamine = null

/obj/item/knife/combat/survival/chemical/examine(mob/user)
	. = ..()
	if(IS_TRAITOR(user) || IS_NUKE_OP(user) || user.mind?.has_antag_datum(/datum/antagonist/spy)) //helpful to other syndicates
		. += "This knife has an internal redspace reagent generator producing [chemicalexamine]."

/obj/item/knife/combat/survival/chemical/afterattack(atom/target, mob/user, proximity = TRUE)
	. = ..()
	var/mob/living/carbon/H = target
	if(IS_TRAITOR(user) || IS_NUKE_OP(user) || user.mind?.has_antag_datum(/datum/antagonist/spy))
		H.reagents.add_reagent(chemicalinuse, chemicalamount)

/obj/item/knife/combat/survival/chemical/venom
	chemicalinuse = /datum/reagent/toxin/venom
	chemicalamount = 4
	chemicalexamine = "Venom"

/obj/item/knife/combat/survival/chemical/lexorin
	chemicalinuse = /datum/reagent/toxin/lexorin
	chemicalamount = 3
	chemicalexamine = "Lexorin"

/obj/item/knife/combat/survival/chemical/amanitin
	chemicalinuse = /datum/reagent/toxin/amanitin
	chemicalamount = 5
	chemicalexamine = "Amanitin"

/obj/item/knife/combat/survival/chemical/staminatoxin
	chemicalinuse = /datum/reagent/toxin/staminatoxin
	chemicalamount = 6
	chemicalexamine = "Tirizene"

/obj/item/knife/combat/survival/chemical/curare
	chemicalinuse = /datum/reagent/toxin/curare
	chemicalamount = 2
	chemicalexamine = "Curare"

/obj/item/knife/combat/survival/chemical/initropidril
	chemicalinuse = /datum/reagent/toxin/initropidril
	chemicalamount = 3
	chemicalexamine = "Initropidril"

/obj/item/knife/combat/survival/chemical/pancuronium
	chemicalinuse = /datum/reagent/toxin/pancuronium
	chemicalamount = 3
	chemicalexamine = "Pancuronium"

/obj/item/knife/combat/survival/chemical/heparin
	chemicalinuse = /datum/reagent/toxin/heparin
	chemicalamount = 5
	chemicalexamine = "Heparin"


/obj/item/knife/throwing
	name = "throwing knife"
	icon = 'hypermods/icons/obj/weapons/stabby.dmi'
	icon_state = "throwingknife"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/swords_righthand.dmi'
	inhand_icon_state = "throwingknife"
	embed_type = /datum/embed_data/throwingknife
	force = 15
	throwforce = 35
	throw_speed = 2
	throw_range = 12

/datum/embed_data/throwingknife
	embed_chance = 100
	fall_chance = 0.01


/obj/item/melee/syndidagger
	name = "syndicate dagger"
	desc = "An old-fashioned syndicate dagger. Rumored to have manufactured to kill syndicate agents specifically."
	icon = 'hypermods/icons/obj/weapons/stabby.dmi'
	icon_state = "syndidagger"
	force = 10
	throwforce = 20
	sharpness = SHARP_EDGED
	var/syndicateuser = FALSE

/obj/item/melee/syndidagger/examine(mob/user)
	. = ..()
	if(IS_TRAITOR(user)) // since this is a surplus only thing, people likely wont know what this does.
		. += "This dagger seems specifically made to kill syndicate agents like you. Might prove useful if your allies betray you."

/obj/item/melee/syndidagger/pickup(mob/user)
	..()
	if(IS_TRAITOR(user)) // prevent normal peeps from antag checking
		syndicateuser = TRUE

/obj/item/melee/syndidagger/dropped()
	..()
	syndicateuser = FALSE

/obj/item/melee/syndidagger/afterattack(target, mob/user, proximity = TRUE)
	. = ..()
	var/mob/living/carbon/human/L = target
	if(IS_TRAITOR(L) && syndicateuser)
		L.apply_damage(20, BRUTE)
