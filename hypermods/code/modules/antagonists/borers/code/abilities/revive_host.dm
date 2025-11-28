//revive your host
/datum/action/cooldown/borer/revive_host
	name = "Revive Host"
	cooldown_time = 2 MINUTES
	button_icon_state = "revive"
	chemical_cost = 200
	requires_host = TRUE
	sugar_restricted = TRUE
	needs_dead_host = TRUE
	ability_explanation = "\
	Halfs all the damage, including organ damage that your host has. Then defiblirates their heart\n\
	You may need to use this ability multiple times depending on how badly your host is damaged\n\
	"

/datum/action/cooldown/borer/revive_host/Trigger(trigger_flags, atom/target)
	. = ..()
	if(!.)
		return FALSE
	var/mob/living/basic/cortical_borer/cortical_owner = owner

	cortical_owner.chemical_storage -= chemical_cost

	if(cortical_owner.human_host.get_brute_loss())
		cortical_owner.human_host.adjust_brute_loss(-(cortical_owner.human_host.get_brute_loss()*0.5))
	if(cortical_owner.human_host.get_tox_loss())
		cortical_owner.human_host.adjust_tox_loss(-(cortical_owner.human_host.get_tox_loss()*0.5))
	if(cortical_owner.human_host.get_fire_loss())
		cortical_owner.human_host.adjust_fire_loss(-(cortical_owner.human_host.get_fire_loss()*0.5))
	if(cortical_owner.human_host.get_oxy_loss())
		cortical_owner.human_host.adjust_oxy_loss(-(cortical_owner.human_host.get_oxy_loss()*0.5))

	if(cortical_owner.human_host.blood_volume < BLOOD_VOLUME_BAD)
		cortical_owner.human_host.blood_volume = BLOOD_VOLUME_BAD

	for(var/obj/item/organ/internal_target in cortical_owner.human_host.organs)
		internal_target.apply_organ_damage(-internal_target.damage * 0.5)

	cortical_owner.human_host.revive()
	to_chat(cortical_owner.human_host, span_boldwarning("Your heart jumpstarts!"))
	owner.balloon_alert(owner, "host revived")
	var/turf/human_turf = get_turf(cortical_owner.human_host)
	var/logging_text = "[key_name(cortical_owner)] revived [key_name(cortical_owner.human_host)] at [loc_name(human_turf)]"
	cortical_owner.log_message(logging_text, LOG_GAME)
	cortical_owner.human_host.log_message(logging_text, LOG_GAME)
	StartCooldown()
