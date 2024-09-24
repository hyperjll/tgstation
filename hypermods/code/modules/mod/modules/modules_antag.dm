//An actually disguised springlock module for sabotage.
/obj/item/mod/module/springlock/disguised

/obj/item/mod/module/springlock/disguised/Initialize(mapload)
	. = ..()
	var/obj/item/mod/module/dna_lock/the_dna_lock_behind_the_slaughter = /obj/item/mod/module/dna_lock
	name = initial(the_dna_lock_behind_the_slaughter.name)
	desc = initial(the_dna_lock_behind_the_slaughter.desc)
	icon_state = initial(the_dna_lock_behind_the_slaughter.icon_state)
	complexity = initial(the_dna_lock_behind_the_slaughter.complexity)
	use_energy_cost = initial(the_dna_lock_behind_the_slaughter.use_energy_cost)

/obj/item/mod/module/springlock/disguised/on_install()
	mod.activation_step_time *= 1 // If the suit activates quickly, that's a DEAD give-away. Get it?

/obj/item/mod/module/springlock/disguised/on_uninstall(deleting = FALSE)
	mod.activation_step_time *= 1

///Teleporter - Lets the user teleport to a nearby location.
/obj/item/mod/module/synditeleporter
	name = "syndicate MOD teleporter module"
	desc = "A module that uses experimental technology to let the user transport their particles elsewhere."
	icon_state = "teleporter"
	module_type = MODULE_ACTIVE
	complexity = 3
	use_energy_cost = DEFAULT_CHARGE_DRAIN * 5
	cooldown_time = 15 SECONDS
	required_slots = list(ITEM_SLOT_BACK|ITEM_SLOT_BELT)
	/// Time it takes to teleport
	var/teleport_time = 5 SECONDS

/obj/item/mod/module/synditeleporter/on_select_use(atom/target)
	. = ..()
	if(!.)
		return
	var/turf/open/target_turf = get_turf(target)
	if(!istype(target_turf) || target_turf.is_blocked_turf_ignore_climbable() || !(target_turf in view(mod.wearer)))
		balloon_alert(mod.wearer, "invalid target!")
		return
	balloon_alert(mod.wearer, "teleporting...")
	var/matrix/pre_matrix = matrix()
	pre_matrix.Scale(4, 0.25)
	var/matrix/post_matrix = matrix()
	post_matrix.Scale(0.25, 4)
	animate(mod.wearer, teleport_time, color = COLOR_CYAN, transform = pre_matrix.Multiply(mod.wearer.transform), easing = SINE_EASING|EASE_OUT)
	if(!do_after(mod.wearer, teleport_time, target = mod))
		balloon_alert(mod.wearer, "interrupted!")
		animate(mod.wearer, teleport_time*0.1, color = null, transform = post_matrix.Multiply(mod.wearer.transform), easing = SINE_EASING|EASE_IN)
		return
	animate(mod.wearer, teleport_time*0.1, color = null, transform = post_matrix.Multiply(mod.wearer.transform), easing = SINE_EASING|EASE_IN)
	if(!do_teleport(mod.wearer, target_turf, asoundin = 'sound/effects/phasein.ogg'))
		return
	drain_power(use_energy_cost)

///Anti-Gravity - Makes the user weightless.
/obj/item/mod/module/antigrav
	name = "MOD anti-gravity module"
	desc = "A module that uses a gravitational core to make the user completely weightless."
	icon_state = "antigrav"
	module_type = MODULE_TOGGLE
	complexity = 3
	active_power_cost = DEFAULT_CHARGE_DRAIN * 1.6
	incompatible_modules = list(/obj/item/mod/module/anomaly_locked, /obj/item/mod/module/atrocinator)
	cooldown_time = 0.5 SECONDS
	required_slots = list(ITEM_SLOT_BACK|ITEM_SLOT_BELT)

/obj/item/mod/module/antigrav/on_activation()
	if(mod.wearer.has_gravity())
		new /obj/effect/temp_visual/mook_dust(get_turf(src))
	mod.wearer.AddElement(/datum/element/forced_gravity, 0)
	playsound(src, 'sound/effects/gravhit.ogg', 50)

/obj/item/mod/module/antigrav/on_deactivation(display_message = TRUE, deleting = FALSE)
	mod.wearer.RemoveElement(/datum/element/forced_gravity, 0)
	if(deleting)
		return
	if(mod.wearer.has_gravity())
		new /obj/effect/temp_visual/mook_dust(get_turf(src))
	playsound(src, 'sound/effects/gravhit.ogg', 50)

/obj/item/mod/module/dispenser/frag
	name = "MOD frag grenade dispenser module"
	desc = "This module can create fragmentation grenades at the user's liking. What makes YOU a good demoman?"
	icon_state = "dispenser"
	cooldown_time = 30 SECONDS
	use_energy_cost = DEFAULT_CHARGE_DRAIN * 3
	dispense_type = /obj/item/grenade/frag

/obj/item/mod/module/joint_torsion/syndicate
	name = "syndicate MOD joint torsion ratchet module"
	desc = "A compact AC generator that charges the suit's internal cell through the power of deambulation. It doesn't work in zero G."
	power_per_step = DEFAULT_CHARGE_DRAIN * 0.6

/obj/item/mod/module/recycler/ammobox
	name = "MOD munitions recycler module"
	desc = "A mod module collects and repackages spent rounds (and garbage) into boxes of a specific type of ammunition. \
		Activate on a nearby turf or storage to unload stored ammo boxes."
	icon = 'hypermods/icons/obj/clothing/modsuit/mod_modules.dmi'
	icon_state = "donk_recycler"
	//overlay_state_inactive = "module_donk_recycler"
	//overlay_state_active = "module_donk_recycler"
	efficiency = 0.75 // Stops getting as many riot foam darts as one consumes.
	accepted_mats = list(/datum/material/iron)
	///The type of ammo box that it dispenses
	var/ammobox_type = /obj/item/ammo_box
	///The cost of each dispensed ammo box
	var/required_amount = SHEET_MATERIAL_AMOUNT*20

/obj/item/mod/module/recycler/ammobox/dispense(atom/target)
	if(!container.use_amount_mat(required_amount, /datum/material/iron))
		balloon_alert(mod.wearer, "not enough material")
		playsound(src, 'sound/machines/buzz/buzz-sigh.ogg', 50, TRUE)
		return
	var/obj/item/ammo_box/product = new ammobox_type(target)
	attempt_insert_storage(product)
	balloon_alert(mod.wearer, "ammo box dispensed.")
	playsound(src, 'sound/machines/microwave/microwave-end.ogg', 50, TRUE)

/obj/item/mod/module/recycler/ammobox/c9mm
	name = "MOD 9mm munitions recycler module"
	icon_state = "recycler9mm"
	ammobox_type = /obj/item/ammo_box/c9mm
	required_amount = (SHEET_MATERIAL_AMOUNT*10)

/obj/item/mod/module/recycler/ammobox/c45
	name = "MOD .45 munitions recycler module"
	icon_state = "recycler45"
	ammobox_type = /obj/item/ammo_box/c45
	required_amount = (SHEET_MATERIAL_AMOUNT*15)

/obj/item/mod/module/recycler/ammobox/a357
	name = "MOD .357 munitions recycler module"
	icon_state = "recycler357"
	ammobox_type = /obj/item/ammo_box/a357/no_direct
	required_amount = (SHEET_MATERIAL_AMOUNT*20)

/obj/item/mod/module/recycler/ammobox/c10mm
	name = "MOD 10mm munitions recycler module"
	icon_state = "recycler10mm"
	ammobox_type = /obj/item/ammo_box/c10mm
	required_amount = (SHEET_MATERIAL_AMOUNT*15)

/obj/item/mod/module/recycler/ammobox/m50
	name = "MOD 50ae munitions recycler module"
	icon_state = "recycler50ae"
	ammobox_type = /obj/item/ammo_box/m50
	required_amount = (SHEET_MATERIAL_AMOUNT*20)

/obj/item/mod/module/stealth/syndicate
	name = "syndicate MOD cloaking module"
	desc = "A complete retrofitting of the suit, this is a form of visual concealment tech employing esoteric technology \
		to bend light around the user, as well as mimetic materials to make the surface of the suit match the \
		surroundings based off sensor data. This version has been modified to be more effective yet costly."
	icon = 'hypermods/icons/obj/clothing/modsuit/mod_modules.dmi'
	icon_state = "scloak"
	module_type = MODULE_TOGGLE
	complexity = 6
	active_power_cost = DEFAULT_CHARGE_DRAIN * 3
	use_energy_cost = DEFAULT_CHARGE_DRAIN * 10
	incompatible_modules = list(/obj/item/mod/module/stealth)
	cooldown_time = 5 SECONDS
	required_slots = list(ITEM_SLOT_BACK|ITEM_SLOT_BELT)
	bumpoff = TRUE
	stealth_alpha = 40

///Basically a shittier hacker module, doesn't hack doors but can shock people
/obj/item/mod/module/hacker/electricpalm
	name = "MOD lightning palm module"
	desc = "Specifically designed by the MI13, and manufactured at the behest of both Cybersun Industries and Waffle Co. \
		This modules allows the wearer to channel electrical shocks directly from the MODsuit's battery into the gloves, \
		allowing for electrocution of enemies and quick stuns. Was later discontinued for a more effective module which has since been privatized."
	icon_state = "hacker"
	removable = TRUE
	incompatible_modules = list(/obj/item/mod/module/hacker)
	required_slots = list(ITEM_SLOT_GLOVES)

/obj/item/mod/module/hacker/electricpalm/on_suit_activation()
	RegisterSignal(mod.wearer, COMSIG_LIVING_UNARMED_ATTACK, PROC_REF(hack))

/obj/item/mod/module/hacker/electricpalm/on_suit_deactivation(deleting = FALSE)
	UnregisterSignal(mod.wearer, COMSIG_LIVING_UNARMED_ATTACK)

/obj/item/mod/module/hacker/electricpalm/hack(mob/living/carbon/human/source, atom/target, proximity, modifiers)
	SIGNAL_HANDLER

	if(!LAZYACCESS(modifiers, RIGHT_CLICK) || !proximity)
		return NONE
	target.add_fingerprint(mod.wearer)

	//Got that electric touch
	if(istype(target, /mob/living/carbon/human))
		return target.ninjadrain_act(mod.wearer, src)

/obj/item/mod/module/energy_net/syndicate
	name = "syndicate MOD energy net module"
	desc = "A custom-built net-thrower. While conventional implementations of this capturing device \
		utilize monomolecular fibers or cutting razorwire, this uses hardlight technology to deploy a \
		trapping field capable of immobilizing even the strongest opponents."
	icon_state = "energy_net"
	removable = FALSE
	module_type = MODULE_ACTIVE
	use_energy_cost = DEFAULT_CHARGE_DRAIN * 6
	incompatible_modules = list(/obj/item/mod/module/energy_net)
	cooldown_time = 5 SECONDS
	required_slots = list(ITEM_SLOT_GLOVES)

/obj/item/mod/module/energy_net/syndicate/on_suit_deactivation(deleting)
	for(var/obj/structure/energy_net/net as anything in energy_nets)
		net.atom_destruction(ENERGY)

/obj/item/mod/module/energy_net/syndicate/on_select_use(atom/target)
	. = ..()
	if(!.)
		return
	var/obj/projectile/net = new /obj/projectile/energy_net/syndicate(mod.wearer.loc, src)
	net.preparePixelProjectile(target, mod.wearer)
	net.firer = mod.wearer
	playsound(src, 'sound/items/weapons/punchmiss.ogg', 25, TRUE)
	INVOKE_ASYNC(net, TYPE_PROC_REF(/obj/projectile, fire))
	drain_power(use_energy_cost)

/obj/item/mod/module/energy_net/syndicate/add_net(obj/structure/energy_net/syndicate/net)
	energy_nets += net
	RegisterSignal(net, COMSIG_QDELETING, PROC_REF(remove_net))

/obj/item/mod/module/energy_net/syndicate/remove_net(obj/structure/energy_net/syndicate/net)
	SIGNAL_HANDLER
	energy_nets -= net

/obj/projectile/energy_net/syndicate
	name = "energy net"
	icon = 'hypermods/icons/obj/clothing/modsuit/mod_modules.dmi'
	icon_state = "net_projectile"
	damage = 5 // A little damage for your troubles.
	range = 9

/obj/projectile/energy_net/syndicate/fire(setAngle)
	if(firer)
		line = firer.Beam(src, "net_beam", 'hypermods/icons/obj/clothing/modsuit/mod_modules.dmi')
	return ..()

/obj/projectile/energy_net/syndicate/on_hit(mob/living/target, blocked = 0, pierce_hit)
	. = ..()
	if(!istype(target))
		return
	if(locate(/obj/structure/energy_net/syndicate) in get_turf(target))
		return
	var/obj/structure/energy_net/syndicate/net = new /obj/structure/energy_net/syndicate(target.drop_location())
	var/obj/item/mod/module/energy_net/syndicate/module = net_module?.resolve()
	if(module)
		module.add_net(net)
	firer?.visible_message(span_danger("[firer] caught [target] with an energy net!"), span_notice("You caught [target] with an energy net!"))
	if(target.buckled)
		target.buckled.unbuckle_mob(target, force = TRUE)
	net.buckle_mob(target, force = TRUE)

/obj/item/mod/module/adrenaline_boost/syndicate
	name = "MOD stimulant injector module"
	desc = "A reagent injector stored within the MODsuit, when activated a portion of the stored contents are injected into the base of the wearer's neck."
	icon = 'hypermods/icons/obj/clothing/modsuit/mod_modules.dmi'
	icon_state = "stimulant_boost"
	removable = TRUE
	module_type = MODULE_USABLE
	allow_flags = MODULE_ALLOW_INCAPACITATED
	incompatible_modules = list(/obj/item/mod/module/adrenaline_boost)
	cooldown_time = 12 SECONDS
	required_slots = list(ITEM_SLOT_BACK|ITEM_SLOT_BELT)
	/// What reagent we need to refill?
	reagent_required = /datum/reagent/medicine/ephedrine
	/// How much of a reagent we need to refill the boost.
	reagent_required_amount = 20

/obj/item/mod/module/adrenaline_boost/syndicate/Initialize(mapload)
	. = ..()
	create_reagents(reagent_required_amount)
	reagents.add_reagent(reagent_required, reagent_required_amount)

/obj/item/mod/module/adrenaline_boost/used()
	if(!reagents.has_reagent(reagent_required, reagent_required_amount))
		balloon_alert(mod.wearer, "no charge!")
		return FALSE
	return ..()

/obj/item/mod/module/adrenaline_boost/syndicate/on_use()
	to_chat(mod.wearer, span_notice("You have used the stimulant boost."))
	mod.wearer.SetAllImmobility(0)
	mod.wearer.adjustStaminaLoss(-20) // Down from 200
	mod.wearer.remove_status_effect(/datum/status_effect/speech/stutter)
	mod.wearer.reagents.add_reagent(/datum/reagent/medicine/stimulants, 5)
	reagents.remove_reagent(reagent_required, reagents.total_volume * 0.75)
	addtimer(CALLBACK(src, PROC_REF(boost_aftereffects), mod.wearer), 7 SECONDS)

/obj/item/mod/module/adrenaline_boost/syndicate/on_install()
	RegisterSignal(mod, COMSIG_ATOM_ITEM_INTERACTION, PROC_REF(try_boost))

/obj/item/mod/module/adrenaline_boost/syndicate/on_uninstall(deleting = FALSE)
	UnregisterSignal(mod, COMSIG_ATOM_ITEM_INTERACTION)

/obj/item/mod/module/adrenaline_boost/syndicate/try_boost(source, mob/user, obj/item/attacking_item)
	SIGNAL_HANDLER
	if(charge_boost(attacking_item))
		return COMPONENT_NO_AFTERATTACK
	return NONE

/obj/item/mod/module/adrenaline_boost/syndicate/charge_boost(obj/item/attacking_item)
	if(!attacking_item.is_open_container())
		return FALSE
	if(reagents.has_reagent(reagent_required, reagent_required_amount))
		balloon_alert(mod.wearer, "already charged!")
		return FALSE
	if(!attacking_item.reagents.trans_to(src, reagent_required_amount, target_id = reagent_required))
		return FALSE
	balloon_alert(mod.wearer, "charge [reagents.has_reagent(reagent_required, reagent_required_amount) ? "fully" : "partially"] reloaded")
	return TRUE

/obj/item/mod/module/adrenaline_boost/syndicate/boost_aftereffects(mob/affected_mob)
	if(!affected_mob)
		return
	reagents.trans_to(affected_mob, reagents.total_volume)
	to_chat(affected_mob, span_danger("You are beginning to feel the after-effect of the injection."))

/obj/item/mod/module/active_sonar/syndicate
	name = "syndicate MOD active sonar"
	desc = "Ancient tech from the 20th century refitted with newly manufactured parts, this module uses sonic waves to detect living creatures within the user's radius. \
		Its basic function slowly scans around the user for any bio-signatures, however it can be overclocked to scan everywhere at once.\
		Its loud ping is much harder to hide in an indoor station than in the outdoor operations it was designed for."
	icon_state = "active_sonar"
	module_type = MODULE_USABLE
	idle_power_cost = DEFAULT_CHARGE_DRAIN * 0.5
	use_energy_cost = DEFAULT_CHARGE_DRAIN * 3
	complexity = 2
	incompatible_modules = list(/obj/item/mod/module/active_sonar)
	cooldown_time = 4 SECONDS

/obj/item/mod/module/projectile_dampener/syndicate
	name = "syndicate MOD projectile nullifier module"
	desc = "Developed by Cybersun after this technology was delivered to them from covert spies, this module projects a field capable of greatly weakening all projectiles in nearby range."
	icon_state = "projectile_dampener"
	module_type = MODULE_TOGGLE
	complexity = 2
	active_power_cost = DEFAULT_CHARGE_DRAIN
	incompatible_modules = list(/obj/item/mod/module/projectile_dampener)
	cooldown_time = 1.5 SECONDS
	required_slots = list(ITEM_SLOT_BACK|ITEM_SLOT_BELT)
	/// Radius of the dampening field.
	field_radius = 1
	/// Damage multiplier on projectiles.
	damage_multiplier = 0.5
	/// Debuff multiplier on projectiles.
	debuff_multiplier = 0.33
	/// Speed multiplier on projectiles, higher means slower.
	speed_multiplier = 5

/obj/item/mod/module/death_sphere
	name = "syndicate MOD death sphere module"
	desc = "A module able to move the suit's parts around, turning it and the user into a sphere. \
		The sphere can move quickly, even through lava, and launch highly explosive bombs to decimate area and people alike."
	icon_state = "sphere"
	module_type = MODULE_ACTIVE
	removable = TRUE
	active_power_cost = DEFAULT_CHARGE_DRAIN * 0.5
	use_energy_cost = DEFAULT_CHARGE_DRAIN * 3
	incompatible_modules = list(/obj/item/mod/module/sphere_transform)
	cooldown_time = 1.25 SECONDS
	required_slots = list(ITEM_SLOT_OCLOTHING|ITEM_SLOT_ICLOTHING, ITEM_SLOT_HEAD|ITEM_SLOT_MASK)
	/// Time it takes us to complete the animation.
	var/animate_time = 0.25 SECONDS
	/// List of traits to add/remove from our subject as needed.
	var/static/list/user_traits = list(
		TRAIT_FORCED_STANDING,
		TRAIT_HANDS_BLOCKED,
		TRAIT_LAVA_IMMUNE,
		TRAIT_NO_SLIP_ALL,
	)

/obj/item/mod/module/death_sphere/activate()
	if(!mod.wearer.has_gravity())
		balloon_alert(mod.wearer, "no gravity!")
		return FALSE
	return ..()

/obj/item/mod/module/death_sphere/on_activation()
	playsound(src, 'sound/items/modsuit/ballin.ogg', 100, TRUE)
	mod.wearer.add_filter("mod_ball", 1, alpha_mask_filter(icon = icon('icons/mob/clothing/modsuit/mod_modules.dmi', "ball_mask"), flags = MASK_INVERSE))
	mod.wearer.add_filter("mod_blur", 2, angular_blur_filter(size = 15))
	mod.wearer.add_filter("mod_outline", 3, outline_filter(color = "#000000AA"))
	mod.wearer.base_pixel_y -= 4
	animate(mod.wearer, animate_time, pixel_y = mod.wearer.base_pixel_y, flags = ANIMATION_PARALLEL)
	mod.wearer.SpinAnimation(1.5)
	mod.wearer.add_traits(user_traits, MOD_TRAIT)
	mod.wearer.RemoveElement(/datum/element/footstep, FOOTSTEP_MOB_HUMAN, 1, -6)
	mod.wearer.AddElement(/datum/element/footstep, FOOTSTEP_OBJ_ROBOT, 1, -6, sound_vary = TRUE)
	mod.wearer.add_movespeed_mod_immunities(MOD_TRAIT, /datum/movespeed_modifier/damage_slowdown)
	mod.wearer.add_movespeed_modifier(/datum/movespeed_modifier/sphere)
	RegisterSignal(mod.wearer, COMSIG_MOB_STATCHANGE, PROC_REF(on_statchange))

/obj/item/mod/module/death_sphere/on_deactivation(display_message = TRUE, deleting = FALSE)
	if(!deleting)
		playsound(src, 'sound/items/modsuit/ballin.ogg', 100, TRUE, frequency = -1)
	mod.wearer.base_pixel_y += 4
	animate(mod.wearer, animate_time, pixel_y = mod.wearer.base_pixel_y)
	addtimer(CALLBACK(mod.wearer, TYPE_PROC_REF(/datum, remove_filter), list("mod_ball", "mod_blur", "mod_outline")), animate_time)
	mod.wearer.remove_traits(user_traits, MOD_TRAIT)
	mod.wearer.remove_movespeed_mod_immunities(MOD_TRAIT, /datum/movespeed_modifier/damage_slowdown)
	mod.wearer.RemoveElement(/datum/element/footstep, FOOTSTEP_OBJ_ROBOT, 1, -6, sound_vary = TRUE)
	mod.wearer.AddElement(/datum/element/footstep, FOOTSTEP_MOB_HUMAN, 1, -6)
	mod.wearer.remove_movespeed_modifier(/datum/movespeed_modifier/sphere)
	UnregisterSignal(mod.wearer, COMSIG_MOB_STATCHANGE)

/obj/item/mod/module/death_sphere/used()
	if(lavaland_equipment_pressure_check(get_turf(src)))
		balloon_alert(mod.wearer, "not enough pressure!")
		playsound(src, 'sound/items/weapons/gun/general/dry_fire.ogg', 25, TRUE)
		return FALSE
	return ..()

/obj/item/mod/module/death_sphere/on_select_use(atom/target)
	. = ..()
	if(!.)
		return
	var/obj/projectile/bomb = new /obj/projectile/bullet/mining_bomb/syndicate(mod.wearer.loc)
	bomb.preparePixelProjectile(target, mod.wearer)
	bomb.firer = mod.wearer
	playsound(src, 'sound/items/weapons/gun/general/grenade_launch.ogg', 75, TRUE)
	INVOKE_ASYNC(bomb, TYPE_PROC_REF(/obj/projectile, fire))
	drain_power(use_energy_cost)

/obj/item/mod/module/death_sphere/on_active_process(seconds_per_tick)
	animate(mod.wearer) //stop the animation
	mod.wearer.SpinAnimation(1.5) //start it back again
	if(!mod.wearer.has_gravity())
		deactivate() //deactivate in no grav

/obj/item/mod/module/death_sphere/proc/on_statchange(datum/source)
	SIGNAL_HANDLER

	if(!mod.wearer.stat)
		return
	deactivate()

/obj/projectile/bullet/mining_bomb/syndicate
	name = "bomb"
	desc = "A bomb. Spending your time reading this doesn't seem like the best use of your time."
	icon_state = "smine_bomb"
	icon = 'hypermods/icons/obj/clothing/modsuit/mod_modules.dmi'

/obj/projectile/bullet/mining_bomb/syndicate/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/projectile_drop, /obj/structure/mining_bomb/syndicate)
	RegisterSignal(src, COMSIG_PROJECTILE_ON_SPAWN_DROP, PROC_REF(handle_drop))

/obj/projectile/bullet/mining_bomb/syndicate/handle_drop(datum/source, obj/structure/mining_bomb/syndicate/bomb)
	SIGNAL_HANDLER
	addtimer(CALLBACK(bomb, TYPE_PROC_REF(/obj/structure/mining_bomb/syndicate, prime), firer), bomb.prime_time)

/obj/structure/mining_bomb/syndicate
	name = "mining bomb"
	desc = "A bomb. Spending your time reading this doesn't seem like the best use of your time."
	icon_state = "smine_bomb"
	icon = 'hypermods/icons/obj/clothing/modsuit/mod_modules.dmi'
	/// Time to prime the explosion
	prime_time = 0.5 SECONDS
	/// Time to explode from the priming
	explosion_time = 2 SECONDS // Up from 1
	/// Damage done on explosion.
	damage = 20
	/// Damage multiplier on hostile fauna. If those fauna happen to be ON station, i feel bad for them.
	fauna_boost = 5

/obj/structure/mining_bomb/syndicate/boom(atom/movable/firer)
	visible_message(span_danger("[src] explodes!"))
	playsound(src, 'sound/effects/magic/magic_missile.ogg', 200, vary = TRUE)
	for(var/turf/closed/mineral/rock in circle_range_turfs(src, 2))
		rock.gets_drilled()
	for(var/mob/living/mob in range(3, src)) // range from 1 to 3
		mob.apply_damage(damage * (ishostile(mob) ? fauna_boost : 1), BRUTE, spread_damage = TRUE)
		if(!ishostile(mob) || !firer)
			continue
		var/mob/living/simple_animal/hostile/hostile_mob = mob
		hostile_mob.GiveTarget(firer)
	for(var/obj/object in range(1, src))
		object.take_damage(damage, BRUTE, BOMB)
	qdel(src)

/obj/item/mod/module/power_kick/syndicate
	name = "syndicate MOD power kick module"
	desc = "This module uses high-power myomer to generate an incredible amount of energy, transferred into the power of a kick."
	icon_state = "power_kick"
	module_type = MODULE_ACTIVE
	removable = FALSE
	use_energy_cost = DEFAULT_CHARGE_DRAIN * 5
	incompatible_modules = list(/obj/item/mod/module/power_kick)
	cooldown_time = 5 SECONDS
	required_slots = list(ITEM_SLOT_FEET)
	/// Damage on kick.
	damage = 40
	/// The wound bonus of the kick.
	wounding_power = 45
	/// How long we knockdown for on the kick.
	knockdown_time = 5 SECONDS
