/mob/living/silicon/pai/syndicate
	can_be_held = TRUE
	can_buckle_to = FALSE
	density = FALSE
	desc = "A generic pAI hard-light holographics emitter."
	health = 500
	held_lh = 'icons/mob/inhands/pai_item_lh.dmi'
	held_rh = 'icons/mob/inhands/pai_item_rh.dmi'
	head_icon = 'icons/mob/clothing/head/pai_head.dmi'
	hud_type = /datum/hud/pai
	icon = 'icons/mob/silicon/pai.dmi'
	icon_state = "repairbot"
	job = JOB_PERSONAL_AI
	layer = LOW_MOB_LAYER
	light_color = COLOR_PAI_GREEN
	light_flags = LIGHT_ATTACHED
	light_on = FALSE
	light_range = 3
	light_system = OVERLAY_LIGHT
	maxHealth = 500
	mob_size = MOB_SIZE_TINY
	mobility_flags = MOBILITY_FLAGS_REST_CAPABLE_DEFAULT
	mouse_opacity = MOUSE_OPACITY_ICON
	move_force = 0
	move_resist = 0
	name = "pAI"
	pass_flags = PASSTABLE | PASSMOB
	pull_force = 0
	radio = /obj/item/radio/headset/syndicate
	worn_slot_flags = ITEM_SLOT_HEAD

	var/host_repairing = FALSE
	var/scrampulse_cooldown = 1 SECONDS
	var/chemsynth_cooldown = 1 SECONDS
	var/thermalVision = FALSE
	var/empblast_cooldown = 1 SECONDS

	// Static lists
	/// List of all available downloads
	var/static/list/available_syndicate_software = list(
		"Atmospheric Sensor" = 2.5,
		"Crew Manifest" = 2.5,
		"Digital Messenger" = 2.5,
		"Photography Module" = 2.5,
		"Encryption Slot" = 1,
		"Music Synthesizer" = 1,
		"Newscaster" = 5,
		"Remote Signaler" = 5,
		"Host Scan" = 10,
		"Medical HUD" = 10,
		"Security HUD" = 10,
		"Crew Monitor" = 20,
		"Door Jack" = 20,
		"Internal GPS" = 15,
		"Universal Translator" = 15,
		"Host Repair" = 30,
		"Martyrdom" = 100,
		"Scram Pulse" = 50,
		"Antiviral" = 10,
		"Stimulate" = 50,
		"Thermal Sensors" = 50,
		"Empulse" = 25,
	)
