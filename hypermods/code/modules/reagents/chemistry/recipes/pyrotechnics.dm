/datum/chemical_reaction/teslium/alt
	results = list(/datum/reagent/teslium = 3)
	required_reagents = list(/datum/reagent/vestine = 1, /datum/reagent/stable_plasma = 1, /datum/reagent/silver = 1)
	mix_message = "<span class='danger'>A jet of sparks flies from the mixture as it merges into a flickering slurry.</span>"
	required_temp = 300
	reaction_tags = REACTION_TAG_EASY | REACTION_TAG_EXPLOSIVE

/datum/chemical_reaction/tazinide
	results = list(/datum/reagent/tazinide = 2)
	required_reagents = list(/datum/reagent/vestine = 1, /datum/reagent/teslium = 1, /datum/reagent/iodine = 1)
	mix_message = "<span class='danger'>A jet of sparks flies from the mixture as it merges into a metallic mixture.</span>"
	required_temp = 300
