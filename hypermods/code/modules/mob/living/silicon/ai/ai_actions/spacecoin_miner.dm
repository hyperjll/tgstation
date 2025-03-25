/obj/item/spacecoin_miner_upgrade
	name = "spacecoin miner upgrade"
	desc = "An upgrade for artificial intelligence units, which directs half of their power generation toward money generation for the station's cargo department."
	icon = 'icons/obj/devices/circuitry_n_data.dmi'
	icon_state = "datadisk1"

/obj/item/spacecoin_miner_upgrade/pre_attack(atom/A, mob/living/user, proximity)
	if(!proximity)
		return ..()
	if(!isAI(A))
		return ..()
	var/mob/living/silicon/ai/AI = A
	if(AI.miner_active)
		AI.battery += 10 // Just to not screw over the user.
		to_chat(AI, span_userdanger("[user] has attempted to upgrade you with a spacecoin mining setup, but you already have that. Atleast you got a slight recharge, though."))
	else
		to_chat(AI, span_userdanger("[user] has installed a spacecoin mining program within you! While your backup power will recharge slower, you'll now passively generate revenue!"))
		AI.miner_active = TRUE
		log_silicon("[key_name(user)] has upgraded [key_name(AI)] with a [src].")
		message_admins("[ADMIN_LOOKUPFLW(user)] has upgraded [ADMIN_LOOKUPFLW(AI)] with a [src].")
	to_chat(user, span_notice("You install [src], upgrading [AI]."))
	qdel(src)
	return TRUE
