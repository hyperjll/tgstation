/datum/round_event_control/disease_outbreak/lycanthropy
	name = "Disease Outbreak: Lycanthropy"
	typepath = /datum/round_event/disease_outbreak/lycanthropy
	max_occurrences = 1
	min_players = 30
	weight = 1 // Super rare cuz it's just werewolves midround ruleset
	category = EVENT_CATEGORY_HEALTH
	description = "Lycanthropy will infect some members of the crew."
	admin_setup = list(/datum/event_admin_setup/minimum_candidate_requirement/disease_outbreak)
	///Disease recipient candidates
	disease_candidates = list()

/datum/round_event/disease_outbreak/lycanthropy/start()
	var/datum/round_event_control/disease_outbreak/disease_event = control
	afflicted += disease_event.disease_candidates
	disease_event.disease_candidates.Cut() //Clean the list after use
	if(!virus_type)
		var/list/virus_candidates = list()

		virus_candidates += list(/datum/disease/transformation/lycanthropy)

		//The rest of the diseases either aren't conventional "diseases" or are too unique/extreme to be considered for a normal event
		virus_type = pick(virus_candidates)

	var/datum/disease/new_disease
	new_disease = new virus_type()
	new_disease.carrier = TRUE
	illness_type = new_disease.name

	var/mob/living/carbon/human/victim
	while(length(afflicted))
		victim = pick_n_take(afflicted)
		if(victim.ForceContractDisease(new_disease, FALSE))
			message_admins("Event triggered: Disease Outbreak - [new_disease.name] starting with patient zero [ADMIN_LOOKUPFLW(victim)]!")
			log_game("Event triggered: Disease Outbreak - [new_disease.name] starting with patient zero [key_name(victim)].")
			announce_to_ghosts(victim)
			return
		CHECK_TICK //don't lag the server to death
	if(isnull(victim))
		message_admins("Event Disease Outbreak: Lycanthropy attempted to start, but failed to find a candidate target.")
		log_game("Event Disease Outbreak: Lycanthropy attempted to start, but failed to find a candidate target")
