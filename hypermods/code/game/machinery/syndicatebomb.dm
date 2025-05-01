/obj/machinery/syndicatebomb/super
	payload = /obj/item/bombcore/syndicate/large

/obj/machinery/syndicatebomb/decoy
	payload = /obj/item/bombcore/syndicate/decoy

/obj/machinery/syndicatebomb/dimensional
	name = "syndicate dimensional bomb"
	payload = /obj/item/bombcore/dimensional

/obj/item/bombcore/syndicate/decoy
	name = "Donk Co. Super-Stable Bomb Payload Decoy"
	range_heavy = 1
	range_medium = 2
	range_light = 0
	range_flame = 2

/obj/item/bombcore/emp/small
	name = "Small EMP Payload"
	range_heavy = 4
	range_medium = 10
	grenade_craft = TRUE
	grenade_craft_type = /obj/item/grenade/empgrenade

/obj/item/bombcore/flash
	name = "Flash Payload"
	desc = "A payload containing the necessities to create a flashbang. Must be inserted into a chemical grenade casing or a bomb to function."
	icon = 'hypermods/icons/obj/devices/assemblies.dmi'
	icon_state = "flashcore"
	grenade_craft = TRUE
	grenade_craft_type = /obj/item/grenade/flashbang
	var/flashbang_range = 7 //how many tiles away the mob will be stunned.

/obj/item/bombcore/flash/detonate()
	if(adminlog)
		message_admins(adminlog)
		log_game(adminlog)

	var/flashbang_turf = get_turf(src)
	if(!flashbang_turf)
		return
	do_sparks(rand(5, 9), FALSE, src)
	playsound(flashbang_turf, 'sound/items/weapons/flashbang.ogg', 100, TRUE, 8, 0.9)
	new /obj/effect/dummy/lighting_obj (flashbang_turf, flashbang_range + 2, 4, COLOR_WHITE, 2)
	for(var/mob/living/living_mob in get_hearers_in_view(flashbang_range, flashbang_turf))
		bang(get_turf(living_mob), living_mob)

	sleep(1 SECONDS) // putting this here to prevent a runtime with the extra proc
	qdel(src)

/obj/item/bombcore/flash/proc/bang(turf/turf, mob/living/living_mob) // copy and pasted from the grenade
	if(living_mob.stat == DEAD) //They're dead!
		return
	living_mob.show_message(span_warning("BANG"), MSG_AUDIBLE)
	var/distance = max(0, get_dist(get_turf(src), turf))

//Flash
	if(living_mob.flash_act(affect_silicon = 1))
		living_mob.Paralyze(max(20/max(1, distance), 5))
		living_mob.Knockdown(max(200/max(1, distance), 60))

//Bang
	if(!distance || loc == living_mob || loc == living_mob.loc)
		living_mob.Paralyze(20)
		living_mob.Knockdown(200)
		living_mob.soundbang_act(1, 200, 10, 15)
	else
		if(distance <= 1) // Adds more stun as to not prime n' pull (#45381)
			living_mob.Paralyze(5)
			living_mob.Knockdown(30)
		living_mob.soundbang_act(1, max(200 / max(1, distance), 60), rand(0, 5))

/obj/item/bombcore/stingbang
	name = "Stingbang Payload"
	desc = "A payload containing the necessities to create a stingbang. Must be inserted into a chemical grenade casing or a bomb to function."
	icon = 'hypermods/icons/obj/devices/assemblies.dmi'
	icon_state = "stingbangcore"
	grenade_craft = TRUE
	grenade_craft_type = /obj/item/grenade/stingbang
	no_big_bombs = TRUE

/obj/item/bombcore/cryogenic
	name = "Cryogenic Payload"
	desc = "A payload containing the necessities to create a cryogenic grenade. Must be inserted into a chemical grenade casing to function."
	icon = 'hypermods/icons/obj/devices/assemblies.dmi'
	icon_state = "cryocore"
	grenade_craft = TRUE
	grenade_craft_type = /obj/item/grenade/cryogenic
	no_big_bombs = TRUE

/obj/item/bombcore/metal_foam
	name = "Metal Foam Payload"
	desc = "A payload containing the necessities to create a metal foam grenade. Must be inserted into a chemical grenade casing to function."
	icon = 'hypermods/icons/obj/devices/assemblies.dmi'
	icon_state = "metalfoamcore"
	grenade_craft = TRUE
	grenade_craft_type = /obj/item/grenade/chem_grenade/metalfoam_stylish
	no_big_bombs = TRUE

/obj/item/bombcore/smart_metal_foam
	name = "Smart Metal Foam Payload"
	desc = "A payload containing the necessities to create a smart metal foam grenade. Must be inserted into a chemical grenade casing to function."
	icon = 'hypermods/icons/obj/devices/assemblies.dmi'
	icon_state = "metalfoamcore"
	grenade_craft = TRUE
	grenade_craft_type = /obj/item/grenade/chem_grenade/smart_metal_foam_stylish
	no_big_bombs = TRUE

/obj/item/bombcore/pepper
	name = "Tear Gas Payload"
	desc = "A payload containing the necessities to create a tear gas grenade. Must be inserted into a chemical grenade casing to function."
	icon = 'hypermods/icons/obj/devices/assemblies.dmi'
	icon_state = "peppercore"
	grenade_craft = TRUE
	grenade_craft_type = /obj/item/grenade/chem_grenade/teargas_stylish
	no_big_bombs = TRUE

/obj/item/bombcore/foam_dart
	name = "Foam Dart Payload"
	desc = "A payload containing the necessities to create a foam dart grenade. Must be inserted into a chemical grenade casing to function."
	icon = 'hypermods/icons/obj/devices/assemblies.dmi'
	icon_state = "foamdartcore"
	grenade_craft = TRUE
	grenade_craft_type = /obj/item/grenade/foam_dart
	no_big_bombs = TRUE

/obj/item/bombcore/riot_dart
	name = "Riot Dart Payload"
	desc = "A payload containing the necessities to create a riot dart grenade. Must be inserted into a chemical grenade casing to function."
	icon = 'hypermods/icons/obj/devices/assemblies.dmi'
	icon_state = "riotdartcore"
	grenade_craft = TRUE
	grenade_craft_type = /obj/item/grenade/foam_dart/riot
	no_big_bombs = TRUE

/obj/item/bombcore/highexplosive
	name = "HE Payload"
	desc = "A payload containing the necessities to create a highly-explosive grenade. Must be inserted into a chemical grenade casing to function."
	icon = 'hypermods/icons/obj/devices/assemblies.dmi'
	icon_state = "hecore"
	grenade_craft = TRUE
	grenade_craft_type = /obj/item/grenade/syndieminibomb/concussion
	no_big_bombs = TRUE

/obj/item/bombcore/estinger
	name = "Disabler Stinger Payload"
	desc = "A payload containing the necessities to create a disabler stinger. Must be inserted into a chemical grenade casing to function."
	icon = 'hypermods/icons/obj/devices/assemblies.dmi'
	icon_state = "estingcore"
	grenade_craft = TRUE
	grenade_craft_type = /obj/item/grenade/energy_stinger
	no_big_bombs = TRUE

/obj/item/bombcore/estinger_lethal
	name = "Energy Stinger Payload"
	desc = "A payload containing the necessities to create a disabler stinger. Must be inserted into a chemical grenade casing to function."
	icon = 'hypermods/icons/obj/devices/assemblies.dmi'
	icon_state = "estingcore"
	grenade_craft = TRUE
	grenade_craft_type = /obj/item/grenade/energy_stinger/lethal
	no_big_bombs = TRUE
