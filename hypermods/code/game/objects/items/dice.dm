/obj/item/dice/d20/e20
	name = "d20"
	desc = "A die with twenty sides. The preferred die to throw at the GM."
	icon_state = "d20"
	sides = 20

/obj/item/dice/d20/e20/diceroll(mob/user, in_hand=FALSE)
	..()
	explosion(src, round(result*0.2), round(result*0.4), round(result*0.75), flame_range = round(result))
	qdel(src)
