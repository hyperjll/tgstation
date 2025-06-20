/obj/item/clockwork/trap_placer/explosive
	name = "explosive lattice"
	desc = "An ominous tile you REALLY shouldn't get close to."
	icon_state = "explosive"
	result_path = /obj/structure/destructible/clockwork/trap/explosive
	clockwork_desc = "A tile rigged with explosives that will self-destruct should it be triggered."

/obj/structure/destructible/clockwork/trap/explosive
	name = "explosive lattice"
	desc = "An ominous tile you REALLY shouldn't get close to."
	icon_state = "explosive"
	component_datum = /datum/component/clockwork_trap/explosive
	unwrench_path = /obj/item/clockwork/trap_placer/explosive
	clockwork_desc = "A tile rigged with explosives that will self-destruct should it be triggered."

/// Ka-boom
/obj/structure/destructible/clockwork/trap/explosive/proc/self_destruct()
	explosion(src, 0, 0, 4, flame_range = 2)
	qdel(src)


/datum/component/clockwork_trap/explosive
	takes_input = TRUE

/datum/component/clockwork_trap/explosive/trigger()
	if(!..())
		return

	var/obj/structure/destructible/clockwork/trap/explosive/explosive_parent = parent
	explosive_parent.self_destruct()
