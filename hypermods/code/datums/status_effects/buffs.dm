/datum/status_effect/catchup // used by the mirage drive
	id = "catchup"
	duration = 1 SECONDS
	var/newcolor = list(rgb(77,77,77), rgb(150,150,150), rgb(28,28,28), rgb(0,0,0))

/datum/status_effect/catchup/on_apply()
	. = ..()
	if(.)
		owner.add_movespeed_modifier(/datum/movespeed_modifier/status_effect/catchup)
		owner.add_atom_colour(newcolor, FIXED_COLOUR_PRIORITY)

/datum/status_effect/catchup/on_remove()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/status_effect/catchup)
	owner.remove_atom_colour(FIXED_COLOUR_PRIORITY)


/datum/status_effect/regenerative_howl
	id = "regenerative_howl"
	duration = 1 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/regenerative_howl
	/// Whether we healed from our last tick
	var/healed_last_tick = FALSE

/datum/status_effect/regenerative_howl/tick(seconds_between_ticks)
	healed_last_tick = FALSE
	var/need_mob_update = FALSE

	if(owner.get_brute_loss() > 0)
		need_mob_update += owner.adjust_brute_loss(-0.5, updating_health = FALSE)
		healed_last_tick = TRUE

	if(owner.get_fire_loss() > 0)
		need_mob_update += owner.adjust_fire_loss(-0.5, updating_health = FALSE)
		healed_last_tick = TRUE

	if(owner.get_tox_loss() > 0)
		// Forced, so slimepeople are healed as well.
		need_mob_update += owner.adjust_tox_loss(-0.25, updating_health = FALSE, forced = TRUE)
		healed_last_tick = TRUE

	if(need_mob_update)
		owner.updatehealth()

	// Technically, "healed this tick" by now.
	if(healed_last_tick)
		new /obj/effect/temp_visual/heal(get_turf(owner), COLOR_RED)

	return ..()

/atom/movable/screen/alert/status_effect/regenerative_howl
	name = "Regenerative Howl"
	desc = "You succeeded in performing a Defensive Howl, and are slowly recouperating from any wounds."
	icon = 'hypermods/icons/ui_icons/antags/werewolf/werewolf_ui.dmi'
	icon_state = "howl"


/datum/status_effect/adrenaline_quirk
	id = "adrenaline_quirk"
	alert_type = /atom/movable/screen/alert/status_effect/adrenaline_quirk

/datum/status_effect/adrenaline_quirk/on_apply()
	. = ..()
	if(.)
		owner.add_movespeed_modifier(/datum/movespeed_modifier/status_effect/adrenaline_quirk)

/datum/status_effect/adrenaline_quirk/on_remove()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/status_effect/adrenaline_quirk)

/atom/movable/screen/alert/status_effect/adrenaline_quirk
	name = "Adrenaline"
	desc = "Your wounds have resulted in your brain releasing a constant stream of adrenaline. You'll move about 20% faster."
	icon = 'hypermods/icons/hud/implants.dmi'
	icon_state = "adrenaline"


/datum/status_effect/bed_rest
	id = "bed_rest"
	alert_type = /atom/movable/screen/alert/status_effect/bed_rest

/datum/status_effect/bed_rest/tick(seconds_between_ticks)
	var/need_mob_update = FALSE

	if(owner.stat == DEAD)
		return

	if(owner.get_brute_loss() > 0)
		need_mob_update += owner.adjust_brute_loss(-0.1, updating_health = FALSE)

	if(owner.get_fire_loss() > 0)
		need_mob_update += owner.adjust_fire_loss(-0.1, updating_health = FALSE)

	if(owner.get_tox_loss() > 0)
		// Forced, so slimepeople are healed as well.
		need_mob_update += owner.adjust_tox_loss(-0.1, updating_health = FALSE, forced = TRUE)

	if(need_mob_update)
		owner.updatehealth()

	return ..()

/atom/movable/screen/alert/status_effect/bed_rest
	name = "Bed Rest"
	desc = "You're resting on a bed, the mattress sure is comfy. You'll slowly recover from damage this way."
	icon = 'hypermods/icons/hud/screen_alert.dmi'
	icon_state = "bed_rest"


/datum/status_effect/auto_pump
	id = "auto_pump"
	duration = 5 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/auto_pump

/datum/status_effect/auto_pump/on_apply()
	. = ..()
	if(.)
		owner.add_traits(list(TRAIT_NOBREATH, TRAIT_STABLEHEART, TRAIT_NOCRITDAMAGE), "auto-pump")

/datum/status_effect/auto_pump/on_remove()
	owner.remove_traits(list(TRAIT_NOBREATH, TRAIT_STABLEHEART, TRAIT_NOCRITDAMAGE), "auto-pump")
	playsound(owner.loc, 'hypermods/sound/items/autopumpend.ogg', 30, TRUE)

/datum/status_effect/auto_pump/tick(seconds_between_ticks)
	var/need_mob_update = FALSE

	if(owner.stat == DEAD)
		return

	var/total_damage = (owner.get_brute_loss() + owner.get_fire_loss() + owner.get_tox_loss())

	if(total_damage >= 100)
		need_mob_update += owner.adjust_brute_loss(-0.25, updating_health = FALSE)
		need_mob_update += owner.adjust_fire_loss(-0.25, updating_health = FALSE)
		need_mob_update += owner.adjust_tox_loss(-0.25, updating_health = FALSE, forced = TRUE)

	if(owner.get_oxy_loss() > 0)
		need_mob_update += owner.adjust_oxy_loss(-0.5, updating_health = FALSE)

	owner.adjust_blood_volume(0.4, maximum = BLOOD_VOLUME_SAFE)

	if(need_mob_update)
		owner.updatehealth()

	return ..()

/atom/movable/screen/alert/status_effect/auto_pump
	name = "Auto-Pump Life-Support"
	desc = "You've had an Auto-Pump attached to you, and have been granted temporary life-support."
	icon = 'hypermods/icons/obj/medical/imported_medical.dmi'
	icon_state = "autopump_status"


/datum/status_effect/neuralboosted
	id = "neuralboosted"
	duration = INFINITY
	alert_type = /atom/movable/screen/alert/status_effect/neuralboosted

/datum/status_effect/neuralboosted/tick(seconds_between_ticks)
	owner.AdjustAllImmobility(-10, FALSE)

	return ..()

/datum/status_effect/neuralboosted/on_apply()
	. = ..()
	if(.)
		owner.add_actionspeed_modifier(/datum/actionspeed_modifier/neuralboosted)
		owner.add_movespeed_modifier(/datum/movespeed_modifier/neuralboosted)
		owner.maxHealth += 10
		owner.add_traits(list(TRAIT_STRENGTH), "neuralboosted")

/datum/status_effect/neuralboosted/on_remove()
	owner.remove_actionspeed_modifier(/datum/actionspeed_modifier/neuralboosted)
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/neuralboosted)
	owner.maxHealth -= 10
	owner.remove_traits(list(TRAIT_STRENGTH), "neuralboosted")


/atom/movable/screen/alert/status_effect/neuralboosted
	name = "Neural Boosted"
	desc = "Your brain's been permanently enhanced by a Neural Booster. Many of your physical and mental abilities have been improved."
	icon = 'hypermods/icons/hud/screen_alert.dmi'
	icon_state = "neuralboosted"


/datum/status_effect/antidepressants
	id = "antidepressants"
	duration = INFINITY
	alert_type = /atom/movable/screen/alert/status_effect/antidepressants

/atom/movable/screen/alert/status_effect/antidepressants
	name = "Anti-Depressants"
	desc = "You're on Anti-Depressants. You feel like everything will be alright."
	icon = 'hypermods/icons/hud/screen_alert.dmi'
	icon_state = "antidepressants"


/datum/status_effect/immortality_regen
	id = "immortality_regen"
	duration = INFINITY
	alert_type = null

/datum/status_effect/immortality_regen/tick(seconds_between_ticks)
	var/need_mob_update = FALSE

	if(owner.get_brute_loss() > 0)
		need_mob_update += owner.adjust_brute_loss(-0.5, updating_health = FALSE)

	if(owner.get_fire_loss() > 0)
		need_mob_update += owner.adjust_fire_loss(-0.5, updating_health = FALSE)

	if(owner.get_tox_loss() > 0)
		// Forced, so slimepeople are healed as well.
		need_mob_update += owner.adjust_tox_loss(-0.25, updating_health = FALSE, forced = TRUE)

	if(owner.get_oxy_loss() > 0)
		need_mob_update += owner.adjust_oxy_loss(-0.5, updating_health = FALSE)

	owner.adjust_blood_volume(0.2, maximum = BLOOD_VOLUME_SAFE)

	if(need_mob_update)
		owner.updatehealth()

	return ..()


/datum/status_effect/extra_lives
	id = "extra_lives"
	duration = INFINITY
	alert_type = null
	var/extra_lives = 9
	/// Were we gained by selling our soul?
	var/soul_sold = FALSE

/datum/status_effect/extra_lives/on_apply()
	. = ..()
	if(.)
		owner.add_traits(list(TRAIT_BOMBGIBIMMUNE), "extra_lives")

/datum/status_effect/extra_lives/tick(seconds_between_ticks)
	if(owner.stat != DEAD)
		return

	owner.revive(ADMIN_HEAL_ALL, force_grab_ghost = TRUE)

	do_sparks(5,FALSE,owner)
	var/turf/emergency_turf = find_safe_turf(owner.z, extended_safety_checks = TRUE)
	var/range = 0
	if(!emergency_turf)
		emergency_turf = get_turf(owner)
		range = 50
	if(do_teleport(owner, emergency_turf, range, channel = TELEPORT_CHANNEL_BLUESPACE))
		do_sparks(5,FALSE,owner)

	extra_lives--

	to_chat(owner, span_notice("You've lost a life. You have [extra_lives] lives left."))

	if(extra_lives <= 0)
		qdel(src)

	return ..()

/datum/status_effect/extra_lives/on_remove()
	owner.remove_traits(list(TRAIT_BOMBGIBIMMUNE), "extra_lives")
	if(soul_sold) // To prevent ghosts from being locked outta their bodies despite having extra lives.
		ADD_TRAIT(owner, TRAIT_SOUL_SOLD, SOUL_CONTRACT_TRAIT)

/datum/status_effect/extra_lives/three
	extra_lives = 3

/datum/status_effect/extra_lives/three/devil
	soul_sold = TRUE

/datum/status_effect/extra_lives/single
	extra_lives = 1


/datum/status_effect/eternal_youth
	id = "eternal_youth"
	duration = INFINITY
	alert_type = null

/datum/status_effect/eternal_youth/on_apply()
	. = ..()
	if(.)
		owner.add_traits(list(TRAIT_NODISMEMBER), "eternal_youth")

/datum/status_effect/eternal_youth/tick(seconds_between_ticks)
	if(owner.stat != DEAD)
		return

	var/need_mob_update = FALSE

	if(owner.get_brute_loss() > 0)
		need_mob_update += owner.adjust_brute_loss(-1, updating_health = FALSE)

	if(owner.get_fire_loss() > 0)
		need_mob_update += owner.adjust_fire_loss(-1, updating_health = FALSE)

	if(owner.get_tox_loss() > 0)
		// Forced, so slimepeople are healed as well.
		need_mob_update += owner.adjust_tox_loss(-0.5, updating_health = FALSE, forced = TRUE)

	if(owner.get_oxy_loss() > 0)
		need_mob_update += owner.adjust_oxy_loss(-1, updating_health = FALSE)

	owner.adjust_blood_volume(0.5, maximum = BLOOD_VOLUME_SAFE)

	if(need_mob_update)
		owner.updatehealth()

	if(!ishuman(owner))
		return ..()

	var/mob/living/carbon/human/affected_mob = owner
	affected_mob.AdjustAllImmobility(-40)

	affected_mob.age = 18
	return ..()

/datum/status_effect/eternal_youth/on_remove()
	owner.remove_traits(list(TRAIT_NODISMEMBER), "eternal_youth")


/datum/status_effect/protection_wish
	id = "protection_wish"
	duration = INFINITY
	alert_type = null
	var/healthcheck

/datum/status_effect/protection_wish_cd
	id = "protection_wish_cd"
	duration = 1200
	alert_type = null

/datum/status_effect/protection_wish/on_apply()
	. = ..()
	if(.)
		var/mob/living/carbon/human/our_human = owner
		our_human.add_traits(list(TRAIT_BOMBGIBIMMUNE), "protection_wish")
		our_human.physiology.brute_mod *= 0.5
		our_human.physiology.burn_mod *= 0.5
		our_human.physiology.tox_mod *= 0.5
		our_human.physiology.oxy_mod *= 0.5

/datum/status_effect/protection_wish/tick(seconds_between_ticks)
	if(owner.has_status_effect(/datum/status_effect/protection_wish_cd))
		return ..()

	if(healthcheck && (healthcheck - owner.health) > 5)
		to_chat(owner, span_notice("As your health plummets, you suddenly find yourself transported elsewhere!"))
		do_sparks(5,FALSE,owner)
		var/turf/emergency_turf = find_safe_turf(owner.z, extended_safety_checks = TRUE)
		var/range = 0
		if(!emergency_turf)
			emergency_turf = get_turf(owner)
			range = 50
		if(do_teleport(owner, emergency_turf, range, channel = TELEPORT_CHANNEL_BLUESPACE))
			do_sparks(5,FALSE,owner)
			owner.apply_status_effect(/datum/status_effect/protection_wish_cd)
	healthcheck = owner.health
	return ..()

/datum/status_effect/protection_wish/on_remove()
	var/mob/living/carbon/human/our_human = owner
	our_human.remove_traits(list(TRAIT_BOMBGIBIMMUNE), "protection_wish")
	our_human.physiology.brute_mod /= 0.5
	our_human.physiology.burn_mod /= 0.5
	our_human.physiology.tox_mod /= 0.5
	our_human.physiology.oxy_mod /= 0.5


/datum/status_effect/contentment
	id = "contentment"
	duration = INFINITY
	alert_type = /atom/movable/screen/alert/status_effect/contentment
	var/laststand_chance = 0.1 // % chance when entering critical condition for a last stand.

/datum/status_effect/contentment/tick(seconds_between_ticks)
	if(!owner)
		return

	var/mob/living/carbon/human/moody_human = owner
	if(moody_human.mob_mood.sanity_level >= SANITY_LEVEL_NEUTRAL)
		owner.remove_status_effect(/datum/status_effect/contentment)

	if(HAS_TRAIT(moody_human, TRAIT_CRITICAL_CONDITION))
		if(prob(laststand_chance))
			moody_human.last_stand()

	return ..()

/atom/movable/screen/alert/status_effect/contentment
	name = "Contentment"
	desc = "You're in great mental health and have grown content with your current predicament."
	icon = 'hypermods/icons/hud/screen_alert.dmi'
	icon_state = "contentment"

/datum/status_effect/last_stand_cd
	id = "last_stand_cd"
	duration = 10 MINUTES
	alert_type = null

/datum/status_effect/last_stand
	id = "last_stand"
	duration = 5 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/last_stand
	var/laststand_chance = 0.1 // % chance when entering critical condition for a last stand.

/datum/status_effect/last_stand/on_apply()
	. = ..()
	if(.)
		if(owner.get_oxy_loss())
			owner.adjust_oxy_loss(-200, updating_health = FALSE)
		if(owner.get_brute_loss() > 40)
			var/totalbruteloss = owner.get_brute_loss()
			owner.adjust_brute_loss((-totalbruteloss + 40), updating_health = FALSE)
		if(owner.get_fire_loss() > 40)
			var/totalfireloss = owner.get_fire_loss()
			owner.adjust_fire_loss((-totalfireloss + 40), updating_health = FALSE)
		if(owner.get_tox_loss() > 15)
			var/totaltoxloss = owner.get_tox_loss() // this one gets special treatment to ensure the damage leftover never hits 100
			owner.adjust_tox_loss((-totaltoxloss + 15), updating_health = FALSE)

		owner.adjust_blood_volume(50, maximum = BLOOD_VOLUME_SAFE)

		owner.add_traits(list(TRAIT_NOSOFTCRIT, TRAIT_NOCRITDAMAGE), "last_stand")

		owner.apply_status_effect(/datum/status_effect/last_stand_cd)

/datum/status_effect/last_stand/tick(seconds_between_ticks)
	var/need_mob_update = FALSE

	if(owner.get_brute_loss() > 0)
		need_mob_update += owner.adjust_brute_loss(-0.2, updating_health = FALSE)

	if(owner.get_fire_loss() > 0)
		need_mob_update += owner.adjust_fire_loss(-0.2, updating_health = FALSE)

	if(owner.get_tox_loss() > 0)
		// Forced, so slimepeople are healed as well.
		need_mob_update += owner.adjust_tox_loss(-0.2, updating_health = FALSE, forced = TRUE)

	if(need_mob_update)
		owner.updatehealth()

	return ..()

/datum/status_effect/last_stand/on_remove()
	owner.remove_traits(list(TRAIT_NOSOFTCRIT, TRAIT_NOCRITDAMAGE), "last_stand")

/atom/movable/screen/alert/status_effect/last_stand
	name = "Last Stand"
	desc = "Something deep within you has awakened. Despite your broken body, you've refused to die. It'll be more difficult to put you down, but not impossible."
	icon = 'hypermods/icons/hud/screen_alert.dmi'
	icon_state = "last_stand"
