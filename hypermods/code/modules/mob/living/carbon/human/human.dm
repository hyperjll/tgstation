/mob/living/carbon/human/proc/undeploy() // primarily used by /obj/item/organ/brain/cybernetic/ai to undeploy back to the AI should the AI die and not the human shell.
	if(QDELETED(src))
		return
	for(var/datum/action/innate/brain_undeployment/undeployment_action in src.actions)
		undeployment_action.Trigger(src)

/mob/living/carbon/human/proc/mindwipe() // used by /datum/reagent/medicine/mindwipe
	if(src.has_status_effect(/datum/status_effect/hollow))
		return

	src.playsound_local(get_turf(src), 'hypermods/sound/items/mindwipe.ogg', 40, FALSE, pressure_affected = FALSE, use_reverb = FALSE)
	src.emote("scream")

	src.adjust_organ_loss(ORGAN_SLOT_BRAIN, -50)
	src.set_organ_loss(ORGAN_SLOT_EARS, 95)
	src.set_organ_loss(ORGAN_SLOT_EYES, 45)
	src.cure_trauma_type(resilience = TRAUMA_RESILIENCE_BASIC)
	src.cure_trauma_type(resilience = TRAUMA_RESILIENCE_SURGERY)
	src.cure_trauma_type(resilience = TRAUMA_RESILIENCE_LOBOTOMY)

	src.Sleeping(20 SECONDS)
	src.apply_status_effect(/datum/status_effect/hollow)

/mob/living/carbon/human/proc/neuralboost() // used by /datum/reagent/medicine/neuralbooster
	if(src.has_status_effect(/datum/status_effect/neuralboosted))
		src.mindwipe()

	src.reagents.add_reagent(/datum/reagent/drug/pumpup, 5)
	src.reagents.add_reagent(/datum/reagent/medicine/synaptizine, 5)
	src.reagents.add_reagent(/datum/reagent/determination, 10)

	src.adjust_organ_loss(ORGAN_SLOT_BRAIN, -10)

	if(!src.has_status_effect(/datum/status_effect/neuralboosted))
		src.apply_status_effect(/datum/status_effect/neuralboosted)


/mob/living/carbon/human/species/werewolf
	race = /datum/species/werewolf
