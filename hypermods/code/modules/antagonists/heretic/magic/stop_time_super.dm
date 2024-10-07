/datum/action/cooldown/spell/timestop_super
	name = "Stop Time"
	desc = "This spell stops time for everyone except for you in an extremely large radius, \
		allowing you to move freely while your enemies and even projectiles are frozen."
	background_icon_state = "bg_heretic"
	overlay_icon_state = "bg_heretic_border"
	button_icon_state = "time"

	school = SCHOOL_FORBIDDEN
	cooldown_time = 1 MINUTES

	invocation = "L'T TH'S' N'GG'S KN'W"
	invocation_type = INVOCATION_WHISPER
	spell_requirements = SPELL_REQUIRES_HUMAN

	/// The radius / range of the time stop.
	var/timestop_range = 10 // Fuck you.
	/// The duration of the time stop.
	var/timestop_duration = 20 SECONDS // Also fuck you.

	/// if TRUE, the owner is immune to all time stop, from anyone
	var/owner_is_immune_to_all_timestop = TRUE
	/// if TRUE, the owner is immune to their own timestop (but not other people's, if above is FALSE)
	var/owner_is_immune_to_self_timestop = TRUE

/datum/action/cooldown/spell/timestop_super/Grant(mob/grant_to)
	. = ..()
	if(!isnull(owner) && owner_is_immune_to_all_timestop)
		ADD_TRAIT(owner, TRAIT_TIME_STOP_IMMUNE, REF(src))

/datum/action/cooldown/spell/timestop_super/Remove(mob/remove_from)
	REMOVE_TRAIT(remove_from, TRAIT_TIME_STOP_IMMUNE, REF(src))
	return ..()

/datum/action/cooldown/spell/timestop_super/cast(atom/cast_on)
	. = ..()
	var/list/default_immune_atoms = list()
	if(owner_is_immune_to_self_timestop)
		default_immune_atoms += cast_on
	new /obj/effect/timestop/magic(get_turf(cast_on), timestop_range, timestop_duration, default_immune_atoms)

/datum/action/cooldown/spell/timestop_super/vv_edit_var(var_name, var_value)
	. = ..()
	if(var_name != NAMEOF(src, owner_is_immune_to_all_timestop) || isnull(owner))
		return

	if(var_value)
		ADD_TRAIT(owner, TRAIT_TIME_STOP_IMMUNE, REF(src))
	else
		REMOVE_TRAIT(owner, TRAIT_TIME_STOP_IMMUNE, REF(src))
