/obj/item/card/id/departmental_budget/eng
	department_ID = ACCOUNT_ENG
	department_name = ACCOUNT_ENG_NAME
	icon_state = "eng_budget"

/obj/item/card/id/departmental_budget/sci
	department_ID = ACCOUNT_SCI
	department_name = ACCOUNT_SCI_NAME
	icon_state = "sci_budget"

/obj/item/card/id/departmental_budget/med
	department_ID = ACCOUNT_MED
	department_name = ACCOUNT_MED_NAME
	icon_state = "med_budget"

/obj/item/card/id/departmental_budget/srv
	department_ID = ACCOUNT_SRV
	department_name = ACCOUNT_SRV_NAME
	icon_state = "srv_budget"

/obj/item/card/id/departmental_budget/civ
	department_ID = ACCOUNT_CIV
	department_name = ACCOUNT_CIV_NAME
	icon_state = "civ_budget"

/obj/item/card/id/departmental_budget/sec
	department_ID = ACCOUNT_SEC
	department_name = ACCOUNT_SEC_NAME
	icon_state = "sec_budget"


// New assistant stuff to ensure they can actually ASSIST in jobs.
/obj/item/assistant_job_selector
	name = "Nanotrasen Assistant Access Granter"
	desc = "A single-use access card which can be modified and used to grant any id cards the selected access."
	w_class = WEIGHT_CLASS_SMALL
	icon = 'icons/obj/card.dmi'
	icon_state = "data_1"
	var/using = FALSE

/obj/item/assistant_job_selector/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/assistant_job_selector/Destroy()
	. = ..()
	STOP_PROCESSING(SSobj, src)

/obj/item/assistant_job_selector/attack_self(mob/user)
	if(!using)
		using = TRUE
		sleep(1 SECONDS)
		generate_options(user)

/obj/item/assistant_job_selector/proc/generate_display_names() // return the list that will be used in the choice selection. entries should be in (type.name = type) fashion. see choice_beacon/hero for how this is done.
	return list()

/obj/item/assistant_job_selector/proc/generate_options(mob/living/M)
	var/list/display_names = generate_display_names()
	if(!display_names.len)
		using = FALSE
		return
	var/choice = input(M,"Which access would you like?","Select an Access Card") as null|anything in display_names
	if(!choice)
		using = FALSE
		return

	spawn_option(display_names[choice],M)

/obj/item/assistant_job_selector/proc/spawn_option(obj/choice,mob/living/M)
	var/obj/new_item = new choice()
	var/turf/open/T = get_turf(M)
	new_item.forceMove(T)
	qdel(src)

/obj/item/assistant_job_selector/generate_display_names()
	var/static/list/accesscards
	if(!accesscards)
		accesscards = list()
		var/list/templist = list(/obj/item/card/assistant_access_card/science,
							/obj/item/card/assistant_access_card/cargo,
							/obj/item/card/assistant_access_card/engineering,
							/obj/item/card/assistant_access_card/service,
							/obj/item/card/assistant_access_card/medical
							)
		for(var/V in templist)
			var/atom/A = V
			accesscards[initial(A.name)] = A
	return accesscards


/obj/item/card/assistant_access_card/science
	name = "science access card"
	desc = "A small card, that when used on any ID, will add science access. Self-destructs when used."
	icon = 'hypermods/icons/obj/card.dmi'
	icon_state = "idsci"

/obj/item/card/assistant_access_card/science/interact_with_atom(atom/interacting_with, mob/user, proximity)
	. = ..()
	if(istype(interacting_with, /obj/item/card/id) && proximity)
		var/obj/item/card/id/I = interacting_with
		I.access |=	ACCESS_SCIENCE
		to_chat(user, "You upgrade [I] with basic science access.")
		if(I.assignment == "Assistant")
			I.assignment = "Science Assistant"
			if(user.has_dna())
				var/id_name = user.real_name
				I.name = "[id_name] ID Card (Science Assistant)"
		qdel(src)

/obj/item/card/assistant_access_card/cargo
	name = "cargo access card"
	desc = "A small card, that when used on any ID, will add cargo access. Self-destructs when used."
	icon = 'hypermods/icons/obj/card.dmi'
	icon_state = "idcar"

/obj/item/card/assistant_access_card/cargo/interact_with_atom(atom/interacting_with, mob/user, proximity)
	. = ..()
	if(istype(interacting_with, /obj/item/card/id) && proximity)
		var/obj/item/card/id/I = interacting_with
		I.access |=	ACCESS_CARGO
		to_chat(user, "You upgrade [I] with basic cargo access.")
		if(I.assignment == "Assistant")
			I.assignment = "Cargo Assistant"
			if(user.has_dna())
				var/id_name = user.real_name
				I.name = "[id_name] ID Card (Cargo Assistant)"
		qdel(src)

/obj/item/card/assistant_access_card/engineering
	name = "engineering access card"
	desc = "A small card, that when used on any ID, will add engineering access. Self-destructs when used."
	icon = 'hypermods/icons/obj/card.dmi'
	icon_state = "ideng"

/obj/item/card/assistant_access_card/engineering/interact_with_atom(atom/interacting_with, mob/user, proximity)
	. = ..()
	if(istype(interacting_with, /obj/item/card/id) && proximity)
		var/obj/item/card/id/I = interacting_with
		I.access |=	ACCESS_ENGINEERING
		I.access |=	ACCESS_CONSTRUCTION
		to_chat(user, "You upgrade [I] with basic engineering access.")
		if(I.assignment == "Assistant")
			I.assignment = "Engineering Assistant"
			if(user.has_dna())
				var/id_name = user.real_name
				I.name = "[id_name] ID Card (Engineering Assistant)"
		qdel(src)

/obj/item/card/assistant_access_card/service
	name = "service access card"
	desc = "A small card, that when used on any ID, will add theatre, kitchen, bar, and hydroponic access. Self-destructs when used."
	icon = 'hypermods/icons/obj/card.dmi'
	icon_state = "idciv"

/obj/item/card/assistant_access_card/service/interact_with_atom(atom/interacting_with, mob/user, proximity)
	. = ..()
	if(istype(interacting_with, /obj/item/card/id) && proximity)
		var/obj/item/card/id/I = interacting_with
		I.access |=	ACCESS_THEATRE
		I.access |=	ACCESS_KITCHEN
		I.access |=	ACCESS_BAR
		I.access |=	ACCESS_HYDROPONICS
		to_chat(user, "You upgrade [I] with essential service access.")
		if(I.assignment == "Assistant")
			I.assignment = "Service Assistant"
			if(user.has_dna())
				var/id_name = user.real_name
				I.name = "[id_name] ID Card (Service Assistant)"
		qdel(src)

/obj/item/card/assistant_access_card/medical
	name = "medical access card"
	desc = "A small card, that when used on any ID, will add medical access. Self-destructs when used."
	icon = 'hypermods/icons/obj/card.dmi'
	icon_state = "idmed"

/obj/item/card/assistant_access_card/medical/interact_with_atom(atom/interacting_with, mob/user, proximity)
	. = ..()
	if(istype(interacting_with, /obj/item/card/id) && proximity)
		var/obj/item/card/id/I = interacting_with
		I.access |=	ACCESS_MEDICAL
		to_chat(user, "You upgrade [I] with basic medical access.")
		if(I.assignment == "Assistant")
			I.assignment = "Medical Assistant"
			if(user.has_dna())
				var/id_name = user.real_name
				I.name = "[id_name] ID Card (Medical Assistant)"
		qdel(src)
