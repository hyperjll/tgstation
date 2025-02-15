/obj/item/compressionkit
	name = "bluespace compression kit"
	desc = "An illegally modified BSRPED, capable of reducing the size of most items."
	icon = 'hypermods/icons/obj/devices/tool.dmi'
	icon_state = "compression_e"
	inhand_icon_state = "RPED"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	var/charges = 5
	// var/damage_multiplier = 0.2 Not in use yet.

/obj/item/compressionkit/examine(mob/user)
	. = ..()
	. += ("<span class='notice'>It has [charges] charges left. Recharge with bluespace crystals.</span>")

/obj/item/compressionkit/proc/sparks()
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(5, 1, get_turf(src))
	s.start()

/obj/item/compressionkit/interact_with_atom(atom/interacting_with, mob/living/user)
	. = ..()
	if(!interacting_with)
		return
	else
		if(charges == 0)
			playsound(get_turf(src), 'sound/machines/buzz/buzz-two.ogg', 50, 1)
			to_chat(user, "<span class='notice'>The bluespace compression kit is out of charges! Recharge it with bluespace crystals.</span>")
			return
	if(istype(interacting_with, /obj/item))
		var/obj/item/Object_to_compress = interacting_with
		if(Object_to_compress.w_class == 1)
			playsound(get_turf(src), 'sound/machines/buzz/buzz-two.ogg', 50, 1)
			to_chat(user, "<span class='notice'>[interacting_with] cannot be compressed smaller!</span>")
			return
		if(istype(Object_to_compress, /obj/item/storage)) // Not super foolproof, but it'll cover most storage items.
			to_chat(user, "<span class='notice'>You can't make this item any smaller without compromising its storage functions!</span>")
			return
		if(istype(Object_to_compress, /obj/item/flatpack)) // To avoid placing entire machines within your backpack.
			to_chat(user, "<span class='notice'>You can't make this item any smaller without destroying it's functionality!</span>")
			return
		if(Object_to_compress.w_class > 1)
			playsound(get_turf(src), 'sound/items/weapons/flash.ogg', 50, 1)
			user.visible_message("<span class='warning'>[user] is compressing [Object_to_compress] with their bluespace compression kit!</span>")
			if(do_after(user, 4 SECONDS) && charges > 0 && Object_to_compress.w_class > 1)
				playsound(get_turf(src), 'sound/items/weapons/emitter2.ogg', 50, 1)
				sparks()
				flash_lighting_fx(3, 3, LIGHT_COLOR_CYAN)
				Object_to_compress.w_class -= 1
				// Object_to_compress.force *= damage_multiplier
				charges -= 1
				to_chat(user, "<span class='notice'>You successfully compress [interacting_with]! The compressor now has [charges] charges.</span>")
		else
			to_chat(user, "<span class='notice'>Anomalous error. Summon a coder.</span>")

/obj/item/compressionkit/attackby(obj/item/I, mob/user, params)
	..()
	if(istype(I, /obj/item/stack/ore/bluespace_crystal))
		var/obj/item/stack/ore/bluespace_crystal/Bcrystal = I
		charges += 1
		to_chat(user, "<span class='notice'>You insert [I] into [src]. It now has [charges] charges.</span>")
		if(Bcrystal.amount > 1)
			Bcrystal.amount -= 1
		else
			qdel(I)
