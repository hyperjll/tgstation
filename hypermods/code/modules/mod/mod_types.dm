/obj/item/mod/control/pre_equipped/raid
	theme = /datum/mod_theme/raid
	starting_frequency = MODLINK_FREQ_SYNDICATE
	applied_cell = /obj/item/stock_parts/power_store/cell/hyper
	applied_modules = list(
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/pathfinder,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/hat_stabilizer/syndicate,
		/obj/item/mod/module/quick_cuff,
	)
	default_pins = list(
		/obj/item/mod/module/armor_booster,
	)

/obj/item/mod/control/pre_equipped/juggernaut
	theme = /datum/mod_theme/juggernaut
	starting_frequency = MODLINK_FREQ_SYNDICATE
	applied_cell = /obj/item/stock_parts/power_store/cell/hyper
	applied_modules = list(
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/pathfinder,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/hat_stabilizer/syndicate,
		/obj/item/mod/module/quick_cuff,
	)
	default_pins = list(
		/obj/item/mod/module/armor_booster,
		/obj/item/mod/module/jetpack,
	)

/obj/item/mod/control/pre_equipped/interdyne/traitor
	theme = /datum/mod_theme/interdyne/traitor
	starting_frequency = MODLINK_FREQ_SYNDICATE
	applied_cell = /obj/item/stock_parts/power_store/cell/hyper
	applied_modules = list(
		/obj/item/mod/module/organizer,
		/obj/item/mod/module/defibrillator/combat,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/health_analyzer,
		/obj/item/mod/module/injector,
		/obj/item/mod/module/surgical_processor/preloaded,
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/hat_stabilizer/syndicate,
		/obj/item/mod/module/tether,
		/obj/item/mod/module/quick_cuff,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/pathfinder,
		/obj/item/mod/module/magnetic_harness,
	)
	default_pins = list(
		/obj/item/mod/module/surgical_processor/preloaded,
		/obj/item/mod/module/health_analyzer,
		/obj/item/mod/module/defibrillator/combat,
		/obj/item/mod/module/organizer,
		/obj/item/mod/module/jetpack,
	)

/obj/item/mod/control/pre_equipped/responsory/inquisitory/syndie/super // a better version than this garbage
	theme = /datum/mod_theme/responsory/traitor/super
	starting_frequency = MODLINK_FREQ_SYNDICATE
	req_access = null
	applied_cell = /obj/item/stock_parts/power_store/cell/hyper
	applied_modules = list(
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/pathfinder,
		/obj/item/mod/module/flashlight/darkness/super,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/quick_cuff,
		/obj/item/mod/module/visor/night,
		/obj/item/mod/module/shove_blocker,
		/obj/item/mod/module/noslip,
		/obj/item/mod/module/shock_absorber, // should've been in the non-super one.
		/obj/item/mod/module/anti_magic, // this too.
	)
	default_pins = list(
		/obj/item/mod/module/flashlight/darkness/super,
		/obj/item/mod/module/jetpack,
	)


/obj/item/mod/control/pre_equipped/civilian/traitor
	theme = /datum/mod_theme/civilian/traitor
	starting_frequency = MODLINK_FREQ_SYNDICATE
	applied_modules = list(
		/obj/item/mod/module/welding,
		/obj/item/mod/module/longfall,
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/pathfinder,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/hat_stabilizer/syndicate,
		/obj/item/mod/module/quick_cuff,
		/obj/item/mod/module/armor_booster,
	)
	default_pins = list(
		/obj/item/mod/module/armor_booster,
		/obj/item/mod/module/jetpack,
	)

/obj/item/mod/control/pre_equipped/engineering/traitor
	theme = /datum/mod_theme/engineering/traitor
	starting_frequency = MODLINK_FREQ_SYNDICATE
	applied_modules = list(
		/obj/item/mod/module/welding,
		/obj/item/mod/module/rad_protection,
		/obj/item/mod/module/tether,
		/obj/item/mod/module/magboot/advanced, // Advanced magboots
		/obj/item/mod/module/headprotector,
		/obj/item/mod/module/visor/meson, // New
		/obj/item/mod/module/constructor, // New
		/obj/item/mod/module/rcd/syndicate, // Unique
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/pathfinder,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/hat_stabilizer/syndicate,
		/obj/item/mod/module/quick_cuff,
	)
	default_pins = list(
		/obj/item/mod/module/magboot/advanced,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/tether,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/rcd/syndicate,
	)

/obj/item/mod/control/pre_equipped/atmospheric/traitor
	theme = /datum/mod_theme/atmospheric/traitor
	starting_frequency = MODLINK_FREQ_SYNDICATE
	applied_modules = list(
		/obj/item/mod/module/welding,
		/obj/item/mod/module/rad_protection,
		/obj/item/mod/module/magboot/advanced, // Nice
		/obj/item/mod/module/quick_carry,
		/obj/item/mod/module/headprotector,
		/obj/item/mod/module/visor/meson,  // New
		/obj/item/mod/module/constructor,  // New
		/obj/item/mod/module/mister/syndicate, // Unique
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/pathfinder,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/hat_stabilizer/syndicate,
		/obj/item/mod/module/quick_cuff,
	)
	default_pins = list(
		/obj/item/mod/module/magboot/advanced,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/mister/syndicate,
	)

/obj/item/mod/control/pre_equipped/loader/traitor
	theme = /datum/mod_theme/loader/traitor
	starting_frequency = MODLINK_FREQ_SYNDICATE
	applied_modules = list(
		/obj/item/mod/module/stamp,
		/obj/item/mod/module/paper_rifle, // Unique
		/obj/item/mod/module/disposal_connector, // New
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/pathfinder,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/hat_stabilizer/syndicate,
		/obj/item/mod/module/quick_cuff,
	)
	default_pins = list(
		/obj/item/mod/module/clamp/loader,
		/obj/item/mod/module/magnet,
		/obj/item/mod/module/hydraulic,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/paper_rifle,
	)

/obj/item/mod/control/pre_equipped/mining/traitor
	theme = /datum/mod_theme/mining/traitor
	applied_core = /obj/item/mod/core/plasma
	starting_frequency = MODLINK_FREQ_SYNDICATE
	applied_modules = list(
		/obj/item/mod/module/gps,
		/obj/item/mod/module/orebag,
		/obj/item/mod/module/clamp,
		/obj/item/mod/module/drill,
		/obj/item/mod/module/mouthhole,
		/obj/item/mod/module/wormhole_jaunter, // Unique
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/pathfinder,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/hat_stabilizer/syndicate,
		/obj/item/mod/module/quick_cuff,
	)
	default_pins = list(
		/obj/item/mod/module/gps,
		/obj/item/mod/module/drill,
		/obj/item/mod/module/death_sphere, // Syndi version for free?
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/wormhole_jaunter,
	)

/obj/item/mod/control/pre_equipped/medical/traitor
	theme = /datum/mod_theme/medical/traitor
	starting_frequency = MODLINK_FREQ_SYNDICATE
	applied_modules = list(
		/obj/item/mod/module/health_analyzer,
		/obj/item/mod/module/quick_carry,
		/obj/item/mod/module/surgical_processor, // New
		/obj/item/mod/module/reagent_scanner/advanced, // New
		/obj/item/mod/module/medbeam, // Gotta have the regular version as an option or people will valid-hunt MODsuit users for using the medbeam.
		/obj/item/mod/module/harmbeam, // Hehe, harmbeam
		/obj/item/mod/module/hypospray, // Unique
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/pathfinder,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/hat_stabilizer/syndicate,
		/obj/item/mod/module/quick_cuff,
	)
	default_pins = list(
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/health_analyzer,
		/obj/item/mod/module/surgical_processor,
		/obj/item/mod/module/medbeam,
		/obj/item/mod/module/harmbeam,
	)

/obj/item/mod/control/pre_equipped/emergency_medical/traitor
	theme = /datum/mod_theme/medical/traitor2
	starting_frequency = MODLINK_FREQ_SYNDICATE
	applied_cell = /obj/item/stock_parts/power_store/cell/hyper
	applied_modules = list(
		/obj/item/mod/module/organizer,
		/obj/item/mod/module/defibrillator,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/health_analyzer,
		/obj/item/mod/module/injector,
		/obj/item/mod/module/surgical_processor/emergency, // Better than regular medical ver
		/obj/item/mod/module/medbeam, // Cream of the crop.
		/obj/item/mod/module/harmbeam, // Also here to not play favorites
		/obj/item/mod/module/syringe_pistol, // Unique
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/pathfinder,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/hat_stabilizer/syndicate,
		/obj/item/mod/module/quick_cuff,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/magnetic_harness,
	)
	default_pins = list(
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/health_analyzer,
		/obj/item/mod/module/injector,
		/obj/item/mod/module/organizer,
		/obj/item/mod/module/defibrillator,
		/obj/item/mod/module/surgical_processor/emergency,
		/obj/item/mod/module/medbeam,
		/obj/item/mod/module/syringe_pistol,
	)

/obj/item/mod/control/pre_equipped/cosmohonk/traitor
	theme = /datum/mod_theme/cosmohonk/traitor
	starting_frequency = MODLINK_FREQ_SYNDICATE
	applied_modules = list(
		/obj/item/mod/module/waddle,
		/obj/item/mod/module/bikehorn/mega, // Unique
		/obj/item/mod/module/balloon/explosive, // Just for clowns: A second unique module.
		/obj/item/mod/module/noslip, // For free
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/pathfinder,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/hat_stabilizer/syndicate,
	)
	default_pins = list(
		/obj/item/mod/module/jetpack/advanced,
		/obj/item/mod/module/bikehorn/mega,
		/obj/item/mod/module/balloon/explosive,
	)

/obj/item/mod/control/pre_equipped/prototype/traitor
	theme = /datum/mod_theme/prototype/traitor
	starting_frequency = MODLINK_FREQ_SYNDICATE
	req_access = null
	applied_modules = list(
		/obj/item/mod/module/welding,
		/obj/item/mod/module/rad_protection,
		/obj/item/mod/module/tether,
		/obj/item/mod/module/teslacoil, // Unique
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/pathfinder,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/hat_stabilizer/syndicate,
	)
	default_pins = list(
		/obj/item/mod/module/tether,
		/obj/item/mod/module/anomaly_locked/kinesis/prototype, // Really cool
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/teslacoil,
	)

/obj/item/mod/control/pre_equipped/corporate/traitor
	theme = /datum/mod_theme/corporate
	starting_frequency = MODLINK_FREQ_SYNDICATE
	applied_core = /obj/item/mod/core/standard
	req_access = null
	applied_modules = list(
		/obj/item/mod/module/storage/bluespace,
		/obj/item/mod/module/hat_stabilizer,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/emp_shield/advanced,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/pathfinder,
	)
	default_pins = list(
		/obj/item/mod/module/jetpack,
	)

/obj/item/mod/control/pre_equipped/ninja/traitor
	theme = /datum/mod_theme/ninja/traitor
	starting_frequency = null
	applied_cell = /obj/item/stock_parts/power_store/cell/hyper
	applied_modules = list(
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/noslip,
		/obj/item/mod/module/status_readout/ninja,
		/obj/item/mod/module/stealth/wraith,
		/obj/item/mod/module/dispenser/ninja,
		/obj/item/mod/module/dna_lock/noremove,
		/obj/item/mod/module/emp_shield/pulse,
		/obj/item/mod/module/hacker/electricpalm,
		/obj/item/mod/module/quick_cuff,
		/obj/item/mod/module/synditeleporter,
		/obj/item/mod/module/visor/night,
	)
	default_pins = list(
		/obj/item/mod/module/stealth/wraith,
		/obj/item/mod/module/dispenser/ninja,
		/obj/item/mod/module/synditeleporter,
		/obj/item/mod/module/emp_shield/pulse,
		/obj/item/mod/module/adrenaline_boost/syndicate,
		/obj/item/mod/module/energy_net,
		/obj/item/mod/module/visor/night,
	)
