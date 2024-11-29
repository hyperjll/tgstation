/datum/station_trait/scarves
	name = "Scarves"
	trait_type = STATION_TRAIT_NEUTRAL
	weight = 5
	cost = STATION_TRAIT_COST_MINIMAL
	show_in_report = TRUE
	var/list/scarves
	trait_to_give = STATION_TRAIT_SCARVES

/datum/station_trait/scarves/New()
	. = ..()
	report_message = pick(
		"Nanotrasen is experimenting with seeing if neck warmth improves employee morale.",
		"After Space Fashion Week, scarves are the hot new accessory.",
		"Everyone was simultaneously a little bit cold when they packed to go to the station.",
		"The station is definitely not under attack by neck grappling aliens masquerading as wool. Definitely not.",
		"You all get free scarves. Don't ask why.",
		"A shipment of scarves was delivered to the station.",
	)
	scarves = typesof(/obj/item/clothing/neck/scarf) + list(
		/obj/item/clothing/neck/large_scarf/red,
		/obj/item/clothing/neck/large_scarf/green,
		/obj/item/clothing/neck/large_scarf/blue,
	)

	RegisterSignal(SSdcs, COMSIG_GLOB_JOB_AFTER_SPAWN, PROC_REF(on_job_after_spawn))


/datum/station_trait/scarves/proc/on_job_after_spawn(datum/source, datum/job/job, mob/living/spawned, client/player_client)
	SIGNAL_HANDLER
	var/scarf_type = pick(scarves)

	spawned.equip_to_slot_or_del(new scarf_type(spawned), ITEM_SLOT_NECK, initial = FALSE)
