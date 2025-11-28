/obj/item/implant/pseudodeath
	name = "pseudo death implant"
	desc = "A rare implant designed protect the host in critical condition while feigning their death."
	actions_types = null
	var/downdur = 60 SECONDS
	var/cooldowndur = 4 MINUTES // Technically 3 minutes
	var/healththreshold = 40
	COOLDOWN_DECLARE(pseudodeath_cooldown)

/obj/item/implant/pseudodeath/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(.)
		RegisterSignal(target, COMSIG_LIVING_HEALTH_UPDATE, PROC_REF(check_health))

/obj/item/implant/pseudodeath/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(.)
		UnregisterSignal(target, COMSIG_LIVING_HEALTH_UPDATE)

/obj/item/implant/pseudodeath/proc/check_health(mob/living/source)
	SIGNAL_HANDLER

	if(!COOLDOWN_FINISHED(src, pseudodeath_cooldown))
		return

	if(source.health < (source.crit_threshold - healththreshold))
		fake_death(source)

/obj/item/implant/pseudodeath/proc/fake_death(mob/living/carbon/source)
	if(QDELETED(source) || source.stat == DEAD)
		return
	source.fakedeath("imp_pseudodeath")
	ADD_TRAIT(source, TRAIT_NOCRITDAMAGE, IMPLANT_TRAIT)

	if(ishuman(source))
		var/mob/living/carbon/human/H = source
		H.physiology.brute_mod *= 0.1
		H.physiology.burn_mod *= 0.1
		H.physiology.tox_mod *= 0.1

	addtimer(CALLBACK(src, PROC_REF(unfake_death), source), downdur)
	COOLDOWN_START(src, pseudodeath_cooldown, cooldowndur)

/obj/item/implant/pseudodeath/proc/unfake_death(mob/living/carbon/source)
	if(QDELETED(src))
		return

	if(ishuman(source))
		var/mob/living/carbon/human/H = source
		H.physiology.brute_mod /= 0.1
		H.physiology.burn_mod /= 0.1
		H.physiology.tox_mod /= 0.1

	if(source.get_oxy_loss())
		source.adjust_oxy_loss(-200, updating_health = FALSE)
	if(source.get_brute_loss() > 40)
		var/totalbruteloss = source.get_brute_loss()
		source.adjust_brute_loss((-totalbruteloss + 40), updating_health = FALSE)
	if(source.get_fire_loss() > 40)
		var/totalfireloss = source.get_fire_loss()
		source.adjust_fire_loss((-totalfireloss + 40), updating_health = FALSE)
	if(source.get_tox_loss() > 15)
		var/totaltoxloss = source.get_tox_loss() // this one gets special treatment to ensure the damage leftover never hits 100
		source.adjust_tox_loss((-totaltoxloss + 15), updating_health = FALSE)

	source.set_heartattack(FALSE) // Just in case.
	source.set_jitter_if_lower(200 SECONDS)
	log_game("[source] fakes their death via [src]")

	REMOVE_TRAIT(source, TRAIT_NOCRITDAMAGE, IMPLANT_TRAIT)
	source.cure_fakedeath("imp_pseudodeath")


/obj/item/implanter/pseudodeath
	name = "implanter (pseudo-death)"
	icon = 'hypermods/icons/obj/medical/syringe.dmi'
	icon_state = "simplanter0"
	base_icon_state = "simplanter"
	imp_type = /obj/item/implant/pseudodeath

/obj/item/implantcase/pseudodeath
	name = "Implant Case - 'Pseudo-Death'"
	desc = "A glass case containing a pseudo-death implant."
	imp_type = /obj/item/implant/pseudodeath
