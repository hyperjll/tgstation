/datum/chemical_reaction/teslium/alt
	results = list(/datum/reagent/teslium = 3)
	required_reagents = list(/datum/reagent/vestine = 1, /datum/reagent/stable_plasma = 1, /datum/reagent/iron = 1)
	mix_message = "<span class='danger'>A jet of sparks flies from the mixture as it merges into a flickering slurry.</span>"
	required_temp = 300

/datum/chemical_reaction/tazinide
	results = list(/datum/reagent/tazinide = 2)
	required_reagents = list(/datum/reagent/vestine = 1, /datum/reagent/teslium = 1, /datum/reagent/iodine = 1)
	mix_message = "<span class='danger'>A jet of sparks flies from the mixture as it merges into a metallic mixture.</span>"
	required_temp = 300
	reaction_tags = REACTION_TAG_DAMAGING | REACTION_TAG_EXPLOSIVE | REACTION_TAG_CHEMICAL | REACTION_TAG_BURN

/datum/chemical_reaction/tatp
	results = list(/datum/reagent/tatp = 4)
	required_reagents = list(/datum/reagent/vestine = 1, /datum/reagent/acetone = 1, /datum/reagent/toxin/acid = 1, /datum/reagent/oxygen = 1)
	required_temp = 300

/datum/chemical_reaction/emp_pulse_powder
	required_reagents = list(/datum/reagent/emp_powder = 1)
	required_temp = 512
	reaction_tags = REACTION_TAG_EASY | REACTION_TAG_EXPLOSIVE | REACTION_TAG_DANGEROUS | REACTION_TAG_ACTIVE

/datum/chemical_reaction/emp_pulse_powder/on_reaction(datum/reagents/holder, datum/equilibrium/reaction, created_volume)
	//pretending this reaction took two ingredients and not three for its effects
	var/turf/turf = get_turf(holder.my_atom)
	var/two_thirds = created_volume / 1.5
	var/location = get_turf(holder.my_atom)
	var/lastkey = holder.my_atom.fingerprintslast
	// 100 created volume = 4 heavy range & 7 light range. A few tiles smaller than traitor EMP grandes.
	// 200 created volume = 8 heavy range & 14 light range. 4 tiles larger than traitor EMP grenades.
	empulse(location, round(two_thirds / 12), round(two_thirds / 7), 1, emp_source = src)
	holder.clear_reagents()
	if(lastkey)
		var/mob/toucher = get_mob_by_key(lastkey)
		toucher.log_message("triggered EMP reaction at [AREACOORD(turf)].", LOG_GAME, log_globally = FALSE)
	..()
