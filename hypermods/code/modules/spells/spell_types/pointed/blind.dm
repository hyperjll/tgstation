/datum/action/cooldown/spell/pointed/blind/curator
	name = "Lesser Blind"
	desc = "This spell temporarily blinds a single target.  It has an extended cooldown, likely due to your inexperience."
	button_icon_state = "blind"
	ranged_mousepointer = 'icons/effects/mouse_pointers/blind_target.dmi'

	sound = 'sound/magic/blind.ogg'
	school = SCHOOL_TRANSMUTATION
	cooldown_time = 60 SECONDS
	cooldown_reduction_per_rank = 6.25 SECONDS

	invocation = "STI KALY"
	invocation_type = INVOCATION_WHISPER
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC

	active_msg = "You prepare to blind a target..."

	/// The amount of blind to apply
	eye_blind_duration = 20 SECONDS
	/// The amount of blurriness to apply
	eye_blur_duration = 40 SECONDS
