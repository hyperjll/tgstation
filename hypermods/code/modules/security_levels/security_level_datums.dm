/**
 * EPSILON
 *
 * Central Command is fed up with the station
 */
/datum/security_level/epsilon
	name = "Epsilon"
	name = "epsilon"
	announcement_color = "grey"
	number_level = SEC_LEVEL_EPSILON
	sound = 'hypermods/sound/announcer/alarm/epsilon.ogg'
	elevating_to_configuration_key = /datum/config_entry/string/alert_epsilon
	shuttle_call_time_mod = 5 // Good luck.

/**
 * YELLOW
 *
 * There's a Giant hole somewhere, ENGINEERING FIX IT!!!
 */
/datum/security_level/yellow
	name = "yellow"
	announcement_color = "yellow"
	number_level = SEC_LEVEL_YELLOW
	sound = 'sound/announcer/notice/notice1.ogg'
	lowering_to_configuration_key = /datum/config_entry/string/alert_yellow
	elevating_to_configuration_key = /datum/config_entry/string/alert_yellow
	shuttle_call_time_mod = 1.5

/**
 * AMBER
 *
 * Biological issues. Zombies, blobs, etc...
 */
/datum/security_level/amber
	name = "amber"
	announcement_color = "amber"
	number_level = SEC_LEVEL_AMBER
	sound = 'sound/announcer/notice/notice1.ogg'
	lowering_to_configuration_key = /datum/config_entry/string/alert_amber
	elevating_to_configuration_key = /datum/config_entry/string/alert_amber
	shuttle_call_time_mod = 1.5

/**
 * GAMMA
 *
 * The CentCom Flavor of Red Alert. Usually used for events.
 */
/datum/security_level/gamma
	name = "gamma"
	announcement_color = "pink" //Its like red, but diffrent.
	number_level = SEC_LEVEL_GAMMA
	sound = 'hypermods/sound/announcer/alarm/gamma.ogg'
	lowering_to_configuration_key = /datum/config_entry/string/alert_gamma
	elevating_to_configuration_key = /datum/config_entry/string/alert_gamma
	shuttle_call_time_mod = 0.5 //Oh god oh fuck things aint looking good.

/**
 * LAMBDA
 *
 * Pants are gonna be turning brown if this activates.
 */
/datum/security_level/lambda
	name = "lambda"
	announcement_color = "crimson"
	number_level = SEC_LEVEL_LAMBDA
	sound = 'hypermods/sound/announcer/alarm/lambda.ogg' // Ported over the current (as of this codes time) ss14 gamma alert, renamed because it fits better. Old gamma was better :(
	elevating_to_configuration_key = /datum/config_entry/string/alert_lambda
	shuttle_call_time_mod = 0.25 //This is as bad as the nuke going off. Everyone is fucked.
