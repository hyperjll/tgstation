/obj/item/pen/hypo
	desc = "It's a normal black ink pen."
	name = "pen"
	icon_state = "pen"
	inhand_icon_state = "pen"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_EARS
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 7
	custom_materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT*0.1)
	pressure_resistance = 2
	grind_results = list(/datum/reagent/iron = 2, /datum/reagent/iodine = 1)
	sharpness = SHARP_POINTY
	numbneedle = TRUE

/obj/item/pen/hypo/Initialize(mapload)
	. = ..()
	create_reagents(15, OPENCONTAINER)

/obj/item/pen/hypo/attack(mob/living/M, mob/user, params)
	. = ..()
	if(!.)
		return
	if(!reagents.total_volume)
		return
	if(!M.reagents)
		return
	reagents.trans_to(M, reagents.total_volume, transferred_by = user, methods = INJECT)

/obj/item/pen/hypo/on_inserted_into_dart(datum/source, obj/item/ammo_casing/dart, mob/user)
	. = ..()
	var/obj/projectile/proj = dart.loaded_projectile
	RegisterSignal(proj, COMSIG_PROJECTILE_SELF_ON_HIT, PROC_REF(on_dart_hit))

/obj/item/pen/hypo/on_removed_from_dart(datum/source, obj/item/ammo_casing/dart, obj/projectile/proj, mob/user)
	. = ..()
	if(istype(proj))
		UnregisterSignal(proj, COMSIG_PROJECTILE_SELF_ON_HIT)

/obj/item/pen/hypo/proc/on_dart_hit(datum/source, atom/movable/firer, atom/target, angle, hit_limb, blocked)
	SIGNAL_HANDLER
	var/mob/living/carbon/carbon_target = target
	if(!istype(carbon_target) || blocked == 100)
		return
	if(carbon_target.can_inject(target_zone = hit_limb))
		reagents.trans_to(carbon_target, reagents.total_volume, transferred_by = firer, methods = INJECT)

/*
 * Cybersun Pen
 */

/obj/item/pen/cybersun
	desc = "It's a pen made from valuable materials, 'Cybersun' is engraved on it's body."
	name = "cybersun pen"
	icon = 'hypermods/icons/obj/service/bureaucracy.dmi'
	icon_state = "pen-cybersun"
	inhand_icon_state = "pen"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_EARS
	throwforce = 30
	force = 15
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 4
	throw_range = 10
	custom_materials = list(/datum/material/titanium = SMALL_MATERIAL_AMOUNT*0.1)
	pressure_resistance = 2
	grind_results = list(/datum/reagent/iron = 2, /datum/reagent/iodine = 1)
	embed_type = /datum/embed_data/cybersunpen
	sharpness = SHARP_POINTY
	custom_price = 200

/datum/embed_data/cybersunpen
	embed_chance = 100

/obj/item/pen/cybersun/disguised
	desc = "It's a normal black ink pen."
	name = "pen"
	icon = 'icons/obj/service/bureaucracy.dmi'
	icon_state = "pen"
	inhand_icon_state = "pen"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_EARS
	throwforce = 30
	force = 15
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 4
	throw_range = 10
	custom_materials = list(/datum/material/titanium = SMALL_MATERIAL_AMOUNT*0.1)
	pressure_resistance = 2
	grind_results = list(/datum/reagent/iron = 2, /datum/reagent/iodine = 1)
	embed_type = /datum/embed_data/cybersunpen
	sharpness = SHARP_POINTY

/**
* Exploding pen from SS14
**/

/obj/item/pen/explosive
	name = "pen"

/obj/item/pen/explosive/attack_self(mob/living/carbon/user)
	to_chat(user, span_warning("You click the pen and something begins ticking! 5 seconds!"))
	sleep(5 SECONDS)
	explode()

/obj/item/pen/explosive/proc/explode()
	explosion(src, 1, 0, 2, flame_range = 1)
	qdel(src)
