/datum/action/cooldown/spell/emp/disable_tech/curator
	name = "Lesser Disable Tech"
	desc = "This spell disables all weapons, cameras and most other technology in range. It has an extended cooldown, likely due to your inexperience."
	sound = 'sound/magic/disable_tech.ogg'

	cooldown_time = 80 SECONDS
	cooldown_reduction_per_rank = 6 SECONDS

	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC

	invocation = "NEC CANTIO"
	invocation_type = INVOCATION_SHOUT

	emp_heavy = 3
	emp_light = 6
