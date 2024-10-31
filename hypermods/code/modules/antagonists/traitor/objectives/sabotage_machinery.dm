/datum/traitor_objective/sabotage_machinery/trap/rare
	name = "Sabotage the %MACHINE%"
	description = "Destroy the %MACHINE% to cause disarray and disrupt the operations of the %JOB%'s department. If you can get another crew member to destroy the machine using the provided booby trap, you will be rewarded with an additional %PROGRESSION% reputation and %TC% telecrystals."

	progression_reward = list(5 MINUTES, 8 MINUTES)
	telecrystal_reward = 2 // A reward, for tresspassing into hard-to-breach areas

	progression_minimum = 10 MINUTES
	progression_maximum = 30 MINUTES

	maximum_allowed = 1
	applicable_jobs = list(
		JOB_HEAD_OF_SECURITY = /obj/machinery/rnd/production/techfab/department/security,
		JOB_CAPTAIN = /obj/machinery/computer/communications,
		JOB_AI = /obj/machinery/computer/upload/ai,
	)

	/// Bonus reward to grant if you booby trap successfully
	bonus_tc = 3
	/// Bonus progression to grant if you booby trap successfully
	bonus_progression = 5 MINUTES
	/// Have we given out a traitor trap item?
	traitor_trapper_given = FALSE

/obj/machinery/rnd/production/techfab/department/security/add_as_sabotage_target()
	return add_sabotage_machine(src, type)

/obj/machinery/computer/communications/add_as_sabotage_target()
	return add_sabotage_machine(src, type)

/obj/machinery/computer/upload/ai/add_as_sabotage_target()
	return add_sabotage_machine(src, type)
