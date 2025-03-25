/obj/item/rgb_lights
	name = "RGB camera lights upgrade"
	desc = "A fancy cosmetic upgrade for artificial intelligence units, causes any cameras they peer through with camera lights on to be tinted a random color of the rainbow."
	icon = 'icons/obj/devices/circuitry_n_data.dmi'
	icon_state = "datadisk1"

/obj/item/rgb_lights/pre_attack(atom/A, mob/living/user, proximity)
	if(!proximity)
		return ..()
	if(!isAI(A))
		return ..()
	var/mob/living/silicon/ai/AI = A
	if(AI.partytime)
		AI.battery += 5 // Just to not screw over the user.
		to_chat(AI, span_userdanger("[user] has attempted to upgrade your camera lights with RGB lights, but you already have that. Atleast you got a slight recharge, though."))
	else
		to_chat(AI, span_userdanger("[user] has upgraded your camera lights with RGB lights!"))
		AI.partytime = TRUE
	to_chat(user, span_notice("You install [src], upgrading [AI]'s maximum backup power."))
	qdel(src)
	return TRUE
