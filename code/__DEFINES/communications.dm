/// The time an admin has to cancel a cross-sector message
#define CROSS_SECTOR_CANCEL_TIME (10 SECONDS)

/// The extended time an admin has to cancel a cross-sector message if they pass the filter, for instance
#define EXTENDED_CROSS_SECTOR_CANCEL_TIME (30 SECONDS)

//Security levels affect the escape shuttle timer
/// Security level is green. (no threats)
#define SEC_LEVEL_GREEN 0
/// Security level is blue. (caution advised)
#define SEC_LEVEL_BLUE 1
/// Security level is red. (hostile threats)
#define SEC_LEVEL_RED 4
/// Security level is delta. (station destruction immiment)
#define SEC_LEVEL_DELTA 6


//Custom alert levels below

#define SEC_LEVEL_YELLOW 2 // Station has been massively sabotaged/cannot sustain life

#define SEC_LEVEL_GAMMA 5 // CC's version of a red alert

#define SEC_LEVEL_LAMBDA 7 // Eldritch beings have been unleashed. Station is a goner.

#define SEC_LEVEL_EPSILON 8 // You REALLY pissed off central command, likely by losing a revolution.

#define SEC_LEVEL_AMBER 3 // Major biohazard has been detected on the station. Blob/Zombies (Putting this at the very end as it's completely situational)

//Defines for "Alert Level Deltaww"
#define SEC_LEVEL_DELTAWW 9 // At THE very end of the list as it's a joke alert level
#define ALERT_COEFF_DELTAWW 255 //This alert level should only be temporary; might as well mess with everyone.
