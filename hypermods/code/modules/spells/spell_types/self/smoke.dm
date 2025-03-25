/// Basic smoke spell.
/datum/action/cooldown/spell/smoke/curator
	name = "Lesser Smoke"
	desc = "This spell spawns a cloud of smoke at your location. \
		People within will begin to choke and drop their items. \
		It has an extended cooldown, likely due to your inexperience."
	button_icon_state = "smoke"

	school = SCHOOL_CONJURATION
	cooldown_time = 40 SECONDS
	cooldown_reduction_per_rank = 4 SECONDS
	spell_requirements = NONE

	invocation_type = INVOCATION_NONE

	smoke_type = /datum/effect_system/fluid_spread/smoke/bad
	smoke_amt = 4
