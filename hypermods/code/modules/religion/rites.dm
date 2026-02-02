/datum/religion_rites/greed/anything_gift
	name = "Purchase Anything Gift"
	desc = "Summons a fabulously wrapped gift that could contain... ANYTHING!"
	invoke_msg = "If I could get some goods to sell, I can be rich!"
	money_cost = 300 // Delicious!

/datum/religion_rites/greed/anything_gift/invoke_effect(mob/living/user, atom/movable/religious_tool)
	..()
	var/altar_turf = get_turf(religious_tool)
	new /obj/item/gift/anything(altar_turf)
	playsound(get_turf(religious_tool), 'sound/effects/cashregister.ogg', 60, TRUE)
	return TRUE
