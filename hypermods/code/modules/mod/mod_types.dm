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

/obj/item/mod/control/pre_equipped/responsory/inquisitory/syndie/super // a better version than this garbage
	starting_frequency = MODLINK_FREQ_SYNDICATE
	req_access = null
	applied_cell = /obj/item/stock_parts/power_store/cell/super
	theme = /datum/mod_theme/responsory/traitor/super
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
