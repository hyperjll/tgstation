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

/obj/item/mod/module/flashlight/darkness/super
	light_power = 2

/obj/item/mod/module/mister/syndicate
	name = "syndicate MOD mister module"
	desc = "A module containing a mister, able to spray it over areas. Holds 1000 units of reagents."
	device = /obj/item/reagent_containers/spray/mister
	volume = 1000

/obj/item/mod/module/mister/syndicate/Initialize(mapload)
	. = ..()
	reagents.add_reagent(/datum/reagent/clf3, volume)

/obj/item/mod/module/rcd
	name = "MOD RCD module"
	desc = "A module containing a Rapid-Construction-Device (RCD), allowing the user to quickly construct and deconstruct structures."
	icon = 'icons/obj/clothing/modsuit/mod_modules.dmi'
	icon_state = "constructor"
	device = /obj/item/construction/rcd
	module_type = MODULE_ACTIVE

/obj/item/mod/module/rcd/syndicate
	name = "syndicate MOD RCD module"
	desc = "A module containing a Syndicate Rapid-Construction-Device (RCD), allowing the user to quickly construct and deconstruct structures with greater ease."
	icon = 'hypermods/icons/obj/clothing/modsuit/mod_modules.dmi'
	icon_state = "constructor_syndi"
	device = /obj/item/construction/rcd/syndicate

/obj/item/mod/module/paper_rifle
	name = "syndicate MOD paper dispenser module"
	desc = "A simple module designed by the bureaucrats of Torch Bay. \
		It dispenses 'warm, clean, and crisp sheets of paper' onto a nearby table. Usually."
	icon_state = "paper_maker"
	module_type = MODULE_ACTIVE
	complexity = 1
	incompatible_modules = list(/obj/item/mod/module/paper_dispenser, /obj/item/mod/module/paper_rifle)
	cooldown_time = 5 SECONDS
	required_slots = list(ITEM_SLOT_GLOVES)
	device = /obj/item/pneumatic_cannon/paperplane/selfcharge
/**
/obj/item/gun/energy/burningpaper
	name = "paper dispenser"
	desc = "A small, easily concealable toy cannon. It fires paper, and lits it."
	icon = 'hypermods/icons/obj/clothing/modsuit/mod_modules.dmi'
	icon_state = "paper_rifle"
	ammo_type = list(/obj/item/ammo_casing/energy/burningpaper)
	fire_sound = 'sound/items/handling/paper_pickup.ogg'
	gun_flags = NOT_A_REAL_GUN
	selfcharge = TRUE

/obj/item/ammo_casing/energy/burningpaper
	projectile_type = /obj/projectile/bullet/burningpaper
	icon = 'icons/obj/service/bureaucracy.dmi'
	icon_state = "paperplane"
	base_icon_state = "paperplane"
	select_name = "paper"
	fire_sound = 'sound/items/handling/paper_drop.ogg'
	delay = 1
	e_cost = LASER_SHOTS(20, STANDARD_CELL_CHARGE)

/obj/projectile/bullet/burningpaper
	name = "paper"
	desc = "Protect your eyes."
	damage = 3 // It's paper.
	damage_type = BRUTE
	icon = 'icons/obj/service/bureaucracy.dmi'
	icon_state = "paperplane"
	base_icon_state = "paperplane"
	range = 10
	shrapnel_type = null
	embed_type = null

/obj/projectile/bullet/burningpaper/on_hit(atom/target, blocked = 0, pierce_hit)
	..()
	var/obj/item/paper/crisp_paper = new(get_turf(target))
	crisp_paper.desc = "It's crisp and warm to the touch. Must be fresh."

	crisp_paper.fire_act(1000, 100)
**/
/obj/item/mod/module/harmbeam
	name = "MOD demedical beamgun module"
	desc = "A wrist mounted variant of the medbeam gun, this particular version does the exact opposite than heal."
	icon_state = "chronogun"
	module_type = MODULE_ACTIVE
	complexity = 2
	active_power_cost = DEFAULT_CHARGE_DRAIN
	device = /obj/item/gun/medbeam/harmful/mod
	incompatible_modules = list(/obj/item/mod/module/harmbeam)
	removable = TRUE
	cooldown_time = 0.5
	required_slots = list(ITEM_SLOT_BACK)

/obj/item/gun/medbeam/harmful/mod
	name = "MOD medbeam" // Gotta make sure you cant just examine this in hand to figure someone out.

/obj/item/mod/module/syringe_pistol
	name = "MOD dart pistol module"
	desc = "A wrist-mounted dart pistol with retractable tethers to quickly hide the pistol within the MODsuit itself."
	icon = 'hypermods/icons/obj/clothing/modsuit/mod_modules.dmi'
	icon_state = "syringe_pistol"
	module_type = MODULE_ACTIVE
	complexity = 1
	active_power_cost = DEFAULT_CHARGE_DRAIN
	device = /obj/item/gun/syringe/syndicate/mod
	incompatible_modules = list(/obj/item/mod/module/syringe_pistol)
	removable = TRUE
	cooldown_time = 0.5
	required_slots = list(ITEM_SLOT_GLOVES)

/obj/item/gun/syringe/syndicate/mod
	name = "MOD dart pistol"

/obj/item/mod/module/hypospray
	name = "MOD hypospray module"
	desc = "A mounted DeForest Medical brand hypospray capable of quickly administering drugs and medicine. \
			It cannot penetrate armor, however..."
	icon = 'hypermods/icons/obj/clothing/modsuit/mod_modules.dmi'
	icon_state = "hypospray"
	module_type = MODULE_ACTIVE
	complexity = 1
	active_power_cost = DEFAULT_CHARGE_DRAIN
	device = /obj/item/reagent_containers/hypospray/buyable/mod
	incompatible_modules = list(/obj/item/mod/module/hypospray)
	removable = TRUE
	cooldown_time = 0.5
	required_slots = list(ITEM_SLOT_GLOVES)

/obj/item/reagent_containers/hypospray/buyable/mod
	name = "MOD DeForest hypospray"

/obj/item/mod/module/wormhole_jaunter
	name = "MOD wormhole jaunter module"
	desc = "A device harnessing outdated wormhole technology, Nanotrasen has since turned its eyes to bluespace for more accurate teleportation. \
			The wormholes it creates are unpleasant to travel through, to say the least.\nIt's been augmented to be used infintely."
	icon = 'hypermods/icons/obj/clothing/modsuit/mod_modules.dmi'
	icon_state = "jaunter"
	module_type = MODULE_ACTIVE
	complexity = 3
	active_power_cost = DEFAULT_CHARGE_DRAIN * 2
	device = /obj/item/wormhole_jaunter/mod
	incompatible_modules = list(/obj/item/wormhole_jaunter/mod)
	removable = TRUE
	cooldown_time = 0.5
	required_slots = list(ITEM_SLOT_GLOVES)

/obj/item/wormhole_jaunter/mod
	name = "MOD wormhole jaunter"
	desc = "A device harnessing outdated wormhole technology, Nanotrasen has since turned its eyes to bluespace for more accurate teleportation. \
			The wormholes it creates are unpleasant to travel through, to say the least.\nIt's been augmented to be used infintely."
	icon = 'hypermods/icons/obj/clothing/modsuit/mod_modules.dmi'
	icon_state = "jaunter"
	inhand_icon_state = "electronic"
	worn_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	throwforce = 0
	w_class = WEIGHT_CLASS_SMALL
	throw_speed = 3
	throw_range = 5
	slot_flags = ITEM_SLOT_BELT

/obj/item/wormhole_jaunter/mod/activate(mob/user, adjacent, teleport)
	if(!turf_check(user))
		return FALSE

	if(!can_jaunter_teleport())
		if(user)
			to_chat(user, span_notice("\The [src] found no beacons in the world to anchor a wormhole to."))
		else
			visible_message(span_notice("\The [src] found no beacons in the world to anchor a wormhole to!"))
		return TRUE // used for chasm code

	var/list/destinations = get_destinations()
	var/chosen_beacon = pick(destinations)

	var/obj/effect/portal/jaunt_tunnel/tunnel = new (get_turf(src), 100, null, FALSE, get_turf(chosen_beacon))
	if(teleport)
		tunnel.teleport(user)
	else if(adjacent)
		try_move_adjacent(tunnel)

	//qdel(src)
	return FALSE // used for chasm code

/obj/item/mod/module/bikehorn/mega
	name = "MOD mega bike horn module"
	desc = "A shoulder-mounted piece of heavy sonic artillery, this module uses the finest technology to \
		precisely deliver an almost lethal squeeze to... a bike horn, producing a significantly memorable sound. \
		It may be the last thing they ever hear."
	icon_state = "bikehorn"
	module_type = MODULE_USABLE
	complexity = 2
	use_energy_cost = DEFAULT_CHARGE_DRAIN * 30 // Hefty
	incompatible_modules = list(/obj/item/mod/module/bikehorn)
	cooldown_time = 60 SECONDS

/obj/item/mod/module/bikehorn/mega/on_use(mob/source, atom/target, list/modifiers)
	drain_power(use_energy_cost)

	playsound(src, 'sound/items/airhorn/airhorn.ogg', 100, TRUE)
	//to_chat(source, "[icon2html(src, source)]<font color='red' size='5'>HONK</font>")
	for(var/mob/living/carbon/M in ohearers(6, source))
		if(!M.can_hear())
			continue
		var/turf/turf_check = get_turf(M)
		if(isspaceturf(turf_check) && !turf_check.Adjacent(M)) //in space nobody can hear you honk.
			continue
		to_chat(M, "<font color='red' size='7'>HONK</font>")
		M.SetSleeping(0)
		M.adjust_stutter(40 SECONDS)
		var/obj/item/organ/ears/ears = M.get_organ_slot(ORGAN_SLOT_EARS)
		if(ears)
			ears.adjustEarDamage(0, 30)
		M.Paralyze(2 SECONDS)
		if(prob(30))
			M.Stun(4 SECONDS)
			M.Unconscious(4 SECONDS)
		else
			M.set_jitter_if_lower(80 SECONDS)

/obj/item/mod/module/balloon/explosive
	name = "MOD explosive balloon blower module"
	desc = "A extra-ordinary piece of technology developed by finest clown engineers with the help of Cybersun Industries \
		to make long balloons and balloon animals for those lucky few who enjoy a bit more fanfare than usual."
	cooldown_time = 20 SECONDS
	balloon_path = /obj/item/toy/balloon/explosive
	blowing_time = 15 SECONDS

/obj/item/mod/module/teslacoil
	name = "MOD tesla coil module"
	desc = "A tiny, high power tesla coil that's fitted within the MODsuit's back, "
	icon = 'icons/obj/machines/engine/tesla_coil.dmi'
	icon_state = "coil0"
	module_type = MODULE_USABLE
	complexity = 4
	use_energy_cost = DEFAULT_CHARGE_DRAIN * 100 // Costly AF
	incompatible_modules = list(/obj/item/mod/module/teslacoil)
	cooldown_time = 45 SECONDS
	required_slots = list(ITEM_SLOT_BACK)
	var/zap_range = 7
	var/zap_power = 30000

/obj/item/mod/module/teslacoil/on_use(mob/source, atom/target, list/modifiers)
	drain_power(use_energy_cost)

	var/zap_flags = ZAP_MOB_DAMAGE | ZAP_OBJ_DAMAGE | ZAP_MOB_STUN
	tesla_zap(mod.wearer, zap_range, zap_power, zap_flags)
	playsound(src, 'sound/machines/defib/defib_zap.ogg', 50, TRUE)
