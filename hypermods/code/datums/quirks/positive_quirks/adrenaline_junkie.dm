/datum/quirk/adrenaline_junkie
	name = "Adrenaline Junkie"
	desc = "While gravely injured, something primal kicks in and gives you the kick-in-the-ass you need to move faster than normal."
	icon = FA_ICON_PERSON_FALLING_BURST
	value = 10
	medical_record_text = "Patient is prone to abnormally large adrenaline releases during stressful situations."
	//mail_goodies = list()

/datum/quirk/adrenaline_junkie/add(client/client_source)
	RegisterSignal(quirk_holder, COMSIG_LIVING_HEALTH_UPDATE, PROC_REF(do_adrenaline_shit))

/datum/quirk/adrenaline_junkie/remove(client/client_source)
	UnregisterSignal(quirk_holder, COMSIG_LIVING_HEALTH_UPDATE)

/datum/quirk/adrenaline_junkie/proc/do_adrenaline_shit(datum/source, seconds_per_tick, times_fired)
	SIGNAL_HANDLER

	var/mob/living/carbon/human/human_holder = quirk_holder
	if(human_holder.stat == DEAD)
		return

	var/totaldamage = (human_holder.getBruteLoss() + human_holder.getFireLoss())
	if(totaldamage <= 75) // If you've sustained atleast 75+ brute/burn damage
		return

	if(human_holder.has_status_effect(/datum/status_effect/adrenaline_quirk))
		return

	human_holder.apply_status_effect(/datum/status_effect/adrenaline_quirk)
