//operating computer that starts with all surgeries excluding a few like necrotic revival
/obj/machinery/computer/operating/clockwork
	name = "Clockwork Operating Computer"
	desc = "A device containing (most) of the surgery secrets of the universe."
	icon = 'hypermods/icons/obj/machines/computer.dmi'
	icon_keyboard = "ratvar_key1"
	icon_screen = "ratvar2"
	icon_state = "ratvarcomputer"
	clockwork = TRUE
	///list of surgeries we get on Init()
	advanced_surgeries = list(/datum/surgery_operation/organ/lobotomy,
							/datum/surgery_operation/organ/lobotomy/mechanic,
							/datum/surgery_operation/organ/pacify,
							/datum/surgery_operation/basic/viral_bonding,
							/datum/surgery_operation/organ/fix_wings,
							/datum/surgery_operation/basic/tend_wounds/combo,
							/datum/surgery_operation/basic/revival)
