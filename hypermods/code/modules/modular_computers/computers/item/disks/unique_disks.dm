/obj/item/computer_disk/black_market/trap
	icon_state = "datadisksyndicate" // this typically gets replaced, but it's the thought that counts.
	var/dev_range = -1
	var/hev_range = 0
	var/weak_range = 7
	var/timer = 20 SECONDS

/obj/item/computer_disk/black_market/trap/remove_file(datum/computer_file/file)
	if(!(file in stored_files))
		return FALSE
	stored_files.Remove(file)
	used_capacity -= file.size
	qdel(file)
	explosion(src, devastation_range = dev_range, heavy_impact_range = hev_range, light_impact_range = weak_range, explosion_cause = src)
	return TRUE

/obj/item/computer_disk/black_market/trap/highend
	dev_range = -1
	hev_range = 2
	weak_range = 9
	timer = 10 SECONDS


/obj/item/computer_disk/syndicate/observe
	max_capacity = 30
	starting_programs = list(/datum/computer_file/program/secureye/noaccess, /datum/computer_file/program/supermatter_monitor/noaccess, /datum/computer_file/program/power_monitor/noaccess, /datum/computer_file/program/crew_manifest/noaccess)
