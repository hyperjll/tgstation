/// Abolutel max of how cold a borer can be
#define BODYTEMP_BORER_COOLING_MAX (BODYTEMP_COOLING_MAX / 10)
/// Abolutel max of how hot a borer can be
#define BODYTEMP_BORER_HEATING_MAX (BODYTEMP_HEATING_MAX / 8)

/// is something a worm
#define iscorticalborer(A) (istype(A, /mob/living/basic/cortical_borer))

// Borer evolution defines
// The three primary paths that eventually diverge
#define BORER_EVOLUTION_SYMBIOTE "Symbiote"
#define BORER_EVOLUTION_HIVELORD "Hivelord"
#define BORER_EVOLUTION_DIVEWORM "Diveworm"
// Just general upgrades that don't take you in a specific direction
#define BORER_EVOLUTION_GENERAL "General"
#define BORER_EVOLUTION_START "Start"

// Borer effect flags

/// If the borer is in stealth mode, giving less feedback to hosts at the cost of no health/resource/point gain
#define BORER_STEALTH_MODE (1<<0)
/// If the borer is sugar-immune, taking no ill effects from sugar
#define BORER_SUGAR_IMMUNE (1<<1)
/// If the borer is able to enter hosts in half the time, if not hiding
#define BORER_FAST_BORING (1<<2)
/// If the borer is currently hiding under tables/couches/stairs or appearing on top of them
#define BORER_HIDING (1<<3)
/// If the borer can produce eggs without a host
#define BORER_ALONE_PRODUCTION (1<<4)

#define ACTIONSPEED_ID_BORER "borer"
