// NT Uplink - Ported from Yogstation, thank you much.
/obj/item/ntuplink
	name = "\improper nanotrasen uplink"
	icon = 'icons/obj/devices/voice.dmi'
	icon_state = "radio"
	inhand_icon_state = "radio"
	worn_icon_state = "radio"
	desc = "A specialized uplink for authorized Nanotrasen use only. Uses reverse engineered telecrystals."
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	dog_fashion = /datum/dog_fashion/back

	obj_flags = CONDUCTS_ELECTRICITY
	slot_flags = ITEM_SLOT_BELT
	throw_speed = 3
	throw_range = 7
	w_class = WEIGHT_CLASS_SMALL
	var/nt_datum = /datum/component/uplink/nanotrasen //Component for the uplink to use.
	var/wc_start = 20 // Starting warpcrystal amount
	var/datum_owner //i dont know what this does and i'm too afraid to ask

/obj/item/ntuplink/Initialize(mapload, owner)
	. = ..()
	AddComponent(/datum/component/uplink/nanotrasen, owner, FALSE, TRUE, null, wc_start)
	datum_owner = owner

/obj/item/ntuplink/proc/finalize() //if the uplink type has been modified somehow, remove it and replace it
	var/datum/component/uplink/nanotrasen/uplink = GetComponent(/datum/component/uplink/nanotrasen)
	if(uplink)
		qdel(uplink)
	AddComponent(nt_datum, datum_owner, FALSE, TRUE, null, wc_start)
