/obj/item/reagent_containers/applicator/pill/bicaridine
	name = "bicaridine pill"
	desc = "Used to relieve brute damage in patients."
	icon_state = "pill4"
	volume = 20
	list_reagents = list(/datum/reagent/medicine/bicaridine = 20)
	rename_with_volume = TRUE

/obj/item/storage/pill_bottle/bicaridine
	name = "bottle of bicaridine pills"
	desc = "Contains pills used to cure brute damage in patients."
	custom_premium_price = 100

/obj/item/storage/pill_bottle/bicaridine/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/applicator/pill/bicaridine(src)

/obj/item/reagent_containers/applicator/pill/bicartranex
	name = "wounded pill"
	desc = "Used to relieve brute damage in patients and clot bleeding wounds while restoring blood."
	icon_state = "pill5"
	volume = 20
	list_reagents = list(/datum/reagent/medicine/bicaridine = 10, /datum/reagent/medicine/coagulant/tranexamicacid = 5,/datum/reagent/medicine/filgrastim = 5)
	rename_with_volume = TRUE

/obj/item/storage/pill_bottle/bicartranex
	name = "bottle of wounded pills"
	desc = "Contains pills used to cure brute damage in patients and clot bleeding wounds while restoring blood."
	custom_premium_price = 200

/obj/item/storage/pill_bottle/bicartranex/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/applicator/pill/bicartranex(src)

/obj/item/reagent_containers/applicator/pill/kelotane
	name = "kelotane pill"
	desc = "Used to relieve burn damage in patients."
	icon_state = "pill7"
	volume = 20
	list_reagents = list(/datum/reagent/medicine/kelotane = 20)
	rename_with_volume = TRUE

/obj/item/storage/pill_bottle/kelotane
	name = "bottle of kelotane pills"
	desc = "Contains pills used to relieve burns in patients."
	custom_premium_price = 100

/obj/item/storage/pill_bottle/kelotane/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/applicator/pill/kelotane(src)

/obj/item/reagent_containers/applicator/pill/dermaline
	name = "dermaline pill"
	desc = "Used to relieve burn damage in patients."
	icon_state = "pill7"
	volume = 20
	list_reagents = list(/datum/reagent/medicine/dermaline = 10, /datum/reagent/medicine/granibitaluri = 10)
	rename_with_volume = TRUE

/obj/item/storage/pill_bottle/dermaline
	name = "bottle of dermaline pills"
	desc = "Contains pills used to relieve burns in patients."
	custom_premium_price = 200

/obj/item/storage/pill_bottle/dermaline/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/applicator/pill/dermaline(src)

/obj/item/reagent_containers/applicator/pill/dylovene
	name = "dylovene pill"
	desc = "Used to relieve minor toxic damage in patients."
	icon_state = "pill11"
	volume = 20
	list_reagents = list(/datum/reagent/medicine/dylovene = 20)
	rename_with_volume = TRUE

/obj/item/storage/pill_bottle/dylovene
	name = "bottle of dylovene pills"
	desc = "Contains pills used to cure minor toxin damage in patients."
	custom_premium_price = 100

/obj/item/storage/pill_bottle/dylovene/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/applicator/pill/dylovene(src)

/obj/item/reagent_containers/applicator/pill/antitoxin
	name = "anti-toxin pill"
	desc = "Used to relieve toxic damage in patients."
	icon_state = "pill11"
	volume = 20
	list_reagents = list(/datum/reagent/medicine/antitoxin = 20)
	rename_with_volume = TRUE

/obj/item/storage/pill_bottle/antitoxin
	name = "bottle of anti-toxin pills"
	desc = "Contains pills used to cure toxin damage in patients."
	custom_premium_price = 100

/obj/item/storage/pill_bottle/antitoxin/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/applicator/pill/antitoxin(src)

/obj/item/reagent_containers/applicator/pill/dexalin
	name = "dexalin pill"
	desc = "Used to relieve oxygen damage in patients."
	icon_state = "pill8"
	volume = 20
	list_reagents = list(/datum/reagent/medicine/dexalin = 20)
	rename_with_volume = TRUE

/obj/item/storage/pill_bottle/dexalin
	name = "bottle of dexalin pills"
	desc = "Contains pills used to heal oxygen damage, even in non-critical state patients."
	custom_premium_price = 100

/obj/item/storage/pill_bottle/dexalin/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/applicator/pill/dexalin(src)

/obj/item/reagent_containers/applicator/pill/dexalinplus
	name = "dexalin plus pill"
	desc = "Used to relieve oxygen damage in patients."
	icon_state = "pill8"
	volume = 20
	list_reagents = list(/datum/reagent/medicine/dexalinplus = 20)
	rename_with_volume = TRUE

/obj/item/storage/pill_bottle/dexalinplus
	name = "bottle of dexalin plus pills"
	desc = "Contains pills used to heal oxygen damage and blood loss, even in non-critical state patients."
	custom_premium_price = 100

/obj/item/storage/pill_bottle/dexalinplus/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/applicator/pill/dexalinplus(src)

/obj/item/reagent_containers/applicator/pill/tranex
	name = "tranexamic acid pill"
	desc = "Used to quickly clot bleeding wounds, and restore blood."
	icon_state = "pill8"
	volume = 7.5
	list_reagents = list(/datum/reagent/medicine/coagulant/tranexamicacid = 7.5)
	rename_with_volume = TRUE

/obj/item/storage/pill_bottle/tranex
	name = "bottle of tranexamic acid pills"
	desc = "Contains pills used to quickly clot bleeding wounds, and restore blood."
	custom_premium_price = 200

/obj/item/storage/pill_bottle/tranex/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/applicator/pill/tranex(src)

/obj/item/reagent_containers/applicator/pill/tricordrazine
	name = "tricordrazine pill"
	desc = "Used to heal most forms of damage including brute, burn and toxin."
	icon_state = "pill2"
	volume = 20
	list_reagents = list(/datum/reagent/medicine/tricordrazine = 20)
	rename_with_volume = TRUE

/obj/item/storage/pill_bottle/tricordrazine
	name = "bottle of tricordrazine pills"
	desc = "Contains pills used to heal most forms of damage without hassle."
	custom_premium_price = 200

/obj/item/storage/pill_bottle/tricordrazine/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/applicator/pill/tricordrazine(src)

/obj/item/reagent_containers/applicator/pill/inaprovaline
	name = "inaprovaline pill"
	desc = "Used to stabilize patients in critical state, often used as a substitute of epinephrine."
	icon_state = "pill12"
	volume = 20
	list_reagents = list(/datum/reagent/medicine/inaprovaline = 20)
	rename_with_volume = TRUE

/obj/item/storage/pill_bottle/inaprovaline
	name = "bottle of inaprovaline pills"
	desc = "Contains pills used to stabilize patients in critical state, can be used in place of epinephrine but only heals aspyxiation."
	custom_premium_price = 50

/obj/item/storage/pill_bottle/inaprovaline/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/applicator/pill/inaprovaline(src)

/obj/item/reagent_containers/applicator/pill/coagulant
	name = "sanguirite pill"
	desc = "Used to reduce bleeding quickly. Refrain from taking more than 1 pill over an extended period of time."
	icon_state = "pill5"
	volume = 10
	list_reagents = list(/datum/reagent/medicine/coagulant = 10)
	rename_with_volume = TRUE

/obj/item/storage/pill_bottle/coagulant
	name = "bottle of sanguirite pills"
	desc = "Contains pills used to relieve bleeding quickly."
	custom_premium_price = 100

/obj/item/storage/pill_bottle/coagulant/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/applicator/pill/coagulant(src)

/obj/item/reagent_containers/applicator/pill/antiviral
	name = "spaceacillin pill"
	desc = "Used to relieve oneself of the symptoms of diseases temporarily, and has the potential to eliminate diseases within the host."
	icon_state = "pill20"
	volume = 5
	list_reagents = list(/datum/reagent/medicine/spaceacillin = 5)
	rename_with_volume = TRUE

/obj/item/storage/pill_bottle/antiviral
	name = "bottle of spaceacillin pills"
	desc = "Contains pills meant to relieve oneself of the symptoms of diseases temporarily, and has the potential to eliminate diseases within the host."
	custom_price = 50
	custom_premium_price = 100

/obj/item/storage/pill_bottle/antiviral/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/applicator/pill/antiviral(src)

/obj/item/reagent_containers/applicator/pill/painkillers
	name = "painkiller"
	desc = "Used for treating minor brute or burn damage."
	icon_state = "pill1"
	volume = 10
	list_reagents = list(/datum/reagent/medicine/painkillers = 10)
	rename_with_volume = TRUE

/obj/item/storage/pill_bottle/painkillers
	name = "bottle of painkillers"
	desc = "Contains pills used for treating minor brute or burn damage."
	custom_premium_price = 100

/obj/item/storage/pill_bottle/painkillers/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/applicator/pill/painkillers(src)

/obj/item/reagent_containers/applicator/pill/syndicryo
	name = "cryogelidia pill"
	desc = "Used to temporarily freeze someone in a protective block of ice, often used as a desperate means of self-defense."
	icon_state = "pill16"
	volume = 100
	list_reagents = list(/datum/reagent/inverse/cryostylane = 65, /datum/reagent/medicine/sal_acid = 2.5, /datum/reagent/medicine/oxandrolone = 2.5, /datum/reagent/medicine/antitoxin = 12.5, /datum/reagent/medicine/c2/seiver = 15, /datum/reagent/medicine/inaprovaline = 2.5)
	rename_with_volume = FALSE

/obj/item/storage/pill_bottle/syndicryo
	name = "bottle of cryogelidia pills"
	desc = "Contains pills used to temporarily freeze someone in a protective block of ice, often used as a desperate means of self-defense."
	custom_premium_price = 300

/obj/item/storage/pill_bottle/syndicryo/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/applicator/pill/syndicryo(src)
