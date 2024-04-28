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
