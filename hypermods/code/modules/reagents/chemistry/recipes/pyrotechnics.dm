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

/datum/chemical_reaction/tatp
	results = list(/datum/reagent/tatp = 4)
	required_reagents = list(/datum/reagent/vestine = 1, /datum/reagent/acetone = 1, /datum/reagent/toxin/acid = 1, /datum/reagent/oxygen = 1)
	required_temp = 300
