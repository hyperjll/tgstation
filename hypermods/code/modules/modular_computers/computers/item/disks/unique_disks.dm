/obj/item/computer_disk/black_market/trap
	icon_state = "datadisksyndicate" // this typically gets replaced, but it's the thought that counts.
	var/dev_range = -1
	var/hev_range = 0
	var/weak_range = 7

/obj/item/computer_disk/black_market/trap/interact_with_atom(atom/target, mob/user, proximity_flag, click_parameters)
	if(istype(target, /obj/item/modular_computer) || istype(target, /obj/machinery/modular_computer))
		addtimer(CALLBACK(src, PROC_REF(trap_explosion)), 60 SECONDS)

/obj/item/computer_disk/black_market/trap/proc/trap_explosion()
	explosion(src, devastation_range = dev_range, heavy_impact_range = hev_range, light_impact_range = weak_range, explosion_cause = src)

/obj/item/computer_disk/black_market/trap/highend
	dev_range = -1
	hev_range = 2
	weak_range = 9


/obj/item/computer_disk/syndicate/observe
	max_capacity = 30
	starting_programs = list(/datum/computer_file/program/secureye/noaccess, /datum/computer_file/program/supermatter_monitor/noaccess, /datum/computer_file/program/power_monitor/noaccess, /datum/computer_file/program/crew_manifest/noaccess)
