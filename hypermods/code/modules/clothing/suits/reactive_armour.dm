// Augmented Syndicate Reactive Armors

/obj/item/clothing/suit/armor/reactive/syndicate
	name = "augmented reactive armor"
	desc = "It looks like reactive teleport armor, save for the small three-headed snake insignia near the middle."
	icon_state = "reactiveoff"
	inhand_icon_state = "reactiveoff"
	blood_overlay_type = "armor"
	armor_type = /datum/armor/armor_reactive
	actions_types = list(/datum/action/item_action/toggle)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	hit_reaction_chance = 75
	///Whether the armor will try to react to hits (is it on)
	active = 0
	///This will be true for 30 seconds after an EMP, it makes the reaction effect dangerous to the user.
	bad_effect = FALSE
	///Message sent when the armor is emp'd. It is not the message for when the emp effect goes off.
	emp_message = span_warning("The reactive armor has been emp'd! Damn, now it's REALLY gonna not do much!")
	///Message sent when the armor is still on cooldown, but activates.
	cooldown_message = span_danger("The reactive armor fails to do much, as it is recharging! From what? Only the reactive armor knows.")
	///Duration of the cooldown specific to reactive armor for when it can activate again.
	reactivearmor_cooldown_duration = 0
	///The CURRENT cooldown of the reactive armor for when it can activate again.
	reactivearmor_cooldown = 0
	///The maximum teleportation range upon being triggered.
	var/tele_range = 10

/datum/armor/armor_reactive
	melee = 15
	bullet = 10
	laser = 10
	energy = 10
	bomb = 20
	bio = 100
	fire = 100
	acid = 100
	wound = 20

/datum/armor/armor_reactive/stronger
	melee = 45
	bullet = 30
	laser = 30
	energy = 30
	bomb = 40
	bio = 100
	fire = 100
	acid = 100
	wound = 40

/obj/item/clothing/suit/armor/reactive/syndicate/attack_self(mob/user)
	active = !(active)
	if(active)
		to_chat(user, span_notice("[src] is now active."))
		icon_state = "reactive"
		inhand_icon_state = "reactive"
	else
		to_chat(user, span_notice("[src] is now inactive."))
		icon_state = "reactiveoff"
		inhand_icon_state = "reactiveoff"
	add_fingerprint(user)
	return

/obj/item/clothing/suit/armor/reactive/syndicate/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	active = 0
	icon_state = "reactiveoff"
	inhand_icon_state = "reactiveoff"
	reactivearmor_cooldown = world.time + 200

///The augmented TELEPORTING armor.

/obj/item/clothing/suit/armor/reactive/syndicate/teleport
	name = "augmented teleport armor"
	desc = "Gotta teleport fast!"
	emp_message = span_warning("The reactive armor's teleportation calculations begin spewing errors!")
	cooldown_message = span_danger("The reactive teleport system is still recharging! It fails to activate!")
	reactivearmor_cooldown_duration = 7 SECONDS
	var/rad_amount= 15

/obj/item/clothing/suit/armor/reactive/syndicate/teleport/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(!active)
		return 0
	if(!damage)
		return 0
	if(prob(hit_reaction_chance))
		var/mob/living/carbon/human/H = owner
		if(world.time < reactivearmor_cooldown)
			owner.visible_message(span_danger("The augmented teleport system is still recharging! It fails to teleport [H]!"))
			return
		owner.visible_message(span_danger("The reactive teleport system flings [H] clear of [attack_text], shutting itself off in the process!"))
		do_teleport(H, get_turf(H), tele_range, asoundin = 'sound/effects/magic/blink.ogg', channel = TELEPORT_CHANNEL_BLUESPACE)
		reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
		return 1
	return 0

///The augmented INCENDIARY armor.

/obj/item/clothing/suit/armor/reactive/syndicate/fire
	name = "augmented incendiary armor"
	desc = "An experimental suit of armor with a reactive sensor array rigged to a flame emitter. Can't handle the heat on this hot summer space day? TOO BAD!"
	reactivearmor_cooldown_duration = 30 SECONDS

/obj/item/clothing/suit/armor/reactive/syndicate/fire/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(!active)
		return 0
	if(!damage)
		return 0
	if(prob(hit_reaction_chance))
		if(world.time < reactivearmor_cooldown)
			owner.visible_message(span_danger("The augmented incendiary armor on [owner] activates, but fails to send out flames as it is still recharging its flame jets!"))
			return
		owner.visible_message(span_danger("[src] blocks [attack_text], sending out jets of flame!"))
		playsound(get_turf(owner),'sound/effects/magic/fireball.ogg', 100, 1)
		for(var/mob/living/carbon/C in range(6, owner))
			if(C != owner)
				C.adjust_fire_stacks(8)
				C.ignite_mob()
		owner.fire_stacks = -4
		reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
		return 1
	return 0

///The augmented STEALTH armor

/obj/item/clothing/suit/armor/reactive/syndicate/stealth
	name = "augmented stealth armor"
	desc = "An experimental suit of armor that renders the wearer invisible on detection of imminent harm, and creates a decoy that runs away from the owner. You can't fight what you can't see."
	reactivearmor_cooldown_duration = 40 SECONDS

/obj/item/clothing/suit/armor/reactive/syndicate/stealth/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(!active)
		return 0
	if(!damage)
		return 0
	if(prob(hit_reaction_chance))
		if(world.time < reactivearmor_cooldown)
			owner.visible_message(span_danger("The augmented stealth system on [owner] activates, but is still recharging its holographic emitters!"))
			return
		var/mob/living/simple_animal/hostile/illusion/escape/E = new(owner.loc)
		E.Copy_Parent(owner, 50)
		E.GiveTarget(owner) //so it starts running right away
		E.Goto(owner, E.move_to_delay, E.minimum_distance)
		owner.alpha = 0
		owner.visible_message(span_danger("[owner] is hit by [attack_text] in the chest!")) //We pretend to be hit, since blocking it would stop the message otherwise
		spawn(40)
			owner.alpha = initial(owner.alpha)
		reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
		return 1

//The augmented TESLA armor

/obj/item/clothing/suit/armor/reactive/syndicate/tesla
	name = "augmented tesla armor"
	desc = "An experimental suit of armor with sensitive detectors hooked up to a huge capacitor grid, with emitters strutting out of it. You'll be the lightning of their lives."
	siemens_coefficient = -1
	cooldown_message = span_danger("The tesla capacitors on the reactive tesla armor are still recharging! The armor merely emits some sparks.")
	emp_message = span_warning("The tesla capacitors beep ominously for a moment.")
	clothing_traits = list(TRAIT_TESLA_SHOCKIMMUNE)
	/// How strong are the zaps we give off?
	var/zap_power = 3.0e4
	/// How far to the zaps we give off go?
	var/zap_range = 40
	/// What flags do we pass to the zaps we give off?
	var/zap_flags = ZAP_MOB_DAMAGE | ZAP_OBJ_DAMAGE

/obj/item/clothing/suit/armor/reactive/syndicate/tesla/cooldown_activation(mob/living/carbon/human/owner)
	var/datum/effect_system/spark_spread/sparks = new /datum/effect_system/spark_spread
	sparks.set_up(1, 1, src)
	sparks.start()
	..()

/obj/item/clothing/suit/armor/reactive/syndicate/tesla/reactive_activation(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	owner.visible_message(span_danger("[src] blocks [attack_text], sending out arcs of lightning!"))
	tesla_zap(source = owner, zap_range = zap_range, power = zap_power, cutoff = 1e3, zap_flags = zap_flags)
	reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
	return TRUE

/obj/item/clothing/suit/armor/reactive/syndicate/tesla/emp_activation(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	owner.visible_message(span_danger("[src] blocks [attack_text], but pulls a massive charge of energy into [owner] from the surrounding environment!"))
	REMOVE_CLOTHING_TRAIT(owner, TRAIT_TESLA_SHOCKIMMUNE) //oops! can't shock without this!
	electrocute_mob(owner, get_area(src), src, 1)
	ADD_CLOTHING_TRAIT(owner, TRAIT_TESLA_SHOCKIMMUNE)
	reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
	return TRUE


//The augmented REPULSE armor

/obj/item/clothing/suit/armor/reactive/syndicate/repulse
	name = "augmented repulse armor"
	desc = "An experimental suit of armor that violently throws back attackers. It's so ugly, people might as well be throwing themselves from you. Just kidding."
	reactivearmor_cooldown_duration = 4 SECONDS
	armor_type = /datum/armor/armor_reactive/stronger
	var/repulse_force = MOVE_FORCE_EXTREMELY_STRONG

/obj/item/clothing/suit/armor/reactive/syndicate/repulse/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(!active)
		return 0
	if(!damage)
		return 0
	if(prob(hit_reaction_chance))
		if(world.time < reactivearmor_cooldown)
			owner.visible_message(span_danger("The repulse generator is still recharging!"))
			return 0
		playsound(get_turf(owner),'sound/effects/magic/repulse.ogg', 100, 1)
		owner.visible_message(span_danger("[src] blocks [attack_text], converting the attack into a wave of force!"))
		var/turf/T = get_turf(owner)
		var/list/thrown_items = list()
		for(var/atom/movable/A in range(T, 7))
			if(A == owner || A.anchored || thrown_items[A])
				continue
			var/throwtarget = get_edge_target_turf(T, get_dir(T, get_step_away(A, T)))
			A.safe_throw_at(throwtarget, 10, 1, force = repulse_force)
			thrown_items[A] = A

		reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
		return 1

//The augmented HALLUCINATION armor

/obj/item/clothing/suit/armor/reactive/syndicate/hallucinating
	name = "reactive hallucinating armor"
	desc = "An experimental suit of armor with sensitive detectors hooked up to the mind of the wearer, sending mind pulses that causes hallucinations around you. Wearing it practically makes you a walking glitch."
	cooldown_message = span_danger("The connection is currently out of sync... Recalibrating.")
	emp_message = span_warning("You feel the backsurge of a mind pulse.")
	clothing_traits = list(TRAIT_MADNESS_IMMUNE)

/obj/item/clothing/suit/armor/reactive/syndicate/hallucinating/cooldown_activation(mob/living/carbon/human/owner)
	var/datum/effect_system/spark_spread/sparks = new /datum/effect_system/spark_spread
	sparks.set_up(1, 1, src)
	sparks.start()
	return ..()

/obj/item/clothing/suit/armor/reactive/syndicate/hallucinating/reactive_activation(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	owner.visible_message(span_danger("[src] blocks [attack_text], sending out mental pulses!"))
	visible_hallucination_pulse(
		center = get_turf(owner),
		radius = 3,
		hallucination_duration = 50 SECONDS,
		hallucination_max_duration = 300 SECONDS,
	)
	reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
	return TRUE

/obj/item/clothing/suit/armor/reactive/syndicate/hallucinating/emp_activation(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	owner.visible_message(span_danger("[src] blocks [attack_text], but pulls a massive charge of mental energy into [owner] from the surrounding environment!"))
	owner.adjust_hallucinations_up_to(50 SECONDS, 300 SECONDS)
	reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
	return TRUE

//The augmented RADIOACTIVE armor

/obj/item/clothing/suit/armor/reactive/syndicate/radiation
	name = "augmented radiation armor"
	desc = "An experimental suit of armor thats give the owner radiation proof and on activation releases a wave of radiation around the owner. Insert a song title here."
	cooldown_message = span_warning("The connection is currently out of sync... Recalibrating.")
	emp_message = span_warning("You feel the radiation wave within you.")
	var/effect_range = 5
	clothing_traits = list(TRAIT_RADIMMUNE)

/obj/item/clothing/suit/armor/reactive/syndicate/radiation/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	owner.visible_message(span_danger("[src] blocks [attack_text], sending out radiation pulses and nuclear particles!"))
	radiation_pulse(src, 5000, effect_range)
	for(var/i = 1 to 5)
		fire_nuclear_particle()
	return TRUE

//The augmented TABLE armor

/obj/item/clothing/suit/armor/reactive/syndicate/table
	name = "augmented table armor"
	desc = "An experimental suit of armor thats give the owner reactive table manifestations. If you can't beat the memes, embrace them."
	reactivearmor_cooldown_duration = 7 SECONDS
	tele_range = 10
	armor_type = /datum/armor/armor_reactive/stronger

/obj/item/clothing/suit/armor/reactive/syndicate/table/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(!active)
		return 0
	if(!damage)
		return 0
	if(prob(hit_reaction_chance))
		var/mob/living/carbon/human/H = owner
		if(world.time < reactivearmor_cooldown)
			owner.visible_message(span_danger("The augmented table armor's fabricators are still on cooldown!"))
			return
		owner.visible_message(span_danger("The augmented teleport system flings [H] clear of [attack_text] and slams [H.p_them()] into a fabricated table!"))
		owner.visible_message("<font color='red' size='3'>[H] GOES ON THE TABLE!!!</font>")
		owner.Paralyze(10)
		var/list/turfs = new/list()
		for(var/turf/T in orange(tele_range, H))
			if(T.density)
				continue
			if(T.x>world.maxx-tele_range || T.x<tele_range)
				continue
			if(T.y>world.maxy-tele_range || T.y<tele_range)
				continue
			turfs += T
		if(!turfs.len)
			turfs += pick(/turf in orange(tele_range, H))
		var/turf/picked = pick(turfs)
		if(!isturf(picked))
			return
		H.forceMove(picked)
		new /obj/structure/table(get_turf(owner))
		reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
		return 1
	return 0

/obj/item/clothing/suit/armor/reactive/syndicate/table/emp_act()
	return

//The augmented BIOSCRAMBLING armor.
/obj/item/clothing/suit/armor/reactive/syndicate/bioscrambling
	name = "augmented bioscrambling armor"
	desc = "An experimental suit of armor with sensitive detectors hooked up to a biohazard release valve. It scrambles the bodies of those around."
	cooldown_message = span_danger("The connection is currently out of sync... Recalibrating.")
	emp_message = span_warning("You feel the armor squirm.")
	///Range of the effect.
	var/range = 10 // double the range
	///Lists for zones and bodyparts to swap and randomize
	var/static/list/zones = list(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
	var/static/list/chests
	var/static/list/heads
	var/static/list/l_arms
	var/static/list/r_arms
	var/static/list/l_legs
	var/static/list/r_legs

/obj/item/clothing/suit/armor/reactive/syndicate/bioscrambling/Initialize(mapload)
	. = ..()
	if(!chests)
		chests = typesof(/obj/item/bodypart/chest)
	if(!heads)
		heads = typesof(/obj/item/bodypart/head)
	if(!l_arms)
		l_arms = typesof(/obj/item/bodypart/arm/left)
	if(!r_arms)
		r_arms = typesof(/obj/item/bodypart/arm/right)
	if(!l_legs)
		l_legs = typesof(/obj/item/bodypart/leg/left)
	if(!r_legs)
		r_legs = typesof(/obj/item/bodypart/leg/right)

/obj/item/clothing/suit/armor/reactive/syndicate/bioscrambling/cooldown_activation(mob/living/carbon/human/owner)
	var/datum/effect_system/spark_spread/sparks = new /datum/effect_system/spark_spread
	sparks.set_up(1, 1, src)
	sparks.start()
	..()

/obj/item/clothing/suit/armor/reactive/syndicate/bioscrambling/reactive_activation(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	owner.visible_message(span_danger("[src] blocks [attack_text], biohazard body scramble released!"))
	bioscrambler_pulse(owner, FALSE)
	reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
	return TRUE

/obj/item/clothing/suit/armor/reactive/syndicate/bioscrambling/emp_activation(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	owner.visible_message(span_danger("[src] blocks [attack_text], but pulls a massive charge of biohazard material into [owner] from the surrounding environment!"))
	bioscrambler_pulse(owner, TRUE)
	reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
	return TRUE

/obj/item/clothing/suit/armor/reactive/syndicate/bioscrambling/proc/bioscrambler_pulse(mob/living/carbon/human/owner, can_hit_owner = FALSE)
	for(var/mob/living/carbon/nearby in range(range, get_turf(src)))
		if(!can_hit_owner && nearby == owner)
			continue
		nearby.bioscramble(name)

//The augmented BARRICADE armor
/obj/item/clothing/suit/armor/reactive/syndicate/barricade
	name = "augmented barricade armor"
	desc = "An experimental suit of armor that generates barriers from another world when it detects its bearer is in danger."
	emp_message = span_warning("The reactive armor's dimensional coordinates are scrambled!")
	cooldown_message = span_danger("The reactive barrier system is still recharging! It fails to activate!")
	reactivearmor_cooldown_duration = 5 SECONDS // halved cooldown
	armor_type = /datum/armor/armor_reactive/stronger // better armor

/obj/item/clothing/suit/armor/reactive/syndicate/barricade/reactive_activation(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	playsound(get_turf(owner),'sound/effects/magic/repulse.ogg', 100, TRUE)
	owner.visible_message(span_danger("The reactive armor interposes matter from another world between [src] and [attack_text]!"))
	for (var/atom/movable/target in repulse_targets(owner))
		repulse(target, owner)

	var/datum/armour_dimensional_theme/theme = new()
	theme.apply_random(get_turf(owner), dangerous = FALSE)
	qdel(theme)

	reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
	return TRUE

/**
 * Returns a list of all atoms around the source which can be moved away from it.
 *
 * Arguments
 * * source - Thing to try to move things away from.
 */
/obj/item/clothing/suit/armor/reactive/syndicate/barricade/proc/repulse_targets(atom/source)
	var/list/push_targets = list()
	for (var/atom/movable/nearby_movable in view(1, source))
		if(nearby_movable == source)
			continue
		if(nearby_movable.anchored)
			continue
		push_targets += nearby_movable
	return push_targets

/**
 * Pushes something one tile away from the source.
 *
 * Arguments
 * * victim - Thing being moved.
 * * source - Thing to move it away from.
 */
/obj/item/clothing/suit/armor/reactive/syndicate/barricade/proc/repulse(atom/movable/victim, atom/source)
	var/dist_from_caster = get_dist(victim, source)

	if(dist_from_caster == 0)
		return

	if (isliving(victim))
		to_chat(victim, span_userdanger("You're thrown back by a wave of pressure!"))
	var/turf/throwtarget = get_edge_target_turf(source, get_dir(source, get_step_away(victim, source, 1)))
	victim.safe_throw_at(throwtarget, 1, 1, source, force = MOVE_FORCE_EXTREMELY_STRONG)

/obj/item/clothing/suit/armor/reactive/syndicate/barricade/emp_activation(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	owner.visible_message(span_danger("The reactive armor shunts matter from an unstable dimension!"))
	var/datum/armour_dimensional_theme/theme = new()
	theme.apply_random(get_turf(owner), dangerous = TRUE)
	qdel(theme)
	reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
	return FALSE
//The augmented POSSESSION armor
/obj/item/clothing/suit/armor/reactive/syndicate/ectoplasm
	name = "augmented possession armor"
	desc = "An experimental suit of armor that animates nearby objects with a ghostly possession."
	emp_message = span_warning("The reactive armor lets out a horrible noise, and ghostly whispers fill your ears...")
	cooldown_message = span_danger("Ectoplasmic Matrix out of balance. Please wait for calibration to complete!")
	reactivearmor_cooldown_duration = 20 SECONDS // halved cooldown

/obj/item/clothing/suit/armor/reactive/syndicate/ectoplasm/reactive_activation(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	playsound(get_turf(owner),'sound/effects/hallucinations/veryfar_noise.ogg', 100, TRUE)
	owner.visible_message(span_danger("The [src] lets loose a burst of otherworldly energy!"))

	haunt_outburst(epicenter = get_turf(owner), range = 8, haunt_chance = 85, duration = 40 SECONDS)
	// +3 range and +10s duration
	reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
	return TRUE

/obj/item/clothing/suit/armor/reactive/syndicate/ectoplasm/emp_activation(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	owner.reagents?.add_reagent(/datum/reagent/inverse/helgrasp, 20)
