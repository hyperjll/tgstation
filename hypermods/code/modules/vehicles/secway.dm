/obj/vehicle/ridden/syndiway
	name = "syndiway"
	desc = "A brave security cyborg gave its life to help you look like a complete tool."
	icon = 'hypermods/icons/mob/rideables/vehicles.dmi'
	icon_state = "syndiway"
	max_integrity = 300
	armor_type = /datum/armor/ridden_syndiway
	key_type = /obj/item/key/syndicate
	integrity_failure = 0.25 // breaks down at 75 hp left.

	///This stores a banana that, when used on the secway, prevents the vehicle from moving until it is removed.
	var/obj/item/food/grown/banana/eddie_murphy

/datum/armor/ridden_syndiway
	melee = 20
	laser = 20
	bullet = 20
	bomb = 30
	fire = 80
	acid = 80

/obj/vehicle/ridden/syndiway/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/ridable, /datum/component/riding/vehicle/syndiway)

/obj/vehicle/ridden/syndiway/atom_break()
	START_PROCESSING(SSobj, src)
	return ..()

/obj/vehicle/ridden/syndiway/process(seconds_per_tick)
	if(atom_integrity >= integrity_failure * max_integrity)
		return PROCESS_KILL
	if(SPT_PROB(10, seconds_per_tick))
		return
	var/datum/effect_system/fluid_spread/smoke/smoke = new
	smoke.set_up(0, holder = src, location = src)
	smoke.start()

/obj/vehicle/ridden/syndiway/welder_act(mob/living/user, obj/item/W)
	if(user.combat_mode)
		return
	. = TRUE
	if(DOING_INTERACTION(user, src))
		balloon_alert(user, "you're already repairing it!")
		return
	if(atom_integrity >= max_integrity)
		balloon_alert(user, "it's not damaged!")
		return
	if(!W.tool_start_check(user, amount=1, heat_required = HIGH_TEMPERATURE_REQUIRED))
		return
	user.balloon_alert_to_viewers("started welding [src]", "started repairing [src]")
	audible_message(span_hear("You hear welding."))
	var/did_the_thing
	while(atom_integrity < max_integrity)
		if(W.use_tool(src, user, 2.5 SECONDS, volume=50))
			did_the_thing = TRUE
			atom_integrity += min(10, (max_integrity - atom_integrity))
			audible_message(span_hear("You hear welding."))
		else
			break
	if(did_the_thing)
		user.balloon_alert_to_viewers("[(atom_integrity >= max_integrity) ? "fully" : "partially"] repaired [src]")
	else
		user.balloon_alert_to_viewers("stopped welding [src]", "interrupted the repair!")

/obj/vehicle/ridden/syndiway/attackby(obj/item/W, mob/living/user, params)
	if(!istype(W, /obj/item/food/grown/banana))
		return ..()
	// ignore the occupants because they're presumably too distracted to notice the guy stuffing fruit into their vehicle's exhaust. do segways have exhausts? they do now!
	user.visible_message(span_warning("[user] begins stuffing [W] into [src]'s tailpipe."), span_warning("You begin stuffing [W] into [src]'s tailpipe..."), ignored_mobs = occupants)
	if(!do_after(user, 3 SECONDS, src))
		return TRUE
	if(user.transferItemToLoc(W, src))
		user.visible_message(span_warning("[user] stuffs [W] into [src]'s tailpipe."), span_warning("You stuff [W] into [src]'s tailpipe."), ignored_mobs = occupants)
		eddie_murphy = W
	return TRUE

/obj/vehicle/ridden/syndiway/attack_hand(mob/living/user, list/modifiers)
	if(!eddie_murphy)
		return ..()
	user.visible_message(span_warning("[user] begins cleaning [eddie_murphy] out of [src]."), span_warning("You begin cleaning [eddie_murphy] out of [src]..."))
	if(!do_after(user, 6 SECONDS, target = src))
		return ..()
	user.visible_message(span_warning("[user] cleans [eddie_murphy] out of [src]."), span_warning("You manage to get [eddie_murphy] out of [src]."))
	eddie_murphy.forceMove(drop_location())
	eddie_murphy = null

/obj/vehicle/ridden/syndiway/examine(mob/user)
	. = ..()
	if(eddie_murphy)
		. += span_warning("Something appears to be stuck in its exhaust...")

/obj/vehicle/ridden/syndiway/atom_destruction()
	explosion(src, devastation_range = -1, light_impact_range = 2, flame_range = 3, flash_range = 4)
	return ..()

/obj/vehicle/ridden/syndiway/Destroy()
	STOP_PROCESSING(SSobj,src)
	return ..()

//bullets will have a 60% chance to hit any riders
/obj/vehicle/ridden/syndiway/bullet_act(obj/projectile/proj)
	if(!buckled_mobs || prob(40))
		return ..()
	for(var/mob/rider as anything in buckled_mobs)
		return rider.projectile_hit(proj)
	return ..()
