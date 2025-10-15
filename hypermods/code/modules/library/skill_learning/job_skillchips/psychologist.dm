/obj/item/skillchip/reversehypno
	name = "HYPN0BAD skillchip"
	desc = "Taming hypnosis with the help of a trusty flash."
	auto_traits = list()
	skill_name = "Reverse Hypnosis"
	skill_description = "Secretive techniques to use flashes to snap people out of Hypnosis, Brainwashing, and other mind-altering trances."
	skill_icon = "spa"
	activate_message = "<span class='notice'>Your mind is flooded with information regarding reverse-hypnotherapy.</span>"
	deactivate_message = "<span class='notice'>You blank out as your knowledge over reverse-hypnotherapy leaves your mind.</span>"

/obj/item/skillchip/reversehypno/on_activate(mob/living/carbon/user, silent = FALSE)
	. = ..()
	RegisterSignal(user, COMSIG_MOB_SUCCESSFUL_FLASHED_MOB, PROC_REF(on_mob_successful_flashed_carbon))
	to_chat(user, span_notice("You are an expert in flash-based therapy and reverse-hypnotism. You may use a flash to heal brain damage and remove hypnotic effects from those you flash."))

/obj/item/skillchip/reversehypno/on_deactivate(mob/living/carbon/user, silent = FALSE)
	UnregisterSignal(user, COMSIG_MOB_SUCCESSFUL_FLASHED_MOB, PROC_REF(on_mob_successful_flashed_carbon))
	to_chat(user, span_notice("You are no longer an expert in flash-based therapy and reverse-hypnotism."))
	return ..()

/obj/item/skillchip/reversehypno/proc/on_mob_successful_flashed_carbon(mob/living/carbon/flashed, client/player_client)
	SIGNAL_HANDLER

	if(flashed.stat == DEAD)
		return

	if(flashed.stat != CONSCIOUS)
		return

	flashed.adjustOrganLoss(ORGAN_SLOT_BRAIN, -10)
	if(prob(10))
		flashed.cure_trauma_type(resilience = TRAUMA_RESILIENCE_BASIC)
// I'm making it cure revoluntaries first, as to not accidentally screw over brainwashers/hypnotizers in the event of a rev round.
	if(flashed.mind.has_antag_datum(/datum/antagonist/rev) && (!flashed.mind.has_antag_datum(/datum/antagonist/rev/head)))
		flashed.Paralyze(3 SECONDS)
		flashed.mind.remove_antag_datum(/datum/antagonist/rev)
		return

	if(flashed.mind.has_antag_datum(/datum/antagonist/brainwashed))
		flashed.Paralyze(3 SECONDS)
		flashed.mind.remove_antag_datum(/datum/antagonist/brainwashed)
		return

	if(flashed.mind.has_antag_datum(/datum/antagonist/hypnotized))
		flashed.Paralyze(3 SECONDS)
		flashed.mind.remove_antag_datum(/datum/antagonist/hypnotized)
		return
