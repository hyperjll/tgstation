/*
 * The Bot-Only Subverter
 */

/obj/item/card/emag/botemagger
	desc = "It's a card with a magnetic strip attached to some circuitry. It looks... off, somehow."
	name = "bot behavior sequencer"
	icon = 'hypermods/icons/obj/card.dmi'
	icon_state = "botmag"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	item_flags = NO_MAT_REDEMPTION | NOBLUDGEON
	/// Does usage require you to be in range?
	prox_check = TRUE
	var/type_whitelist //List of types

/obj/item/card/emag/botemagger/Initialize(mapload)
	. = ..()
	type_whitelist = list(typesof(/mob/living/basic/bot), typesof(/mob/living/simple_animal/bot)) //list of all acceptable typepaths that this device can affect

/obj/item/card/emag/botemagger/can_emag(atom/target, mob/user)
	for (var/list/subtypelist in type_whitelist)
		if (target.type in subtypelist)
			return TRUE
	to_chat(user, span_warning("[src] is unable to interface with this. It seems to display a notification? Simplebot Only."))
	return FALSE

/*
 * The Jestographic Sequencer <- tf? -NexusLeader
 */

/obj/item/card/emag/doorjack/jester
	name = "jestographic sequencer"
	desc = "It's a colorful card with electronics attached to it. The phrase 'Tastes like electromagnetic bananium.' is written on the back. It is stamped by HonkCo."
	icon = 'hypermods/icons/obj/card.dmi'
	icon_state = "jester"
	charge_time = 900 // 1 minute and 30 seconds

/obj/item/card/emag/doorjack/jester/Initialize(mapload)
	. = ..()
	type_whitelist = list(typesof(/obj/machinery/door/airlock), typesof(/obj/machinery/door/window/)) //list of all acceptable typepaths that this device can affect

/obj/item/card/emag/doorjack/jester/interact_with_atom(atom/interacting_with, mob/living/user)
	if(!can_emag(interacting_with, user))
		return ITEM_INTERACT_BLOCKING
	log_combat(user, interacting_with, "attempted to jestergraph")
	if(istype(interacting_with, /obj/machinery/door/airlock)) // You'll have to forgive the 3 different of checks. I'm stupid and have brain rot. :(
		var/obj/machinery/door/airlock/jester_door = interacting_with
		jester_door.jester_act(user, src)
		playsound(jester_door, 'sound/items/bikehorn.ogg', 50, TRUE)
		return ITEM_INTERACT_SUCCESS
	if(istype(interacting_with, /obj/machinery/door/window))
		var/obj/machinery/door/window/jester_door = interacting_with
		jester_door.jester_act(user, src)
		playsound(jester_door, 'sound/items/bikehorn.ogg', 50, TRUE)
		return ITEM_INTERACT_SUCCESS
