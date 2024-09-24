/datum/action/cooldown/spell/aoe/knock/curator
	name = "Lesser Knock"
	desc = "This spell opens nearby doors and closets. It has an extended cooldown, likely due to your inexperience."
	button_icon_state = "knock"

	sound = 'sound/effects/magic/knock.ogg'
	school = SCHOOL_TRANSMUTATION
	cooldown_time = 120 SECONDS
	cooldown_reduction_per_rank = 10 SECONDS

	invocation = "AULIE OXIN FIERA"
	invocation_type = INVOCATION_WHISPER
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC
	aoe_radius = 3
