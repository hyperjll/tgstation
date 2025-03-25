// regen chemsprayer
/obj/item/reagent_containers/spray/chemsprayer/syndicate
	name = "chem sprayer"
	desc = "A chemical-warfare gun designed to spray large amounts of reagents in a given area."
	icon = 'icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "chemsprayer"
	inhand_icon_state = "chemsprayer"
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	throwforce = 0
	w_class = WEIGHT_CLASS_NORMAL
	stream_mode = 1
	current_range = 5
	spray_range = 3
	stream_range = 5
	var/stream_amount = 50
	amount_per_transfer_from_this = 30
	possible_transfer_amounts = list(30,50)
	volume = 800
	var/generate_amount = 30
	var/generate_type1 = /datum/reagent/toxin/sodium_thiopental
	var/generate_type2 = /datum/reagent/toxin/coniine
	var/generate_type3 = /datum/reagent/toxin/venom
	var/generate_type4 = /datum/reagent/consumable/condensedcapsaicin
	var/generate_type5 = /datum/reagent/toxin/initropidril
	var/generate_type6 = /datum/reagent/toxin/polonium
	var/last_generate = 0
	var/generate_delay = 100	//deciseconds or 10 seconds

/obj/item/reagent_containers/spray/chemsprayer/syndicate/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSfastprocess, src)

/obj/item/reagent_containers/spray/chemsprayer/syndicate/Destroy()
	STOP_PROCESSING(SSfastprocess, src)
	return ..()

/obj/item/reagent_containers/spray/chemsprayer/syndicate/process()
	if(world.time < last_generate + generate_delay)
		return
	last_generate = world.time
	reagents.add_reagent(generate_type1, generate_amount)
	reagents.add_reagent(generate_type2, generate_amount)
	reagents.add_reagent(generate_type3, generate_amount)
	reagents.add_reagent(generate_type4, generate_amount)
	reagents.add_reagent(generate_type5, generate_amount)
	reagents.add_reagent(generate_type6, generate_amount)

/obj/item/reagent_containers/spray/chemsprayer/syndicate
	list_reagents = list(/datum/reagent/toxin/sodium_thiopental = 100, /datum/reagent/toxin/coniine = 100, /datum/reagent/toxin/venom = 100, /datum/reagent/consumable/condensedcapsaicin = 100, /datum/reagent/toxin/initropidril = 100, /datum/reagent/toxin/polonium = 100)

//bluespace chemsprayer
/obj/item/reagent_containers/spray/chemsprayer/adv
	name = "bluespace chem sprayer"
	desc = "An advanced chemical-warfare gun used to spray large amounts of reagents in a given area."
	icon = 'icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "chemsprayer"
	inhand_icon_state = "chemsprayer"
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	throwforce = 0
	w_class = WEIGHT_CLASS_NORMAL
	stream_mode = 1
	current_range = 5
	spray_range = 3
	stream_range = 5
	var/stream_amount = 100
	amount_per_transfer_from_this = 50
	possible_transfer_amounts = list(50,100)
	volume = 1200
	var/generate_amount = 50
	var/generate_type1 = /datum/reagent/toxin/sodium_thiopental
	var/generate_type2 = /datum/reagent/toxin/coniine
	var/generate_type3 = /datum/reagent/toxin/venom
	var/generate_type4 = /datum/reagent/consumable/condensedcapsaicin
	var/generate_type5 = /datum/reagent/toxin/initropidril
	var/generate_type6 = /datum/reagent/toxin/polonium
	var/last_generate = 0
	var/generate_delay = 50	//deciseconds or 5 seconds

/obj/item/reagent_containers/spray/chemsprayer/adv/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSfastprocess, src)

/obj/item/reagent_containers/spray/chemsprayer/adv/Destroy()
	STOP_PROCESSING(SSfastprocess, src)
	return ..()

/obj/item/reagent_containers/spray/chemsprayer/adv/process()
	if(world.time < last_generate + generate_delay)
		return
	last_generate = world.time
	reagents.add_reagent(generate_type1, generate_amount)
	reagents.add_reagent(generate_type2, generate_amount)
	reagents.add_reagent(generate_type3, generate_amount)
	reagents.add_reagent(generate_type4, generate_amount)
	reagents.add_reagent(generate_type5, generate_amount)
	reagents.add_reagent(generate_type6, generate_amount)

/obj/item/reagent_containers/spray/chemsprayer/adv
	list_reagents = list(/datum/reagent/toxin/sodium_thiopental = 250, /datum/reagent/toxin/coniine = 250, /datum/reagent/toxin/venom = 250, /datum/reagent/consumable/condensedcapsaicin = 250, /datum/reagent/toxin/initropidril = 250, /datum/reagent/toxin/polonium = 250)

// Mr.freeze sprayer
/obj/item/reagent_containers/spray/chemsprayer/freeze
	list_reagents = list(/datum/reagent/consumable/frostoil = 600)
	var/generate_amount = 50
	var/generate_type = /datum/reagent/consumable/frostoil
	var/last_generate = 0
	var/generate_delay = 10 //deciseconds

/obj/item/reagent_containers/spray/chemsprayer/freeze/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSfastprocess, src)

/obj/item/reagent_containers/spray/chemsprayer/freeze/Destroy()
	STOP_PROCESSING(SSfastprocess, src)
	return ..()

/obj/item/reagent_containers/spray/chemsprayer/freeze/process()
	if(world.time < last_generate + generate_delay)
		return
	last_generate = world.time
	reagents.add_reagent(generate_type, generate_amount)
