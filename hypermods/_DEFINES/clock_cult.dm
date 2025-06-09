/// maximum amount of cogscarabs the clock cult can have
#define MAXIMUM_COGSCARABS 9
/// is something a cogscarab
#define iscogscarab(checked) (istype(checked, /mob/living/basic/drone/cogscarab))
/// is something an eminence
#define iseminence(checked) (istype(checked, /mob/living/eminence))

/// Cooldowns
#define COOLDOWN_MECHA_JUDICIAL_MARK "mecha_judicial_mark"
#define COOLDOWN_MECHA_STEAM_DISCHARGE "mecha_steam_discharge"

#define TIMER_COOLDOWN_START(cd_source, cd_index, cd_time) LAZYSET(cd_source.cooldowns, cd_index, addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(end_cooldown), cd_source, cd_index), cd_time))

#define TIMER_COOLDOWN_CHECK(cd_source, cd_index) LAZYACCESS(cd_source.cooldowns, cd_index)

#define TIMER_COOLDOWN_END(cd_source, cd_index) LAZYREMOVE(cd_source.cooldowns, cd_index)

// Spells

#define SPELLTYPE_ABSTRACT "Abstract"
#define SPELLTYPE_SERVITUDE "Servitude"
#define SPELLTYPE_PRESERVATION "Preservation"
#define SPELLTYPE_STRUCTURES "Structures"

#define SIGIL_TRANSMISSION_RANGE 4

#define MAX_CLOCK_VITALITY 400

///base state the ark is created in, any state besides this will be a hostile environment
#define ARK_STATE_BASE 0
///state for the grace period after the cult has reached its member count max and have enough activing anchoring crystals to summon
#define ARK_STATE_CHARGING 1
///state for after the cult has been annouced and are preparing for the portals to open
#define ARK_STATE_GRACE 2
///state for the first half of the assault
#define ARK_STATE_ACTIVE 3
///state for the halfway point of ark activation
#define ARK_STATE_SUMMONING 4
///the ark has either finished opening or been destroyed in this state
#define ARK_STATE_FINAL 5

///max damage taken per hit by "important" clock structures
#define MAX_IMPORTANT_CLOCK_DAMAGE 30

///how many anchoring crystals need to be active before the ark can open
#define ANCHORING_CRYSTALS_TO_SUMMON 2

///the map path of the reebe map
#define REEBE_MAP_PATH "_maps/templates/lazy_templates/reebe.dmm"

///how long between uses of the anchoring crystal scripture, also how long the hostile environment lasts if the crystal is not destroyed
#define ANCHORING_CRYSTAL_COOLDOWN 7 MINUTES

///up to how many tiles away will the ark stop certain things from breaking turfs
#define ARK_TURF_DESTRUCTION_BLOCK_RANGE 9

/// Trait source for the stargazer.
#define STARGAZER_TRAIT "stargazer"
/// Trait source for the vanguard scripture
#define VANGUARD_TRAIT "vanguard"

/// Status effects
#define STATUS_EFFECT_INTERDICTION /datum/status_effect/interdiction //used by interdiction lenses and judicial marks

//clockwork wall deconstruction
#define COVER_COG_REMOVED 1
#define TRANSMISSION_COGS_REMOVED 2
#define GEARS_UNBOLTED 3
#define INNER_PANEL_REMOVED 4
#define GEARS_UNWOUND 5 //for clock cultist deconstruction

// Clockwork species
#define SPECIES_GOLEM_CLOCKWORK "clock_golem"

// boolean - marks a level as having that property if present
#define ZTRAIT_REEBE "Reebe"

///List of ztraits the reebe Z level has
#define ZTRAITS_REEBE list(ZTRAIT_REEBE = TRUE, ZTRAIT_NOPHASE = TRUE, ZTRAIT_BOMBCAP_MULTIPLIER = 0.5, ZTRAIT_RESERVED = TRUE)

///check if a z level is reebe
#define is_reebe_level(z) SSmapping.level_trait(z, ZTRAIT_REEBE)
