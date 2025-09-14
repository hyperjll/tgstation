/mob/living/carbon/human/proc/undeploy() // primarily used by /obj/item/organ/brain/cybernetic/ai to undeploy back to the AI should the AI die and not the human shell.
	if(QDELETED(src))
		return
	for(var/datum/action/innate/brain_undeployment/undeployment_action in src.actions)
		undeployment_action.Trigger(src)

/mob/living/carbon/human/species/werewolf
	race = /datum/species/werewolf
