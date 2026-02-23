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

/mob/living/carbon/human/proc/suicidal_act() // used by /datum/status_effect/misery
	var/mob/living/carbon/human/our_human = src

	if(!our_human) // did we get gibbed or something?
		return FALSE

	if(our_human.stat == DEAD) // can't harm yourself.
		return FALSE

	src.set_jitter_if_lower(30 SECONDS)
	src.playsound_local(null, 'hypermods/sound/effects/suicide_harm_warning.ogg', 70, FALSE, use_reverb = FALSE)
	addtimer(CALLBACK(src, PROC_REF(self_harm_dmg)), 19 SECONDS) // give us a heads-up we're about to be hurt.

/mob/living/carbon/human/proc/self_harm_dmg()
	var/mob/living/carbon/human/our_human = src

	if(!our_human) // did we get gibbed or something?
		return FALSE

	if(our_human.stat == DEAD) // can't harm yourself.
		return FALSE

	if(our_human.incapacitated & INCAPABLE_RESTRAINTS || HAS_TRAIT(our_human, TRAIT_HANDS_BLOCKED))
		src.adjust_organ_loss(ORGAN_SLOT_TONGUE, 20)
		src.apply_damage(1, BRUTE, BODY_ZONE_HEAD, wound_bonus = 10)
		src.visible_message(
			span_danger("[src] bites down hard onto their tongue!"),
			span_userdanger("You chomp your own tongue!"),
		)
	else
		var/target_bodypart = src.get_random_valid_zone(pick(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_R_ARM, BODY_ZONE_R_LEG, BODY_ZONE_L_ARM, BODY_ZONE_L_LEG))
		src.apply_damage(10, BRUTE, target_bodypart, wound_bonus = 100, sharpness = TRUE)
		src.visible_message(
			span_danger("[src] lashes out and claws into themself!"),
			span_userdanger("You take your frustrations out upon yourself!"),
		)
		src.say("[pick("Yes... the pain! It feels so good...", "I CAN'T TAKE IT ANYMORE!!!", "Fuck this place!", "RAAAGH!!!", "...I hope whoever loots my corpse has better luck than me...", "I died the moment I arrived.", "I'm done. I give up.", "Please... just make it stop...", "Someone... please make this STOP.", "I... need SOMETHING... to make me feel better!", "This time I'm REALLY GONNA DO IT.", "This can't be real...", "Perhaps I shouldn't have ever been born.", "I just want to go to sleep, and never wake up.", "I'm leaving once and for all.", "I'll be more useful as a rotted corpse.", "May God have mercy upon my broken soul.", "I'm... a failure after all.")]")

/mob/living/carbon/human/proc/last_stand() // used by /datum/status_effect/misery
	var/mob/living/carbon/human/our_human = src

	if(!our_human) // did we get gibbed or something?
		return FALSE

	if(our_human.stat == DEAD) // you're dead already.
		return FALSE

	if(our_human.has_status_effect(/datum/status_effect/last_stand_cd))
		return FALSE

	src.fakedeath("last_stand")
	src.set_heartattack(FALSE) // Just in case.
	src.apply_status_effect(/datum/status_effect/last_stand)
	balloon_alert(our_human, "But you refuse.")
	src.playsound_local(null, 'hypermods/sound/effects/last_stand.ogg', 70, FALSE, use_reverb = FALSE)
	addtimer(CALLBACK(src, PROC_REF(last_stand_end)), 4 SECONDS) // give us a heads-up we're about to be hurt.

/mob/living/carbon/human/proc/last_stand_end()
	src.cure_fakedeath("last_stand")


/mob/living/carbon/human/proc/forceEquipOutfit(dresscode) // Taken from select equipment admin verb. Uses by the status infernal contact wish.
	for(var/obj/item/item in src.get_equipped_items(NONE))
		qdel(item)

	var/obj/item/organ/brain/human_brain = src.get_organ_slot(BRAIN)
	human_brain.destroy_all_skillchips() // get rid of skillchips to prevent runtimes

	src.equipOutfit(dresscode)

	src.regenerate_icons()


/mob/living/carbon/human/species/werewolf
	race = /datum/species/werewolf

/mob/living/carbon/human/species/protogen
	race = /datum/species/protogen
