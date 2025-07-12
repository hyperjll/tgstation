/datum/objective/mindshield
	name = "get mindshielded"
	explanation_text = "Extract with a Nanotrasen Loyalty Mindshield implanted in you."
	admin_grantable = TRUE

/datum/objective/mindshield/update_explanation_text()
	..()
	if(target?.current)
		explanation_text = "Extract with a Nanotrasen Loyalty Mindshield implanted in you."
	else
		explanation_text = "Free objective."

/datum/objective/mindshield/check_completion()
	var/list/datum/mind/owners = get_owners()
	for(var/datum/mind/M in owners)
		if(!isliving(M.current))
			continue

		var/mob/living/implantee = M.current

		for(var/obj/item/implant/I in implantee.implants) //Check for items
			if(istype(I, /obj/item/implant/mindshield))
				return TRUE
	return FALSE
