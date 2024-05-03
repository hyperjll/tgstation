/datum/lazy_template/virtual_domain/breeze_bay_2
	name = "Breeze Bay (The Second Coming)"
	desc = "A beach front town with a large forest to the north. Fishing! Now with INTENTIONAL sentient danger, beware!"
	help_text = "It's simple! Enjoy some rays, catch some fish, and have a good time! Don't get bit by the crabs or hostile fauna, though."
	key = "breeze_bay2"
	map_name = "breeze_bay2"
	reward_points = BITRUNNER_REWARD_MEDIUM
	difficulty = BITRUNNER_DIFFICULTY_MEDIUM

/datum/lazy_template/virtual_domain/breeze_bay_2/setup_domain(list/created_atoms)
	. = ..()

	for(var/obj/item/fishing_rod/rod in created_atoms)
		RegisterSignal(rod, COMSIG_FISHING_ROD_CAUGHT_FISH, PROC_REF(on_fish_caught))

/// Eventually reveal the cache
/datum/lazy_template/virtual_domain/breeze_bay_2/proc/on_fish_caught(datum/source, reward)
	SIGNAL_HANDLER

	if(isnull(reward))
		return

	add_points(3)
