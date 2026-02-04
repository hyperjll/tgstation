/obj/item/clockwork/trap_placer/steam_vent
	name = "steam vent"
	desc = "A large vent capable of expelling a large plume of smoke to obscure vision."
	icon = 'icons/obj/structures.dmi'
	icon_state = "steam_vent"
	result_path = /obj/structure/destructible/clockwork/trap/steam_vent
	clockwork_desc = "A vent that can spew smoke to obscure vision, activated by a linked trigger."

//This doesn't function like a "trap" in of itself, but obscures vision when active.
/obj/structure/destructible/clockwork/trap/steam_vent
	name = "steam vent"
	desc = "A large vent billowing a constant stream of air and steam. You can just barely hear the sound of hissing coming from it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "steam_vent"
	clockwork_desc = "When active, these vents will billow out clouds of excess steam from Reebe, obscuring vision."
	break_message = span_warning("The vent snaps and collapses!")
	max_integrity = 100
	density = FALSE
	component_datum = /datum/component/clockwork_trap/steam_vent
	unwrench_path = /obj/item/clockwork/trap_placer/steam_vent
	COOLDOWN_DECLARE(vent_cooldown)
	/// Time until it's able to steam again
	var/vent_cd_time = 10 SECONDS

/obj/structure/destructible/clockwork/trap/steam_vent/proc/unleash_steam()
	if(!COOLDOWN_FINISHED(src, vent_cooldown))
		return

	for(var/mob/living/intruding_mob in get_turf(src))
		if(intruding_mob.incorporeal_move || (intruding_mob.movement_type & (FLOATING|FLYING)))
			continue

		if(IS_CLOCK(intruding_mob))
			to_chat(intruding_mob, span_warning("You dodge out of the way of [src]!"))
			continue

		playsound(src, 'sound/machines/clockcult/steam_whoosh.ogg', 50, TRUE)
		intruding_mob.adjust_wet_stacks(1) //It's wet!

		do_smoke(4, intruding_mob, src, smoke_type = /datum/effect_system/fluid_spread/smoke)

	COOLDOWN_START(src, vent_cooldown, vent_cd_time)


/datum/component/clockwork_trap/steam_vent
	takes_input = TRUE

/datum/component/clockwork_trap/steam_vent/trigger()
	if(!..())
		return

	var/obj/structure/destructible/clockwork/trap/steam_vent/steam_vent_parent = parent
	steam_vent_parent.unleash_steam()
