/obj/item/melee/chainofcommand/tailwhip/syndicate
	name = "liz o' nine tails"
	desc = "A whip fashioned from the severed tails of lizards."
	icon = 'icons/obj/weapons/whip.dmi'
	icon_state = "tailwhip"
	item_flags = NONE
	force = 20

/obj/item/melee/chainofcommand/tailwhip/syndicate/afterattack(target, mob/user, proximity_flag)
	. = ..()
	if(islizard(target) && proximity_flag)
		var/mob/living/carbon/human/species/lizard/L = target
		L.apply_damage(15, BRUTE)

/obj/item/melee/chainofcommand/tailwhip/kitty/syndicate
	name = "cat o' nine tails"
	desc = "A whip fashioned from the severed tails of cats."
	icon_state = "catwhip"
	force = 20

/obj/item/melee/chainofcommand/tailwhip/kitty/syndicate/afterattack(atom/target, mob/user, proximity_flag)
	. = ..()
	var/mob/living/carbon/H = target
	if(ishuman(target) && proximity_flag)
		H.reagents.add_reagent(/datum/reagent/mutationtoxin/felinid, 2)


/obj/item/switchblade/backstab/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/backstabs, 2, 2 SECONDS) // 40 damage, 2s CD


/obj/item/melee/caber
	name = "\improper Ullapool Caber"
	desc = "A potato-masher style hand grenade. Only explodes when swung against a target. Beware the splash damage."
	icon = 'hypermods/icons/obj/weapons/bat.dmi'
	icon_state = "ullapoolcaber"
	inhand_icon_state = "ullapoolcaber"
	lefthand_file = 'hypermods/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'hypermods/icons/mob/inhands/weapons/melee_righthand.dmi'
	siemens_coefficient = 0 //wooden handle
	force = 15 //moderately strong as a regular melee weapon, gets sharp when exploded
	w_class = WEIGHT_CLASS_SMALL //fits in your pocket
	attack_verb_simple = list("blasted", "smacked", "smashed")
	attack_verb_continuous = list("blasts", "smacks", "smashes")
	sharpness = NONE
	var/exploded = FALSE

/obj/item/melee/caber/attack(atom/target, mob/living/user)
	..()
	if(!exploded)
		if(check_holidays(APRIL_FOOLS))
			if(prob(50))
				playsound(user, 'hypermods/sound/misc/demomankaboom.ogg', 80, 0)
			else
				playsound(user, 'hypermods/sound/misc/demomankablooie.ogg', 80, 0)
		explosion(target, 0, 1, 2, flame_range = 0)
		exploded = TRUE
		icon_state = "ullapoolcaberexploded"
		inhand_icon_state = "ullapoolcaberexploded"
		sharpness = SHARP_EDGED
	playsound(target, 'hypermods/sound/misc/caber_hitsound.ogg', 75, 0)
