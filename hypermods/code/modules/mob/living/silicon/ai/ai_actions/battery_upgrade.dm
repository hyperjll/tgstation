/obj/item/battery_upgrade
	name = "electrical storage upgrade"
	desc = "A borderline illegal upgrade for artificial intelligence units, increasing their total battery capacity by an estimated 10 points."
	icon = 'icons/obj/devices/circuitry_n_data.dmi'
	icon_state = "datadisk1"

/obj/item/battery_upgrade/pre_attack(atom/A, mob/living/user, proximity)
	if(!proximity)
		return ..()
	if(!isAI(A))
		return ..()
	var/mob/living/silicon/ai/AI = A
	if(AI.battery_upgrades >= AI.max_battery_upgrades)
		AI.battery += 10 // Just to not screw over the user.
		to_chat(AI, span_userdanger("[user] has attempted to upgrade your backup power battery, but it's already maxxed out. Atleast you got a slight recharge, though."))
	else
		to_chat(AI, span_userdanger("[user] has upgraded your internal battery!"))
		AI.max_battery += 10
		AI.battery_upgrades++
		log_silicon("[key_name(user)] has upgraded [key_name(AI)] with a [src].")
		message_admins("[ADMIN_LOOKUPFLW(user)] has upgraded [ADMIN_LOOKUPFLW(AI)] with a [src].")
	to_chat(user, span_notice("You install [src], upgrading [AI]'s maximum backup power."))
	qdel(src)
	return TRUE
