/datum/religion_rites/rising_pheonix
	name = "Rising Pheonix"
	desc = "Invoke resurrection upon a corpse buckled to your altar, the flames can burn and the fire can comfort."
	ritual_length = 15 SECONDS
	ritual_invocations = list("Ruined body ...",
	"... rise by the flame ...",
	"... let this one's fire be re-kindled ...",
	"... and let it burn brighter ...")
	invoke_msg = "... THAN EVER BEFORE! "
	favor_cost = 1000
	///the buckled corpse we want to revive.
	var/mob/living/carbon/chosen_body

/datum/religion_rites/rising_pheonix/perform_rite(mob/living/user, atom/religious_tool)
	if(!ismovable(religious_tool))
		to_chat(user, span_warning("This rite requires a religious device that individuals can be buckled to."))
		return FALSE
	var/atom/movable/movable_reltool = religious_tool
	if(!movable_reltool)
		return FALSE
	if(!LAZYLEN(movable_reltool.buckled_mobs))
		to_chat(user, span_warning("Nothing is buckled to the altar!"))
		return FALSE
	for(var/corpse in movable_reltool.buckled_mobs)
		if(!iscarbon(corpse))// only works with carbon corpse since most normal mobs can't be set on fire.
			to_chat(user, span_warning("Only carbon lifeforms can be properly burned for the rite!"))
			return FALSE
		chosen_body = corpse
		if(chosen_body.stat != DEAD)
			to_chat(user, span_warning("You can only resurrect dead bodies, this one is still alive!"))
			return FALSE
		return ..()

/datum/religion_rites/rising_pheonix/invoke_effect(mob/living/user, atom/movable/religious_tool)
	..()
	if(!(chosen_body in religious_tool.buckled_mobs))
		to_chat(user, span_warning("The one who was to be resurrected is no longer on the altar!"))
		chosen_body = null
		return FALSE
	if(chosen_body.stat != DEAD)
		to_chat(user, span_warning("This one is still alive!"))
		chosen_body = null
		return FALSE
	to_chat(user, span_notice("[GLOB.deity] coats the corpse with comforting flames for a brief moment, when the fire disappates, their wounds are gone and they spring to life!"))
	chosen_body.revive(ADMIN_HEAL_ALL, force_grab_ghost = TRUE)
	playsound(get_turf(religious_tool), 'sound/effects/magic/fireball.ogg', 50, TRUE)
	chosen_body = null
	return TRUE
