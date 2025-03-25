/obj/item/grenade/syndieminibomb/cyborg
	desc = "A manufactured explosive secretly installed within cyborgs via hidden protocols in exosuit fabrication machines."
	name = "cyborg self-destruct explosive"
	icon = 'icons/obj/weapons/grenade.dmi'
	icon_state = "syndicate"
	inhand_icon_state = "flashbang"
	worn_icon_state = "minibomb"
	ex_dev = 1
	ex_heavy = 3
	ex_light = 6
	ex_flame = 4

/obj/item/grenade/syndieminibomb/cyborg/attack_self(mob/user)
	arm_grenade(user)
